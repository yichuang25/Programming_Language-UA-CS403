#include <iostream>
#include <fstream>
#include <sstream>
#include <iomanip>
#include <vector>
#include <limits>
#include <cctype>

#include "reading.h"
#include "Shape.h"

using namespace std;

string _actions[6]={
"print",
"count",
"min",
"max",
"total",
"avg"
};

string _names[3] = {
"type",
"area",
"volume"
};

string _ops[6] = {
"==",
"!=",
">=",
"<=",
">",
"<"
};

// return -1 if invalid
int isValidAction(string action)
{
    for (int i=0; i<6; i++) {
        if (_actions[i]==action) return i;
    }
    return -1;
}

// return -1 if invalid
int isValidName(string name)
{
	for (int i=0; i<3; i++) {
		if (_names[i]==name) return i;
	}
	return -1;
}

int isValidOp(string op)
{
	for (int i=0; i<6; i++) {
		if (_ops[i]==op) return i;
	}
	return -1;
}

string getAction(string line)
{
	unsigned int i;
	for (i=0; i<line.size(); i++) {
		if (isdigit(line[i])) break;
	}

	return line.substr(0, i);
}

// convert the rest of the line to a number
// return 0 if empty
// If invalid, return -1
// If valid, return the number of test conditions
// 
int getCount(string restOfLine)
{
	if (restOfLine.size()==0) return 0;

	unsigned int j;
	for (j=0; j<restOfLine.size(); j++) {
		if (!isdigit(restOfLine[j])) break;
	}
	if (j<restOfLine.size()) return -1;

	stringstream temp(restOfLine);
	int n;
	temp >> n;
	return n;
}

vector<string> getTestConditions(int testc)
{
    string line;
	vector<string> cond;
	int i=0;
	while (i<testc) {
		cout << "Enter test condition #" << i+1 << ": ";
  		string line;
  		getline(cin, line);
		stringstream line_in(line);
		string name;
		line_in >> name;
		if (isValidName(name)<0) {
            cout << name << ": invalid column." << endl;
			continue;
		}	
		string op;
		line_in >> op;
		if (isValidOp(op)<0) {
            cout << op << ": invalid operator." << endl;
			continue;
		}			
		string value;
		line_in >> value;

		cond.push_back(name);
		cond.push_back(op);
		cond.push_back(value);
		i++;
	}
	
	// cout << "cond.size()=" << cond.size() << endl;
	return cond;
}

void printShapes(vector<Shape*> *shapes, const std::vector<std::string>& cond)
{
	cout << fixed << setprecision(2); 
	for (unsigned int i=0; i<shapes->size(); i++) {
		Shape *ptr=shapes->at(i);
		if (ptr->test(cond)) {
			cout << shapes->at(i)->getInfo() << endl;
		}
	}
}

int countShapes(vector<Shape*> *shapes, const std::vector<std::string>& cond)
{
	int count=0;
    for (unsigned int i=0; i<shapes->size(); i++) {
		Shape *ptr=shapes->at(i);
        if (ptr->test(cond)) count++;
    }
	return count;
}

void printHelp()
{
    printf("\tcount\n");
    printf("\t*** print the number of all shapes\n");
    printf("\tcountN\n");
    printf("\t*** print the number of all shapes that satisfy all N conditions specified below\n");
    printf("\t*** for example: count3\n");
    printf("\tprint\n");
    printf("\t*** print all shapes\n");
    printf("\tprintN\n");
    printf("\t*** print all shapes that satisfy all N conditions specified below\n");
    printf("\t*** for example: print4\n");
    printf("\tmin\n");
    printf("\t*** find the minimum surface area and volume of all shapes\n");
    printf("\tminN\n");
    printf("\t*** find the minimum surface area and volume of all shapes that satisfy all N conditions specified below\n");
    printf("\t*** for example: min2\n");
    printf("\tmax\n");
    printf("\t*** find the maximum surface area and volume of all shapes\n");
    printf("\tmaxN\n");
    printf("\t*** find the maximum surface area and volume of all shapes that satisfy all N conditions specified below\n");
    printf("\t*** for example: max3\n");
    printf("\ttotal\n");
    printf("\t*** find the tatal surface area and volume of all shapes\n");
    printf("\ttotalN\n");
    printf("\t*** find the total surface area and volume of all shapes that satisfy all N conditions specified below\n");
    printf("\t*** for example: total4\n");
	printf("\tavg\n");
    printf("\t*** find the average surface area and volume of all shapes\n");
    printf("\tavgN\n");
    printf("\t*** find the average surface area and volume of all shapes that satisfy all N conditions specified below\n");
    printf("\t*** for example: avg2\n");
    printf("\tquit\n");
    printf("\t*** quit this program\n");
    printf("\thelp\n");
    printf("\t*** print this list\n");

    printf("\nEach condition shall be entered in one line and of the following format:\n");
    printf("\n\tname op value\n\n");
    printf("\t*** for example: type >= cuboid\n");
    printf("\t                 area <= 1000\n");
    printf("\t                 volume > 100.5\n");
    printf("\n\tThe valid names:\n");
	for (int i=0; i<3; i++) cout << "\t\t" << _names[i] << endl;
    printf("\n\tThe valid operators:\n");
	for (int i=0; i<6; i++) cout << "\t\t" << _ops[i] << endl;
    cout << endl;
}

