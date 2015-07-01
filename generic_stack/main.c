#include <stdio.h>
#include "stack.h"
#include <string.h>
#include <malloc.h>

void stringFree(void *ptr)
{
    free(*(char **)ptr);
    //free(ptr); //is not true, so the user need to use it correctly
}

int main(void)
{
//    stack s;
//    stackNew(&s);
//    int i;
//    for(i = 0; i < 1000000; i++)
//        stackPush(&s, i);

//    int value;
//    for(i = 0; i < 1000000; i++)
//    {

//        stackPop(&s, &value);
//        printf("%d ", value);
//    }
//    stackDispose(&s);

    stack intStack;
    stackNew(&intStack, sizeof(int), NULL);
    int i;
    for(i = 0; i < 1000; i++)
        stackPush(&intStack, &i);

    int value;
    for(i = 0; i < 1000; i++)
    {
        stackPop(&intStack, &value);
        printf("%d ", value);
    }
    stackDispose(&intStack);

    stack stringStack;
    stackNew(&stringStack, sizeof(char *), stringFree);

    char *name[] = {"hello", "world", "shabby", "fuck"};
    for(i = 0; i < 1000000; i++)
    {
        char *person1 = strdup(name[1]);
         stackPush(&stringStack, &person1);
    }



    for(i = 0; i < 10; i++)
    {
        char *person2;
        stackPop(&stringStack, &person2);
        printf("%s ", person2);
        free(person2);
    }
    stackDispose(&stringStack);
    return 0;
}

