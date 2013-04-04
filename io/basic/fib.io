#! /usr/bin/env io

fib := method(i,
  if(i < 2,
    i,
    return fib(i-1) + fib(i-2)))

fib(10) println
