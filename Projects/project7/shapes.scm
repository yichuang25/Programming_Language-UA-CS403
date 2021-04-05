(define (perform  . args)
    ;(display args)
    ;(newline)
    ;Test args number
    (cond ((NOT (valid_arg? (length args))) (display "Incorrect number of arguments\n"))
        (ELSE 
            (begin
                ;(display (list-ref args 1))
                ;(newline)
                ;(display (read-file (list-ref args 1)))
                ;(display-list (read-file (list-ref args 1)))
                ;(newline)
                ;(display (length (read-file (list-ref args 1))))
                ;(newline)
                (display-list (wash (read-file (list-ref args 1))))
                (newline)
            
            )
        )
    )
    'done
)

(define (display-list lst)
  (for-each (lambda (what)
              (display what)
              (newline))
            lst)
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

(define (Tonumber list)
    (let loop((ls1 '()) (lst list) (index 0))
        (if (null? lst)
            (begin
                (reverse ls1)
            )
            (begin
                ;(display index)
                ;(newline)
                ;(display-list lst)
                ;(newline)
                ;TODO: distingush through index.
                (cond 
                    ((> index 1) (loop (cons (string->number (string-trim (car lst) char-set:numeric)) ls1) (cdr lst) (+ index 1)))
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


(define (print-file name)
    (let ((port (open-input-file name)))
        (print-file-helper port)
        (close-input-port port)
        'done
    )
)

(define (print-file-helper port)
    (let ((stuff (read-string char-set:whitespace port)))
        (if (eof-object? stuff)
	        'done
	        (begin 
                (display stuff)
                (newline)
                (skip-whitespaces port)
	            (print-file-helper port)
            )
        )
    )
)

(define (skip-whitespaces port)
    (let ((ch (peek-char port)))
	    (if (and (not (eof-object? ch)) (char-whitespace? ch))
	        (begin 
                (read-char port)
                (skip-whitespaces port)
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


(define (valid_arg? length)
    (EQV? (modulo (- length 2) 3) 0)
)

(define (actions)
    '("count" "print" "min" "max" "total" "avg")
)

(define (shapes)
    '("cuboid" "cone" "cylinder" "sphere")
)

(define (names)
    '("type" "area" "volume")
)

(define (ops)
    '("==" "!=" ">=" "<=" ">" "<")
)