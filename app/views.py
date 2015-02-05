#coding: utf-8

from django.http import HttpResponse, HttpResponseRedirect
from django.shortcuts import render_to_response
from django.views.decorators.csrf import csrf_exempt
from django.contrib import auth
from app.models import *
import dis
from app.Indp import *
'''
import matplotlib
matplotlib.use('Agg')
from matplotlib.pyplot import savefig
from pylab import *
'''

@csrf_exempt
def index(request):
    ver = []
    if request.user.is_authenticated():
        username = request.user.username
        ver = Ver.objects.filter(username=username)
    else:
        username = None
    return render_to_response('index.html', locals())

@csrf_exempt
def set_node(request):
    if request.user.is_authenticated():
        username = request.user.username + "_" + str(request.REQUEST.get('ver', ''))
    else:
        return HttpResponseRedirect("/login_page/")

    node = Node.objects.filter(username=username)
    datanum = len(node)
    s = request.REQUEST.get('s')
    return render_to_response('set_node.html', locals())

@csrf_exempt
def set_prod(request):
    if request.user.is_authenticated():
        username = request.user.username + "_" + str(request.REQUEST.get('ver', ''))
    else:
        return HttpResponseRedirect("/login_page/")

    proddata = ProdData.objects.filter(username=username)
    proddatanum = len(proddata)
    unit = Unit.objects.filter(username=username)
    unitnum = len(unit)
    revunit = RevUnit.objects.filter(username=username)
    revunitnum = len(revunit)
    return render_to_response('set_prod.html', locals())

@csrf_exempt
def set_arc(request):
    if request.user.is_authenticated():
        username = request.user.username + "_" + str(request.REQUEST.get('ver', ''))
    else:
        return HttpResponseRedirect("/login_page/")

    arc = ArcData.objects.filter(username=username)
    datanum = len(arc)
    node_list = Node.objects.filter(username=username)
    return render_to_response('set_arc.html', locals())

@csrf_exempt
def set_resource(request):
    if request.user.is_authenticated():
        username = request.user.username + "_" + str(request.REQUEST.get('ver', ''))
    else:
        return HttpResponseRedirect("/login_page/")

    resource = ResourceData.objects.filter(username=username)
    datanum = len(resource)
    return render_to_response('set_resource.html', locals())

@csrf_exempt
def set_arcresource(request):
    if request.user.is_authenticated():
        username = request.user.username + "_" + str(request.REQUEST.get('ver', ''))
    else:
        return HttpResponseRedirect("/login_page/")

    arcresource = ArcResourceData.objects.filter(username=username)
    datanum = len(arcresource)
    node_list = Node.objects.filter(username=username)
    resource_list = ResourceData.objects.filter(username=username)
    return render_to_response('set_arcresource.html', locals())

@csrf_exempt
def set_nodeprod(request):
    if request.user.is_authenticated():
        username = request.user.username + "_" + str(request.REQUEST.get('ver', ''))
    else:
        return HttpResponseRedirect("/login_page/")

    nodeprod = NodeProdData.objects.filter(username=username)
    datanum = len(nodeprod)
    node_list = Node.objects.filter(username=username)
    prod_list = ProdData.objects.filter(username=username)
    return render_to_response('set_nodeprod.html', locals())

@csrf_exempt
def set_arcresourceprod(request):
    if request.user.is_authenticated():
        username = request.user.username + "_" + str(request.REQUEST.get('ver', ''))
    else:
        return HttpResponseRedirect("/login_page/")

    arcresourceprod = ArcResourceProdData.objects.filter(username=username)
    datanum = len(arcresourceprod)
    node_list = Node.objects.filter(username=username)
    resource_list = ResourceData.objects.filter(username=username)
    prod_list = ProdData.objects.filter(username=username)
    return render_to_response('set_arcresourceprod.html', locals())

@csrf_exempt
def set_resourceprod(request):
    if request.user.is_authenticated():
        username = request.user.username + "_" + str(request.REQUEST.get('ver', ''))
    else:
        return HttpResponseRedirect("/login_page/")

    resourceprod = ResourceProdData.objects.filter(username=username)
    datanum = len(resourceprod)
    resource_list = ResourceData.objects.filter(username=username)
    prod_list = ProdData.objects.filter(username=username)
    return render_to_response('set_resourceprod.html', locals())





