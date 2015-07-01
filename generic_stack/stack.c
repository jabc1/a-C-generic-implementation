#include "stack.h"
#include <malloc.h>
#include <assert.h>
#include <stdlib.h>
#include <string.h>

/*
 *version 1
 *
 */
//void stackNew(stack *s)
//{
//    s->top = 0;
//    s->size = 4;
//    s->base = malloc(sizeof(int) * 4);
//}

//void stackDispose(stack *s)
//{
//    free(s->base);
//}

//void stackGrow(stack *s)
//{
//    s->size *= 2;
//    s->base = realloc(s->base, s->size * sizeof(int));
//    assert(s->base != NULL);
//}

//void stackPush(stack *s, int value)
//{
//    if(s->top == s->size)
//        stackGrow(s);
//    s->base[s->top ++] = value;
//}

//void stackPop(stack *s, int *value)
//{
//    assert(s->top != 0);
//    *value = s->base[--s->top];
//}





void stackNew(stack *s, int elemSize, void (*free_fn)(void *))
{
    assert(elemSize > 0);
    s->top = 0;
    s->size = 4;
    s->elemSize = elemSize;
    s->free_fn = free_fn;
    s->base = malloc(elemSize * 4);
    assert(s->base != NULL);
}

void stackDispose(stack *s)
{
    int i;
    if(s->free_fn != NULL)
    {
        for(i = 0; i < s->top; i++)
        {
            /* s->base can be type * and type **, so we don't konw*/
            char *elemAddr = (char *)s->base + i * s->elemSize;
            s->free_fn(elemAddr);
        }
    }

    free(s->base);
}

void stackGrow(stack *s)
{
    s->size *= 2;
    s->base = realloc(s->base, s->size * s->elemSize);
    assert(s->base != NULL);
}

void stackPush(stack *s, void *value)
{
    if(s->top == s->size)
        stackGrow(s);
    void *elemAddr = (char *)s->base + s->top * s->elemSize;
    memcpy(elemAddr, value, s->elemSize);
    s->top ++;
}

void stackPop(stack *s, void *value)
{
    assert(s->top != 0);
    s->top --;
    void *elemAddr = (char *)s->base + s->top * s->elemSize;
    memcpy(value, elemAddr, s->elemSize);
}
