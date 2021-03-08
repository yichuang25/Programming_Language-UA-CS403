#ifndef _CYLINDER_H_
#define _CYLINDER_H_
#include "Shape.h"

class Cylinder: public Shape {
public:
    Cylinder(std::string&, int radius, int height);
    ~Cylinder();

    double getArea();
    double getVolume();
    bool test(std::vector<std::string>& cond);
    std::string getInfo();

private:
    int radius;
    int height;
};

#endif