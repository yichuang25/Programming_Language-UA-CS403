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

vector<Physician*> *readFrom(string file) {
    ifstream datafile;
    vector<Physician*> list;
    datafile.open(file);
    int count = 0;
    if(datafile) {
        string line;
        while(getline(datafile,line)) {
            string work;
            string firstname;
            string lastname;
            stringstream line_in(line);
            line_in >> work;
            line_in >> firstname;
            line_in >> lastname;

            if(work == "teaching") {
                string base;
                string wrvu;
                string rate;

                line_in >> base;
                line_in >> wrvu;
                line_in >> rate;

                double _base = atof(base.c_str());
                double _wrvu = atof(wrvu.c_str());
                double _rate = atof(rate.c_str());

                Teaching *tc = new Teaching(firstname,lastname,_base,_wrvu,_rate);
                list.push_back(tc);
                count++;

            }
            else if(work == "clinical") {
                string  wrvu;
                string rate;

                line_in >> wrvu;
                line_in >> rate;

                double _wrvu = atof(wrvu.c_str());
                double _rate = atof(rate.c_str());

                Clinical *cn = new Clinical(firstname,lastname,_wrvu,_rate);
                list.push_back(cn);
                count++;
            }  
            else {
                cout << "No such physician " << work << endl;
            }
        }
    }
    else {
        cout << "No such file " << endl; 
    }
    vector<Physician*> *_list = new vector<Physician*>;
    for(int i=0; i<count;i++) {
        _list[0].push_back(list.at(i));
    }
    datafile.close();
    return _list;
}

int main(int argc, char *argv[]) {
    
    if(argc != 2) {
        cout << "Usage: " << argv[0] << " physician_file" << endl;
        return 1;
    }

    vector<Physician*> *physicians = readFrom(argv[1]);
    if(physicians->size() == 0) {
        cout << "There are no shape in the file." << endl;
    }

    //cout << physicians->size() << endl;
    for(unsigned int i=0; i<physicians->size(); i++) {
        cout << physicians->at(i)->getInfo() << endl;
    }

    return 0;
}