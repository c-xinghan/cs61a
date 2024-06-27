;;;;;;;;;;;;;;;
;; Questions ;;
;;;;;;;;;;;;;;;

; Scheme

(define (cddr s)
  (cdr (cdr s)))

(define (cadr s)
  ; 'YOUR-CODE-HERE
  (car (cdr s)))

(define (caddr s)
  ; 'YOUR-CODE-HERE
  (car (cddr s)))

(define (sign x)
  ; 'YOUR-CODE-HERE
  (cond 
    ((< x 0) -1)
    ((> x 0) 1)
  (else 0)))

(define (square x) (* x x))

(define (pow b n)
  ; 'YOUR-CODE-HERE
  (if
    (= n 1)
    b
    (if (even? n)
      (square (pow b (/ n 2)))
      (* b (square (pow b (/ (- n 1) 2))))
    )
  ))

(define (unique s)
  ; 'YOUR-CODE-HERE
  (if (null? s)
  '()
  (cons (car s) (unique (filter (lambda (i) (not (eq? i (car s)))) (cdr s))))
  )
)