@csrf_exempt
def update_node(request):
    if request.user.is_authenticated():
        username = request.user.username + "_" + str(request.REQUEST.get('ver', ''))
    else:
        return HttpResponseRedirect("/login_page/")

    name = request.REQUEST.get("name").split(",")
    type = request.REQUEST.get("type").split(",")
    longitude = request.REQUEST.get("longitude").split(",")
    latitude = request.REQUEST.get("latitude").split(",")

    Node.objects.filter(username=username).delete()

    for i in range(1, len(name)):
        ob = Node()
        ob.username = username
        ob.name = name[i]
        ob.type = type[i]
        ob.longitude = longitude[i]
        ob.latitude = latitude[i]
        ob.save()

    return HttpResponse("ok")

@csrf_exempt
def update_prod(request):
    if request.user.is_authenticated():
        username = request.user.username + "_" + str(request.REQUEST.get('ver', ''))
    else:
        return HttpResponseRedirect("/login_page/")

    name = request.REQUEST.get("name").split(",")
    weight = request.REQUEST.get("weight").split(",")
    change = request.REQUEST.get("change").split(",")
    ProdData.objects.filter(username=username).delete()
    for i in range(1, len(name)):
        ob = ProdData()
        ob.username = username
        ob.name = name[i]
        ob.weight = weight[i]
        ob.change = change[i]
        ob.save()

    parent_prod = request.REQUEST.get("parent_prod").split(",")
    child_prod = request.REQUEST.get("child_prod").split(",")
    quantity = request.REQUEST.get("quantity").split(",")
    Unit.objects.filter(username=username).delete()
    for i in range(1, len(parent_prod)):
        ob = Unit()
        ob.username = username
        ob.parent_prod = parent_prod[i]
        ob.child_prod = child_prod[i]
        ob.quantity = quantity[i]
        ob.save()

    rev_parent_prod = request.REQUEST.get("rev_parent_prod").split(",")
    rev_child_prod = request.REQUEST.get("rev_child_prod").split(",")
    rev_quantity = request.REQUEST.get("rev_quantity").split(",")
    RevUnit.objects.filter(username=username).delete()
    for i in range(1, len(rev_parent_prod)):
        ob = RevUnit()
        ob.username = username
        ob.parent_prod = rev_parent_prod[i]
        ob.child_prod = rev_child_prod[i]
        ob.quantity = rev_quantity[i]
        ob.save()

    return HttpResponse("ok")


@csrf_exempt
def update_arc(request):
    if request.user.is_authenticated():
        username = request.user.username + "_" + str(request.REQUEST.get('ver', ''))
    else:
        return HttpResponseRedirect("/login_page/")

    from_where = request.REQUEST.get("from_where").split(",")
    to_where = request.REQUEST.get("to_where").split(",")
    afc = request.REQUEST.get("afc").split(",")
    distance = request.REQUEST.get("distance").split(",")

    ArcData.objects.filter(username=username).delete()

    for i in range(1, len(from_where)):
        ob = ArcData()
        ob.username = username
        ob.from_where = from_where[i]
        ob.to_where = to_where[i]
        ob.afc = afc[i]
        ob.distance = distance[i]
        ob.save()

    return HttpResponse("ok")

@csrf_exempt
def update_resource(request):
    if request.user.is_authenticated():
        username = request.user.username + "_" + str(request.REQUEST.get('ver', ''))
    else:
        return HttpResponseRedirect("/login_page/")

    resource = request.REQUEST.get("resource").split(",")
    arfc = request.REQUEST.get("arfc").split(",")
    upperbound = request.REQUEST.get("upperbound").split(",")
    cfp = request.REQUEST.get("cfp").split(",")
    cfpv = request.REQUEST.get("cfpv").split(",")

    ResourceData.objects.filter(username=username).delete()

    for i in range(1, len(resource)):
        ob = ResourceData()
        ob.username = username
        ob.resource = resource[i]
        ob.arfc = arfc[i]
        ob.upperbound = upperbound[i]
        ob.cfp = cfp[i]
        ob.cfpv = cfpv[i]
        ob.save()

    return HttpResponse("ok")

