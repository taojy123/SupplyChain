"""
lndp.py:  solve the multi-period logistics network design problem +Corbon Foot Print.

Copyright (c) by Joao Pedro PEDROSO and Mikio KUBO, 2012
"""
import math
from pulp import *
##from gurobipy import *
from app.mt import multidictnew
from app.mt import tuplelistnew

"""
Indp class
"""

class Indp:
    def __init__(self):
        self.prob=LpProblem("logistics network design",LpMinimize)
        self.ratio = 5.0  #interest ratio
        self.SSR=1.65   #safety stock ratio
        self.CFPUB =10000.0 #upper bound of carbon foot print (kg)

    def convex_comb_dis(self, a, b,i,j,r,p,yL,yR,qq,x,f):
        """convex_comb_sos -- add piecewise relation with gurobi's SOS constraints
        Parameters:
            - prob: a prob where to include the piecewise linear relation
            - a[k]: x-coordinate of the k-th point in the piecewise linear relation
            - b[k]: y-coordinate of the k-th point in the piecewise linear relation
        Returns the prob with the piecewise linear relation on added variables x, f, and z.
        """
        K = len(a)-1
        yL[i,j,r,p],yR[i,j,r,p],qq[i,j,r,p] = {},{},{}
        for k in range(K):
               yL[i,j,r,p][k]=LpVariable("yL[%s,%s,%s,%s,%s]"%(k,i,j,r,p),lowBound=0,upBound = 1)
               yR[i,j,r,p][k]=LpVariable("yR[%s,%s,%s,%s,%s]"%(k,i,j,r,p),lowBound=0,upBound = 1)
               qq[i,j,r,p][k]=LpVariable("z[%s,%s,%s,%s,%s]"%(k,i,j,r,p), lowBound=0,upBound = 1,cat="Binary")
        x[i,j,r,p] = LpVariable("x,%s,%s,%s,%s"%(i,j,r,p),lowBound=a[0],upBound=a[K],cat="C")
        f[i,j,r,p] = LpVariable("f,%s,%s,%s,%s"%(i,j,r,p),cat="C")
        self.prob+=(x[i,j,r,p] == lpSum(a[k]*yL[i,j,r,p][k]+a[k+1]*yR[i,j,r,p][k] for k in range(K)))
        self.prob+=(f[i,j,r,p] == lpSum(b[k]*yL[i,j,r,p][k]+b[k+1]*yR[i,j,r,p][k] for k in range(K)))
        for k in range(K):
            self.prob+=(yL[i,j,r,p][k]+yR[i,j,r,p][k]==qq[i,j,r,p][k])

        self.prob+=(lpSum(qq[i,j,r,p][k] for k in range(K)) == 1)
        return x[i,j,r,p], f[i,j,r,p], qq[i,j,r,p]

    def LNDP(self,Node,ArcData,ProdData,ResourceData,ResourceProdData,ArcResourceData,
                 ArcResourceProdData,NodeProdData,Unit,RevUnit):


        Arc, ArcFC, Distance= multidictnew(ArcData)
        Prod, Weight, VAR = multidictnew(ProdData)
            #set child Parent data
        Child, Parent ={}, {}
        for (i,j) in Unit:
            if Child.has_key(i):
                    Child[i].append(j)
            else:
                    Child[i]=[j]
                    
        for (i,j) in RevUnit:
            if Parent.has_key(i):
                    Parent[i].append(j)
            else:
                    Parent[i]=[j]
        Resource, ResourceFC, ResourceUB, CFP, CFPV = multidictnew(ResourceData)
        ResourceProd, R= multidictnew(ResourceProdData)
        ArcResource, ArcResourceFC = multidictnew(ArcResourceData)
        ArcResourcePair=tuplelistnew([(i,j,r) for (i,j,r) in ArcResource])
        ArcResourceProd, Type, VariableCost, CycleTime, LT, UB = multidictnew(ArcResourceProdData)
        ArcResourceProdPair=tuplelistnew(ArcResourceProd)
        TransPair, AsmblPair, DisasmblPair =[],[],[]
        for (i,j,r,p) in Type:
                if Type[i,j,r,p]==1:
                    AsmblPair.append( (i,j,r,p) )
                elif Type[i,j,r,p]==2:
                    DisasmblPair.append( (i,j,r,p) )
                else:
                    TransPair.append( (i,j,r,p) )

        NodeProd, VAL, Demand=multidictnew(NodeProdData)
        NodeProdPair=tuplelistnew(NodeProd)
        DemandNodeProdPair=[(i,p) for (i,p) in Demand if Demand[i,p]>0]
        SupplyNodeProdPair=[(i,p) for (i,p) in Demand if Demand[i,p]<0]

        EIC={} #echelon inventory cost
        for (i,j,r,p) in AsmblPair:
                EIC[i,j,r,p]=max(float(self.ratio)*(VAL[j,p]-sum(Unit[p,q]*VAL[i,q] for q in Child[p]))/100.0,0)
        for (i,j,r,p) in DisasmblPair:
                EIC[i,j,r,p]=max(float(self.ratio)*(sum(RevUnit[p,q]*VAL[j,p] for q in Parent[p])-VAL[i,p])/100.0,0)
        for (i,j,r,p) in TransPair:
                EIC[i,j,r,p]=max( float(self.ratio)*(VAL[j,p]-VAL[i,p])/100.0,0)

        z, y, w = {}, {}, {}
        for (i,j) in Arc:
                y[i,j] = LpVariable("y(%s,%s)"%(i,j),cat="Binary")
        for (i,j,r) in ArcResourcePair:
                z[i,j,r] = LpVariable("z(%s,%s,%s)"%(i,j,r), cat="Binary")

            #prepare the nonlinear function
        a,b={},{}
        w,F,Z={},{},{}
        yL,yR,qq={},{},{}
        x,f={},{}
        for (i,j,r,p) in ArcResourceProdPair:
                a[i,j,r,p]=[k for k in range(int(UB[i,j,r,p])+1)]
                b[i,j,r,p]=[self.ratio/100.0*VAL[j,p]*self.SSR*math.sqrt(VAR[p]*LT[i,j,r,p]*k) for k in range(int(UB[i,j,r,p])+1)]
                w[i,j,r,p],F[i,j,r,p],Z[i,j,r,p]=self.convex_comb_dis(a[i,j,r,p],b[i,j,r,p],i,j,r,p,yL,yR,qq,x,f)
                w[i,j,r,p].ub=UB[i,j,r,p]

        TotalArcFC=LpVariable(name=" Arc fixed cost",lowBound = 0)
        TotalArcResourceFC=LpVariable(name="Arc resource fixed cost",lowBound = 0)
        TotalVC=LpVariable( name="Variable cost",lowBound = 0)
        TotalCycleIC=LpVariable(name="Cycle inventory cost",lowBound = 0)
        TotalSafetyIC=LpVariable( name="Safety inventory cost",lowBound = 0)

            

            # flow conservation constraints
        for i in Node:
           for p in Prod:

                prob1=[(w[j,i,r,p],1) for j,ii,r,pp in TransPair+AsmblPair if i==ii and p==pp]
                prob2=[(w[j,i,r,q],RevUnit[q,p])   for j,ii,r,q in DisasmblPair  if i==ii and (p in Parent[q])]
                prob3=[(w[i,k,r,p],-1) for ii,k,r,pp in TransPair+DisasmblPair if i==ii and p==pp]
                prob4=[(w[i,k,r,q],-Unit[q,p]) for ii,k,r,q in AsmblPair if i==ii and p in Child[q]]
                LHS=prob1+prob2+prob3+prob4
                LHS=LpAffineExpression(LHS)
               # print len(LHS)
              #  print LHS
                if len(LHS)>0:
                #    print len(LHS)
                    if (i,p) in DemandNodeProdPair:
                        self.prob+=(LHS==Demand[i,p],"Flow(%s,%s)"%(i,p)) #demand constraint
                       # print Demand[i,p]
                    elif (i,p) in SupplyNodeProdPair:
                        self.prob+=(LHS>=Demand[i,p],"Flow(%s,%s)"%(i,p)) #supply upper bound
                       # print Demand[i,p]
                    else:
                        self.prob+=(LHS==0,"Flow(%s,%s)"%(i,p))           #flow conservation
            
            #capacity constraint
        for i,j,r in ArcResourcePair:
            self.prob+=(lpSum(R[r,p]*w[i,j,r,p] for i,j,r,p in ArcResourceProdPair.select(i,j,r,"*"))<=ResourceUB[r]*z[i,j,r],
                            "Capacity(%s,%s,%s)"%(i,j,r))

            #connection between z and y
        for i,j,r in ArcResourcePair:
            self.prob+=(z[i,j,r]<=y[i,j],"Connect(%s,%s,%s)"%(i,j,r))
            

            #carbon foot print constraint
        self.prob+=((lpSum(CFP[r]*Distance[i,j]*z[i,j,r] for i,j,r in ArcResourcePair) +
                        lpSum(CFPV[r]*Distance[i,j]*Weight[p]*w[i,j,r,p] for i,j,r,p in ArcResourceProdPair)) <=self.CFPUB,"Corbon Foot Print Upper Bound")

            #cost declaration
        self.prob+=(TotalArcFC==lpSum(ArcFC[i,j]*y[i,j] for i,j in Arc)," Arc fixed cost")

        self.prob+=(TotalArcResourceFC==lpSum(ArcResourceFC[i,j,r]*z[i,j,r] for i,j,r in ArcResourcePair),"Arc resource fixed cost")

        self.prob+=(TotalVC==lpSum(VariableCost[i,j,r,p]*w[i,j,r,p] for i,j,r,p in ArcResourceProdPair),"Variable cost")

        self.prob+=(TotalCycleIC==lpSum(EIC[i,j,r,p]*CycleTime[i,j,r,p]/2.0*w[i,j,r,p] for i,j,r,p in ArcResourceProdPair),"Cycle inventory cost")

        self.prob+=(TotalSafetyIC==lpSum(F[i,j,r,p] for i,j,r,p in ArcResourceProdPair),"Safety inventory cost")

           #set objective function
        self.prob+=(TotalArcFC+TotalArcResourceFC+TotalVC+TotalCycleIC+TotalSafetyIC,"object function")
           
            #slef.model.__data=w,y,z,TotalArcFC,TotalArcResourceFC,TotalVC,TotalCycleIC,TotalSafetyIC

        self.prob.writeLP("usecbc.lp")
        self.prob.solve()


        Totalco2 = lpSum(CFP[r]*Distance[i,j]*z[i,j,r].value() for i,j,r in z)+lpSum(CFPV[r]*Distance[i,j]*Weight[p]*w[i,j,r,p].value() for i,j,r,p in w)

        Totalvalue = TotalArcFC.value() + TotalArcResourceFC.value()+TotalVC.value()+TotalCycleIC.value()+TotalSafetyIC.value()
        return w,y,z,TotalArcFC.value(),TotalArcResourceFC.value(),TotalVC.value(),TotalCycleIC.value(),TotalSafetyIC.value(),Totalco2,Totalvalue








