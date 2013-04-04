#! /usr/bin/env io

MyObject := Object clone
MyObject forward := method(
    write("sender = ", call sender, "\n")
    write("target = ", call target, "\n")
    write("self = ", self, "\n")
    write("activated = ", call activated, "\n")
    write("slotContext = ", call slotContext, "\n")
    write("sender type: ", call sender type, "\n")
    write("message name = ", call message name, "\n")
    write("message = ", call message, "\n")
    args := call message argsEvaluatedIn(call sender)
    write("args type: ", args type, "\n")
    args foreach(i, v, write("arg", i, " = ", v, "\n"))
)

MyObject xx("a","b")


