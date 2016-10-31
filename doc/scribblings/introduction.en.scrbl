#lang scribble/doc
@(require "common.ss")

@title[#:tag "intro"]{Introduction}

@margin-note{@para{Copyright 2005, 2006, 2007, 2008, 2009, 2010 by @hyperlink["http://ling.unizd.hr/~dcavar/"]{Damir Ćavar}, Petar Garžina, Larisa Grčić, Tanja Gulan, Damir Kero, Robert Paleka, Franjo Pehar, Pavle Valerjev}@itemlist{@item{Deutsch}@item{@hyperlink["http://ling.unizd.hr/~snltk/manual.en/"]{English}}@item{Hrvatski}}}

@defmodule[nltk]{The @schememodname[nltk] library provides utilities for processing natural language text and data using statistic and symbolic approaches. Included are also language specific dictionaries, rule-sets and grammars for various linguistic analysis tasks. All coded procedures and data structures stick to the @hyperlink["http://www.r6rs.org/"]{R6RS} standard.}

@para{The @hyperlink["http://ling.unizd.hr/~snltk/"]{S-NLTK library} is under continuous development. The current release is considered @italic{Alpha}, meaning that the coding of desired functionality and specific procedures is not yet completed, but nevertheless, the included procedures and data structures are fully functional, if the specified conditions are respected.}

@para{As the library is mainly intended for Scheme implementations that support the @hyperlink["http://www.r6rs.org/"]{R6RS} standard, and tested on the @hyperlink["http://www.plt-scheme.org/"]{PLT-Scheme} and @hyperlink["http://www.larcenists.org/"]{Larceny} platforms, we also recommend these implementations for learning and development purposes. These Scheme development platforms are available for common hardware environments and operating systems, including Linux and other Unix variants, as well as Mac OS X and Microsoft Windows.}

@para{The project S-NLTK was inspired by the impressive @hyperlink["http://www.nltk.org/"]{Python NLTK} @(cite "Bird:ea:2009"). The S-NLTK library is not a Scheme implementation of the @hyperlink["http://www.nltk.org/"]{Python NLTK}, it rather brings together procedures, algorithms and utilities for NLP, coded in Scheme @hyperlink["http://www.r6rs.org/"]{R6RS}, in the same way as the @hyperlink["http://www.nltk.org/"]{NLTK} does for @hyperlink["http://www.python.org/"]{Python}.}

@para{We are grateful for feedback and bug reports, as well as for suggestions related to improvements and new functionality, or even the need for more examples and documentation of specific functionalities. If you have code or linguistic data that you might want to contribute to the library under the specified licensing conditions, we would be glad to integrate it. Please submit your contributions, comments and suggestions to the @hyperlink["http://ling.unizd.hr/~schemers/"]{Schemers in Zadar}.}

@para{@bold{Note:}@linebreak{}
Parts of the S-NLTK library are based on code that was developed for research purposes in the project @italic{Semantic-nets and computational lexicology}, funded by the @hyperlink["http://www.mzos.hr/"]{Ministry of Research, Education and Sports} of the Republic of Croatia, grant number 2120920-0930. Other parts were developed for, and presented at the @hyperlink["http://esslli2006.lcc.uma.es/"]{18th European Summer School in Logic, Language and Information} (ESSLLI 2006) course @italic{Introduction to symbolic and statistical NLP in Scheme}. Most of the code was written and translated into @hyperlink["http://www.r6rs.org/"]{R6RS} by the members of @hyperlink["http://ling.unizd.hr/~schemers/"]{Schemers in Zadar} in their spare time.}


@section[#:tag "overview"]{Overview}

@para{The goal of the Scheme Natural Language ToolKit (S-NLTK) is to provide common functionality for natural language processing (NLP) tasks in Scheme, that can be used for educational purposes, as well as for development of NLP components in productive environments.}

@para{The documentation consists of three components:}

@itemlist{@item{Description of the library and functionality}@item{Documented implementation of the procedures and algorithms in the library}@item{Documented example applications}}


!!! TODO !!!


@section[#:tag "license"]{License}

This documentation is part of the @hyperlink["http://ling.unizd.hr/~snltk/"]{Scheme Natural Language Toolkit (S-NLTK)}.

The documentation of the S-NLTK and all explanations of examples of its use and properties are published under the @hyperlink["http://creativecommons.org/licenses/by-nc-nd/3.0/us/"]{Creative Commons Attribution-Noncommercial-No Derivative Works 3.0 United States} license. For further details about this license, follow the respective link.

@hyperlink["http://ling.unizd.hr/~snltk/"]{The Scheme Natural Language Toolkit (S-NLTK)} Scheme code is free software: you can redistribute it and/or modify it under the terms of the @hyperlink["http://www.gnu.org/copyleft/lesser.html"]{GNU Lesser General Public License} as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

@hyperlink["http://ling.unizd.hr/~snltk/"]{The Scheme Natural Language Toolkit (S-NLTK)} is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the @hyperlink["http://www.gnu.org/copyleft/lesser.html"]{GNU Lesser General Public License} for more details.

You should have received a copy of the @hyperlink["http://www.gnu.org/copyleft/lesser.html"]{GNU Lesser General Public License} along with the @hyperlink["http://ling.unizd.hr/~snltk/"]{Scheme Natural Language Toolkit (S-NLTK)}.  If not, see @url{http://www.gnu.org/licenses/}.
