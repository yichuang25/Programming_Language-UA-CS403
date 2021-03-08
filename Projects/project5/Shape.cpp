// #include <sstream>
#include "Shape.h"

using namespace std;

Shape::Shape(const string& name)
   : name(name)
{
}

void Shape::setName(const string& name)
{
	this->name = name;
}

string Shape::getName() const
{
	return name;
}