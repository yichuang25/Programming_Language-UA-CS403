#ifndef _TEACHING_H_
#define _TEACHING_H_
#include "physician.h"

class Teaching : public Physician {
public:  
    Teaching(const std::string &firstName ,const std::string &lastName, double base, double wrvu, double wrvu_r);
    ~Teaching();

    void setBase(double base);
    double getBase();

    void setwRVU(double mrvu);
    double getwRVU();

    void setRate(double rate);
    double getRate();

    double getAnnual() const;
    std::string getInfo() const;

private:  
    double Base;
    double wRVU;
    double wRVU_rate;


};

#endif