int main(int argc, char *argv[])
{
	if (argc!=2) {
		cout << "Usage: " << argv[0] << " shape_file" << endl;
		return 1;
	}

	// read the emplyee file
	vector<Shape*> *shapes=readFrom(argv[1]);
	if (shapes->size()==0) {
		cout << "There are no shapes in the file." << endl;
		return 2;
	}

    while (1) {
        string command;
		string action;
		int testc=0;
        string line;
        cout << "\nEnter a command: ";
        cin >> command;
        getline(cin, line); // skip the rest of line
        if (command=="quit") break;
        if (command=="help") {
            printHelp();
			continue;
        }

		action=getAction(command);
		testc=getCount(command.substr(action.size()));
		if (isValidAction(action)<0 || testc<0) {
			cout << action << ": invalid action" << endl;
			cout << "Valid actions:";
			for (int i=0; i<6; i++) cout << " " << _actions[i];
			cout << endl;
			cout << "Enter help for help" << endl;
			continue;
		}
		if (action=="count") {
			vector<string> cond=getTestConditions(testc);
			int count=countShapes(shapes, cond);
			cout << "There are " << count << " shapes." << endl;
		}
		else if (action=="print") {
			vector<string> cond=getTestConditions(testc);
			int count=countShapes(shapes, cond);
			if (count==0) {
				cout << "There are no shapes satisfying the condition(s)" << endl;
				continue;
			}
			printShapes(shapes, cond);
		}
		else if (action=="min") {
			vector<string> cond=getTestConditions(testc);
			int count=countShapes(shapes, cond);
			if (count==0) {
				cout << "There are no shapes satisfying the condition(s)" << endl;
				continue;
			}
			double area_min=numeric_limits<double>::max();
			double vol_min=numeric_limits<double>::max();
			for (unsigned int i=0; i<shapes->size(); i++) {
				Shape *ptr=shapes->at(i);
        		if (ptr->test(cond)) {
					double area=ptr->getArea();
					if (area<area_min) area_min=area;
					double vol=ptr->getVolume();
					if (vol<vol_min) vol_min=vol;
				}
			}
			cout << fixed << setprecision(2); 
			cout << "min(Surface Area)=" << area_min << endl;
			cout << "min(Volume)=" << vol_min << endl;	
		}
		else if (action=="max") {
			vector<string> cond=getTestConditions(testc);
			int count=countShapes(shapes, cond);
			if (count==0) {
				cout << "There are no shapes satisfying the condition(s)" << endl;
				continue;
			}
			double area_max=numeric_limits<double>::min();
			double vol_max=numeric_limits<double>::min();
			for (unsigned int i=0; i<shapes->size(); i++) {
				Shape *ptr=shapes->at(i);
        		if (ptr->test(cond)) {
					double area=ptr->getArea();
					if (area>area_max) area_max=area;
					double vol=ptr->getVolume();
					if (vol>vol_max) vol_max=vol;
				}
			}
			cout << fixed << setprecision(2); 
			cout << "max(Surface Area)=" << area_max << endl;
			cout << "max(Volume)=" << vol_max << endl;	
		}
    	else if (action=="total" || action=="avg") {
			vector<string> cond=getTestConditions(testc);
			int count=countShapes(shapes, cond);
			if (count==0) {
				cout << "There are no shapes satisfying the condition(s)" << endl;
				continue;
			}
			double area_total=0;
        	double vol_total=0;
			for (unsigned int i=0; i<shapes->size(); i++) {
				Shape *ptr=shapes->at(i);
        		if (ptr->test(cond)) {
					area_total+=ptr->getArea();
					vol_total+=ptr->getVolume();
				}
			}
			cout << fixed << setprecision(2); 
			if (action=="total") {
				cout << "total(Surface Area)=" << area_total << endl;
				cout << "total(Volume)=" << vol_total << endl;
			}
			else {
				cout << "avg(Surface Area)=" << area_total/count << endl;
				cout << "avg(Volume)=" << vol_total/count << endl;
			}
		}
	}

	// clean up
	for (unsigned int i=0; i<shapes->size(); i++) {
		delete shapes->at(i);
	}
	shapes->clear();

	return 0;
}
