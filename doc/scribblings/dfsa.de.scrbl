#lang scribble/doc
@(require "common.ss")

@title[#:tag "modfsa"]{fsa - Finite State Automata}

@margin-note{@para{Copyright 2005, 2006, 2007, 2008, 2009, 2010 by @hyperlink["http://ling.unizd.hr/~dcavar/"]{Damir Ćavar}, Petar Garžina, Larisa Grčić, Tanja Gulan, Damir Kero, Robert Paleka, Franjo Pehar, Pavle Valerjev}@itemlist{@item{@hyperlink["http://ling.unizd.hr/~snltk/manual.de/"]{Deutsch}}@item{@hyperlink["http://ling.unizd.hr/~snltk/manual.en/"]{English}}@item{@hyperlink["http://ling.unizd.hr/~snltk/manual.hr/"]{Hrvatski}}}}

@defmodule[nltk/fsa]{Das @schememodname[nltk/fsa] Module stellt Prozeduren für die Generierung and die Verarbeitung von Endlichen Automaten (Finite State Automata, FSA) bereit. !!! TODO !!!}

@para{Die Dokumentation des @schememodname[nltk/fsa] Moduls ist in der Entwicklung. Dies ist eine kurze und unvollständige Beschreibung einiger Prozeduren und Datenstrukturen in diesem Modul.}


@section{Grundlegende Prozeduren}


@defproc[(make-fsa [finalstates list? '()]
                   [alphabet    list? '()]
                   [states      list? '()]
                   [transitions hashtable? (make-hashtable equal-hash equal?)]
                   [startstate  integer? 0]) fsa?]{
liefert eine neue Datenstruktur vom Typ @scheme[fsa] zurück.
}


@defproc[(fsa? [sfsa fsa?]) boolean?]{

liefert @scheme[#t] zurück, wenn der Parameter @scheme[sfsa] auf eine Datenstruktur vom Typ @scheme[fsa] verweist. Sonst liefert die Prozedur @scheme[fsa?] den Wert @scheme[#f] zurück.
}


@defproc[(fsa-alphabet [sfsa fsa?]) list?]{
Returns the alphabet or list of symbols accepted by the FSA @scheme[sfsa].
}

@defproc[(fsa-alphabet-set! [sfsa fsa?]
                            [new-alphabet list?]) void?]{
Sets a new list @scheme[new-alphabet] as the alphabet or list of symbols accepted by FSA @scheme[sfsa].
}

@defproc[(fsa-finalstates [sfsa fsa?]) list?]{
Returns a list with final states as defined in FSA @scheme[sfsa].
}

@defproc[(fsa-finalstates-set! [sfsa fsa?]
                               [new-finalstates list?]) void?]{

Sets the finalstates for FSA @scheme[sfsa] to be the list provided by the parameter @scheme[new-finalstates].
}

@defproc[(fsa-states [sfsa fsa?]) list?]{
Returns a list of states that are defined in FSA @scheme[sfsa].
}

@defproc[(fsa-states-set! [sfsa fsa?]
                          [states list?]) void?]{
Sets the list of states in FSA @scheme[sfsa] to be @scheme[states].
}

@defproc[(fsa-startstate [sfsa fsa?]) integer?]{
Returns the start state of FSA @scheme[sfsa].
}

@defproc[(fsa-startstate-set! [sfsa  fsa?]
                              [state integer?]) void?]{
Sets the start state of FSA @scheme[sfsa] to be the state identifier @scheme[state].
}

@defproc[(fsa-transitions [sfsa fsa?]) hashtable?]{
Returns the transitions defined in FSA @scheme[sfsa] as a @scheme[hashtable]. The keys in the returned @scheme[hashtable] are of the type @scheme[vector] containing a tuple of a state identifier and a symbol for the transition. The corresponding value is an @scheme[integer] representing the goal state of the respective transition.
}

@defproc[(fsa-transitions-set! [sfsa fsa?]
                               [transitions hashtable?]) void?]{
Sets the transitions for FSA @scheme[sfsa] to be the hashtable @scheme[transitions]. The new @scheme[hashtable] is expected to have keys of the type @scheme[vector], containing an identifier of a state and the related transition symbol, and the corresponding value is expected to contain an @scheme[integer] value, representing the goal of the transition.
}


@section{Extended data manipulation}

@defproc[(fsa-set-finalstate! [sfsa fsa?]
                              [sid  integer?]) void?]{
Declares the state with the id @scheme[sid] to be a final state in the FSA specified in the parameter @scheme[sfsa].
}

@defproc[(fsa-add-state! [sfsa  fsa?]
                         [state integer?]) void?]{
Adds a new state @scheme[state] to the list of states of FSA @scheme[sfsa].
}

@defproc[(fsa-add-symbol! [sfsa  fsa?]
                          [nsymb any?]) void?]{
Adds a new symbol @scheme[nsymb] to the list of symbols of FSA @scheme[sfsa].
}

@defproc[(fsa-add-transition! [sfsa fsa?]
                              [from-state integer?]
                              [symb any?]
                              [to-state integer?]) void?]{
Adds a transition from state @scheme[from-state] with symbol @scheme[symb] to state @scheme[to-state] in FSA @scheme[sfsa].
}

@defproc[(fsa-get-transition [sfsa       fsa?]
                             [from-state integer?]
                             [tsymb      any?]) integer?]{
Returns an identifier of a goal state for the transition that is identified by the @scheme[from-state] and @scheme[tsymb] parameter. If there is no defined goal state for the specified transition, the returned value is @scheme[-1].
}

@defproc[(fsa-all-transitions [sfsa fsa?]) values?]{
Returns two values, a vector of the keys, and a vector of the corresponding values. The keys a of the type vector, containing the identifier of the state from which the transition starts, and the respective symbol for the transition. The values are of the type integer, representing an identifier for the goal of the the transition.
}


@section{FSA manipulation}

@defproc[(fsa-minimize [first-fsa fsa?]) fsa?]{

!!! TODO !!!
}

@defproc[(fsa-concatenate [first-fsa fsa?]
                          [second-fsa fsa?]) fsa?]{

Returns a FSA that represents the concatenation of two FSAs provided via the parameters @scheme[first-fsa] and @scheme[second-fsa]. !!! TODO !!!
}

@defproc[(fsa-union [first-fsa  fsa?]
                    [second-fsa fsa?]) fsa?]{

Returns a new FSA that is the Union of the two FSAs provided by the parameters @scheme[first-fsa] and @scheme[second-fsa]. The order of the two FSAs in the parameters is irrelevant.
}

@defproc[(sequence->fsa [seq (or/c list? vector? string?)]) fsa?]{

Returns an automaton from 
}



@section{Output procedures}

@defproc[(fsa->dot [fsa-par fsa?]) string?]{

Returns a @hyperlink["http://www.graphviz.org/doc/info/lang.html"]{DOT} representation of the directed graph that corresponds to the FSA provided in the first parameter @scheme[fsa-par]. The returned data structure is of the type @scheme[string].

The resulting @hyperlink["http://www.graphviz.org/doc/info/lang.html"]{DOT} data (or file) can be processed and visualized using @hyperlink["http://www.graphviz.org/"]{Graphviz}, and many other related tools. More information on @hyperlink["http://www.graphviz.org/doc/info/lang.html"]{DOT}, @hyperlink["http://www.graphviz.org/"]{Graphviz} and other visualization software is available at the @hyperlink["http://www.graphviz.org/"]{Graphviz homepage}.
}
