#include <stdio.h>
#include "testing.h"

int main( int argc, char **argv ) {
    initialize_test(__FILE__);

    printf("Before any allocation\n");
    tags_print(print_object);

    int * mem1 = (int *) mallocing(8, print_status, false);

    printf("mem1 = malloc(8)\n");
    tags_print(print_object);

    int * mem2 = (int *) reallocing(32, mem1, print_status, false);

    printf("mem1 = realloc(32)\n");
    tags_print(print_object);

    mem2 = (int *) reallocing(40, mem1, print_status, false);

    printf("mem1 = realloc(40)\n");
    tags_print(print_object);

    freeing(mem2, 8, print_status, false);
    printf("free(mem1))\n");
    tags_print(print_object);

    finalize_test();
}
