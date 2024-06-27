; Define a procedure over-or-under which takes in a number num1 and a number num2 and returns the following:
; -1 if num1 is less than num2
; 0 if num1 is equal to num2
; 1 if num1 is greater than num2

; (define (over-or-under num1 num2) 'YOUR-CODE-HERE)
; (define (over-or-under num1 num2) 
;   (if (< num1 num2) -1
;     (if (= num1 num2) 0 1)
;   ))

; alternate implementation using cond
(define (over-or-under num1 num2) 
  (cond 
    ((< num1 num2) -1)
    ((= num1 num2) 0)
    ((> num1 num2) 1)
  ))


; Write the procedure make-adder which takes in an initial number, num, and then returns a procedure. 
; This returned procedure takes in a number inc and returns the result of num + inc.
; (define (make-adder num) 'YOUR-CODE-HERE)

; (define (make-adder num) 
;   (define (inner-proc inc)
;     (+ inc num)
;   ) 
;   inner-proc)

; alternate implementation using lambda
(define (make-adder num) 
  (lambda (inc) (+ num inc)))


; Write the procedure composed, which takes in procedures f and g and outputs a new procedure.
; This new procedure takes in a number x and outputs the result of calling f on g of x.
; (define (composed f g) 'YOUR-CODE-HERE)

(define (composed f g) 
  (lambda (x) (f (g x))))


; Write the procedure repeat, which takes in a procedure f and a number n, and outputs a new procedure.
; This new procedure takes in a number x and outputs the result of applying f to x a total of n times.
; (define (repeat f n) 'YOUR-CODE-HERE)

(define (repeat f n) 
  (define (inner-proc x)
    (if (= n 0) 
      x 
      ((repeat f (- n 1)) (f x))
    )
  )
  inner-proc)


; The GCD is the the greatest common divisor of two positive integers.
; Write the procedure gcd, which computes the GCD of numbers a and b using Euclid's algorithm,
; which uses the fact that the GCD of two values is either of the following:

; a) the smaller value if it evenly divides the larger value, or
; b) the greatest common divisor of the smaller value and the remainder of the larger value divided by the smaller value
; (define (gcd a b) 'YOUR-CODE-HERE)

(define (max a b)
  (if (> a b)
      a
      b))

(define (min a b)
  (if (> a b)
      b
      a))

(define (gcd a b)
  (let ((c (modulo (max a b) (min a b))))
    (if (zero? c)
      (min a b)
      (gcd a c)
    )
  ))
