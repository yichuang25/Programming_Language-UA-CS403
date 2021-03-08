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

using namespace std;

int main() {
    string name = "Sphere1";
    Sphere sph(name,1);
    cout << sph.getInfo() << "\n";

    return 0;
}