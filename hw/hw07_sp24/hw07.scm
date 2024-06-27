(define (square n) (* n n))

; Implement a procedure pow that raises a base to the power of a nonnegative integer exp.
; The number of recursive pow calls should grow logarithmically with respect to exp, rather than linearly.
; For example, (pow 2 32) should result in 5 recursive pow calls rather than 32 recursive pow calls.
; (define (pow base exp) 'YOUR-CODE-HERE)

(define (pow base exp) 
  (if (= exp 1) 
    base 
    (if (even? exp) 
      (square (pow base (/ exp 2))) 
      (* base (square (pow base (/ (- exp 1) 2))))
    )
  ))


; Implement repeatedly-cube, which receives a number x and cubes it n times.
; (define (repeatedly-cube n x)
;   (if (zero? n)
;       x
;       (let (_________________)
;         (* y y y))))

(define (repeatedly-cube n x)
   (if (zero? n)
       x
       (let ((y (repeatedly-cube (- n 1) x)))
         (* y y y))))


; Define the procedure cadr, which returns the second element of a list.
; Also define caddr, which returns the third element of a list.
; (define (cadr s) 'YOUR-CODE-HERE)
; (define (caddr s) 'YOUR-CODE-HERE)

(define (cddr s) (cdr (cdr s)))

(define (cadr s) (car (cdr s)))

(define (caddr s) (car (cddr s)))
