Node := Object clone do(
  init := method(item,
    self item := item
    self next := nil
  )
)

Stack := Object clone do(
  init := method(
    self first := nil
    self N := 0
  )

  size := method(
    self N
  )

  isEmpty := method(
    self N === 0
  )

  push := method(item,
    oldFirst := self first
    self first := Node clone
    self first item := item
    self first next := oldFirst
    self N = self N + 1
  )

  pop := method(
    item := self first item
    self first := self first next
    self N = self N - 1
    item
  )
)

stack := Stack clone
stack push(1)
stack push(2)

writeln("stack: ", stack asString)
writeln("pop1: ", stack pop)
writeln("pop2: ", stack pop)


