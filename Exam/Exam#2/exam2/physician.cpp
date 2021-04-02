#include "physician.h"

using namespace std;

Physician :: Physician(const string &firstName, const string &lastName) {
    this->FirstName = firstName;
    this->LastName = lastName;
}

void Physician::setFirstName(const std::string &firstName) {
    this->FirstName = firstName;
}
string Physician::getFirstName() const {
    return FirstName;
}
void Physician::setLastName(const std::string &lastName) {
    this->LastName = lastName;
}
string Physician::getLastName() const {
    return LastName;
}