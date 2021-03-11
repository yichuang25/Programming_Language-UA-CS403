#include "reading.h"
#include "Shape.h"
#include <fstream>

using namespace std;

vector<Shape*> *readFrom(string file) {
    ifstream datfile;
    vector<Shape*> *list;
    datfile.open(file);
    if(datfile) {
        string line;
        while(getline(datfile,line)) {
            printf("%s\n",line.c_str());
        }
    }
    else {
        printf("No such file\n");  
    }
    return list;
}   