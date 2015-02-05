__version__ = "0.2"

quicksum = sum

def multidictnew(d):
    r = []
    items = d.items()
    try:
        t = list( items[0][1] )
    except:
        t = [ items[0][1] ]
    for i in t:
        r.append({})
    for k, v in items:
        try:
            t = list(v)
        except:
            t = [v]
        for i in range(len(t)):
            r[i][k] = t[i]
    r.insert(0, d.keys())
    return r

class tuplelistnew(list):
    def select(self, *limit):
        l = self
        r = []
        for s in self:
            flag = 1
            for i in range(len(limit)):
                if limit[i] == "*":
                    continue
                try:
                    t = s[i]
                except:
                    t = s
                if limit[i] != t:
                    flag = 0
                    break
            if flag == 1:
                r.append(s)
        return tuplelistnew(r)
                   

#============testing_start=============
if __name__ == "__main__":
    a = {
        ('Gurbi', 'Optimal Engine') : 1,
        ('EdgeStone', 'Resellor') :  2,
        ('Python','Programming') :  3
        }
    name, property1 = multidictnew(a)
    print name
    print property1
    name = tuplelistnew(name)
    print name.select('EdgeSeone', '*')
    print name.select('EdgeStone', '*')
    print 
    a = {
        ('Gurbi', 'Optimal Engine') : [1,2],
        ('EdgeStone', 'Resellor') :  [2,3],
        ('Python','Programming') :  [44,23]
        }
    res = multidictnew(a)
    print res[0], res[1], res[2]
#============testing_end================