@csrf_exempt
def update_arcresource(request):
    if request.user.is_authenticated():
        username = request.user.username + "_" + str(request.REQUEST.get('ver', ''))
    else:
        return HttpResponseRedirect("/login_page/")

    from_where = request.REQUEST.get("from_where").split(",")
    to_where = request.REQUEST.get("to_where").split(",")
    resource = request.REQUEST.get("resource").split(",")
    arcresourcefc = request.REQUEST.get("arcresourcefc").split(",")

    ArcResourceData.objects.filter(username=username).delete()

    for i in range(1, len(from_where)):
        ob = ArcResourceData()
        ob.username = username
        ob.from_where = from_where[i]
        ob.to_where = to_where[i]
        ob.resource = resource[i]
        ob.arcresourcefc = arcresourcefc[i]
        ob.save()

    return HttpResponse("ok")

@csrf_exempt
def update_nodeprod(request):
    if request.user.is_authenticated():
        username = request.user.username + "_" + str(request.REQUEST.get('ver', ''))
    else:
        return HttpResponseRedirect("/login_page/")

    node = request.REQUEST.get("node").split(",")
    prod = request.REQUEST.get("prod").split(",")
    value = request.REQUEST.get("value").split(",")
    demand = request.REQUEST.get("demand").split(",")

    NodeProdData.objects.filter(username=username).delete()

    for i in range(1, len(node)):
        ob = NodeProdData()
        ob.username = username
        ob.node = node[i]
        ob.prod = prod[i]
        ob.value = value[i]
        ob.demand = demand[i]
        ob.save()

    return HttpResponse("ok")

@csrf_exempt
def update_arcresourceprod(request):
    if request.user.is_authenticated():
        username = request.user.username + "_" + str(request.REQUEST.get('ver', ''))
    else:
        return HttpResponseRedirect("/login_page/")

    from_where = request.REQUEST.get("from_where").split(",")
    to_where = request.REQUEST.get("to_where").split(",")
    resource = request.REQUEST.get("resource").split(",")
    production = request.REQUEST.get("production").split(",")
    type = request.REQUEST.get("type").split(",")
    variablecost = request.REQUEST.get("variablecost").split(",")
    cycletime = request.REQUEST.get("cycletime").split(",")
    leadtime = request.REQUEST.get("leadtime").split(",")
    upperbound = request.REQUEST.get("upperbound").split(",")

    ArcResourceProdData.objects.filter(username=username).delete()

    for i in range(1, len(from_where)):
        ob = ArcResourceProdData()
        ob.username = username
        ob.from_where = from_where[i]
        ob.to_where = to_where[i]
        ob.resource = resource[i]
        ob.production = production[i]
        ob.type = type[i]
        ob.variablecost = variablecost[i]
        ob.cycletime = cycletime[i]
        ob.leadtime = leadtime[i]
        ob.upperbound = upperbound[i]
        ob.save()

    return HttpResponse("ok")

@csrf_exempt
def update_resourceprod(request):
    if request.user.is_authenticated():
        username = request.user.username + "_" + str(request.REQUEST.get('ver', ''))
    else:
        return HttpResponseRedirect("/login_page/")

    resource = request.REQUEST.get("resource").split(",")
    prod = request.REQUEST.get("prod").split(",")
    unit = request.REQUEST.get("unit").split(",")

    ResourceProdData.objects.filter(username=username).delete()

    for i in range(1, len(resource)):
        ob = ResourceProdData()
        ob.username = username
        ob.resource = resource[i]
        ob.prod = prod[i]
        ob.unit = unit[i]
        ob.save()

    return HttpResponse("ok")



@csrf_exempt
def login_page(request):
    return render_to_response('login_page.html', locals())

@csrf_exempt
def login(request):
    username = request.REQUEST.get('username', '')
    password = request.REQUEST.get('password', '')
    user = auth.authenticate(username=username, password=password)
    if user is not None and user.is_active:
        auth.login(request, user)
    return HttpResponseRedirect("/index/")

