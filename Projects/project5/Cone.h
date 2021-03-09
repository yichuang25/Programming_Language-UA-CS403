#ifndef _CONE_H_
#define _CONE_H_
#include "Shape.h"

class Cone: public Shape {
public:
    Cone(const std::string name, double radius, double height);
    ~Cone();

    double getArea() const;
    double getVolume() const;
    bool test(const std::vector<std::string>& cond) const;
    std::string getInfo() const;

private:
    double radius;
    double height;
};

#endif