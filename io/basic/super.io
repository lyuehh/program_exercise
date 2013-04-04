#! /usr/bin/env io

A := Object clone
A m := method(write("self is: ", self, "in A\n"))
B := A clone
B m := method(write("self is: ", self, "in B\n"); super(m))
B m

//b := B clone
//b m

Dog := Object clone
Dog bark := method(writeln("woof!"))

fido := Dog clone
fido bark := method(
  writeln("ruf!")
  super(bark)
)

//fido bark
