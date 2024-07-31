(define (flatmap f x)
  ; 'YOUR-CODE-HERE)
  (define (flatmap-tail f x current)
    (if (null? x)
      current
      (flatmap-tail f (cdr x) (append current (f (car x))))
    )
  )
  (flatmap-tail f x nil)
)

(define (expand lst)
  ; 'YOUR-CODE-HERE)
  (define (rewrite item)
    (cond 
      ((null? item) nil)
      ((equal? item 'x) '(x r y f r))
      ((equal? item 'y) '(l f x l y))
      (else (list item))
    )
  )
  (flatmap rewrite lst)
)

(define (interpret instr dist)
  ; 'YOUR-CODE-HERE)
  (if (not (null? instr))
    (begin
      (cond
        ((eq? (car instr) 'f)  (fd dist))
        ((eq? (car instr) 'l) (lt 90))
        ((eq? (car instr) 'r) (rt 90))
      )
      (interpret (cdr instr) dist)
    )    
  )
)

(define (apply-many n f x)
  (if (zero? n)
      x
      (apply-many (- n 1) f (f x))))

(define (dragon n d)
  (interpret (apply-many n expand '(f x)) d))