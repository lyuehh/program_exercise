#lang racket

;(substring "the cat haha" 4 6)

(define (extract str)
  (substring str 4 7))

; define and expression
(define pie 3)
(define (piece str)
  (substring str 0 pie))

(define (bake flavor)
  (printf "haha 123\n")
  (string-append flavor " pie"))

(define (reply s)
  (if (equal? "hello" (substring s 0 5))
      "hi!"
      "huh?"))

(define (reply2 s)
  (if (and (string? s)
           (>= (string-length s) 5)
           (equal? "hello" (substring s 0 5)))
      "hi!"
      "huh?"))
(define (reply-more s)
  (cond
    [(equal? "hello" (substring s 0 5))
     "hi!"]
     [(equal? "goodbye" (substring s 0 7))
     "bye!"]
     [(equal? "?" (substring s (- (string-length s) 1)))
      "I don't know"]
     [else "huh?"]))

(define (double v)
  ((if (string? v) string-append +) v v))

(define (twice f v)
  (f (f v)))

(define (make-add-suffix s2)
  (lambda (s) (string-append s s2)))

(define (louder s)
  (string-append s "!"))

;the louder2 is equivalent of louder
(define louder2
  (lambda (s)
    (string-append s "!")))

(define (converse s)
  (define (starts? s2)
    (define len2 (string-length s2))
    (and (>= (string-length s) len2)
         (equal? s2 (substring s 0 len2))))
  (cond
    [(starts? "hello") "hi!"]
    [(starts? "goodbye") "bye!"]
    [else "huh?"]))

(define (game)
  (let ([x (random 4)]
        [o (random 4)])
    (cond
      [(> x o) "x wins"]
      [(> o x) "o wins"]
      [else "cat's game"])))

(define (game2)
  (let* ([x (random 4)]
         [o (random 4)]
         [diff (number->string (abs (- x o)))])
    (cond
      [(> x o) (string-append "x wins by " diff)]
      [(> o x) (string-append "o wins by " diff)]
      [else "cat's game"])))

;lists
(define l (list "a" "b" "c"))

;(length (list "a" "b"))
;(list-ref (list "a" "b") 0)
;(append (list "a") (list "b"))
;(reverse (list "a" "b" "c"))
;(member "a" (list "a" "b"))

(define (map1) (map sqrt (list 1 4 9 16)))
(define (map2) (map (lambda (i) (string-append i "!")) (list "a" "b")))

;andmap like _.all
(define (andmap1) (andmap string? (list "a" 1 "c")))

;ormap like _.any, _.some
(define (ormap1) (ormap number? (list "a" 1 "c")))

;filter
(define (filter1) (filter string? (list "a" 1 2 3 "b")))
(define (filter2) (filter positive? (list 1 -2 3 -4)))

;map multi param
(define (map3)
  (map
   (lambda (s n) (substring s 0 n))
   (list "abcde" "qwert" "987654")
   (list 2 3 4)))

