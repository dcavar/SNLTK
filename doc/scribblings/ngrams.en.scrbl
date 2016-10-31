#lang scribble/doc
@(require "common.ss")

@title[#:tag "modngrams"]{ngrams - N-gram models}

@margin-note{@para{Copyright 2005, 2006, 2007, 2008, 2009, 2010 by @hyperlink["http://ling.unizd.hr/~dcavar/"]{Damir Ćavar}, Petar Garžina, Larisa Grčić, Tanja Gulan, Damir Kero, Robert Paleka, Franjo Pehar, Pavle Valerjev}@itemlist{@item{Deutsch}@item{@hyperlink["http://ling.unizd.hr/~snltk/manual.en/"]{English}}@item{Hrvatski}}}

@author{Damir Ćavar}

@defmodule[nltk/ngrams]{The @schememodname[nltk/ngrams] module provides procedures to generate and process n-gram models from token lists. The token lists could be sequences of any type. For linguistic analysis and processing the tokens are usually strings that represent words, or character sequences. The procedures for n-gram model generation and processing in this module are in fact more generic. A sequence of any data type tokens can be used to generate n-grams of the particular tokens.

An explanation of n-grams and their use in Computational Linguistics and Natural Language Processing can be found in the following resources:

@itemlist{@item{@hyperlink["http://en.wikipedia.org/wiki/N-gram"]{Wikipedia n-gram}}@item{@(cite "Jurafsky:Martin:2008")}@item{@(cite "Manning:Schuetze:1999")}}
}


@section{N-grams: General procedures}

@defproc[(token-sequence->ngrams [seq (or/c list? vector? string?)]
                                 [n (and/c (>/c 0) integer?) 2]
                                 [ngrams hashtable? (make-hashtable equal-hash equal?)]) hashtable?]{
                                                                       
Returns a n-gram data structure as a @scheme[hashtable] with n-gram keys and their absolute frequency as corresponding values. The @scheme[seq] parameter must be a sequence type, that is a @scheme[list], a @scheme[vector] of tokens, or a @scheme[string]. A @scheme[string] is interpreted as a sequence of characters, thus the resulting n-grams generated from strings consist of @scheme[n] tokens of the type @scheme[char]. The number of tokens in the resulting n-gram model is specified by the implicit parameter @scheme[n], which must be a positive integer larger than @scheme[0], and defaults to 2.

The procedure has a side effect, if the @scheme[ngrams] parameter is provided. In this case, the extracted n-grams will be added to the model in @scheme[ngrams]. If the parameter @scheme[ngrams] is not specified, it defaults to an empty @scheme[hashtable].

The resulting n-gram model is represented in a @scheme[hashtable] data structure, with the n-grams as keys of the type @scheme[vector], and the values of type @scheme[integer].

The procedure returns an empty @scheme[hashtable], if the optional @scheme[ngrams] parameter is not provided, and either the @scheme[seq] parameter is not of a sequence type, or the @scheme[n] parameter is @scheme[< 1]. If a @scheme[ngrams] parameter is provided, and the @scheme[seq] parameter is not of a sequence type, or the @scheme[n] parameter is @scheme[< 1], the @scheme[ngrams] parameter is returned unchanged.
}


@section{N-grams model conversion}

@defproc[(filter-ngrams [ngrams hashtable?]
                        [filter-tokens list?]
                        [remove boolean? #t]) hashtable?]{

Returns a new data structure of the type @scheme[hashtable] with n-grams as keys and frequencies as values. If the optional @scheme[remove] flag is provided as @scheme[#t], the returned @scheme[hashtable] will not contain any n-gram that contains an element that is @scheme[member] of the obligatory @scheme[filter-tokens] list. If the optional @scheme[remove] flag is provided as @scheme[#f], the returned @scheme[hashtable] will only contain n-grams that contain an element that is @scheme[member] of the obligatory @scheme[filter-tokens] list.}


@defproc[(filter-ngrams! [ngrams hashtable?]
                         [filter-tokens list?]
                         [remove boolean? #t]) hashtable?]{

Returns exactly the same data structure of the type @scheme[hashtable] that is specified in the parameter @scheme[ngrams], with n-grams as keys and the corresponding n-gram frequencies as values. Similar to @scheme[filter-ngrams], if the @scheme[remove] flag is set to @scheme[#t] all n-grams are removed from the @scheme[ngrams] @scheme[hashtable], if one of their tokens is @scheme[member] of the list @scheme[filter-tokens]. If the remove flag is set to @scheme[#f], only the n-grams will remain in the resulting @scheme[hashtable] that contain a token that is @scheme[member] of the list @scheme[filter-ngrams]. The data structure @scheme[ngrams] is changed in place.}


@defproc[(filter-pos-ngrams [ngrams hashtable?]
                            [filter-tokens list?]
                            [pos integer? 0]
                            [remove boolean? #t]) hashtable?]{

Returns a new data structure of the type @scheme[hashtable] that is specified in the parameter @scheme[ngrams], with n-grams as keys and the corresponding n-gram frequencies as values. Similar to @scheme[filter-ngrams], if the @scheme[remove] flag is set to @scheme[#t] all n-grams are removed from the @scheme[ngrams] @scheme[hashtable], if the token at position @scheme[pos] is @scheme[member] of the list @scheme[filter-tokens]. The optional parameter @scheme[pos] is a value between 0 and the length of the n-grams minus 1. If the remove flag is set to @scheme[#f], only the n-grams will remain in the resulting @scheme[hashtable] that contain a token in position @scheme[pos] of the n-gram that is @scheme[member] of the list @scheme[filter-ngrams].

This procedure is useful for identifying n-grams starting or ending with a specific token or tokens.}



@defproc[(filter-ngrams-counts [ngrams hashtable?]
                               [threshold list?]
                               [larger boolean? #t]) hashtable?]{

Returns a new data structure of the type @scheme[hashtable] with n-grams as keys and frequencies as values. If the optional @scheme[larger] flag is provided as @scheme[#t], the returned @scheme[hashtable] will not contain any n-gram with a frequency larger than @scheme[threshold]. If the optional @scheme[larger] flag is @scheme[#f], the returned @scheme[hashtable] will only contain n-grams with a frequency below @scheme[threshold].}


@defproc[(filter-ngrams-counts! [ngrams hashtable?]
                                [threshold list?]
                                [larger boolean? #t]) hashtable?]{

Returns exactly the same data structure of the type @scheme[hashtable] that is specified in the parameter @scheme[ngrams], with n-grams as keys and the corresponding n-gram frequencies as values, changing the @scheme[ngrams] data structure. The functionality and meaning of parameters is as described for @scheme[filter-ngrams-counts].}


@defproc[(ngrams->bigrams [ngrams hashtable?]) hashtable?]{
Returns a new data structure of the type @scheme[hashtable] with bigrams as keys and frequencies as values. If the length of the n-grams in the parameter @scheme[ngrams] is smaller than 2, or if the @scheme[ngrams] data structure is empty, an empty @scheme[bigrams] @scheme[hashtable] is returned.
The frequencies of the bigrams in the returned data structure are not real frequencies of these n-grams in the original text source or corpus.}


@defproc[(relativize-ngrams [ngram hashtable?]) hashtable?]{
Returns a new @scheme[hashtable] with @scheme[ngrams] as keys. The @scheme[ngrams] are of the type vector, the values are relativized by division of their individual values thought the sum of all values. The procedure does not perform any type or value checking. The values are expected to be absolute frequency counts of ngrams of the integer type, the resulting values are of type rational.}


@defproc[(relativize-ngrams! [ngram hashtable?]) hashtable?]{
Relativizes absolute frequencies of ngrams, as @scheme[relativize-ngrams], with the side effect of changing the values within the submitted @scheme[ngrams] model (@scheme[hashtable]).}


@defproc[(ngrams-sort [ngram hashtable?]
                      [decreasing boolean? #t]
                      [by-value   boolean? #t]) hashtable?]{
Return a vector of ngram and frequency tuples. The elements in the vector are sorted decreasingly by default, and increasingly, if the optional parameter @scheme[decreasing] is specified as @scheme[#t]. The elements in the returned vector are in the default sorted by value, that is by frequency. If the optional parameter @scheme[by-value] is @scheme[#f], the elements are sorted by n-grams. The sorting by n-gram will only take the first gram into account.}


@defproc[(frequency-profile-decreasing [ngram hashtable?]) hashtable?]{
Returns a vector with the decreasing frequency profile of the n-grams in the @scheme[ngram] model. This procedure is equivalent to the procedure call @scheme[(ngrams-sort ngrams #t #t)]}


@defproc[(frequency-profile-increasing [ngram hashtable?]) hashtable?]{
Returns a vector with the increasing frequency profile of the n-grams in the @scheme[ngram] model. This procedure is equivalent to the procedure call @scheme[(ngrams-sort ngrams #f #t)].}


@defproc[(frequency-profile [ngram hashtable?]) hashtable?]{
Returns a vector with the increasing frequency profile of the n-grams in the @scheme[ngram] model. This procedure is equivalent to the procedure call @scheme[(frequency-profile-decreasing ngrams)].}



@section{N-grams output procedures}

@defproc[(ngrams->dot [ngrams hashtable?] [graph-type symbol? 'digraph]) string?]{

Returns a string with the @hyperlink["http://www.graphviz.org/doc/info/lang.html"]{DOT} representation of a graph with all interconnections between tokens in n-grams.

The resulting @hyperlink["http://www.graphviz.org/doc/info/lang.html"]{DOT} data (or file) can be processed and visualized using @hyperlink["http://www.graphviz.org/"]{Graphviz}, and many other related tools. More information on @hyperlink["http://www.graphviz.org/doc/info/lang.html"]{DOT}, @hyperlink["http://www.graphviz.org/"]{Graphviz} and other visualization software is available at the @hyperlink["http://www.graphviz.org/"]{Graphviz homepage}.
}


@defproc[(ngrams->dot-digraph [ngrams hashtable?]) string?]{

Returns a string with the @hyperlink["http://www.graphviz.org/doc/info/lang.html"]{DOT} representation of a graph with all interconnections between tokens in the provided n-grams parameter.}


@defproc[(ngrams->dot-graph [ngrams hashtable?]) string?]{

Returns a string with the @hyperlink["http://www.graphviz.org/doc/info/lang.html"]{DOT} representation of a graph with all interconnections between tokens in n-grams.}


@defproc[(ngrams->html-table [ngrams hashtable?]
                             [column-titles list? '()]
                             [sorted boolean? #t]
                             [sort-field symbol? 'frequency]) string? ]{

Returns a string that contains the @hyperlink["http://en.wikipedia.org/wiki/HTML"]{HTML} code representation of n-grams and their frequencies as stored in the @scheme[hashtable] data structure provided by the variable @scheme[ngrams]. The optional parameter @scheme[column-titles] is a @scheme[list] of @scheme[strings] with the column or header labels for the resulting table. The optional @scheme[sorted] flag defaults to @scheme[#t], which results in a sorted output, using a decreasing strategy for numbers, and an increasing for strings. The optional parameter @scheme[sort-field] is either the symbol @scheme['frequency], or something else. If @scheme[sort-field] has the value @scheme['frequency], the resulting table will be sorted decreasingly on the frequency value of the contained n-grams. Else, it will be sorted increasingly on the n-grams themselves.

Each row of the @hyperlink["http://en.wikipedia.org/wiki/HTML"]{HTML} table consists of a cell list with all tokens from the n-gram in one cell, followed by their corresponding value.

The resulting @hyperlink["http://en.wikipedia.org/wiki/HTML"]{HTML} code of the table provides a @hyperlink["http://en.wikipedia.org/wiki/CSS"]{CSS}, @hyperlink["http://en.wikipedia.org/wiki/JavaScript"]{JavaScript} or style hook for formatting options. The following class attributes values are used in the three basic tags of the resulting @hyperlink["http://en.wikipedia.org/wiki/HTML"]{HTML} output.


@itemlist{@item{@hyperlink["http://www.w3schools.com/html/html_tables.asp"]{table}: table-style}@item{@hyperlink["http://www.w3schools.com/html/html_tables.asp"]{thead}: table-header-style}@item{@hyperlink["http://www.w3schools.com/html/html_tables.asp"]{tbody}: table-body-style}}
}
