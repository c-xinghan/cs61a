;; Scheme ;;

(define (over-or-under a b)
  ; 'YOUR-CODE-HERE
  (cond ((< a b) -1) ((> a b) 1) (else 0))
)

;;; Tests
(over-or-under 1 2)
; expect -1
(over-or-under 2 1)
; expect 1
(over-or-under 1 1)
; expect 0

(define (filter-lst fn lst)
  ; 'YOUR-CODE-HERE
  (filter fn lst)
)

;;; Tests
(define (even? x)
  (= (modulo x 2) 0))
(filter-lst even? '(0 1 1 2 3 5 8))
; expect (0 2 8)

(define (make-adder n)
  ; 'YOUR-CODE-HERE
  (define (adder x)
    (+ x n)
  )
  adder
)

;;; Tests
(define adder (make-adder 5))
(adder 8)
; expect 13

;; Extra questions

(define lst
  ; 'YOUR-CODE-HERE
  (list (list 1) 2 (list 3 4) 5)

  ; alternate solution
  ; (cons (cons 1 nil) (cons 2 (cons (cons 3 (cons 4 nil)) (cons 5 nil))))
)

(define (composed f g)
  ; 'YOUR-CODE-HERE
  (define (composition x)
    (f(g x))
  )
  composition
)

(define (remove item lst)
  ; 'YOUR-CODE-HERE
  (filter-lst (lambda (i) (not (= i item))) lst)
)


;;; Tests
(remove 3 nil)
; expect ()
(remove 3 '(1 3 5))
; expect (1 5)
(remove 5 '(5 3 5 5 1 4 5 4))
; expect (3 1 4 4)

(define (no-repeats s)
  ; 'YOUR-CODE-HERE
  (if (null? s)
    nil
    (cons (car s) (no-repeats (filter-lst (lambda (i) (not (= i (car s)))) (cdr s))))
  )
)

(define (substitute s old new)
  ; 'YOUR-CODE-HERE
  (if (null? s)
    nil

    ; (if (eq? (car s) old)
    ;   (if (pair? (car s))
    ;     (cons (substitute (cons new (cdr (car s))) old new) (substitute (cdr s) old new))
    ;     (cons new (substitute (cdr s) old new))
    ;   )
    ;   (if (pair? (car s))
    ;     (cons (substitute (car s) old new) (substitute (cdr s) old new))
    ;     (cons (car s) (substitute (cdr s) old new))
    ;   )
    ; )

    ; better solution with less repeated code
    (cons 
      (if (pair? (car s)) 
        (substitute (car s) old new)
        (if (eq? (car s) old)
          new
          (car s)
        )
      ) 
      (substitute (cdr s) old new)
    )
  )
)




(define (sub-all s olds news)
  ; 'YOUR-CODE-HERE
  (if (null? olds)
    s
    (sub-all (substitute s (car olds) (car news)) (cdr olds) (cdr news))
  )
)