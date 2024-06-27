; A non-empty subset of a list s is a list containing some of the elements of s.
; It could contain all the elements of s, but not none of them.

(define (nonempty-subsets s)
  (if (null? s) nil
    (let ((rest (nonempty-subsets (cdr s))))
      (append rest
        (map (lambda (t) (cons (car s) t)) rest)
        (list (list (car s)))))))

(define (even-subsets s)
  (filter (lambda (s) (even? (apply + s))) (nonempty-subsets s)))