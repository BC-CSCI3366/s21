# CSCI 3366 Programming Languages

**R. Muller**

------

### Bitlang

Bitlang is the world's most trivial "programming" language — it only allows bits or fully parenthesized bit addition. E.g., `0` or `1` or `(1 + (1 + 0))` etc. Its raison d'être, is for showing how to write the very simplest recursive descent parser.

Syntax

```
Expr ::= 0 | 1 | (Expr + Expr) 
```

Compile and run:

```bash
> cd src
> dune exec bin/main.exe
```

Type ctrl-d to exit.

```bash
> dune clean
```

to clean up intermediate files.