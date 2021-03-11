#include <stdio.h>
#include <stdlib.h>

int compare (const void *a, const void *b) {
    if (*(double *)a > *(double *)b) {
        return 1;
    }
    else {
        return -1;
    }
}

int main () {

    double values[] = {40.7, 40.9, 40.1, 40.8, 40.5, 40.3, 40.6, 40.2, 40.4, 40.0};
    qsort(values,10,sizeof(double),compare);
    for(int i=0;i<10;i++) {
        printf("%lf ",values[i]);
    }
    printf("\n");
    return 0;
}