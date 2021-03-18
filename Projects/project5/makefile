./a.out: main.o Shape.o Sphere.o Cone.o Cylinder.o Cuboid.o reading.o
	g++ -o ./a.out -std=c++11 main.o Shape.o Sphere.o Cone.o Cylinder.o Cuboid.o reading.o
main.o:	main.cpp reading.h Shape.h
	g++ -c -Wall -std=c++11 main.cpp
Shape.o: Shape.h Shape.cpp
	g++ -c -Wall -std=c++11 Shape.cpp
Sphere.o: Shape.h Sphere.cpp Sphere.h
	g++ -c -Wall -std=c++11 Sphere.cpp 
Cone.o: Shape.h Cone.cpp Cone.h
	g++ -c -Wall -std=c++11 Cone.cpp
Cylinder.o: Shape.h Cylinder.cpp Cylinder.h
	g++ -c -Wall -std=c++11 Cylinder.cpp
Cuboid.o: Shape.h Cuboid.h Cuboid.cpp
	g++ -c -Wall -std=c++11 Cuboid.cpp
reading.o: reading.h reading.cpp Shape.h Sphere.h Cone.h Cylinder.h Cuboid.h
	g++ -c -Wall -std=c++11 reading.cpp
clean:
	rm a.out *.o
