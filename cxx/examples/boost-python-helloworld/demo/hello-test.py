import hello ;

print(hello.version())

a = hello.Point()

print(a.toString())
a.x = 3.0
a.y = 4.0

print(a.toString())

print(a.distance(hello.Point(4.0,4.0)))


