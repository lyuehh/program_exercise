#! /usr/bin/env io

fib := method(i,
  a := 1
  b := 1
  c := 0
  for(index, 1, i,
    if(index < 3) then (
      c = 1
    ) else (
      c := a + b
      a := b
      b := c
    )
  )
  return c
)

fib(10) println
