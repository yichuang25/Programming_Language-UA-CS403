
(define (print-file name)
  (let ((port (open-input-file name)))
    (print-file-helper port)
    (close-input-port port)
    'done))

(define (print-file-helper port)
  (let ((stuff (read-char port)))
    (if (eof-object? stuff)
	'done
	(begin
	       (cond
                   ((char=? stuff #\space) (display #\_))
                   ((char=? stuff #\newline) (display #\newline))
                   (else (display stuff)))
;               (newline)
	       (print-file-helper port)))))

(print-file "shapes.dat")
