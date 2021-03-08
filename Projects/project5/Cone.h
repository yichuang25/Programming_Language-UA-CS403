#ifndef _CONE_H_
#define _CONE_H_
#include "Shape.h"

class Cone: public Shape {
public:
    Cone(std::string&, int radius, int height);
    ~Cone();

    double getArea();
    double getVolume();
    bool test(std::vector<std::string>& cond);
    std::string getInfo();

private:
    int radius;
    int height;
};

#endif