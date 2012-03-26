#!/usr/local/bin/csi -ss

; search-sxml.scm: search sxml document for matching patterns
; Eric Nichols <eric@ecei.tohoku.ac.jp>

(use ssax sxpath sxpath-lolevel data-structures regex)

(define (search-sxml path port)
  (let ((sxml (ssax:xml->sxml port '())))
    (pp ((sxpath path) sxml) ) ) )

(define (main args)
  (let* (;(path "/root/document/sentences/sentence/tokens/token")
	 ;(path "//token/lemma")
	 ;(path '(// (tokens (// (token ((equal? (@ (id "1")))))))))
	 ;(path "//token[word='blazei']")
	 ;(path '(// (token ((equal? (word "blazei"))))))
	 (path '(// (word (((lambda () #t) "blazei")))))
	 (search (lambda (port) (search-sxml path port))))
    (cond ((= 0 (length args)) ; read from stdin when no command line args 
	   (search (current-input-port)))
	  (else (for-each
		 (lambda (port) (call-with-input-file port search))
		 args)))))

(cond-expand
 (compiling (main (command-line-arguments)))
 (else #f))
