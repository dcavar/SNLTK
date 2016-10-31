#lang scribble/doc
@(require "common.ss")

@title[#:tag "modsequences"]{sequences - Sequence manipulation procedures}

@margin-note{@para{Copyright 2005, 2006, 2007, 2008, 2009, 2010 by @hyperlink["http://ling.unizd.hr/~dcavar/"]{Damir Ćavar}, Petar Garžina, Larisa Grčić, Tanja Gulan, Damir Kero, Robert Paleka, Franjo Pehar, Pavle Valerjev}@itemlist{@item{@hyperlink["http://ling.unizd.hr/~snltk/manual.de/"]{Deutsch}}@item{@hyperlink["http://ling.unizd.hr/~snltk/manual.en/"]{English}}@item{@hyperlink["http://ling.unizd.hr/~snltk/manual.hr/"]{Hrvatski}}}}

@author{Damir Ćavar}

@defmodule[nltk/sequences]{The @schememodname[nltk/sequences] module provides procedures for the generation and manipulation of sequences, that is lists, vectors or strings.}


@section{Sequences Emumeration procedures}

@defproc[(enum-list [n integer?]
                    [from integer? 0]
                    [step integer? 1]) list?]{
Returns a @scheme[list] of an integer progression delimited by the @scheme[n] parameter, starting from 0 (the default value) or otherwise the optional parameter @scheme[from]. The increment of the progression defaults to 1, and can be specified with the optional @scheme[step] parameter.

This procedure is a simplified version of the @scheme[iota] procedure in the @scheme[SRFI] library.}

@defproc[(enum-vector [n integer?]
                      [from integer? 0]
                      [step integer? 1]) vector?]{
Returns a @scheme[vector] of an integer progression delimited by the @scheme[n] parameter, starting from 0 (the default value) or otherwise the optional parameter @scheme[from]. The increment of the progression defaults to 1, and can be specified with the optional @scheme[step] parameter.

This procedure corresponds to the procedure @scheme[enum-list], except with respect to the returned data type.}


@section{Sequences Permutation procedures}

@defproc[(sequence->permutations-list [seq (or/c list? vector? string?)]) list?]{
Returns a @scheme[list] of all possible permutations of elements in the @scheme[seq] parameter. If the variable @scheme[seq] is a string, the resulting list of permutations contains lists of elements of the type @scheme[character]. If the variable @scheme[seq] refers to a list or vector of elements, a list of all permutations of these elements is returned.

The number of returned permutations is exactly @scheme[n!], where @scheme[n] is the number of elements in @scheme[seq], or the length of the string that @scheme[seq] might refer to. Depending on the number of tokens or characters, this procedure can potentially claim a significant portion of memory for runtime and results, and is thus to be handled with care.}


@defproc[(sequence->permutations-vector [seq (or/c list? vector? string?)]) vector?]{
Returns a @scheme[vector] of all possible permutations of elements in the @scheme[seq] parameter. If the variable @scheme[seq] is a string, the resulting vector of permutations contains vectors of elements of the type @scheme[character]. If the variable @scheme[seq] refers to a list or vector of elements, a vector of all permutations of these elements is returned.

See @scheme[sequence->permutations-list] for further details.}


@section{Sequences Conversion procedures}

@defproc[(sequence->hashtable [seq (or/c list? vector? string?)]
                              [wlhash hashtable? (make-hashtable equal-hash equal?)]) hashtable?]{
Returns a @scheme[hashtable] with all tokens as keys and their frequency in @scheme[seq] as corresponding values.

If an optional @scheme[hashtable] is provided via the parameter @scheme[wlhash], the tokens and their frequences will be updated in this @scheme[hashtable].}

