function fact(n) {
  if(n === 0) {
    return 1;
  } else {
    return n * fact(n-1);
  }
}

// in cps
function fact1(n, ret) {
  if(n === 0) {
    ret(1);
  } else {
    fact1(n-1, function(t0) {
      ret(n * t0);
    });
  }
}

console.log(fact(5));
fact1(5, function(n){
  console.log(n);
});

// tail-recursive factorial
function tail_fact2(n, a) {
  if(n === 0) {
    return a;
  } else {
    return tail_fact2(n-1, n*a);
  }
}
function fact2(n) {
  return tail_fact2(n, 1);
}

console.log(fact2(5));

// in cps
function tail_fact3(n, a, ret) {
  if(n === 0) {
    ret(a);
  } else {
    tail_fact3(n-1, n*a, ret);
  }
}
function fact3(n, ret) {
  tail_fact3(n, 1, ret);
}
fact3(5, function(n){
  console.log(n);
});

// call/cc in JavaScript
function callcc(f, cc) {
  f(function(x, k) {
    cc(x);
  }, cc);
}
