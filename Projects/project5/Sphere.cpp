#include "Sphere.h"
#include "Shape.h"

using namespace std;

Sphere::Sphere(const string name, double radius) : Shape(name) {
    this->radius = radius;
}
Sphere::~Sphere() = default;

double Sphere::getArea() const{
    return 4*PI*(radius*radius);
} 

double Sphere::getVolume() const{
    return (double(4)/double(3))*PI*(radius*radius*radius);
}

bool Sphere::test(const vector<string>& cond) const{
    if (cond.empty()) {
        return true;
    }
    for(int i=0; i<cond.size(); i=i+3) {
        string name = cond.at(i);
        string op = cond.at(i+1);
        string value = cond.at(i+2);

        if (name == "type") { //type op value
            string type = "sphere";
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

string Sphere::getInfo() const{
    string text;
    text = "Name: " + this->getName() + " Area: ";
    string area = to_string(this->getArea());
    text.append(area);

    return text;
}



