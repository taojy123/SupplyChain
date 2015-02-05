import math

def deg2rad(d):
    d = float(d)
    return d * math.pi/180.0

def spherical_distance(f, t):
    """
    #frompoint = [40.0351,116.40863583333334]
    #topoint = [40.0352,116.4086358333333]
    #print dis.spherical_distance(frompoint,topoint)
    """
    EARTH_RADIUS_METER = 6378137.0

    flon = deg2rad(f[1])
    flat = deg2rad(f[0])
    tlon = deg2rad(t[1])
    tlat = deg2rad(t[0])
    con = math.sin(flat) * math.sin(tlat)
    con += math.cos(flat) * math.cos(tlat) * math.cos(flon - tlon)

    return round(math.acos(con) * EARTH_RADIUS_METER / 1000, 4)
