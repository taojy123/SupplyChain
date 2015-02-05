from django.db import models

class Node(models.Model):
    username = models.CharField(max_length=32, blank=True, null=True)
    name = models.CharField(max_length=32, blank=True, null=True)
    type = models.CharField(max_length=32, blank=True, null=True)
    longitude = models.CharField(max_length=32, blank=True, null=True)
    latitude = models.CharField(max_length=32, blank=True, null=True)
    def get_ll(self):
        return [ float(self.latitude) , float(self.longitude) ]
    def get_str(self):
        outstr = "[" + str(self.latitude) + "," + str(self.longitude) + "]"
        return outstr

class ProdData(models.Model):
    username = models.CharField(max_length=32, blank=True, null=True)
    name = models.CharField(max_length=32, blank=True, null=True)
    weight = models.CharField(max_length=32, blank=True, null=True)
    change = models.CharField(max_length=32, blank=True, null=True)

class Unit(models.Model):
    username = models.CharField(max_length=32, blank=True, null=True)
    parent_prod = models.CharField(max_length=32, blank=True, null=True)
    child_prod = models.CharField(max_length=32, blank=True, null=True)
    quantity = models.CharField(max_length=32, blank=True, null=True)

class RevUnit(models.Model):
    username = models.CharField(max_length=32, blank=True, null=True)
    parent_prod = models.CharField(max_length=32, blank=True, null=True)
    child_prod = models.CharField(max_length=32, blank=True, null=True)
    quantity = models.CharField(max_length=32, blank=True, null=True)

class ArcData(models.Model):
    username = models.CharField(max_length=32, blank=True, null=True)
    from_where = models.CharField(max_length=32, blank=True, null=True)
    to_where = models.CharField(max_length=32, blank=True, null=True)
    afc = models.CharField(max_length=32, blank=True, null=True)
    distance = models.CharField(max_length=32, blank=True, null=True)
    def get_from(self):
        r = Node.objects.filter(name = self.from_where)[0]
        return [ float(r.latitude) , float(r.longitude) ]
    def get_to(self):
        r = Node.objects.filter(name = self.to_where)[0]
        return [ float(r.latitude) , float(r.longitude) ]

class ResourceData(models.Model):
    username = models.CharField(max_length=32, blank=True, null=True)
    resource = models.CharField(max_length=32, blank=True, null=True)
    arfc = models.CharField(max_length=32, blank=True, null=True)
    upperbound = models.CharField(max_length=32, blank=True, null=True)
    cfp = models.CharField(max_length=32, blank=True, null=True)
    cfpv = models.CharField(max_length=32, blank=True, null=True)

class ArcResourceData(models.Model):
    username = models.CharField(max_length=32, blank=True, null=True)
    from_where = models.CharField(max_length=32, blank=True, null=True)
    to_where = models.CharField(max_length=32, blank=True, null=True)
    resource = models.CharField(max_length=32, blank=True, null=True)
    arcresourcefc = models.CharField(max_length=32, blank=True, null=True)

class NodeProdData(models.Model):
    username = models.CharField(max_length=32, blank=True, null=True)
    node = models.CharField(max_length=32, blank=True, null=True)
    prod = models.CharField(max_length=32, blank=True, null=True)
    value = models.CharField(max_length=32, blank=True, null=True)
    demand = models.CharField(max_length=32, blank=True, null=True)
    def get_latlng_str(self):
        r = Node.objects.filter(name = self.node)[0]
        outstr = "[" + str(r.latitude) + "," + str(r.longitude) + "]"
        return outstr

class ArcResourceProdData(models.Model):
    username = models.CharField(max_length=32, blank=True, null=True)
    from_where = models.CharField(max_length=32, blank=True, null=True)
    to_where = models.CharField(max_length=32, blank=True, null=True)
    resource = models.CharField(max_length=32, blank=True, null=True)
    production = models.CharField(max_length=32, blank=True, null=True)
    type = models.CharField(max_length=32, blank=True, null=True)
    variablecost = models.CharField(max_length=32, blank=True, null=True)
    cycletime = models.CharField(max_length=32, blank=True, null=True)
    leadtime = models.CharField(max_length=32, blank=True, null=True)
    upperbound = models.CharField(max_length=32, blank=True, null=True)
    def get_from(self):
        r = Node.objects.filter(name = self.from_where)[0]
        return [ float(r.latitude) , float(r.longitude) ]
    def get_to(self):
        r = Node.objects.filter(name = self.to_where)[0]
        return [ float(r.latitude) , float(r.longitude) ]
    def get_from_str(self):
        r = Node.objects.filter(name = self.from_where)[0]
        outstr = "[" + str(r.latitude) + "," + str(r.longitude) + "]"
        return outstr
    def get_to_str(self):
        r = Node.objects.filter(name = self.to_where)[0]
        outstr = "[" + str(r.latitude) + "," + str(r.longitude) + "]"
        return outstr
    def get_mind_str(self):
        f = Node.objects.filter(name = self.from_where)[0]
        t = Node.objects.filter(name = self.to_where)[0]
        outstr = "[" + str((float(f.latitude)+float(t.latitude))/2) + "," + str((float(f.longitude)+float(t.longitude))/2) + "]"
        return outstr

class ResourceProdData(models.Model):
    username = models.CharField(max_length=32, blank=True, null=True)
    resource = models.CharField(max_length=32, blank=True, null=True)
    prod = models.CharField(max_length=32, blank=True, null=True)
    unit = models.CharField(max_length=32, blank=True, null=True)

class Ver(models.Model):
    username = models.CharField(max_length=32, blank=True, null=True)
    name = models.CharField(max_length=32, blank=True, null=True)


