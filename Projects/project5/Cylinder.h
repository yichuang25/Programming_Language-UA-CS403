#ifndef _CYLINDER_H_
#define _CYLINDER_H_
#include "Shape.h"

class Cylinder: public Shape {
public:
    Cylinder(const std::string name, double radius, double height);
    ~Cylinder();

    double getArea() const;
    double getVolume() const;
    bool test(const std::vector<std::string>& cond) const;
    std::string getInfo() const;

private:
    double radius;
    double height;
};

#endif