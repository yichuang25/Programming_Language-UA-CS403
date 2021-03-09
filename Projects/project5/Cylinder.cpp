#include "Cylinder.h"
#include "Shape.h"

using namespace std;

Cylinder::Cylinder(const std::string name, double radius, double height) : Shape(name){
    this->radius = radius;
    this->height = height;
}

Cylinder::~Cylinder() = default;

double Cylinder::getArea() const {
    return 2*PI*radius*(radius + height);
}

double Cylinder::getVolume() const {
    return PI*radius*radius*height;
}

bool Cylinder::test(const vector<string>& cond) const {
    if (cond.empty()) {
        //printf("2\n");
        return true;
    }
    for(int i=0; i<cond.size(); i=i+3) {
        string name = cond.at(i);
        string op = cond.at(i+1);
        string value = cond.at(i+2);
        //printf("%s\n",cond.at(i).c_str());
        if (name == "type") { //type op value
            
            string type = "cylinder";
            if(op == "==") {
                if(type != value) {
                    return false;
                }
            }
            else if(op == "!=") {
                if(type == value){
                    return false;
                }
            }
            else if(op == ">=") {
                if(type < name) {
                    return false;
                }
            }
            else if(op == "<=") {
                if(type > name) {
                    return false;
                }
            }
            else if(op == ">") {
                if(type <= name) {
                    return false;
                }
            }
            else { //<
                if(type >= name) {
                    return false;
                }
            }
        }
        else if (name == "area") { // area op value
            double area = this->getArea();
            double _value = atof(value.c_str());
            if(op == "==") {
                if(area != _value) {
                    return false;
                }
            }
            else if(op == "!=") {
                if(area == _value) {
                    return false;
                }
            }
            else if(op == ">=") {
                if(area < _value) {
                    return false;
                }
            }
            else if(op == "<=") {
                if(area > _value) {
                    return false;
                }
            }
            else if(op == ">") {
                if(area <= _value) {
                    return false;
                }
            }
            else { //<
                if(area >= _value) {
                    return false;
                }
            }
        }
        else {
            double volume = this->getVolume();
            double _value = atof(value.c_str());
            if(op == "==") {
                if(volume != _value) {
                    return false;
                }
            }
            else if(op == "!=") {
                if(volume == _value) {
                    return false;
                }
            }
            else if(op == ">=") {
                if(volume < _value) {
                    return false;
                }
            }
            else if(op == "<=") {
                if(volume > _value) {
                    return false;
                }
            }
            else if(op == ">") {
                if(volume <= _value) {
                    return false;
                }
            }
            else { //<
                if(volume >= _value) {
                    return false;
                }
            }
        }
    }
    return true;
}

string Cylinder::getInfo() const {
    string text;
    char radius[6];
    char height[6];
    char area[6];
    char volume[6];

    sprintf(radius,"%.2lf",this->radius);
    sprintf(height,"%.2lf",this->height);
    sprintf(volume,"%.2lf",this->getVolume());
    sprintf(area,"%.2lf",this->getArea());

    text = "Cylinder: " + this->getName() + ", Radius=" + radius + ", Height=" + height + "\nSurface area: " + area + ", Volume: " + volume;
    return text;
}
