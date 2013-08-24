#lang racket

; list

(cons 1 2) ; -> '(1 . 2)
(cons 1 empty) ; -> '(1)
(cons '1 '()) ; -> '(1)
(cons '1 '(2 3)) ; -> '(1 2 3)
(list 1 2 3) ; -> '(1 2 3)
'(1 2 3) ; -> '(1 2 3)
(first (list 1 2 3)) ; -> 1
(rest (list 1 2 3)) ; -> '(2 3)
(second (list 1 2 3)) ; -> 2
(third (list 1 2 3)) ; -> 3

; struct
(struct student (name id# dorm))
(define stu1 (student 'Joe 1234 'NewHal))
(student-name stu1)
(student-id# stu1)
(student-dorm stu1)

(define stu2 (student 'Haha 2345 'OldHal))
(define stu3 (student 'Hala 4567 'Yesa))
(define stu4 (student 'Yala 6678 'Newoo))
(define in-class (list stu1 stu2 stu3 stu4))
(student-id# (third in-class))
(display in-class)

(struct student-body (freshmen sophomores juniors seniors))
(define all-students
  (student-body (list stu1 (student 'Mary 0101 'OldHall))
                (list (student 'Jeff 5678 'OldHall))
                (list (student 'Bob 4321 'Apartment))
                empty))
(printf "\n")
(display all-students)
(printf "\n")
(student-name (first (student-body-freshmen all-students)))

; structure transparency
(struct example (x y z))
(define ex1 (example 1 2 3))
(display ex1)
(printf "\n")

; transparency
(struct example2 (x y z) #:transparent)
(define ex2 (example2 1 2 3))
(display ex2)
