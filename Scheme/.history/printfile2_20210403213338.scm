
(define (print-file name)
  (let ((port (open-input-file name)))
    (print-file-helper port)
    (close-input-port port)
    'done
  )
)

(define (print-file-helper port)
  (let ((stuff (read port)))
    (if (eof-object? stuff)
	'done
	(begin
	       (if (symbol? stuff)
                   (display (string-capitalize (symbol->string stuff)))
                   (display stuff))
               (newline)
	       (print-file-helper port)))))

(print-file "shapes.dat")
