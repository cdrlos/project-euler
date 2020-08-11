#|
Problem 2:

Each new term in the Fibonacci sequence is generated by adding the previous two
terms. By starting with 1 and 2, the first 10 terms will be:

1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...

By considering the terms in the Fibonacci sequence whose values do not exceed
four million, find the sum of the even-valued terms.
|#
;; Answer: 4613732

(cond-expand
  (guile (use-modules (srfi srfi-1)))
  (chicken (import (chicken format) srfi-1)))

(define (fibonacci-numbers< n)
  (define (fib-tail fibn-2 fibn-1 fib-lst)
    (if (> (+ fibn-2 fibn-1) n)
        fib-lst
        (fib-tail fibn-1
                  (+ fibn-1 fibn-2)
                  (cons (+ fibn-1 fibn-2) fib-lst))))
  (fib-tail 1 1 '()))

(define (even-fibonacci-numbers< n)
  (filter even? (fibonacci-numbers< n)))

(define (sum lst)
  (fold-right + 0 lst))

(define answer-002
  (sum (even-fibonacci-numbers< 4000000)))

(define (main)
  (display (format #t "Problem 2 answer: ~a~%" answer-002)))

(main)
