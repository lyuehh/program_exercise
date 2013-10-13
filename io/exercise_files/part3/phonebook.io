OperatorTable addAssignOperator(":", "atPutNumber")

curlyBrackets := method(
  r := Map clone
  writeln("message: ", call message)
  writeln("arguments: ", call message arguments)
  call message arguments foreach(arg,
    writeln("arg: ", arg)
    r doMessage(arg)
  )
  r
)

Map atPutNumber := method(
  self atPut(
    call evalArgAt(0) asMutable removePrefix("\"") removeSuffix("\""),
    call evalArgAt(1))
)

ss := File with("phone.txt") openForReading
s := File with("phone.txt") openForReading contents
phoneNumbers := doString(s)
phoneNumbers keys println
phoneNumbers values println
