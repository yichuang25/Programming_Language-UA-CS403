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
                (str-split-helper (string-tail line 1) str (cons str list))
            )
        )
        (else
            (str-split-helper (string-tail line 1) (string-append str (string-head line 1)) list)
        )
    )
)

(define (str-split line) 
    (str-split-helper line "\r" '())
)
        
