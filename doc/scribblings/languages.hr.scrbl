#lang scribble/doc
@(require "common.ss")

@title[#:tag "modlanguages"]{languages - Language data and language specific procedures}

@margin-note{@para{Copyright 2005, 2006, 2007, 2008, 2009, 2010 by @hyperlink["http://ling.unizd.hr/~dcavar/"]{Damir Ćavar}, Petar Garžina, Larisa Grčić, Tanja Gulan, Damir Kero, Robert Paleka, Franjo Pehar, Pavle Valerjev}@itemlist{@item{@hyperlink["http://ling.unizd.hr/~snltk/manual.de/"]{Deutsch}}@item{@hyperlink["http://ling.unizd.hr/~snltk/manual.en/"]{English}}@item{@hyperlink["http://ling.unizd.hr/~snltk/manual.hr/"]{Hrvatski}}}}

@author{Damir Ćavar}

@defmodule[nltk/lang-XX]{The @schememodname[nltk/lang-XX] module provides data structures and procedures for specific languages. Each language set is part of its own module. The ISO language code abbreviations are used for the XX in the module name. For example, Croatian language data and relevant procedures are contained in the module @scheme[lang-hr].

!!! TODO !!!

Change documentation, not defproc!}


@section{Croatian - lang-hr}

@defproc[(stopwords-list-hr) list?]{
a list containing Croatian stopwords.}

@defproc[(stopwords-hash-hr) hashtable?]{
Returns a @scheme[hashtable] with the Croatian stopwords in @scheme[stopwords-list-hr] as keys, and a default value of 1.}

