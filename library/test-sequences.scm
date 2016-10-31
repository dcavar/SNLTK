#!r6rs

;;; filename: test-sequences.scm
;;;
;;; Time-stamp: <2010-02-28 01:15:00 dcavar>
;;; encoding: UTF-8
;;;
;;; Copyright (C) 2010 by Damir Ćavar. 
;;;
;;; testing sequence procedures
;;;
;;; This library is free software; you can redistribute it
;;; and/or modify it under the terms of the Creative Commons
;;; GNU Lesser General Public License as published by the
;;; Free Software Foundation; either version 2.1 of the License,
;;; or (at your option) any later version.
;;;
;;; The Scheme NLTK is distributed in the hope that it will be
;;; useful, but WITHOUT ANY WARRANTY; without even the
;;; implied warranty of MERCHANTABILITY or FITNESS FOR A
;;; PARTICULAR PURPOSE.  See the Creative Commons GNU Lesser
;;; General Public License for more details.
;;;
;;; You should have received a copy of the GNU Lesser
;;; General Public License along with Web testing; if not,
;;; write to the Free Software Foundation, Inc., 59 Temple
;;; Place, Suite 330, Boston, MA 02111-1307 USA
;;;
;;; Author: Damir Ćavar <dcavar@unizd.hr>
;;
;;
;; Commentary:
;; 
;; TODO:


(import (rnrs)
        (rnrs base)
        (nltk sequences))


(define test1
  (lambda (seq)
    (display (sequence->permutations-vector seq))
    (newline)))

(define test2
  (lambda (seq)
    (display (sequence->permutations-list seq))
    (newline)))

(define test3
  (lambda (n)
    (display (enum-list n))
    (newline)))

(define test4
  (lambda (seq)
    (display (enum-vector (length seq)))
    (newline)))


(display "test1: returns vector of token permutations from list of strings")(newline)
(test1 '("John" "loves" "Mary" "not"))
(newline)

(display "test1: returns vector of token permutations from vector of symbols")(newline)
(test1 (vector 'John 'loves 'Mary 'not))
(newline)

(display "test1: returns vector of character permutations from string")(newline)
(test1 "John")
(newline)

(display "test2: returns list of token permutations from list of strings")(newline)
(test2 '("John" "loves" "Mary" "not"))
(newline)

(display "test2: returns list of character permutations from string")(newline)
(test2 "John")
(newline)

(display "test2: returns list of number permutations from vector of numbers")(newline)
(test2 (vector 1 7 6 5 3))
(newline)

(display "test3: returns empty list for negative sequence lengths")(newline)
(test3 -1)
(newline)

(display "test4: returns vector #(0 1 2 3)")(newline)
(test4 '("Peter" "lives" "in" "Paris"))
(newline)
