#include <iostream>
#include <fstream>
#include <sstream>
#include <iomanip>
#include <vector>
#include <limits>
#include <cctype>

#include "Shape.h"
#include "reading.h"
#include "Sphere.h"
#include "Cylinder.h"
#include "Cone.h"
#include "Cuboid.h"
#include "reading.h"

using namespace std;

int main() {
    /*
    string name = "Cube#1";
    Cuboid cyl(name,2,2,2);
    vector<string> cond;
    
    cond.push_back("type");
    cond.push_back("<");
    cond.push_back("cyl");

    cout << cyl.test(cond) << endl;
    cout << cyl.getInfo() << "\n"; 
    */
    readFrom("shapes.dat");

    return 0;
}