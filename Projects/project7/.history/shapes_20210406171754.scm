(define (perform  . args)
    ;(display args)
    ;(newline)
    ;Test args number
    (cond ((NOT (valid_arg? (length args))) (display "Incorrect number of arguments\n"))
        (ELSE 
            (begin
                ;(display-list (wash (read-file (list-ref args 1))))
                ;(newline)
                (cond 
                    ((EQV? (length args) 2)
                        (cond 
                            ((equal? (list-ref args 0) "print")
                                (begin
                                    ;(display "print")
                                    ;(newline)
                                    (printlist (wash (read-file (list-ref args 1))))
                                )
                            )
                            ((equal? (list-ref args 0) "count") 
                                (begin
                                    (display "There are ")
                                    (display (length (wash (read-file (list-ref args 1)))))
                                    (display " shapes.")
                                    (newline)
                                )
                            )
                            ((equal? (list-ref args 0) "min")
                                (begin
                                    (display "min(Surface Area)=")
                                    (display (minim (findArea (wash (read-file (list-ref args 1))))))
                                    (newline)
                                    (display "min(Volume)=")
                                    (display (minim (findVolume (wash (read-file (list-ref args 1))))))
                                    (newline)
                                )
                            )
                            ((equal? (list-ref args 0) "max")
                                (begin
                                    (display "max(Surface Area)=")
                                    (display (maxim (findArea (wash (read-file (list-ref args 1))))))
                                    (newline)
                                    (display "max(Volume)=")
                                    (display (maxim (findVolume (wash (read-file (list-ref args 1))))))
                                    (newline)
                                )
                            )
                            ((equal? (list-ref args 0) "total")
                                (begin
                                    (display "total(Surface Area)=")
                                    (display (sum (findArea (wash (read-file (list-ref args 1))))))
                                    (newline)
                                    (display "total(Volume)=")
                                    (display (sum (findVolume (wash (read-file (list-ref args 1))))))
                                    (newline)
                                )
                            )
                            (else
                                (begin
                                    (display "avg(Surface Area)=")
                                    (display (average (findArea (wash (read-file (list-ref args 1))))))
                                    (newline)
                                    (display "avg(Volume)=")
                                    (display (average (findVolume (wash (read-file (list-ref args 1))))))
                                    (newline)
                                )
                            )                        
                        )
                    )
                    (else
                        (display ">2")
                        (newline)
                    )
                )
            
            )
        )
    )
    'done
)

(define (average list)
    (/ (sum list) (length list))
)

(define (sum elemList)
  (if
    (null? elemList)
    0
    (+ (car elemList) (sum (cdr elemList)))
  )
)

(define (maxim lst)
    (cond 
        ((null? (cdr lst)) 
            (car lst)
        )
        ((> (car lst) (maxim (cdr lst))) 
            (car lst)
        )
        (else 
            (maxim (cdr lst))
        )
    ) 
)

(define (minim lst)
    (cond 
        ((null? (cdr lst)) 
            (car lst)
        )
        ((< (car lst) (minim (cdr lst))) 
            (car lst)
        )
        (else 
            (minim (cdr lst))
        )
    ) 
)



