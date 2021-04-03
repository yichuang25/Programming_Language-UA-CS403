
(define (print-file name)
  (let ((port (open-input-file name)))
    (print-file-helper port)
    (close-input-port port)
    'done))

(define (print-file-helper port)
  (let ((stuff (read-string char-set:whitespace port)))
    (if (eof-object? stuff)
	'done
	(begin (display stuff)
               (newline)
               (skip-whitespaces port)
	       (print-file-helper port)))))

(define (skip-whitespaces port)
  (let ((ch (peek-char port)))
	(if (and (not (eof-object? ch)) (char-whitespace? ch))
	    (begin (read-char port)
                   (skip-whitespaces port)))))

(print-file "shapes.dat")
