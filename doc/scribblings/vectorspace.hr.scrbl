#lang scribble/doc
@(require "common.ss")

@title[#:tag "modvectorspace"]{vectorspace - Vector Space Model and related procedures}

@margin-note{@para{Copyright 2005, 2006, 2007, 2008, 2009, 2010 by @hyperlink["http://ling.unizd.hr/~dcavar/"]{Damir Ćavar}, Petar Garžina, Larisa Grčić, Tanja Gulan, Damir Kero, Robert Paleka, Franjo Pehar, Pavle Valerjev}@itemlist{@item{@hyperlink["http://ling.unizd.hr/~snltk/manual.de/"]{Deutsch}}@item{@hyperlink["http://ling.unizd.hr/~snltk/manual.en/"]{English}}@item{@hyperlink["http://ling.unizd.hr/~snltk/manual.hr/"]{Hrvatski}}}}

@author{Damir Ćavar}

@defmodule[nltk/vectorspace]{The @schememodname[nltk/vectorspace] module provides procedures for the generation and manipulation of vector spaces.}


@section{Vectorspace Basic procedures}

@defproc[(make-vs) vs?]{
Returns a @scheme[vs] data structure.
}

@defproc[(vs? [uvs vs?]) boolean?]{
Returns @scheme[#t], if @scheme[uvs] is of type @scheme[vs], else it returnes @scheme[#f].
}

@defproc[(vs-columnlabels [uvs vs?]) list?]{
Returns a @scheme[list] of column labels.
}

@defproc[(vs-columnlabels-set! [uvs vs?]
                               [labels list?])]{
Sets the column labels @scheme[list] .
}

@defproc[(vs-rowlabels [uvs vs?]) list?]{
Returns a @scheme[list] with the row labels for the vector space @scheme[uvs].
}

@defproc[(vs-rowlabels-set! [uvs vs?]
                            [rowlabels list?])]{
Sets the row labels of vector space @scheme[uvs] to the @scheme[list] @scheme[rowlabels].
}

@defproc[(vs-cells [uvs vs?]) hashtable?]{
Returns a @scheme[hashtable] data structure with the cells of the vector space @scheme[uvs].
}

@defproc[(vs-cells-set! [uvs vs?]
                        [cells hashtable?])]{
Sets the cells of vector space @scheme[uvs] to be the @scheme[hashtable] data structure @scheme[cells].
}

