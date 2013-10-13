vizzini := Object clone
vizzini talk := method(
  "Fezzik, are there roocks ahead?" println
  yield
  "No more rhymes now, I mean it." println
  yield)

fezzik := Object clone
fezzik rhyme := method(
  yield
  "If there are, we'll all be head." println
  yield
  "Anybody want a peanut?" println)

vizzini @@talk; fezzik @@rhyme

Coroutine currentCoroutine pause
