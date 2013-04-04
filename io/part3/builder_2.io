OperatorTable addAssignOperator(":", "atPutNumber")

curlyBrackets := method(
  r := Map clone
  writeln("message: ", call message)
  writeln("arguments: ", call message arguments)
  call message arguments foreach(arg,
    writeln("argx: ", arg)
    r doMessage(arg)
  )
  r
  writeln("r: ", r asObject))

Map atPutNumber := method(
  writeln("xx")
  self atPut(
    call evalArgAt(0) asMutable removePrefix("\"") removeSuffix("\""),
    call evalArgAt(1)))

Builder := Object clone
i := 0
Builder forward := method(
  for(l, 1, i*2, write(" "))
  writeln("<", call message name)
  call message arguments foreach(
    arg,
    i = i + 1
    writeln("arg: ", arg)
    content := self doMessage(arg)
    if(content type == "Sequence",
      for(l, 1, i*2, write(" "))
      writeln(content))
      i = i - 1)
  for(l, 1, i*2, write(" "))
  writeln("</", call message name, ">"))


Builder ul(
  li({"id" : "li_here"}, "Io"),
  li("Lua"),
  li("JavaScript"),
  li(ul(li("A"),li("B"))))


Test := Object clone
Test forward := method(
  call message arguments foreach(arg,
    writeln("arg: ", arg)
    writeln("arg 0 type: ", arg argAt(0) type)
    writeln("arg 1 type: ", arg argAt(1))))

Test xx(1,"aa")
