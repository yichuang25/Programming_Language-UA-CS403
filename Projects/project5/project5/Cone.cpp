#include "Cone.h"
#include "Shape.h"
#include <math.h>

using namespace std;

Cone::Cone(const std::string name, double radius, double height) : Shape(name) {
    this->radius = radius;
    this->height = height;
}

Cone::~Cone() = default;

double Cone::getArea() const {
    return PI*radius*(radius + sqrt(radius*radius + height*height));
}

double Cone::getVolume() const {
    return ((double)1/(double)3)*PI*radius*radius*height;
}

bool Cone::test(const vector<string>& cond) const {
    if (cond.empty()) {
        //printf("2\n");
        return true;
    }
    for(int i=0; (unsigned)i<cond.size(); i=i+3) {
        string name = cond.at(i);
        string op = cond.at(i+1);
        string value = cond.at(i+2);
        //printf("%s\n",cond.at(i).c_str());
        if (name == "type") { //type op value
            
            string type = "cone";
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
                if(type < value) {
                    return false;
                }
            }
            else if(op == "<=") {
                if(type > value) {
                    return false;
                }
            }
            else if(op == ">") {
                if(type <= value) {
                    return false;
                }
            }
            else { //<
                if(type >= value) {
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

string Cone::getInfo() const{
    string text;
    char radius[100];
    char height[100];
    char area[100];
    char volume[100];

    sprintf(radius,"%.2lf",this->radius);
    sprintf(height,"%.2lf",this->height);
    sprintf(volume,"%.2lf",this->getVolume());
    sprintf(area,"%.2lf",this->getArea());

    text = "Cone: " + this->getName() + ", Radius=" + radius + ", Height=" + height + "\n\tSurface area: " + area + ", Volume: " + volume;
    return text;
}