#lang racket
(zero? 32)
(zero? 0)
(symbol=? 'a 'b)

(struct student (name id# dorm) #:transparent)
(define sophomore3 (student 'David 100234 'PG))
(student-name sophomore3)
(student? 'a)
(student? sophomore3)
(student? (student 1 2 3))
(student? "i am student")

; check datatype
(number? 'a)
(string? "hello world")
(symbol? 'a)
;(image? 10)
(boolean? "false")
(list? 'eh)
(cons? '(what is that aboot?))
(empty? 'a)

; check number
(real? 10)
(real? (sqrt -1))
(rational? 2/3)
(integer? 1.0)
(integer? 1)
(exact-integer? 1.0)

; more
(= 1 2)
(= (sqrt -1) 0+1i)
(boolean=? #f #f)
(string=? "hello world" "good bye")
(equal? (student 'David 100234 'PG) sophomore3)

; equal
(equal? '(1 2 3) '(1 2 3))
(equal? 'a 'b)
(equal? "hello world" 'a)
(equal? 10 10)
(equal? #t 10)

; example
(define (add-to-front-of-123 x)
  (cons x '(1 2 3)))
(add-to-front-of-123 'a)
(add-to-front-of-123 0)
(add-to-front-of-123 '(a b c))

(if (= (+ 1 2) 3)
    'yes
    'no)
(if (= (+ 1 2) 4)
    'yes
    'no)
(if #t
    'yes
    'no)

; everything that is not #f is true

(if (odd? 5)
    'yes
    'no)
; if和define都是特殊的形式，不是函数，函数会先求值，再代入
; if则是短路的，只在需要的时候求值
(if (odd? 5)
    'odd
    (/ 1 0))

; cond
(define x 7)
(cond [(= x 7) 5]
      [(odd? x) 'odd-number]
      [else 'even-number])

; recursion
(printf "----recursion----\n")
(define (my-length a-list)
  (if (empty? a-list)
      0
      (add1 (my-length (rest a-list)))))
(my-length (list 1 2 3))

; and or
(and (odd? 5) (odd? 2) (odd? (/ 1 0)))
(or (odd? 4) (odd? 5) (even? 10))

#|
(if file-modified
    (if (ask-user-about-saving)
        (save-file)
        false)
    false)
->
|#
;(and file-modified (ask-user-about-saving) (save-file))

(when (and (> 5 1) (< 1 2))
  'haha)
(unless (< 4 1)
  'haha2)

; member tricks
(if (member 4 (list 3 4 1 5)) '4-is-in 'not-in)
(member 1 '(3 4 1 5)) ; -> '(1 5)

; equality
(struct point (x y) #:transparent)
; point
; point-x
; point-y
; point?

(define (distance-to-origin p)
  (sqrt (+ (sqr (point-x p)) (sqr (point-y p)))))
(distance-to-origin (point 3 4))

; equal? and eq?
(define pt1 (point -1 2))
(define pt2 (point -1 2))
(equal? pt1 pt2)
(eq? pt1 pt2)
(eq? pt1 pt1)

; testing
(require rackunit)
(check-equal? (add1 5) 6)
(check-equal? (add1 6) 7)
; bad syntax
; (check-equal? (sub1 (add1 5) 5))
; (check-equal? 5 6 "number matter!")

; more test
(check-not-equal? 2 1)
(check-pred number? 1)
(check-= 1 3 2)
(check-true #t)
(check-false #f)
(check-not-false #t)

; constants
(define WIDTH 100)
(define HEIGHT 100)
(unless (> HEIGHT 0)
  (error "HIEGHT must > 0"))

; local define
(define (fun1)
  (define x 10)
  (display x))
(fun1)