@csrf_exempt
def logout(request):
    auth.logout(request)
    return HttpResponseRedirect("/index/")


@csrf_exempt
def confort(request):
    if request.user.is_authenticated():
        username = request.user.username + "_" + str(request.REQUEST.get('ver', ''))
    else:
        return HttpResponseRedirect("/login_page/")

    np = NodeProdData.objects.filter(username=username)
    rs = []
    for n in np:
        flag = 0
        for temp in rs:
            if temp["name"] == n.node:
                temp["info"] = temp["info"] + " " + n.prod
                flag = 1
                break
        if flag == 0:
            r = {}
            r['latlng'] = n.get_latlng_str()
            r['name'] = n.node
            r['info'] = n.prod
            print r,"+"
            rs.append(r)

    arp = ArcResourceProdData.objects.filter(username=username)
    ts = []
    for a in arp:
        flag = 0
        for temp in ts:
            if temp["from_where"] == a.from_where and temp["to_where"] == a.to_where:
                temp["trans"] = temp["trans"] + " " + a.resource
                flag = 1
                break
        if flag == 0:
            t = {}
            t['from_where'] = a.from_where
            t['to_where'] = a.to_where
            t['from'] = a.get_from_str()
            t['to'] = a.get_to_str()
            t['mind'] = a.get_mind_str()
            t['dis'] = dis.spherical_distance(a.get_from(), a.get_to())
            t['trans'] = a.resource
            if t['dis'] > 1:
                ts.append(t)

    s = request.REQUEST.get('s')
    return render_to_response('confort.html', locals())


@csrf_exempt
def result(request):
    if request.user.is_authenticated():
        username = request.user.username + "_" + str(request.REQUEST.get('ver', ''))
    else:
        return HttpResponseRedirect("/login_page/")

    nodes = Node.objects.filter(username=username)
    node = []
    for n in nodes:
        node.append(n.name)

    arcs = ArcData.objects.filter(username=username)
    arcdata = {}
    for n in arcs:
        arcdata[(n.from_where, n.to_where)] = [ float(n.afc), int(dis.spherical_distance(n.get_from(), n.get_to())) ]

    prods = ProdData.objects.filter(username=username)
    proddata = {}
    for n in prods:
        proddata[n.name] = [float(n.weight), float(n.change)]

    resources = ResourceData.objects.filter(username=username)
    resourcedata = {}
    for n in resources:
        resourcedata[n.resource] = [float(n.arfc), float(n.upperbound), float(n.cfp), float(n.cfpv)]

    resourceprods = ResourceProdData.objects.filter(username=username)
    resourceproddata = {}
    for n in resourceprods:
        resourceproddata[(n.resource, n.prod)] = float(n.unit)

    arcresources = ArcResourceData.objects.filter(username=username)
    arcresourcedata = {}
    for n in arcresources:
        arcresourcedata[(n.from_where, n.to_where, n.resource)] = float(n.arcresourcefc)

    arcresourceprods = ArcResourceProdData.objects.filter(username=username)
    arcresourceproddata = {}
    for n in arcresourceprods:
        arcresourceproddata[(n.from_where, n.to_where, n.resource, n.production)] = [float(n.type), float(n.variablecost), float(n.cycletime), float(n.leadtime), float(n.upperbound)]

    nodeprods = NodeProdData.objects.filter(username=username)
    nodeproddata = {}
    for n in nodeprods:
        nodeproddata[(n.node, n.prod)] = [float(n.value), float(n.demand)]

    units = Unit.objects.filter(username=username)
    unit = {}
    for n in units:
        unit[(n.parent_prod, n.child_prod)] = float(n.quantity)

    revunits = RevUnit.objects.filter(username=username)
    revunit = {}
    for n in revunits:
        revunit[(n.parent_prod, n.child_prod)] = float(n.quantity)

