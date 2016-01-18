#lang info
(define collection "racket-syntax-test")
(define deps '("base"
               "rackunit-lib"))
(define build-deps '("scribble-lib" "racket-doc"))
(define scribblings '(("scribblings/racket-syntax-test.scrbl" ())))
(define pkg-desc "Description Here")
(define version "0.0")
(define pkg-authors '(leif))

(define pre-install-collection "private/install.rkt")
