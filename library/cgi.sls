#!r6rs

;;; Time-stamp: <2010-05-30 18:11:00 dcavar>
;;; encoding: UTF-8

;;; Copyright (C) 2010 by Damir Ćavar

;;; This library is free software; you can redistribute it
;;; and/or modify it under the terms of the Creative Commons
;;; GNU Lesser General Public License as published by the
;;; Free Software Foundation; either version 2.1 of the License,
;;; or (at your option) any later version.

;;; The Scheme NLTK is distributed in the hope that it will be
;;; useful, but WITHOUT ANY WARRANTY; without even the
;;; implied warranty of MERCHANTABILITY or FITNESS FOR A
;;; PARTICULAR PURPOSE.  See the Creative Commons GNU Lesser
;;; General Public License for more details.

;;; You should have received a copy of the GNU Lesser
;;; General Public License along with Web testing; if not,
;;; write to the Free Software Foundation, Inc., 59 Temple
;;; Place, Suite 330, Boston, MA 02111-1307 USA

;;; Author: Damir Ćavar <dcavar@unizd.hr>

;; Commentary:
;; TODO:
;; - 


(library
 (nltk cgi)
 (export query-decode
         request-method
         query-string
         content-length
         parse-query-string)
 (import (rnrs)
         (rnrs base)
         (rnrs unicode)
         (rnrs io ports)
         (rnrs hashtables)
         (rnrs control)
         (only (srfi :98) get-environment-variable)
         (only (nltk sequences) str-split))
 
 ;; a variant of decode procedure in
 ;; the Mosh distribution of cgi.ss
 ;; see:
 ;; http://code.google.com/p/mosh-scheme/
 ;;
 (define query-decode
   (lambda (s)
     (call-with-port
      (open-string-input-port s)
      (lambda (in)
        (call-with-values
         (lambda () (open-string-output-port))
         (lambda (out rf)
           (let ([p (transcoded-port
                     (make-custom-binary-input-port
                      "cgi decode"
                      (lambda (bv start count)
                        (let ([read-byte (lambda ()
                                           (let ([c (read-char in)])
                                             (cond
                                               [(eof-object? c) (eof-object)]
                                               [(eq? #\+ c) 32]
                                               [(eq? #\% c)
                                                (string->number (list->string (list (read-char in) (read-char in))) 16)]
                                               [else
                                                (char->integer c)])))])
                          (let loop ([size 0]
                                     [b (read-byte)])
                            (cond
                              [(eof-object? b) size]
                              [else
                               (when (or (< b 0) (> b 255))
                                 (error "cgi decode" "malformed encoded data" s))
                               (bytevector-u8-set! bv (+ start size) b)
                               (if (>= (+ size 1) count)
                                   (+ size 1)
                                   (loop (+ size 1) (read-byte)))]))))
                      #f #f #f)
                     (make-transcoder (utf-8-codec)))])
             (let loop ([c (read-char p)])
               (cond
                 [(eof-object? c)
                  (rf)]
                 [else
                  (display c out)
                  (loop (read-char p))])))))))))


 (define request-method
   (lambda ()
     (let ([method (get-environment-variable "REQUEST_METHOD")])
       (cond [(not method)
              'unknown]
             [(string=? method "POST")
              'post]
             [(string=? method "GET")
              'get]
             [else
              'unknown]))))
 
 
 (define query-string
   (lambda ()
     (let ([qs (get-environment-variable "QUERY_STRING")])
       (cond [(string? qs)
              (query-decode qs)]
             [else
              qs]))))
 
 
 
 ; if POST content-length -> #f
 ; if GET  content-length -> some int
 (define content-length
   (lambda ()
     (get-environment-variable "CONTENT_LENGTH")))
 
 
 (define parse-query-string
   (lambda (qs)
     (let ([qsh (make-hashtable string-hash string=?)])
       (cond [(string? qs)
              (for-each
               (lambda (token)
                 (let ([stokens (str-split token #\=)])
                   (cond [(= (length stokens) 2)
                          (hashtable-set! qsh (list-ref stokens 0) (list-ref stokens 1))])))
               (str-split qs #\&))])
       qsh)))
 

 )