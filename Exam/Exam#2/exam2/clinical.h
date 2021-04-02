#ifndef _CLINICAL_H_
#define _CLINICAL_H_
#include "physician.h"

class Clinical : public Physician {
public:  
    Clinical(const std::string &firstName ,const std::string &lastName, double wrvu, double wrvu_r);
    ~Clinical();

    void setwRVU(double mrvu);
    double getwRVU();

    void setRate(double rate);
    double getRate();

    double getAnnual() const;
    std::string getInfo() const;

private:  

    double wRVU;
    double wRVU_Rate;

};

#endif