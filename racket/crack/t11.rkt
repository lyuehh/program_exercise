#lang racket

(define hello
  (lambda (name)
    (string-append "hello " name)))

(define (hello2 name)
  (string-append "hello " name))

(define hello3
  (case-lambda
    [() "hello world"]
    [(name) (string-append "hello " name)]))

(define (hello4 [name "world"])
  (string-append "hello " name))
