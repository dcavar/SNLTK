#lang scribble/doc
@(require "common.ss")

@title[#:tag "modngramstatistics"]{ngram-statistics - Statistical functions for n-gram models}

@margin-note{@para{Copyright 2005, 2006, 2007, 2008, 2009, 2010 by @hyperlink["http://ling.unizd.hr/~dcavar/"]{Damir Ćavar}, Petar Garžina, Larisa Grčić, Tanja Gulan, Damir Kero, Robert Paleka, Franjo Pehar, Pavle Valerjev}@itemlist{@item{Deutsch}@item{@hyperlink["http://ling.unizd.hr/~snltk/manual.en/"]{English}}@item{Hrvatski}}}

@author{Damir Ćavar}

@defmodule[nltk/ngram-statistics]{The @schememodname[nltk/ngram-statistics] module provides procedures for statistical analyses on the basis of n-gram models.

An explanation of n-grams and various statistical analyses used in Computational Linguistics and Natural Language Processing can be found in the following resources:

@itemlist{@item{@hyperlink["http://en.wikipedia.org/wiki/N-gram"]{Wikipedia n-gram}}@item{@(cite "Jurafsky:Martin:2008")}@item{@(cite "Manning:Schuetze:1999")}}


@para{!!! TODO !!!}
}

@defproc[(chi2-score [ngrams hashtable?]
                     [unigrams hashtable?]
                     [gram (or/c list? vector? string?)]) hashtable?]{

Returns the chi2 score for a gram, using the n-gram models provided by the parameters @scheme[ngrams] and @scheme[unigrams].
}

                                                                     
@defproc[(lowest-probability [ngrams hashtable?]) (or/c integer? rational? real?)]{

Returns the lowest probability in an n-gram model.
}


@defproc[(highest-probability [ngrams hashtable?]) (or/c integer? rational? real?)]{

Returns the highest probability in an n-gram model.
}


@defproc[(kld-discrete [ngrams1 hashtable?]
                       [ngrams2 hashtable?]) real?]{

Returns the Kullback–Leibler divergence for two probability distributions of a discrete random variable, in this case two n-gram models.
}



@defproc[(pointwise-mutual-information [ngrams hashtable?]
                                       [unigrams hashtable?]
                                       [gram   (or/c list? vector? string?)]) real?]{

Returns the pointwise Mutual Information for one n-gram using a n-gram and an unigram model.
}



@defproc[(mutual-information [ngrams hashtable?]
                             [unigrams hashtable?]) real?]{

Returns the Mutual Information for a n-gram distribution using a n-gram and an unigram model.
}
