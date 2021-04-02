#include "physician.h"
#include "teaching.h"

using namespace std;

Teaching::Teaching(const string &firstName ,const string &lastName, double base, double wrvu, double wrvu_r) : Physician(firstName,lastName) {
    this->Base = base;
    this->wRVU = wrvu;
    this->wRVU_rate = wrvu_r;
}

Teaching::~Teaching() = default;

void Teaching::setBase(double base_A) {
    this->Base = base_A;
}

double Teaching::getBase() {
    return this->Base;
}

void Teaching::setwRVU(double wrvu) {
    this->wRVU = wrvu;
}

double Teaching::getwRVU() {
    return this->wRVU;
}

void Teaching::setRate(double rate) {
    this->wRVU_rate = rate;
}

double Teaching::getRate() {
    return this->wRVU_rate;
}


double Teaching::getAnnual() const {
    double Annual = 0;
    Annual = Annual + Base;

    double TwRVU = wRVU - 3000;
    if(TwRVU < 0) {
        TwRVU = 0;
    }

    Annual = Annual + (TwRVU * wRVU_rate);

    if(Annual < 0) {
        Annual = 0;
    }


    return Annual;
}

string Teaching::getInfo() const {
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
    text = this->getFirstName() +" "+ this->getLastName()+"(T) "+ Salary + " " + scale;

    return text;
}