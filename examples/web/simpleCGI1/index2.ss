#!/usr/bin/env mzscheme
#!r6rs

;;; Time-stamp: <2010-02-28 01:15:00 dcavar>
;;; encoding: UTF-8
;;;
;;; Copyright (C) 2010 by Damir Ćavar. 
;;;
;;; This script is free software; you can redistribute it
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

(import (rnrs)
        (rnrs base)
        (nltk ngrams))

(define test2
  (lambda ()
    (ngrams->html-table (token-sequence->ngrams
                         '("John" "saw" "the" "new" "house" "of" "the" "new" "landlords"
                                  "who" "live" "in" "the" "new" "part" "of" "the" "city")
                         2) '("rijec 1" "riječ 2" "frekvencija") #t #f)))

;;; (display "Running test2: HTML table")(newline)
(display "Content-type: text/html; charset=utf-8 ")(newline)(newline)
(display "<html>")(newline)
(display "<head>")(newline)
(display "<meta http-equiv=\"content-type\" content=\"text/html; charset=utf-8\" encoding=\"UTF-8\" />")(newline)
(display "<link rel=\"stylesheet\" type=\"text/css\" href=\"test.css\" />")(newline)
(display "<title>Test page</title>")(newline)
(display "</head>")(newline)
(display "<body>")(newline)
(display "<h1>Test</h1>")(newline)
(display (test2))
(newline)
(display "</body>")(newline)
(display "</html>")(newline)
(newline)