(define (findVolume list)
    (let loop((ls1 '()) (lst list))
        (if (null? lst)
            (begin
                
                (reverse ls1)
            )
            (begin
                ;(display-list lst)
                ;(newline)
                (cond 
                    ((equal? (list-ref (car lst) 1) "sphere")
                        (loop (cons (list-ref (car lst) 4) ls1) (cdr lst))
                    )
                    ((equal? (list-ref (car lst) 1) "cone")
                        (loop (cons (list-ref (car lst) 5) ls1) (cdr lst))
                    )
                    ((equal? (list-ref (car lst) 1) "cylinder")
                        (loop (cons (list-ref (car lst) 5) ls1) (cdr lst))
                    )
                    (else
                        (loop (cons (list-ref (car lst) 6) ls1) (cdr lst))
                    )

                )
                ;(loop (cons () ls1) (cdr lst))
            )
        )
    
    )
)


(define (findArea list)
    (let loop((ls1 '()) (lst list))
        (if (null? lst)
            (begin
                
                (reverse ls1)
            )
            (begin
                ;(display-list lst)
                ;(newline)
                (cond 
                    ((equal? (list-ref (car lst) 1) "sphere")
                        (loop (cons (list-ref (car lst) 3) ls1) (cdr lst))
                    )
                    ((equal? (list-ref (car lst) 1) "cone")
                        (loop (cons (list-ref (car lst) 4) ls1) (cdr lst))
                    )
                    ((equal? (list-ref (car lst) 1) "cylinder")
                        (loop (cons (list-ref (car lst) 4) ls1) (cdr lst))
                    )
                    (else
                        (loop (cons (list-ref (car lst) 5) ls1) (cdr lst))
                    )

                )
                ;(loop (cons () ls1) (cdr lst))
            )
        )
    
    )
)

(define (printlist-helper list)
    (begin 
        (cond 
            ((equal? (list-ref list 1) "sphere")
                (begin
                    (display "Sphere: ")
                    (display (list-ref list 0))
                    (display ", Radius=")
                    (display (list-ref list 2))
                    (newline)
                    (display "\tSurface Area: ")
                    (display (list-ref list 3))
                    (display ", Volume: ")
                    (display (list-ref list 4))
                    (newline)
                )
            )
            ((equal? (list-ref list 1) "cone")
                (begin
                    (display "Cone: ")
                    (display (list-ref list 0))
                    (display ", Radius=")
                    (display (list-ref list 2))
                    (display ", Height=")
                    (display (list-ref list 3))
                    (newline)
                    (display "\tSurface Area: ")
                    (display (list-ref list 4))
                    (display ", Volume: ")
                    (display (list-ref list 5))
                    (newline)
                )
            )
            ((equal? (list-ref list 1) "cylinder")
                (begin
                    (display "Cylinder: ")
                    (display (list-ref list 0))
                    (display ", Radius=")
                    (display (list-ref list 2))
                    (display ", Height=")
                    (display (list-ref list 3))
                    (newline)
                    (display "\tSurface Area: ")
                    (display (list-ref list 4))
                    (display ", Volume: ")
                    (display (list-ref list 5))
                    (newline)
                )
            )
            (else ;cuboid
                (begin
                    (display "Cuboid: ")
                    (display (list-ref list 0))
                    (display ", Length=")
                    (display (list-ref list 2))
                    (display ", Width=")
                    (display (list-ref list 3))
                    (display ", Height=")
                    (display (list-ref list 4))
                    (newline)
                    (display "\tSurface Area: ")
                    (display (list-ref list 5))
                    (display ", Volume: ")
                    (display (list-ref list 6))
                    (newline)
                )
            )
        )
    )
)

(define (printlist list)
    (for-each 
    (lambda (line) 
        (printlist-helper line)
    )
    list)
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
                
                ;(display (getArea (reverse ls1)))
                ;(newline)
                ;(display (getVolume (reverse ls1)))
                ;(newline)
                ;(newline)
                (reverse (cons (getVolume (reverse ls1)) (cons (getArea (reverse ls1)) ls1)))
            )
            (begin
                ;(display index)
                ;(newline)
                ;(display-list lst)
                ;(newline)
                
                (cond 
                    ((> index 1) (loop (cons (string->number (string-trim (car lst) char-set:numeric)) ls1) (cdr lst) (+ index 1)))
                    (else (loop (cons (car lst) ls1) (cdr lst) (+ index 1)))
                )
                ;(loop (cons (car lst) ls1) (cdr lst) (+ index 1))
            )
        )
    )
)


(define (getArea list)
    (cond 
        ((equal? (list-ref list 1) "sphere")
            (* 4 (* pi (* (list-ref list 2 ) (list-ref list 2))))
        )
        ((equal? (list-ref list 1) "cone") 
            (* pi (* (list-ref list 2) (+ (list-ref list 2) (sqrt (+ (* (list-ref list 2) (list-ref list 2)) (* (list-ref list 3) (list-ref list 3)))))))
        )
        ((equal? (list-ref list 1) "cylinder") 
            (* 2 (* pi (* (list-ref list 2) (+ (list-ref list 2) (list-ref list 3)))))
        )
        (else
        ;(list-ref list 2) L, (list-ref list 3) W, (list-ref list 4) H
            (+ (* 2 (* (list-ref list 2) (list-ref list 3))) (+ (* 2 (* (list-ref list 2) (list-ref list 4))) (* 2 (* (list-ref list 4) (list-ref list 3)))))
        )
    )
)


(define (getVolume list)
    (cond 
        ((equal? (list-ref list 1) "sphere")
            (* (/ 4 3) (* pi (* (list-ref list 2) (* (list-ref list 2) (list-ref list 2)))))
        )
        ((equal? (list-ref list 1) "cone") 
            (* (/ 1 3) (* pi (* (* (list-ref list 2) (list-ref list 2)) (list-ref list 3))))
        )
        ((equal? (list-ref list 1) "cylinder") 
            (* pi (* (* (list-ref list 2) (list-ref list 2)) (list-ref list 3)))
        )
        (else
        ;cuboid(list-ref list 2) L, (list-ref list 3) W, (list-ref list 4) H
            (* (list-ref list 2) (* (list-ref list 3) (list-ref list 4)))
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

(define pi 3.141592654)