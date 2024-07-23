(define (caar x) (car (car x)))
(define (cadr x) (car (cdr x)))
(define (cdar x) (cdr (car x)))
(define (cddr x) (cdr (cdr x)))


;; Problem 15
;; Returns a list of two-element lists
(define (enumerate s)
  ; BEGIN PROBLEM 15
  ; 'replace-this-line
    ; (define (count s c)
    ;   (if (null? s)
    ;     c
    ;     (count (cdr s) (- c 1))
    ;   )
    ; )
    (define (create_pair s i)
      (if (null? s) 
        nil
        (cons (list i (car s)) (create_pair (cdr s) (+ i 1)))
      )
    )
    (create_pair s 0)
  )
  ; END PROBLEM 15

;; Problem 16

;; Merge two lists LIST1 and LIST2 according to COMP and return
;; the merged lists.
(define (merge comp list1 list2)
  ; BEGIN PROBLEM 16
  ; 'replace-this-line
    (cond 
      ((and (null? list1) (null? list2)) nil)
      ((null? list1) list2)
      ((null? list2) list1)
      (else
        (if (comp (car list1) (car list2))
          (cons (car list1) (cons (car list2) (merge comp (cdr list1) (cdr list2))))
          (cons (car list2) (cons (car list1) (merge comp (cdr list1) (cdr list2))))
        )
      )
    )
  )
  ; END PROBLEM 16


(merge < '(1 5 7 9) '(4 8 10))
; expect (1 4 5 7 8 9 10)
(merge > '(9 7 5 1) '(10 8 4 3))
; expect (10 9 8 7 5 4 3 1)

;; Problem 17

(define (nondecreaselist s)
  ; BEGIN PROBLEM 17
  ; 'replace-this-line
  (define (nondecreaselist2 ls subls last)
    (cond
      ((null? ls) (list subls))
      ((< (car ls) last) (cons subls (nondecreaselist2 ls nil (car ls))))
      (else 
        (nondecreaselist2 (cdr ls) (append subls (list (car ls))) (car ls))
      )
    )
  )
  (nondecreaselist2 s nil (car s))
)
  ; END PROBLEM 17


