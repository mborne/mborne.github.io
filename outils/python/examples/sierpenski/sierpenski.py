from math import sqrt

class Point:
    def __init__(self,x_init,y_init):
        self.x = x_init
        self.y = y_init

    def shift(self, x, y):
        self.x += x
        self.y += y

    def __repr__(self):
        return "".join([str(self.x), ",", str(self.y)])


def center(a,b):
    return Point((a.x+b.x)/2.0,(a.y+b.y)/2.0)


class Triangle:
    def __init__(self,a_init,b_init,c_init):
        self.a = a_init
        self.b = b_init
        self.c = c_init
        self.color = "black"

    def split(self):
        Iab = center(self.a,self.b)
        Ibc = center(self.b,self.c)
        Ica = center(self.c,self.a)
        t1 = Triangle(self.a,Iab,Ica)
        t1.color = "red"
        t2 = Triangle(Iab,self.b,Ibc)
        t2.color = "green"
        t3 = Triangle(Ibc,self.c,Ica)
        t3.color = "blue"
        return [t1,t2,t3]

    def __repr__(self):
        return "".join(["<polygon points=\"",str(self.a)," ",str(self.b)," ",str(self.c),"\" fill=\"",self.color,"\" />"])


def sierpenski(triangles):
    result = []
    for triangle in triangles:
        result.extend(triangle.split())
    return result


a = Point(0.0,1000.0)
b = Point(1000.0,1000.0)
c = Point(500.0, 1000.0 - sqrt(3.0) * 500.0 )

triangles = [Triangle(a,b,c)]
for k in range(5):
    triangles = sierpenski(triangles)

print('<svg xmlns="http://www.w3.org/2000/svg" height="1000" width="1000">')
print('<rect width="1000" height="1000" fill="white" />')
for t in triangles:
    print(t)
print('</svg>')



