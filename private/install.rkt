#lang racket

(provide pre-installer)

(require racket/file
         dynext/file
         dynext/compile
         dynext/link)

(define (pre-installer collections-top-path racl-path)
  (define c-source (build-path racl-path "private" "syntax-grabber.c"))
  (define object-target-path
    (build-path racl-path "private" "compiled" "native" (system-library-subpath)))
  (define object-target
    (build-path object-target-path "syntax-grabber.o"))
  (define shared-object-target
    (build-path object-target-path (append-extension-suffix "syntax-grabber")))
  (make-directory* object-target-path)
  (compile-extension #t c-source object-target '())
  (link-extension #t (list object-target) shared-object-target))
