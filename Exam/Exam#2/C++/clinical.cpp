#include "physician.h"
#include "clinical.h"

using namespace std;

Clinical :: Clinical(const string &firstName ,const string &lastName, double wrvu, double wrvu_r) : Physician(firstName, lastName){
    this->wRVU = wrvu;
    this->wRVU_Rate = wrvu_r;
}

Clinical :: ~Clinical() = default;

void Clinical::setwRVU(double wrvu) {
    this->wRVU = wrvu;
}

double Clinical::getwRVU() {
    return this->wRVU;
}

void Clinical::setRate(double rate) {
    this->wRVU_Rate = rate;
}

double Clinical::getRate() {
    return this->wRVU_Rate;
}

double Clinical::getAnnual() const {
    double Annual = 0;
    if(wRVU > 5000) {
        Annual = Annual + (5000 * wRVU_Rate) + (wRVU - 5000) * 1.1 * wRVU_Rate;
    }
    else {
        Annual = Annual + (wRVU * wRVU_Rate);
    }

    if(Annual < 0) {
        Annual = 0;
    }

    return Annual;
}

string Clinical::getInfo() const {
    string text;
    double salary = getAnnual();
    string scale;
    char Salary[100];
    sprintf(Salary,"%.2lf",salary);
    if(salary > 400000) {
        scale = "High";
    }
    else if(salary > 200000) {
        scale = "Mid";
    }
    else {
        scale = "Low";
    }
    text = this->getFirstName() +" "+ this->getLastName()+"(C) "+ Salary + " " + scale;

    return text; 
}