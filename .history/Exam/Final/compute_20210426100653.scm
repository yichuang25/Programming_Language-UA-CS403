(define (compute file)
    (begin
        (cond 
            ((NOT (file-exists? file)) 
                (begin
                    (display "The file ")
                    (display file)
                    (display " does not exist\n")
                    (newline)
                )
            )
            (ELSE
                (begin
                    (printlist (wash(read-file file)))
                    
                )
            
            )
        )
    )
)

(define (printlist list)
    (for-each 
    (lambda (line) 
        (printlist-helper line list)
    )
    list)
)

(define (printlist-helper line list)
    (begin
        (display (list-ref line 0))
        (display " ")
        (display (list-ref line 1))
        (display " ")
        (display (list-ref line 4))
        ;(display (getAvg list))
        (cond 
            ((< (list-ref line 4) (getAvg list)) 
                (display " Below\n")
            )
            ((= (list-ref line 4) (getAvg list)) 
                (display " Equal\n")
            )
            (else 
                (display " Above\n")
            )
        )
    )
)

(define (getSum list)
    (if
    (null? list)
    0
    (+ (list-ref (car list) 4) (getSum (cdr list)))
  )
)

(define (getAvg list)
    (exact->inexact (/ (getSum list) (length list)))
)

(define (wash list)
    (let loop((ls1 '()) (lst list))
        (if (null? lst)
            (begin
                (reverse ls1)
            )
            (begin
                ;(display-list lst)
                ;(newline)
                (loop (cons (Tonumber (car lst)) ls1) (cdr lst))
            )
        )
    
    )
)

(define (getFee list)
    (cond 
        ((equal? (list-ref list 2) "basic") 
            
            (+ 10 (* (list-ref list 3) 5))      
        )
        ((equal? (list-ref list 2) "value")
            (if (<= (list-ref list 3) 5)
                25
                (+ 25 (* 3 (- (list-ref list 3) 5)))
            )
        )
        (else ;unlimited
            40
        )
    
    )

)


(define (Tonumber list)
    (let loop((ls1 '()) (lst list) (index 0))
        (if (null? lst)
            (begin
                
                (reverse (cons (getFee (reverse ls1)) ls1))
                ;(reverse ls1)
            )
            (begin
                ;(display index)
                ;(newline)
                ;(display-list lst)
                ;(newline)
                
                (cond 
                    ((> index 2) (loop (cons (string->number (string-trim (car lst) char-set:numeric)) ls1) (cdr lst) (+ index 1)))
                    (else (loop (cons (car lst) ls1) (cdr lst) (+ index 1)))
                )
                ;(loop (cons (car lst) ls1) (cdr lst) (+ index 1))
            )
        )
    )
)

(define (read-file file-name)
    (let ((p (open-input-file file-name)))
        (let loop((ls1 '()) (c (read-line p)))
            (if (eof-object? c)
	            (begin
	                (close-input-port p)
	                (reverse ls1)
                )
	            (loop (cons (str-split c) ls1) (read-line p))
            )
        )
    )
)

(define (str-split-helper line str list)
    (cond
        ((string-null? line)
            (if (string-null? str)
		        (reverse list)
		        (reverse (cons str list))
            )
        )
        ((char=? (string-ref line 0) #\space)
            (if (string-null? str)
                (str-split-helper (string-tail line 1) str list)
                (str-split-helper (string-tail line 1) "" (cons str list))
            )
        )
        (else
            (str-split-helper (string-tail line 1) (string-append str (string-head line 1)) list)
        )
    )
)

(define (str-split line) 
    (str-split-helper line "" '())
)