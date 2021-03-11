#include <iostream>

using namespace std;

template <class Type>
int search(Type* array, Type key, int size) {

    for(int index = 0; index < size; index++) {
        if( array[index]== key) {
            return index;
        }
    }
    return -1;
}

int main () {
    int array[] = {1,2,3,4,5,6,7,8,9};
    float array2[] = {1.1,2.1,3.1,4.1,5.1,6.1,7.1};
    float key = 5.1;
    

    int result = search(array2, key, 7);
    
    if(result == -1) {
        cout << "Can not find the key.\n";
    }
    else {
        cout << "The position of the key is " << result << "\n";
    }

    return 0;

}