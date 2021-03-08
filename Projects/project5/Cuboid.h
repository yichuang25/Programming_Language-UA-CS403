#ifndef _CUBOID_H_
#define _CUBOID_H_
#include "Shape.h"

class Cuboid: public Shape {
public:
    Cuboid(std::string&, int length, int width, int height);
    ~Cuboid();

    double getArea();
    double getVolume();
    bool test(std::vector<std::string>& cond);
    std::string getInfo();

private:  
    int length;
    int width;
    int height;
};

#endif