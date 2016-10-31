#lang scribble/doc
@(require "common.ss")

@title[#:tag "modngrams"]{ngrams - N-gram modeli}

@margin-note{@para{Copyright 2005, 2006, 2007, 2008, 2009, 2010 by @hyperlink["http://ling.unizd.hr/~dcavar/"]{Damir Ćavar}, Petar Garžina, Larisa Grčić, Tanja Gulan, Damir Kero, Robert Paleka, Franjo Pehar, Pavle Valerjev}@itemlist{@item{Deutsch}@item{@hyperlink["http://ling.unizd.hr/~snltk/manual.en/"]{English}}@item{Hrvatski}}}

@author{Damir Ćavar}

@defmodule[nltk/ngrams]{@schememodname[nltk/ngrams] modul daje postupak za generiranje i procesiranje n-gram modela iz dane liste tokena. Lista tokena može biti slijed bilo koje vrste. Za lingvističke analize i procesiranje tokeni su najčešće stringovi koji predstavljaju riječ, ili su samo nizovi znakova.}


@defproc[(token-sequence->ngrams [seq (or/c list? vector? string?)]) hashtable?]{                                                                          
Vraća strukturu bigram podataka kao @scheme[hashtable] u kojoj je bigram ključ, a apsolutni brojem vrijednost. Parametar @scheme[seq] mora biti sekvencionalan, odnosno lista, vektor simbola ili string. Budući da je @scheme[string] definiran kao niz slova, konačni rezultirajući bigram model se sastoji od dva niza simbola. Broj simbola u konačnom n-gram modelu je određen implicitnim parametrom @scheme[n], koji mora biti pozitivan, veći od @scheme[0] i po već zadanom standardu je 2.}


@defproc[(token-sequence->ngrams [seq (or/c list? vector? string?)] [n (>/c 0)]) hashtable?]{
Vraća n-gram strukturu podataka kao @scheme[hashtable], u kojoj je n-gram ključ, a apsolutni brojem vrijednost. Parametar @scheme[seq] mora biti sekvencijalnog tipa, što znači da mora biti lista, vektor simbola ili string - što je interpretirano kao niz znakova. Broj znakova u rezultirajućem n-gram modelu je određen parametrom @scheme[n], koji mora biti pozitivan i veći od @scheme[0].}


@defproc[(token-sequence->ngrams [seq (or/c list? vector? string?)]
                                 [n (>/c 0)]
                                 [ngrams hashtable?]) hashtable?]{
Vraća n-gram strukturu podataka u obliku @scheme[hashtable], u kojoj je n-gram ključ, a apsolutni brojem vrijednost. @scheme[seq] parametar mora biti sekvencijalnog tipa, odnosno lista, vektor sa oznakama/simbolima ili string, koji se interpretira kao niz znakova. broj simbola/oznaka u dobivenom n-gram modelu je određen parametrom @scheme[n], koji mora biti pozitivan i veći od @scheme[0].}


@defproc[(ngrams->dot-digraph [ngrams hashtable?]) string?]{
Vraća string sa DOT reprezentacijom grafa sa svim vezama između tokena u n-gram modelu.}


@defproc[(ngrams->dot-graph [ngrams hashtable?]) string?]{
Vraća string sa DOT reprezentacijom grafa sa svim međupoveznicama između tokena u n-gramima.}


@defproc[(ngrams->dot [ngrams hashtable?] [graph-type symbol?]) string?]{
Vraća string sa DOT reprezentacijom (prikazom) grafa sa svim međupoveznicama između tokena u n-gramima.}


@defproc[(ngrams->html-table [ngrams hashtable?]
                             [column-titles list?]
                             [sorted boolean?]
                             [sort-field symbol?]) string?]{
Vraća string koji sadrži HTML kod koji reprezentira n-grame i njihove frevkvencije kako su pohranjene u strukturi podataka @scheme[hashtable] s varijablom @scheme[ngrams]. Opcionalni parametar @scheme[column-titles] je lista (@scheme[list]) stringova (@scheme[strings]) sa stupcima ili oznakama zaglavlja za dobivenu tablicu. Opcionalna @scheme[sorted] oznaka je podešena na @scheme[#t], što rezultira sortiranim outputom (izlazom), koristeći strategiju "od većeg prema manjem" za brojeve, i "od manjeg prema većem" za stringove. opcionalni parametar @scheme[sort-field] je ili simbol @scheme['frequency] ili nešto drugo. Ako @scheme[sort-field] ima vrijendost @scheme['frequency]onda će dobivena tablica biti sortirana od veće prema manjoj vrijednosti frekvencije n-grama koje sadržava. Ako ne, onda će tablica biti sortirana od manje vrijednosti prema većoj s obzirom na same n-grame (n-grami se onda tretiraju kao stringovi).

Svaki red HTML tablice sadrži listu ćelije u kojima su svi tokeni iz n-grama kao i njihove odgovarajuće vrijendosti. Krajnji HTML kod tabele omogućava CSS, Javascript ili style hook za podešavanje opcija preko @tt{@literal{class="table-style"}} atributa na @tt{@literal{table}} oznaku.}


@defproc[(ngrams->bigrams [ngrams hashtable?]) hashtable?]{
Vraća novu strukturu podataka @scheme[hashtable], gdje su bigrami ključ, a frekvencije vrijednosti. Ako je dužina n-grama u parametru @scheme[ngrams] manja od 2, ili ako je @scheme[ngrams] struktura podataka prazna onda se vraća prazna @scheme[bigrams] @scheme[hashtable].
Frekvencije bigrama u tako dobivenoj strukturi podataka ne odražava realne frekvencije tih n-grama u originalnom izvoru teksta ili korpusu.}


@defproc[(filter-ngrams [ngrams hashtable?] [filter-tokens list?] [remove boolean?]) hashtable?]{
Vraća novu strukturu podataka u obliku hash-tabele @scheme[hashtable], gdje su n-grami ključ, a frekvencije vrijednost. Ako je opcionalna @scheme[remove] oznaka zadana kao @scheme[#t], vraćena @scheme[hashtable] neće sadržavati nijedan n-gram koji sarži element koji je @scheme[member] obavezne @scheme[filter-tokens] liste. Ako je opcionalna oznaka @scheme[remove] zadana kao @scheme[#f], vraćena @scheme[hashtable] će sadržavati samo n-grame koji sadrže element koji je član @scheme[member] obavezne @scheme[filter-tokens] liste.}


@defproc[(filter-ngrams! [ngrams hashtable?] [filter-tokens list?] [remove boolean?]) hashtable?]{
Vraća potpuno istu strukturu podataka oblika @scheme[hashtable] koja je određena parametrom @scheme[ngrams], gdje je n-gram ključ, a odgovarajuće frekvencije n-grama vrijednost. Slično @scheme[filter-ngrams], ako je @scheme[remove] oznaka postavljena kao @scheme[#t] svi n-grami će biti uklonjeni iz @scheme[ngrams] @scheme[hashtable] ako je samo i jedan token @scheme[member] liste @scheme[filter-tokens]. Ako je pak "remove" oznaka postavljena kao @scheme[#f] u rezultuirajućoj @scheme[hastable] će ostati samo n-grami koji sadrže token koji je dio @scheme[member] liste @scheme[filter-ngrams]. struktura podataka @scheme[ngrams] je promijenjena.}


@defproc[(relativize-ngrams [ngram hashtable?]) hashtable?]{
Returns...}


@defproc[(relativize-ngrams! [ngram hashtable?]) hashtable?]{
Returns...}
