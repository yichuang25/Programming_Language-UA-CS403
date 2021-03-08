#ifndef _SPHERE_H_
#define _SPHERE_H_
#include "Shape.h"

class Sphere : public Shape {
public:
    Sphere(const std::string name, double radius);
    ~Sphere();

    virtual double getArea() const;
    virtual double getVolume() const;
    virtual bool test(const std::vector<std::string>& cond) const;
    virtual std::string getInfo() const;


private:
    double radius;
};

#endif