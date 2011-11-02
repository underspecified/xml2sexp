#!/usr/local/bin/csi -ss

; corenlp2sxml.scm: converts Stanford Core NLP XML output into SXML
; SXML specs: http://okmij.org/ftp/Scheme/SXML.html 
; Eric Nichols <eric@ecei.tohoku.ac.jp>

(use ssax sxml-transforms)

;; (define (surface-in-body tag body)
;;   "leave the surface form in the body"
;;   (let* ((attr (car body))
;; 	 (ann (cdr attr))
;; 	 (rest (drop-right ann 1))
;; 	 (feat (car (take-right ann 1)))
;; 	 (surface (cadr body)))
;;     `(tok ,(append '(@) rest feat) ,surface)))

;; (define (surface-in-ann tag body)
;;   "put the surface form in the annotations"
;;   (let* ((attr (car body))
;; 	 (ann (cdr attr))
;; 	 (rest (drop-right ann 1))
;; 	 (feat (car (take-right ann 1)))
;; 	 (surface (cadr body)))
;;     `(tok ,(append '(@) rest `((surface ,surface)) feat))))

;; (define (labeled-features tag body)
;;   "split the mecab POS features into labeled annotations"
;;   (zip '(pos1 pos2 pos3 pos4 ctype cform base read pron unk2 unk3) 
;;        (string-split (car body) ",")))

;; (define (expand-features sexp)
;;   (pre-post-order* 
;;    sexp
;;    `((tok . ,surface-in-ann)
;;      (feature . ,labeled-features)
;;      ,@alist-conv-rules*) ) )

(define (x->s port)
  "convert the document on <port> to SXML and pretty print it"
  (pp ;(expand-features 
       (ssax:xml->sxml port '())) 
      ;)
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
