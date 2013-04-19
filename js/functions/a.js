function add( seed ) {
  function retVal( later ) {
    return add( seed + later );
  }
  retVal.toString = function() {
    return seed;
  };
  return retVal;
}
console.log(add(1)(2)(3)(4));
