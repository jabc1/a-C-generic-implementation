#ifndef __STACK_H__
#define __STACK_H__

/**
  *
  * version 1: simple
  *
  */
//typedef struct stack {
//    int *base;
//    int top;
//    int size;
//}stack;

//void stackNew(stack *s);
//void stackDispose(stack *s);
//void stackPush(stack *s, int value);
//void stackPop(stack *s, int *value);

/**
  *
  *version 2: generic type
  *
  */
typedef struct stack {
    void *base;
    int top;
    int size;
    int elemSize;
    /* add for dispose the resource such as push 100 numbers ,but just pop 50, will cause memory leak*/
    void (*free_fn)(void *);
}stack;

void stackNew(stack *s, int elemSize, void (*free_fn)(void *));
void stackDispose(stack *s);
void stackPush(stack *s, void *value);
void stackPop(stack *s, void *value);
#endif
