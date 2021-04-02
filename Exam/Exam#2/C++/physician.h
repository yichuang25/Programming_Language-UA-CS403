#ifndef _PHYSICIAN_H_
#define _PHYSICIAN_H_

#include <string>
#include <vector>

class Physician {
public:
    Physician(const std::string &firstName ,const std::string &lastName);

    void setFirstName(const std::string &firstName);
    std::string getFirstName() const;
    void setLastName(const std::string &lastName);
    std::string getLastName() const;

    virtual double getAnnual() const = 0;
    virtual std::string getInfo() const = 0;


private:
    std::string FirstName;
    std::string LastName;

};

#endif