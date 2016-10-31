#lang scribble/doc
@(require "common.ss")


@defmodule[nltk]{zbirka/knjižnica @schememodname[nltk] pruža sredstvo za procesiranje tekstova i podataka prirodnog jezika koristeći se statističkim i simboličkim pristupom. U zbirku su ključeni specifični rječnici jezika, skupovi pravila i gramatike za razne zadatke lingvističke analize. Svi postupci i podaci u skladu su sa @hyperlink["http://www.r6rs.org/"]{R6RS} standardom.}
                 
@hyperlink["http://ling.unizd.hr/~snltk/"]{Zbirka S-NLTK} je u neprestanom razvoju. Trenutna verzija se smatra @italic{Alpha-verzijom}, što znači da željena funkcionalnost, kao i specifični postupci još nisu gotovi. Međutim, navedeni postupci i strukture podataka su u potpunosti funkcionalni i kao takvi se mogu koristit.



@section[#:tag "overview"]{Overview}
@margin-note{@para{Copyright 2005, 2006, 2007, 2008, 2009, 2010 by @hyperlink["http://ling.unizd.hr/~dcavar/"]{Damir Ćavar}, Petar Garžina, Larisa Grčić, Tanja Gulan, Damir Kero, Robert Paleka, Franjo Pehar, Pavle Valerjev}@itemlist{@item{Deutsch}@item{@hyperlink["http://ling.unizd.hr/~snltk/manual.en/"]{English}}@item{Hrvatski}}}


@section[#:tag "license"]{License}

Ova dokumentacija je dio @hyperlink["http://ling.unizd.hr/~snltk/"]{Scheme Natural Language Toolkit (S-NLTK)}.

@hyperlink["http://ling.unizd.hr/~snltk/"]{The Scheme Natural Language Toolkit (S-NLTK)} je besplatni software: dopušteno ga je redistribuirati i mijenjati u skladu s uvjetima korištenja @hyperlink["http://www.gnu.org/copyleft/lesser.html"]{GNU Lesser General Public License} objavljenim od strane Free Software Foundation, bilo da se radi o verziji 3 ili bilo kojoj kasnijoj verziji.

@hyperlink["http://ling.unizd.hr/~snltk/"]{The Scheme Natural Language Toolkit (S-NLTK)} se distribuira u nadi da će biti od koristi, ali BEZ GARANCIJE; čak bez implicitnog upozorenja o MOGUĆNOSTI TRGOVANJA ili POGODNOSTI ZA ODREĐENU SVRHU. Vidi @hyperlink["http://www.gnu.org/copyleft/lesser.html"]{GNU Lesser General Public License} za više detalja.

Sa @hyperlink["http://ling.unizd.hr/~snltk/"]{Scheme Natural Language Toolkit (S-NLTK)} bi trebali dobiti i kopiju @hyperlink["http://www.gnu.org/copyleft/lesser.html"]{GNU Lesser General Public License}. Za slučaj da niste dobili kopiju vidi @url{http://www.gnu.org/licenses/}.
