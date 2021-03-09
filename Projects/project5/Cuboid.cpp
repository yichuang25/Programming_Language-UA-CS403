#include "Cuboid.h"
#include "Shape.h"

using namespace std;

Cuboid::Cuboid(const std::string name, double length, double width, double height) : Shape(name) {
    this->length = length;
    this->width = width;
    this->height = height;
}

Cuboid::~Cuboid() = default;

double Cuboid::getArea() const{
    return 2*width*length + 2*length*height + 2*height*width;
}

double Cuboid::getVolume() const {
    return length*width*height;
}

bool Cuboid::test(const vector<string>& cond) const {
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
            
            string type = "cuboid";
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

string Cuboid::getInfo() const {
    string text;
    char length[6];
    char width[6];
    char height[6];
    char area[6];
    char volume[6];

    sprintf(length,"%.2lf",this->length);
    sprintf(width,"%.2lf",this->width);
    sprintf(height,"%.2lf",this->height);
    sprintf(volume,"%.2lf",this->getVolume());
    sprintf(area,"%.2lf",this->getArea());

    text = "Cone: " + this->getName() + ", Length=" + length +", Width=" + width + ", Height=" + height + "\nSurface area: " + area + ", Volume: " + volume;
    return text;
}