;foldl like reduce
(define (foldl1)
  (foldl (lambda (elem v)
         (+ v (* elem elem)))
  0
  '(1 2 3)))

;list iteration
;(first (list 1 2 3))
;(rest (list 1 2 3))
;(cons "a" empty)
;(cons "a" (cons "b" empty))
;(empty empty) #t
;(cons? empty) #f

(define (my-length lst)
  (cond
   ([empty? lst] 0)
   [else (+ 1 (my-length (rest lst)))]))

(define (my-map f lst)
  (cond
    ([empty? lst] empty)
    [else (cons (f (first lst))
                (my-map f (rest lst)))]))

;tail recursion
(define (my-length2 lst)
  (define (iter lst len)
    (cond
      [(empty? lst) len]
      [else (iter (rest lst) (+ len 1))]))
  (iter lst 0))

(define (my-map2 f lst)
  (define (iter lst backward-result)
    (cond
      [(empty? lst) (reverse backward-result)]
      [else (iter (rest lst)
                  (cons (f (first lst))
                        backward-result))]))
  (iter lst empty))

;equal to
(define (my-map3 f lst)
  (for/list ([i lst])
    (f i)))

(define (remove-dups l)
  (cond
    [(empty? l) empty]
    [(empty? (rest l)) l]
    [else
     (let ([i (first l)])
       (if (equal? i (first (rest l)))
           (remove-dups (rest l))
           (cons i (remove-dups (rest l)))))]))

;pairs, lists, syntax
;pairs
;(cons 1 2) -> '(1 . 2)
;(cons "a" "b") -> '("a" . "b")
;(pair? empty) -> #f
;(pair? (list 1 2 3)) #t
;(cons (list 2 3) 1) -> '((2 3) . 1)
;(cons 1 (list 2 3)) -> '(1 2 3)
;(cons 0 (cons 1 2)) -> '(0 1 . 2)

;quoting pairs
;(list (list 1) (list 2 3) (list 4)) -> '((1) (2 3) (4))
;(quote (1 2 3))-> '(1 2 3)
;(quote ((1) (2 3) (4))) -> '((1) (2 3) (4))
;(quote (1 . 2)) -> '(1 . 2)
;(quote (0 . (1 . 2))) -> '(0 1 . 2)

;symbol
;(quote aa) -> 'aa
;(symbol? (quote aa)) -> #t
;(procedure? map) -> #t
;(string->symbol "map") -> 'map
;(symbol->string (quote map)) -> "map"
;(car (quote (a b))) -> 'a
;(symbol? (car (quote (a b)))) -> #t

;quote has no effect for a number or a string
;(quote 32) -> 32
;(quote "a") -> "a"

;3 Build-in DataTypes

;3.1 boolean
;(= 2 (+ 1 1)) -> #t
;(boolean? #t) -> #t
;any value other than #f is true

;3.2 numbers

; exact number: 
; * integer, 1 -2
; * rational that exactly the ratio of two integer, 1/2 -3/4
; * complex number with exact real and imaginary parts, 1+2i 1/2i+3/4i

; inexact number:
; * IEEE floating-point of a number, 2.0 2.12e+2, +inf.0 -inf.0 +nan.0 -nan.0
; * complex number with IEEE floating 2.0+3.0i -inf.0+nan.oi

; exact -> integer and fractions
; inexact -> with a point

;#eo.5 -> 1/2
;#i1/2 -> 0.5
;#b10 -> 2
;#o10 -> 8
;#xf -> 15

;(exact->inexact)
;(inexact->exact)

;(sin 0) -> 0
;(sin 1/2) -> 0.479....

(define (sigma f a b)
  (if (= a b)
      0
      (+ (f a) (sigma f (+ a 1) b))))

;(integer? 5) 整数
;(rational? 3) 有理数
;(complex? 4)
;(real? 3)
;(number? 3)

;(= 1 1.0) -> #t ;convert inexact to exact numbers
;(eqv? 1 1.0) -> #f
;(equal? 1 1.0) -> #f

; 3.3 characters
;(integer->char 65) -> #\A
;(char->integer #\A) -> 65
;(char->integer #\space) -> 32
;(display #\哈) -> 哈
;(char-alphabetic? #\A) -> #t
;(char-numberic? #\0) -> #t
;(char-whitespace? #\newline) -> #t
;(char-downcase #\A) -> #\a
;(char-upcase #\a) -> #\A
;(char=? #\a #\A) -> #f
;(char-ci=? #\a #\A) -> #t
;(eqv? #\a #\A) -> #f

; 3.4 strings
;(display "asdf") -> asdf
;(string-ref "aaa" 0) -> #\a
;(make-string 4 #\.) -> "...."
(define s (make-string 4 #\.))
(string-set! s 2 #\a)
;locale ..

; 3.5 bytes and byte strings
;(byte? 0) -> #t
;(byte? 256) -> #f
;(bytes-ref #"aa" 0) -> 97
;(make-bytes 3 65) -> #"AAA"
;(bytes-set!)
;(bytes->string/utf-8 #"\316\273")
;(bytes->string/latin-1 #"\316\273")

; 3.6 symbols
; 'a -> 'a
;(symbol? 'a) -> #t
;(eq? 'a (string->symbol "a")) -> #t
;#ci 'A -> a
;(string-symbol "6") -> '|6|
;(write 'a) -> a
;(display 'a) -> a
;(gensym) -> 'xxxx
;(eq? 'a (string->uninterned-symbol "a")) -> #f

; 3.7 keywords
;with #:
;(string->keyword "apple") -> '#:apple

; 3.8 pairs and lists

;pairs
;(cons 1 2) -> '(1 . 2)
;(cons (cons (1 2) 3) -> '((1 . 2) . 3)
;(car (cons 1 2)) -> 1
;(cdr (cons 1 2)) -> 2
;(pair? (cons 1 2)) -> #t

;lists
;null -> '()
;(cons 0 (cons 1 (cons 2 null))) -> '(0 1 2)
;(list? null) -> #t
;(list? (cons 1 (cons 2 null))) -> #t
;(list? (cons 1 2)) -> #f

;(for-each (lambda (i) (display i)) '(1 2 3))
;(member "keys" '("a" "keys" "aa")) -> '("keys" "aa")
;(assoc 'where '((when "a") (where "b") (who "c"))) -> '(where "b"_

; 3.9 vectors
; '#("a" "b" "c")
;#4(a b) -> '#(a b b b)
;(vector-ref #("a" "b" "c") 1) -> "b"
;(vector->list)
;(list->vector)
;(list->vector (map string-titlecase (vector->list #("abc" "def" "haha")))) -> '#("Abc" "Def" "Haha")

; 3.10 Hash Tables
;...

;match
(define (fizzbuzz? n)
  (match (list (remainder n 3) (remainder n 5))
    [(list 0 0) 'fizzbuzz]
    [(list 0 _) 'fizz]
    [(list _ 0) 'buzz]
    [_ #f]))

; `(,(posn 3 3)) ; -> (list (posn 3 3))
; `(,(goo (posn 3 3) 120),(goo (posn 3 3) 120)) ; -> (list (goo (posn 3 3) 120) (goo (posn 3 3) 120))


