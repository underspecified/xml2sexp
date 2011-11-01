#!/usr/local/bin/csi -ss

; xml2sexp.scm: converts XML file into SXML
; SXML specs: http://okmij.org/ftp/Scheme/SXML.html
; Eric Nichols <eric@ecei.tohoku.ac.jp>

(use ssax sxpath sxml-transforms matchable)

(define (expand-features sexp)
  (pre-post-order* 
   sexp	   
   `(
     (tok . ,(lambda (tag body)
	       (let* ((attr (car body))
		      (ann (cdr attr))
		      (rest (drop-right ann 1))
		      (feat (car (take-right ann 1)))
		      (surface (cadr body)))
		 `(tok ,(append '(@) rest `(surface ,surface)) 
		       ,feat))))
     (feature . ,(lambda (tag body)
		(zip '(pos1 pos2 pos3 pos4 ctype cform 
			    base read pron unk2 unk3) 
		     (string-split (car body) ","))))
		,@alist-conv-rules*) ) )

(define (x->s port)
  "convert the document on <port> to SXML and pretty print it"
  (pp (expand-features 
       (ssax:xml->sxml port '()))
      ) 
)

(define (main args)
  (cond ((= 0 (length args)) ; read from stdin when no command line args 
	 (x->s (current-input-port)))
	(else (for-each
	       (lambda (port) (call-with-input-file port x->s))
	       args))))

(cond-expand
 (compiling (main (command-line-arguments)))
 (else #f))
