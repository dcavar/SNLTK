#lang scribble/doc
@(require "common.ss")

@title[#:tag "moddfsa"]{dfsa - Deterministic Finite State Automata}

@margin-note{@para{Copyright 2005, 2006, 2007, 2008, 2009, 2010 by @hyperlink["http://ling.unizd.hr/~dcavar/"]{Damir Ćavar}, Petar Garžina, Larisa Grčić, Tanja Gulan, Damir Kero, Robert Paleka, Franjo Pehar, Pavle Valerjev}@itemlist{@item{Deutsch}@item{@hyperlink["http://ling.unizd.hr/~snltk/manual.en/"]{English}}@item{Hrvatski}}}

@defmodule[nltk/fsa]{The @schememodname[nltk/dfsa] module provides procedures to generate and work with simple Deterministic Finite State Automata (DFSA). !!! TODO !!!}

@para{The documentation of the @schememodname[nltk/dfsa] module is under development. This is a brief and incomplete description of some procedures and data structures contained in this module.}


@section{DFSA: Basic procedures}

@defproc[(make-dfsa [finalstates list? '()]
                    [alphabet    list? '()]
                    [states      list? '()]
                    [transitions hashtable? (make-hashtable equal-hash equal?)]
                    [startstate  integer? 0]) fsa?]{

Returns a new data structure of the type @scheme[dfsa].
}

@defproc[(dfsa? [sfsa dfsa?]) boolean?]{

Returns @scheme[#t], if the provided parameter @scheme[sfsa] refers to a data structure of the type @scheme[dfsa]. Otherwise the procedure @scheme[dfsa?] returns @scheme[#f].
}

@defproc[(dfsa-alphabet [sfsa dfsa?]) list?]{
Returns the alphabet or list of symbols accepted by the DFSA @scheme[sfsa].
}

@defproc[(dfsa-alphabet-set! [sfsa dfsa?]
                            [new-alphabet list?]) void?]{
Sets a new list @scheme[new-alphabet] as the alphabet or list of symbols accepted by the DFSA @scheme[sfsa].
}

@defproc[(dfsa-finalstates [sfsa dfsa?]) list?]{
Returns a list with final states as defined in the DFSA @scheme[sfsa].
}

@defproc[(dfsa-finalstates-set! [sfsa dfsa?]
                               [new-finalstates list?]) void?]{

Sets the finalstates for the DFSA @scheme[sfsa] to be the list provided by the parameter @scheme[new-finalstates].
}

@defproc[(dfsa-states [sfsa dfsa?]) list?]{
Returns a list of states that are defined in the DFSA @scheme[sfsa].
}

@defproc[(dfsa-states-set! [sfsa dfsa?]
                          [states list?]) void?]{
Sets the list of states in the DFSA @scheme[sfsa] to be @scheme[states].
}

@defproc[(dfsa-startstate [sfsa dfsa?]) integer?]{
Returns the start state of the DFSA @scheme[sfsa].
}

@defproc[(dfsa-startstate-set! [sfsa  dfsa?]
                              [state integer?]) void?]{
Sets the start state of the DFSA @scheme[sfsa] to be the state identifier @scheme[state].
}

@defproc[(dfsa-transitions [sfsa dfsa?]) hashtable?]{
Returns the transitions defined in the DFSA @scheme[sfsa] as a @scheme[hashtable]. The keys in the returned @scheme[hashtable] are of the type @scheme[vector] containing a tuple of a state identifier and a symbol for the transition. The corresponding value is an @scheme[integer] representing the goal state of the respective transition.
}

@defproc[(dfsa-transitions-set! [sfsa dfsa?]
                               [transitions hashtable?]) void?]{
Sets the transitions for the DFSA @scheme[sfsa] to be the hashtable @scheme[transitions]. The new @scheme[hashtable] is expected to have keys of the type @scheme[vector], containing an identifier of a state and the related transition symbol, and the corresponding value is expected to contain an @scheme[integer] value, representing the goal of the transition.
}


@section{DFSA: Extended data manipulation}

@defproc[(dfsa-set-finalstate! [sfsa dfsa?]
                              [sid  integer?]) void?]{
Declares the state with the id @scheme[sid] to be a final state in the DFSA specified in the parameter @scheme[sfsa].
}

@defproc[(dfsa-add-state! [sfsa  dfsa?]
                         [state integer?]) void?]{
Adds a new state @scheme[state] to the list of states of the DFSA @scheme[sfsa].
}

@defproc[(dfsa-add-symbol! [sfsa  dfsa?]
                          [nsymb any?]) void?]{
Adds a new symbol @scheme[nsymb] to the list of symbols of the DFSA @scheme[sfsa].
}

@defproc[(dfsa-add-transition! [sfsa dfsa?]
                              [from-state integer?]
                              [symb any?]
                              [to-state integer?]) void?]{
Adds a transition from state @scheme[from-state] with symbol @scheme[symb] to state @scheme[to-state] in the DFSA @scheme[sfsa].
}

@defproc[(dfsa-get-transition [sfsa       dfsa?]
                             [from-state integer?]
                             [tsymb      any?]) integer?]{
Returns an identifier of a goal state for the transition that is identified by the @scheme[from-state] and @scheme[tsymb] parameter. If there is no defined goal state for the specified transition, the returned value is @scheme[-1].
}

@defproc[(dfsa-all-transitions [sfsa dfsa?]) values?]{
Returns two values, a vector of the keys, and a vector of the corresponding values. The keys a of the type vector, containing the identifier of the state from which the transition starts, and the respective symbol for the transition. The values are of the type integer, representing an identifier for the goal of the the transition.
}


@section{DFSA manipulation}

@defproc[(dfsa-minimize! [first-fsa dfsa?]) dfsa?]{

Returns a minimized DFSA from the provided @scheme[first-fsa] parameter. The provided @scheme[first-fsa] is changed in place.
}

@defproc[(dfsa-concatenate [first-fsa dfsa?]
                          [second-fsa dfsa?]) dfsa?]{

Returns a DFSA that represents the concatenation of two DFSAs provided via the parameters @scheme[first-fsa] and @scheme[second-fsa]. !!! TODO !!!
}

@defproc[(dfsa-union [first-fsa  dfsa?]
                    [second-fsa dfsa?]) dfsa?]{

Returns a new DFSA that is the Union of the two DFSAs provided by the parameters @scheme[first-fsa] and @scheme[second-fsa]. The order of the two DFSAs in the parameters is irrelevant.
}

@defproc[(sequence->dfsa [seq (or/c list? vector? string?)]) dfsa?]{

Returns an automaton from a single sequence of symbols or characters @scheme[seq].
}

@defproc[(sequence-list->dfsa [seq-list (or/c list? vector?)]) dfsa?]{

Returns an automaton from a sequence of sequences @scheme[seq-list].
}


@section{DFSA output procedures}

@defproc[(dfsa->dot [fsa-par dfsa?]) string?]{

Returns a @hyperlink["http://www.graphviz.org/doc/info/lang.html"]{DOT} representation of the directed graph that corresponds to the DFSA provided in the first parameter @scheme[fsa-par]. The returned data structure is of the type @scheme[string].

The resulting @hyperlink["http://www.graphviz.org/doc/info/lang.html"]{DOT} data (or file) can be processed and visualized using @hyperlink["http://www.graphviz.org/"]{Graphviz}, and many other related tools. More information on @hyperlink["http://www.graphviz.org/doc/info/lang.html"]{DOT}, @hyperlink["http://www.graphviz.org/"]{Graphviz} and other visualization software is available at the @hyperlink["http://www.graphviz.org/"]{Graphviz homepage}.
}
