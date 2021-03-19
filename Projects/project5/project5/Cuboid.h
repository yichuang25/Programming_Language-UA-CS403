#ifndef _CUBOID_H_
#define _CUBOID_H_
#include "Shape.h"

class Cuboid: public Shape {
public:
    Cuboid(const std::string name, double length, double width, double height);
    ~Cuboid();

    double getArea() const;
    double getVolume() const;
    bool test(const std::vector<std::string>& cond) const;
    std::string getInfo() const;

private:  
    double length;
    double width;
    double height;
};

#endif