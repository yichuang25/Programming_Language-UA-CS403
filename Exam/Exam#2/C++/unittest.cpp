#include <iostream>
#include <fstream>
#include <sstream>
#include <iomanip>
#include <vector>
#include <limits>
#include <cctype>

#include "physician.h"
#include "clinical.h"
#include "teaching.h"

using namespace std;

int main() {
    //Clinical a("William", "Smith", 6500, 80);
    Teaching a("Noah", "Johnson", 180000, 4200, 60);
    cout << a.getInfo() << endl;

}