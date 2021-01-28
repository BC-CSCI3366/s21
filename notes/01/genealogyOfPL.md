### The Genealogy of Programming Languages (30K Ft Edition)

Bob Muller — Jan. 2019

```
1600                                                   Symbolic Algebra

...                                                         |
                                                                           Set Theory
1879                                                   Symbolic Logic

...                                                         |
                                 Godel
1936    Turing Machine                             Untyped Lambda Calculus
...                                                                   \
           |                                                           \
           |                                                |       Typed Lambda Calculus
1945   von Neumann IAS Computer                                       
           |                                                |                 |
        Assembly        
-----------|-----------------------------------------------------------------------------
           |
1950       |                                                |
           |
           |
        FORTRAN
           |                                                |
1955       |
           |
           |                                         
           +-> Algol                                       LISP
           |    |                                           |
1960       v    |                                           |                   APL
                |                                           |                    |
                |                                           |                    v SNOBOL
                +-> CPL                                     |                        |      
                +----|-----> Simula                         |                        v
1965            |    |         |                         LISP 1.5 --------> ISWIM
                |    |         |                            |                 |
                |   BCPL       |           +----- Logo <----+                 |
                |    |         |           v                |                 |
                |    B         +-----> Smalltalk            |                 |
1970  Pascal <--+    |         |           |                |                 |
       |        |    C         v           |                |                 |
       |        |    |                     |                |                 |
       |        +--->|-------------------->|--------+       |            ML <-+--+
       +-> CLU  |    |                     |        v       |            |       |
1975   |    v   v    |                     |      Scheme <--+            |       v
       |             |                     |        |       |            |      SASL
       +----> Modula |    +======+=====+===+==+     |       |            |       |
       |         |   |    |      |     |   |  |     |       |            |      KRC
       +-> Ada   v   |    v      v     v   v  |     |       |            |       | Matlab
1980   |    |        +--->+----->+---->+      |     |       |            |       |   |
       v    v   B    |    |      |     |      |     |       |            |       v   v
                     |    |      |     |      |     |       |            |
                |    |    v      |     v      |     |       |            +--> Miranda --+     
                |    |   C++     |   ObjC     |     |       |            |              |     
                |    |    |      |     |      |     |    Common   SML <--+-------->+    |     
1985            |    |    |      |     |      |     |     LISP     |     |         |    |     
                |    |    |      |     |      |     |       |      v     |         |    v     
               ABC   |    |      |     |      |     |       v            +-> Caml Haskell  
                |    |    |      |     |      |     |                    |    |    |    |     
                |    |    |      |     |      |     |                    v    |    |    |     
1990            |    |    |      v     |      |     +----->+                  |    |    |     
       Python <-+    |    +---> Oak    |      |     |      |                  |    |    |     
        |            |    |      |     |      |     v      |                  |    |    |
        |            |    v      |     |      +--> Ruby    |                  |    |    |
        |            |           |     |      v            |                  |    |    |
1995    |    PHP     |         Java    |  JavaScript <-----+---> R          OCaml  |    |
        |     |      |           |     |      |            |     |            |    |    |
        |     v      |           |     |      |            |     v            |    |    |
        |            |        +--+     |      |            |                  |    v    |
        |            |        |        |      |            |                  |   Agda <+
2000    |            |   C# <-+        |      |            |                  |    |    |
        |            |    |   |        |      |            |                  |    v    |
        |            |    v   |        |      |            |                  |         |
        |       +----+        |        |      |            |                  |         |
        |       |    |        |        |      |            |                  |         |
2005    |       v    |      GJava      |      |    +-------+            F# <--+         |
        |      Rust  |        |        |      |    |       |             |    |         |
        +---+   |    |        |   +----+      |    |       |             v    |         |
        |   v   |    |        |   |    |      |    v       |                  |         |
        |   Go  |    |        |   v    v      |  Julia     |                  |         |
2010    |   |   |    |        | Swift         |    |     Racket               |         |
        |   |   |    |        |   |           |    |                          |         |
        |   |   |    |        |   v  Type <---+--->|--------------> Elm <-----+<--------+
        |   |   |    |        |      Script   |    |                 |        |         |
        |   |   |    |        |        |      +--->|---------------->|------->+----+    |
2015    |   |   |    |        |        v      |    |                 |        |    |    |
        |   |   |    |        |               |    v                 |        |    v    |
        v   v   v    v        v               v                      v        v  Reason v
```

 Crowded out: `COBOL, Basic, PL/1, Bliss, Logo, SETL, Prolog, Delphi, Eiffel, Dylan, Self, Erlang, Lua, Scala, Flash, Clojure, Groovy, Scratch, Kotlin, ... `.
