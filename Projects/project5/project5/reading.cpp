#include "reading.h"
#include "Shape.h"
#include <fstream>
#include <sstream>
#include "Sphere.h"
#include "Cylinder.h"
#include "Cone.h"
#include "Cuboid.h"

using namespace std;

vector<Shape*> *readFrom(string file) {
    ifstream datfile;
    vector<Shape*> list;
    datfile.open(file);
    int count = 0;
    if(datfile) {
        string line;
        while(getline(datfile,line)) {
            string name;
            string shape;
            stringstream line_in(line);
            line_in >> name;
            line_in >> shape;
            //printf("%s %s\n",name.c_str(), shape.c_str());
            if(shape == "sphere") {
                string radius;
                line_in >> radius;
                double _radius = atof(radius.c_str());
                Sphere *sp = new Sphere(name,_radius);
                list.push_back(sp);
                count++;
            }
            else if(shape == "cylinder") {
                string radius;
                string height;
                line_in >> radius;
                line_in >> height;
                double _radius = atof(radius.c_str());
                double _height = atof(height.c_str());
                Cylinder *cyl = new Cylinder(name, _radius, _height);
                list.push_back(cyl);
                count++;
            }
            else if(shape == "cone") {
                string radius;
                string height;
                line_in >> radius;
                line_in >> height;
                double _radius = atof(radius.c_str());
                double _height = atof(height.c_str());
                Cone *cone = new Cone(name, _radius, _height);
                list.push_back(cone);
                count++;
            }
            else if(shape == "cuboid") {
                string length;
                string width;
                string height;
                line_in >> length;
                line_in >> width;
                line_in >> height;
                double _length = atof(length.c_str());
                double _width = atof(width.c_str());
                double _height = atof(height.c_str());
                Cuboid *cub = new Cuboid(name, _length,_width ,_height);
                list.push_back(cub);
                count++;
            }
            else {
                printf("No such shape %s\n", shape.c_str());
            }

            //printf("%s\n",line.c_str());
        }
    }
    else {
        printf("No such file\n");  
    }
    vector<Shape*> *_list = new vector<Shape*>;
    for(int i=0; i<count; i++) {
        //printf("%s\n",list.at(i)->getInfo().c_str());
        _list[0].push_back(list.at(i));
    }
    //printf("%s\n",list.at(0)->getInfo().c_str());
    datfile.close();
    return _list;
}   