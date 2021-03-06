\" $Id: ocamllex.m 9026 2008-09-15 14:12:56Z doligez $
.TH OCAMLLEX 1

.SH NAME
ocamllex \- The Objective Caml lexer generator

.SH SYNOPSIS
.B ocamllex
[
.BI \-o \ output-file
]
[
.B \-ml
]
.I filename.mll

.SH DESCRIPTION

The
.BR ocamllex (1)
command generates Objective Caml lexers from a set of regular
expressions with associated semantic actions, in the style of
.BR lex (1).

Running
.BR ocamllex (1)
on the input file
.IR lexer \&.mll
produces Caml code for a lexical analyzer in file
.IR lexer \&.ml.

This file defines one lexing function per entry point in the lexer
definition. These functions have the same names as the entry
points. Lexing functions take as argument a lexer buffer, and return
the semantic attribute of the corresponding entry point.

Lexer buffers are an abstract data type implemented in the standard
library module Lexing. The functions Lexing.from_channel,
Lexing.from_string and Lexing.from_function create
lexer buffers that read from an input channel, a character string, or
any reading function, respectively.

When used in conjunction with a parser generated by
.BR ocamlyacc (1),
the semantic actions compute a value belonging to the type token defined
by the generated parsing module.

.SH OPTIONS

The
.BR ocamllex (1)
command recognizes the following options:
.TP
.B \-ml
Output code that does not use OCaml's built-in automata
interpreter. Instead, the automaton is encoded by Caml functions.
This option is mainly useful for debugging
.BR ocamllex (1),
using it for production lexers is not recommended.
.TP
.BI \-o \ output\-file
Specify the name of the output file produced by
.BR ocamllex (1).
The default is the input file name, with its extension replaced by .ml.
.TP
.B \-q
Quiet mode.
.BR ocamllex (1)
normally outputs informational messages
to standard output.  They are suppressed if option
.B \-q
is used.
.TP
.BR \-v \ or \ \-version
Print version and exit.
.TP
.BR \-help \ or \ \-\-help
Display a short usage summary and exit.

.SH SEE ALSO
.BR ocamlyacc (1).
.br
.IR "The Objective Caml user's manual" ,
chapter "Lexer and parser generators".
