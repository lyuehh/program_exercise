#! /usr/bin/env io

A := Object clone
A m := method(write("self is: ", self, "in A\n"))
B := A clone
B m := method(write("self is: ", self, "in B\n"); resend)
B m

