
(define (parse-string str)
  (let ((port (open-input-string str)))
    (parse-string-helper port)
    (close-input-port port)
    'done))

(define (parse-string-helper port)
  (let ((stuff (read-string char-set:whitespace port)))
    (if (eof-object? stuff)
	'done
	(begin (display stuff)
               (newline)
               (skip-whitespaces port)
	       (parse-string-helper port)))))

(define (skip-whitespaces port)
  (let ((ch (peek-char port)))
	(if (and (not (eof-object? ch)) (char-whitespace? ch))
	    (begin (read-char port)
                   (skip-whitespaces port)))))

(parse-string "commission Floyd Jenkins 300 3000 .08")
