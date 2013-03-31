(define (fact n)
  (cond
    ((<= n 0) 1)
    (else (* n (fact (- n 1))))))
