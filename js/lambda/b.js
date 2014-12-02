(((f,g) => {
   return (n) => f(g(n))
})((n) => n*3,
((n) => {
   return (x) => n + x
})(1))(10))
