#include <stdio.h>
#include <string.h>
#include <stdlib.h>
//int lsearch(int key, int array[], int len)
//{
//    int i;
//    for(i = 0; i < len; i++) {
//        if(key == array[i])
//            return i;
//    }
//    return -1;
//}

//void *lsearch(const void *key, void *base, int n, int elemSize)
//{
//    int i;
//    for(i = 0; i < n; i++) {
//        void *elemAddr = (char *)base + i * elemSize;
//        if(memcmp(key, elemAddr, elemSize) == 0)
//            return elemAddr;
//    }
//    return NULL;
//}

//the design will not modify the method above, if we use the string the above need memcmp(*key, *element, elemSize )
//and we should know the address it type char * or char **
void *lsearch(const void *key, void *base, int n, int elemSize, int (*cmpfn)(const void *, const void *))
{
    int i;
    for(i = 0; i < n ;i ++) {
        void *elemAddr = (char *)base + i * elemSize;
        if(cmpfn(key, elemAddr) == 0)
            return elemAddr;
    }
    return NULL;
}

int intCmp(const void * s1, const void * s2)
{
    int *ip1 = (int *) s1;
    int *ip2 = (int *) s2;
    return *ip1 - *ip2;
}

int strCmp(const void *s1, const void * s2)
{
    char *sp1 = *(char **)s1;
    char *sp2 = *(char **)s2;
    return strcmp(sp1, sp2);
}

/**
 * the difference between the memcpy and memmove is that the latter need check the src and the dest wether it overlaps
 * the former is more effective
 * */

int rotate(void *start, void *middle, void *end)
{
    int leftLength = (char *)middle - (char *)start;
    char buffer[leftLength];
    memcpy(buffer, start, leftLength);
    memmove(start, middle, (char *)end - (char *)middle);
    memcpy(end - leftLength, buffer, leftLength);
}

int main(void)
{
//    int arr[] = {1 ,2 ,6 ,23 ,6, 7};
//    int key = 5;
//    int index = lsearch(key, arr, 6);
//    if(index != -1)
//        printf("index %d value %d\n", index, arr[index]);
//    else
//        printf("%d couldn't found\n", key);

//    int arr[] = {1 ,2 ,6 ,23 ,6, 7};
//    int key = 1;
//    int *index = lsearch(&key, arr, 6, sizeof(int));
//    if(index != NULL)
//        printf("index %d value %d\n", index, *index);
//    else
//        printf("%d couldn't found\n", key);
//    return 0;

    int arr[] = {1 ,2 ,6 ,23 ,6, 7};
    int key = 5;
    int *index = lsearch(&key, arr, 6, sizeof(int), intCmp);
    if(index != NULL)
        printf("index %x value %d\n", (unsigned int)index, *index);
    else
        printf("%d couldn't found\n", key);

    char *name[] = {"jacky", "lau", "hello", "world"};
    char *person1 = strdup("hello");
    char **ret = lsearch(&person1, name, 4, sizeof(char *), strCmp);
    if(ret != NULL)
        printf("index %x value %s\n", (unsigned int)ret, *ret);
    else
        printf("%s couldn't found\n", person1);
    free(person1);

    int a[] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
    rotate(a, a + 3, a + 10);
    int i;
    for(i = 0; i < 10; i++)
    {
        printf("%d ", a[i]);
    }
    return 0;
}

