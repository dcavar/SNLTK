#!r6rs

;;; Time-stamp: <2010-03-11 13:28:00 dcavar>
;;; encoding: UTF-8

;;; Copyright (C) 2010 by Damir Ćavar. 

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
;
;
; ( ( 1 2 )
;   ( 3 2 )
;   ( 1 3 ) )


(library
 (nltk vectorspace)
 (export make-vs
         vs?
         vs-columnlabels
         vs-columnlabels-set!
         vs-rowlabels
         vs-rowlabels-set!
         vs-cells
         vs-cells-set!
         relativize-vectorspace
         euclidean-distance
         dot-product
         vector-magnitude
         cosine-similarity
         vectorspace->centroid
         ngrams->vectorspace)
 (import (rnrs)
         (rnrs base)
         (nltk sequences))
 
 
 (define-record-type vs
   (fields (mutable columnlabels vs-columnlabels vs-columnlabels-set!)
           (mutable rowlabels    vs-rowlabels    vs-rowlabels-set!)
           (mutable cells        vs-cells        vs-cells-set!))
   (protocol
    (lambda (p)
      (lambda ()
        (p '() '() (make-hashtable equal-hash equal?))))))
 
 
 
 (define euclidean-distance
   (lambda (v1 v2)
     (let ([v1 (sequence->list v1)]
           [v2 (sequence->list v2)])
       (sqrt (apply + (map (lambda (el1 el2)
                             (expt (- el1 el2) 2))
                           v1 v2))))))
 
 
 (define dot-product
   (lambda (v1 v2)
     (let ([v1 (sequence->list v1)]
           [v2 (sequence->list v2)])
       (apply + (map (lambda (el1 el2)
                       (* el1 el2)) v1 v2)))))
 
 
 (define vector-magnitude
   (lambda (v)
     (sqrt (dot-product v v))))
 
 
 (define cosine-similarity
   (lambda (v1 v2)
     (/ (dot-product v1 v2)
        (* (vector-magnitude v1)
           (vector-magnitude v2)))))
 
 
 (define vectorspace->centroid
   (lambda (vs)
     (let ([vlen (vector-length (vector-ref vs 0))]
           [vspacelen (vector-length vs)])
       (let loop ([init-v (make-vector vlen 0)]
                  [pos    0])
         (if (< pos (vector-length vs))
             (loop (vector-map (lambda (c i)
                                 (+ c i))
                               init-v (vector-ref vs pos))
                   (+ pos 1))
             (vector-map (lambda (c)
                           (/ c vspacelen))
                         init-v))))))
 
 
 (define ngrams->vectorspace
   (lambda (ngram-models)
     (let ([all-tokens (make-hashtable equal-hash equal?)])
       (for-each
        (lambda (ht)
          (let-values ([(keys vals) (hashtable-entries ht)])
            (vector-for-each
             (lambda (key val)
               (hashtable-set! all-tokens key 0))
             keys vals)))
        ngram-models)
       (let-values ([(keys vals) (hashtable-entries all-tokens)]) ; sr = keys vals
         (map (lambda (language-model)
                (vector-map (lambda (token)
                              (hashtable-ref language-model token 0))
                            keys))
              ngram-models)))))
 
 (define relativize-vectorspace
   (lambda (vs)
     (vector-map
      (lambda (v)
        (let ([total (apply + (vector->list v))])
          (vector-map
           (lambda (val)
             (/ val total))
           v)))
      vs)))
 
 )