#    print node
#    print arcdata
#    print proddata
#    print resourcedata
#    print resourceproddata
#    print arcresourcedata
#    print arcresourceproddata
#    print nodeproddata
#    print unit
#    print revunit


    indp = Indp()
    w,y,z,TotalArcFC,TotalArcResourceFC,TotalVC,TotalCycleIC,TotalSafetyIC,Totalco2,Totalvalue=indp.LNDP(node,arcdata,proddata,resourcedata,resourceproddata,arcresourcedata,arcresourceproddata,nodeproddata,unit,revunit)


    content = u"<p><font size='3' color='red'>最適化の結果,総費用は：</font></p>"
    content += u"<p>Opt.value =  %s 万円です</p>"%Totalvalue
    content += u"<p>輸送中C02の排出量は %s kg</p>"%Totalco2
    result_str = content



    content = u"<p><font size='3' color='red'>詳しいの情報は以下の表のように：</font><p>"

    #枝固定費用
    content += u"""
    <table>
    <tr>
    <td>

    <table border="1" cellpadding="5">
    <caption>枝固定費用</caption>
    <thead style="background:#ffccff">
    <tr>
    <td>from</td>
    <td>to</td>
    <td>Fixed Cost</td>
    </thead>
    </tr>
    """

    for (i,j) in y:
        if y[i,j].value() >0:
            content += """
                        <tbody style="background:#eeeeee">
                        <tr>
                        <td>%s</td>
                        <td>%s</td>
                        <td>%s</td>
                        </tr>"""%(i,j,arcdata[i,j][0])
    content += "</tbody></table><td></td><td></td><td></td><td></td><td></td></td><td></td><td></td><td></td><td></td>"

    #枝・資源固定費用
    content += u"""<td>
    <table border="1" cellpadding="5">
    <caption>枝・資源固定費用</caption>
    <thead style="background:#ffccff">
    <tr>
    <td>from</td>
    <td>to</td>
    <td>Resource</td>
    <td>Fixed Cost</td>
    </tr>
    </thead>
    """

    for (i,j,r) in z:
        if z[i,j,r].value() >0:
            content += """
                        <tbody style="background:#eeeeee">
                        <tr>
                        <td>%s</td>
                        <td>%s</td>
                        <td>%s</td>
                        <td>%s</td>
                        </tr>"""%(i,j,r,arcresourcedata[i,j,r])
    content += "</tbody></table></td></tr></table>"


    cost_str = content

    rs = []
    ts = []
    for (i,j,r,p) in w:
        if w[i,j,r,p].value() >0:
            from_where = i
            to_where = j
            resource = r
            production = p
            quantity = w[i,j,r,p].value()
            vcost = arcresourceproddata[i,j,r,p][2]*w[i,j,r,p].value()

            from_node = Node.objects.filter(name=from_where)[0]
            to_node = Node.objects.filter(name=to_where)[0]
            if from_where not in [ r['name'] for r in rs ]:
                r = {}
                r['name'] = from_where
                r['latlng'] = from_node.get_str()
                rs.append(r)
            if to_where not in [ r['name'] for r in rs ]:
                r = {}
                r['name'] = to_where
                r['latlng'] = to_node.get_str()
                rs.append(r)

            t = {}
            t['from_where'] = from_where
            t['to_where'] = to_where
            t['from'] = from_node.get_str()
            t['to'] = to_node.get_str()
            t['mind'] = "[" + str(float(from_node.latitude)+((float(to_node.latitude)-float(from_node.latitude))/3)) + "," + str(float(from_node.longitude)+((float(to_node.longitude)-float(from_node.longitude))/3))  + "]"
            distance = int(dis.spherical_distance(from_node.get_ll(), to_node.get_ll()))
            t['distance'] = distance
            content = u"From %s To %s, Distance: %skm <br/>" % (from_where,to_where,str(distance))
            content += u"Resource：%s <br/>" % resource
            content += u"Production： %s <br/>" % production
            content += u"Quantity： %s <br/>" % str(quantity)
            content += u"variablecost： %s <br/>" % str(vcost)
            t['content'] = content
            ts.append(t)



    s = request.REQUEST.get('s')
    return render_to_response('result.html', locals())



def add_ver(request):
    if request.user.is_authenticated():
        username = request.user.username
        name = request.REQUEST.get('name')
        ob = Ver()
        ob.username = username
        ob.name = name
        ob.save()
    return HttpResponseRedirect("/index/")



