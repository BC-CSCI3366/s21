

# CSCI 3366 Programming Languages

### Spring 2021

**R. Muller**, **J. Tassarotti**

------

### Lecture Notes: Week 2

#### This Week

1. OCaml: Basic Types, Literals & Expressions; Naming; Defining Functions
2. Structured Types 
3. Recursive Types & Recursive Functions
4. Functions are Values
5. Imperative Features
6. The Module System

---

Like most programming languages, OCaml is text-based: OCaml source code is written out in text and is then processed by the computer to carry out the expressed computation. OCaml source code is stored in files with the `.ml` extension. OCaml code can either be compiled and executed as an application via a command shell or, under some circumstances, it can be executed by an interpreter either via a shell command or within an editor such as emacs or atom.

**Compilation**

The OCaml compiler `ocamlc` translates OCaml source code and produces a byte-code file that can be executed on OCaml's virtual machine.

```
> ocamlc -o go myprogram.ml
> ./go
```

Executing the `go` byte-code file fires up OCaml's virtual machine to execute the code expressed in `myprogram.ml`. 

**Dune**

For this course, compilation will involve multiple source files and libraries so the process is configured using  the Dune build Manager command. Most often, you'll compile with

```
> cd src
> ls
bin lib
> dune build bin/main.exe
> dune exec bin/main.exe
```

The `exec` command will automatically build if the sources haven't been built yet so the above process can be expressed

```bash
> dune exec bin/main.exe
```

**Interpretation**

OCaml's interpreter `ocaml` can be fired up from the Unix command line. It cycles through a loop: reading, evaluating, printing and then looping back. Interpretation loops of this kind are often referred to as REPLs. An interaction with OCaml's REPL shell might look like:

```ocaml
> ocaml
...
# 3 * 2;;
- : int = 6

#
```

The hash-sign `#` is OCaml's prompt and the trailing `;;` is the user's signal to OCaml that they'd like the expression to be evaluated.  The details are spelled out in problem set 0 for how to run the REPL in your editor, if you choose to use Atom or vscode.

----------------

## 1. Basic Types, Literals & Expressions; Naming; Defining Functions

In computing, it's often useful to think of *types* as **sets**. For example, it's often reasonable to think of the familiar type `int` as the set of integers `{..., -2, -1, 0, 1, 2, ...}`. All programming languages provide a number of basic types that are built-in to the language. Most programming languages have ways to define new types. We'll get to that topic later.

Virtually all programming languages have basic types `int` and `float` together with built-in operators (e.g., `+`, `-`, `*`, `/`, `mod`) that work on values of that type.

**The Type `unit`**

The `unit` type has exactly one value `()`.

```ocaml
# ();;
- : unit = ()
```
That's it. The `unit` type is very useful as we'll see.

**The Type `int`**

```ocaml
# 2;;
- : int = 2
```

The numeral `2` is a *literal* expression of type `int`. OCaml's REPL displays both the type of the expression as well as its value.

```ocaml
# (* This is a comment; ignored by OCaml *)
```
> Unfortunately, OCaml doesn't have notation for a single-line comment. Comments must start with (* and end with *) one line or many.

```ocaml
# 5 * 2;;
- : int = 10
```

The expression `5 * 2` simplifies to the literal `10`. Expressions that can't be further simplified are called *values*.

**Convention** Infix operators should have spaces on either side.  So `5 / 2` is good, `5/2` is less good, and both `5 /2` and `5/ 2` are bad. Some coders prefer a style in which operators of lower precedence are surrounded by spaces while operators of higher precedence do not.  For example, instead of

```ocaml
a * x + b * x + c
```

one might write:

```ocaml
a*x + b*x + c
```

but the former is preferred in CSCI 3366.

**Integer Division**

```ocaml
# 7 / 2;;
- : int = 3

# 99 / 100;;
- : int = 0

# 1 / 0;;
Exception: Division_by_zero.

# 7 mod 5;;
- : int = 2

# max_int;;
- : int = 4611686018427387903
```

**The Type `float`**

```ocaml
# 3.14;;
- : float = 3.14

# 314e-2;;
- : float = 3.14

# 2.0 *. 3.14;;         (* NB: The floating point operators: +., -, ... end with a . *)
- : float = 6.28

# 7.0 /. 2.0;;
- : float = 3.15

# 2.0 ** 3.0;;
- : float = 8.0

# infinity;;
- : float = infinity

# 1.0 /. 0.0;;
- : float = infinity

# 1.0 /. 2;;
Error: This expression has type int but an expression was expected of type float
```

OCaml doesn't provide implicit type conversions as most languages do. You'll have to choose the right operator based on the types of the operands.

**Type Conversion**

Values of a new type can be obtained from values of an existing type using the built-in type conversion functions.

```ocaml
# truncate 3.14;;
- : int = 3

# float_of_int 1;;
- : float = 1.0

# int_of_float 1.9999;;
- : int = 1
```

It's worth noting that the notation `truncate 3.14` represents an *application* or *call* of the built-in `truncate` function. You'll also see function calls written parenthesized as `(truncate 3.14)`. You're probably more familiar with function call syntax of the form `truncate(3.14)`. It turns out something is going on here. We'll return to it later.

##### Infix & Prefix Notation for Operators

the operators `+, *, /, -, …` are usually written in *infix position*, i.e., the operator appears between the operands as in `2 + 3` . Infix operators can also be used in *prefix* *position* by enclosing them in parentheses. For example, one can write

```ocaml
# (+) 2 3;;
- : int = 5
```

One small catch is that the multiply operator `*` must be surrounded by spaces `( * )` so it isn't confused with a comment.

```ocaml
 # ( * ) 2 3;;
- : int = 6
```

This is also true for the exponentiation operator `**`.

Finally, notice that we can simply evaluate an operator as follows.

```ocaml
# (+);;
- : int -> int -> int = <fun>
```

The type of the `+` operator is `int -> int -> int` — this may look a little strange; we'll explain it later.

The built-in operators are interpreted using the familiar PEMDAS order for the operators.

```ocaml
# 2.0 +. 3.14 *. 4.0;;
- : float = 14.56

# (2.0 +. 3.14) *. 4.0;;
- : float = 20.5600000000000023          (* NB: 15 decimal places for floats *)
```

**The Type `char`**

```ocaml
# 'M';;
- : char = 'M'

# Char.code 'M';;
- : int = 77

# Char.chr 77;;
- : char = 'M'
```

The last two examples uses functions `code` and `chr` from the built-in `Char` library, part of the standard library that ships with OCaml. We'll have more to say about libraries below.

**Heads Up** The string type and the bool type are built-in types but they're actually a bit different than the base types shown above. For now we'll ignore the difference.

**The Type `string`**

```ocaml
# "hello world!";;
- : string = "hello world!"

# "hello" ^ " world!";;                 (* string concatenation *)
- : string = "hello world!"

# String.length "hello world!";;
- : int = 12

# "CSCI3366".[1];;                      (* string indexing yields a char *)
- : char = 'S'
```

**The Type `bool`**

```ocaml
# true;;
- : bool = true

# false;;
- : bool = false

# false || true;;
- : bool = true

# false && true;;
- : bool = false

# not (false && true);;
- : bool = true
```

**Relational Operators**

Values of the same type can be compared.

```ocaml
# 'A' = 'A';;
- : bool = true

# 'A' <> 'A';;
- : bool = false

# 3 >= 4;;
- : bool = false

# compare "Alice" "Alice";;
- : int = 0

# compare "Al" "Alice";;
- : int = -1

# compare "Alice" "Al";;
- : int = 1
```

### Libraries

Like most programming languages, OCaml has libraries of code that can be used more or less off-the-shelf. The [Standard Library](http://caml.inria.fr/pub/docs/manual-ocaml/stdlib.html) comes with all implementations of OCaml. We've referred to the Standard Library's **Char** and **String** modules already, there are many more: a **Random** module for working with random numbers, a  **Printf** module for formatted printing and so on. It's worth noting that OCaml's Standard Library is pretty spare in comparison to standard library's in other programming languages.

Symbols defined in library modules can be accessed by prefixing them with the module name.

```ocaml
# String.length "Alice";;
- : int = 5
-
# Random.int 3;;                 (* equal chance of 0, 1 or 2 *)
- : int = 1

# Random.float 1.0;;
- : float = 0.432381

# Printf.sprintf "My friend %s is %d years old." "Jasmine" 19;;
- : string : "My friend Jasmine is 19 years old."
```

One can omit the module-name prefix by opening the module.

```ocaml
open Printf

sprintf "Hello %s" "world!";;
```

It's common to make an abbreviation or alias for a module name.
```ocaml
module P = Printf
P.sprintf "Hello %s" "world!"
```

**Pervasives**

Some library resources are used so, well, pervasively, in OCaml code, their definitions are housed in a module [Pervasives](http://caml.inria.fr/pub/docs/manual-ocaml/libref/Pervasives.html) that is opened automatically. Instead of requiring `Pervasives.min`, one can write simply `min`. 

A few additional pervasive functions:

```ocaml
# let smaller = min 2 3;;
val smaller : int = 2
# floor 3.9999;;
- : int = 3

# abs (-3);;
- : int = 3

# abs_float (-2.0);;
- : float = 2.
```

Modules that are not part of the Standard Library need to be made known to the OCaml compiler. This can be done in a number of ways, we'll come back to this topic later.

**The Lib Module**

For this course, we've created a few useful definitions in a module called `Lib`. You can find documentation [here](https://github.com/BC-CSCI3366/s20/blob/master/resources/lib.md).

**Packages**

The world-wide OCaml community has developed many more library modules that provide functionality beyond the Standard Library. These libraries usually take the form of **packages** that implement complete applications or services. OCaml packages can be installed and managed by OCaml's package manager [OPAM](https://opam.ocaml.org/).

#### Summary

- OCaml expressions are mostly familiar, being built-up from literals of base type, operators and parentheses;

- Like all functional programming languages, OCaml's modus operandi is to simplify:

  ```ocaml
  2 + 3 + 4 + 5 =>
    5 + 4 + 5 ->
    9 + 5 =>
    14
  ```

- A *value* is an expression that cannot be further simplified.

-------------------

### Naming Values

In OCaml, values can be named using a `let`-expression. There are two basic forms:

```ocaml
let x = expr                                    --- top-level let
let x = expr1 in expr2                          --- let-in  
```

The former makes the name `x` usable throughout the top-level. In the latter, the name `x` is only usable in the expression immediately after the `in`  keyword: i.e., the expression `expr2`.

```ocaml
# let a = 3.0 . 2.0;;                  ( top level let *)
val a : float = 6.0

# a;;
- : float = 6.0

# let b = 3.0 . 2.0 in b ** 2.0;;      ( let-in *)
- : float = 36.0

# b;;
Error: Unbound variable b

# let school = "Boston College";;
val school : string = "Boston College"

# school.[0];;
- : char = 'B'
```

**Name Formation** Names in OCaml can be formed in the standard ways. names beginning with a lowercase letter are used for values and types; names beginning with an uppercase letter are used for module names, signature names or constructors. We'll discuss these in the next section.

**Conventions**

1. **Name Formation**: OCaml coders tend to follow the standard conventions using either `camelCase` or `snake_case` for symbols.
2. **Cascaded `let-in` Expressions**: It's very common to have a cascade of `let-in`-expressions as in

```ocaml
let x1 = expr1 in let x2 = expr2 in ... let xn = exprn in expr
```

In this case we stack up the lets as follows:

```ocaml
  let x1 = expr1 in
  let x2 = expr2 in
  ...
  let xn = exprn
  in
  expr
```

#### Let-bindings Support Implicit and Explicit Typing

When introducing a name, one can choose to explicitly specify the expected type or to allow OCaml to infer the type for you. OCaml will infer the type of the right-hand side in any case. If you've guess wrong on your explicit type annotation, OCaml will let you know.

```ocaml
let school : string = "Boston" ^ " " ^ "College";;
val school : string = "Boston College"
```

### Defining Functions

Functions are the main tool for packaging up computation in almost all programming languages. In this section we'll introduce the basic form. In the next section we'll discuss how to write functions in general. Functions have *definitions* and *uses*. A use of a function is often referred to in the standard way as a *call*. In functional languages function calls are often referred to as *applications*.   

**Function Definitions** The two variations of the `let`-expression discussed earlier can be used to name a function value.

```ocaml
  let functionName x1 ... xn = expr1                    --- top-level
  let functionName x1 ... xn = expr1 in expr2           --- let-in
```

The symbols `x1`, ..., `xn` denote binding occurrences of *variables*. These occurrences are called *parameters* or *formal*  *parameters*. Formal parameters usually govern applied occurrences or uses of the variables in the function *body*  `expr1`.

**Notes**:

1. The variables `x1`, …, `xn` can be used only in `expr1`;
2. The function name `functionName` cannot be used in `expr1`, in the former case it can be used in the top-level and in the latter case it can be used only in `expr2`.

Function definitions are usually stored in text files with the **.ml** extension.

**Function Calls**

A function *call* or *application* has the form:

```ocaml
functionName expr1 ... exprn            or         (functionName expr1 ... exprn)
```

where each of `expr1`, ..., `exprn` is an expression. How does a function do its job? As with the simple algebraic expressions, through simplification.

1. When a function call is evaluated, for each i = 1,..,n, `expri` is evaluated. This process may produce a value Vi, it may encounter an error or it may not stop (more on that later).

2. If for each i, the evaluation of `expri` produces a value Vi, the value Vi is plugged-in for `xi` in the function body (i.e., each occurrences of `xi` in `expr1` is *replaced* by value Vi).

3. Then the body of the function is simplified. If the body of the function has a value V, then V is the value of the function call.

**Example**: A doubling function for integers:

```ocaml
# let double n = n * 2;;
val double : int -> int
```
1. **Simplification**

   ```ocaml
   double (2 + 2) =>              --- simplification requires 3 steps
     double 4 =>
     4 * 2 =>
     8
     
   double 3 + double (2 + 3) =>   --- simplification requires 6 steps
     3 * 2 + double (2 + 3) =>
     6 + double (2 + 3) =>
     6 + double 5 =>
     6 + 5 * 2 =>
     6 + 10 =>
     1
   ```

2. **The function denoted by** `double`. From its definition, OCaml has inferred that `double` is of the type `int -> int`, i.e., a function mapping integers to integers. It's not unreasonable to think of `double` as an element of the *set* of functions from integers to integers, in particular, the element that is the set of input/output pairs:

   ```ocaml
   double is { ..., (-2, -4), (-1, -2), (0, 0), (1, 2), (2, 4), ... }
   ```

3. **Explicit & Implicit Types** Other variations of `double` wherein the programmer explicitly specifies input/output types. All four definitions are the same.

   ```ocaml
   let double (n : int) = n * 2         --- specify input type
   
   let double n : int = n * 2           --- specify output type
   
   let double (n : int) : int = n * 2   --- specify both
   ```

**Example**: A min3 function that uses the pervasive two-argument  `min` function to compute the minimum of 3 inputs.

```ocaml
# let min3 p q r = min p (min q r);;
val min3 : 'a -> 'a -> 'a -> 'a

min3 1 2 3 ->
  min 1 (min 2 3) =>
  min 1 2 =>
  1
```

#### Polymorphism

The type of a function depends on its definition. For example, the identity function is trivial but it illustrates the point — there are no constraints on `x` in the function definition.

```ocaml
# let id x = x;;
val id : `a -> `a
```

OCaml will infer the most general possible type `'a -> 'a`. The `'a` is a *type variable*.

```ocaml
# id "Boston";;
- : string = "Boston"

# id 343;;
- : int = 343
```

We'll have more to say about polymorphism later on.

## 2. Structured Types

In OCaml, new names for existing types and new types can be created and named using the `type` keyword.

### Sum Types

Sum types are one of the most important features of modern, typed functional programming languages. They're sometimes called *variant* *types* and sometimes called *union types* or even *disjoint union types*. Variations and restricted forms of sum types have cropped up in many programming languages over the years.

```ocaml
# type fruit = Lemon | Apple | Lime | Banana;;
type fruit = Lemon | Apple | Lime | Banana

# let favorite = Banana;;
favorite : fruit = Banana
```

The symbols enumerated on the right: `Apple`, `Lemon`,  `Lime` and `Banana` are *constructors* — they construct values of the sum type `fruit`. Constructors start with a capital letter and are separated with the "or" symbol `|`.  We can think of the collection of them as a complete *enumeration* of the values of the type `fruit`. 

Values of sum type are the basis of *dispatch* or branching. In OCaml, dispatch is based on *pattern matching*.

```ocaml
(* isCitrus : fruit -> bool *)
let isCitrus fruit =
  match fruit with              (* the expression between the keywords -match- *)
  | Lemon  -> true              (* and -with- is the dispatch expression *)
  | Apple  -> false
  | Lime   -> true              (* NB the "or" sticks lined up with the m in match *)
  | Banana -> false

let isCitrus fruit =            (* slightly more succinctly *)
  match fruit with
  | Lemon | Lime -> true
  | _ -> false
```

> Thinking in terms of the underlying sets, we can understand the type `fruit` as denoting the 4-element set
> $$
> \{\mathtt{()}\}_0 + \{\mathtt{()}\}_1 + \{\mathtt{()}\}_2 + \{\mathtt{()}\}_3 = \{(0, \mathtt{()}), (1, \mathtt{()}), (2, \mathtt{()}), (3, \mathtt{()})\}
> $$
> where `(0, ())` represents `Lemon`, `(1, ())` represents `Apple` and so on. Since the value `()` is of the singleton type `unit`, we can simply ignore it, and effectively represent `Lemon` with just its injection tag 0,  `Apple` with 1 and so on.

##### Exhaustive Matching

One of the important properties of OCaml's `match` expression is that the compiler will warn the coder if the match expressions in their code fails to account for all of the summands. For example, writing `isCitrus` as follows (failing to match `Banana`) draws a specific compiler warning.

```ocaml
let isCitrus fruit = 
  match fruit with 
  | Lemon | Lime -> true 
  | Apple -> false
  
Warning 8: this pattern-matching is not exhaustive.
Here is an example of a case that is not matched:
Banana
val isCitrus : fruit -> bool = <fun>
```

Exhaustive matching turns out to be extremely useful to every-day coders.

##### Constructors with Payloads

The sum type `fruit` is the simplest kind, commonly known as an *enumeration type* — all of the values of the type are explicitly enumerated symbolic names. In the more general case, the summands may carry payloads of data of one kind or another.

```ocaml
type number = Float of float | Int of int;;

# let pi = Float 3.14;;
val pi : number = Float 3.140000...

# let n = Int 14;;
val n : number = Int 14

# let (Int i) = Int (2 + 3);;         (* pattern matching a let-binding *)
val i : int = 5
```

We can modify our `double` function to work on values of type `number`

```ocaml
(* double : number -> number *)
let double n =
  match n with
  | Int i   -> Int (i * 2)
  | Float f -> Float (f *. 2.0)
  
let (Int i) = double (Int 4);;        
val i : int = 8
```

##### Notes 

1. Note that the patterns in the match-clauses introduces variables `i` and `f` which can be used in the expressions on the right-hand sides of the respective `->`s.

2. It's worth noting that most *dynamically typed* programming languages such as Python, JavaScript and the various dialects of LISP support operations on numbers. For example, in JavaScript there are no types `int` or `float`, only `number`. When an expression `2.0 + 5` is encountered in JS, well, both `2.0` and `5` have injection tags, i.e., they are values of sum type, the injection tags are represented at run-time, and are the basis of a run-time dispatch to the appropriate operation.

3. In the definition of `number`, the symbol `Float` is a constructor of values of type `number`. It's convenient to think of a payload carrying constructor such as  `Float` as being a function from `float` to `number`. Unfortunately, constructors are not first-class in OCaml — they can't be passed around (unapplied) as arguments or returned as functions results.

#### Three Important Built-in Sum Types

OCaml has three important built-in sum types. They are 1. the type `bool`, 2. the type `'a option` and finally the type `'a list`. We'll discuss the list type in detail shortly.

##### The Sum Type `bool`

```ocaml
type bool = true | false
```

This is a sum type paralleling the type `fruit` above. This is the only sum type with uncapitalized constructors. In this case, only one bit is required to represent the two values `true` and `false` inhabiting the type.

##### The Sum Type `'a option`

A value of type `'a option` may or may not carry a payload of type `'a`.

```ocaml
type 'a option = None | Some of 'a
```

In cases where a value may or may not be present, it's convenient to use an option type. In some languages these are called "maybe" types. For example, consider integer division and the problem of division by zero. We could write

```ocaml
(* div : int -> int -> int option *)
let div m n =
  match n = 0 with
  | true  -> None
  | false -> Some (m / n)
```

### Product and Record Types

##### Product Types

Product and record types are also very important composite types in OCaml and many other functional programming languages. Unlike the sum type above, product types are built-in so they don't need to be declared via the `type` keyword.

```ocaml
# let point = (1 + 1, 1 + 2);;
val point : int * int = (2, 3)

# fst point;;
- : int = 2

# snd point
- : int = 3

# let (x, y) = point;;
val x : int = 2
val y : int = 3
```

> Continuing with our theme of types as sets, it's reasonable to think of the type `int * int` as a set. I.e., the Cartesian produce of the set of integers `{..., (-2, 4), (-1, 4), (0, 4), (1, 4), (2, 4), ...}` . Of course we think of the value `(2, 3)`  as being an element of the set denoted by its type.

Note the tuple pattern matching on the let-binding. Also, as in Python, Swift and Rust, we can have tuples of arbitrary degree. Tuples provide a convenient way for a function to return "multiple" results. A function returning a k-tuple is in fact returning only one result (the tuple), but with tuple-matching, the result can be easily used as though it were k results.

Consider a function that returns both the quotient and the remainder of integer division.

```ocaml
(* div : int -> int -> int * int *)
# let div m n = (m / n, m mod n);;
val div : int -> int -> int * int = <fun>

# let (quotient, remainder) = div 19 5;;
val quotient : int = 3
val remainder : int = 4
```

##### Record Types

Tuples are useful, but it's frequently even more useful to be able to associate symbolic names with the various components of the tuple. The record type fills that bill. For our 2D-point example above, we can name the x and y fields.

```ocaml
# type point = {x : int; y : int};;              (* x and y are field labels *)
type point = {x : int; y : int}

# let p = {x = 2 * 2; y = 8};;
val p : point = {x = 4; y = 8}

# p.x;;
- : int = 4
```

The expression `p.x`, called `projection`, retrieves the `x` field from record `p`. 

Records are especially useful because of the symbolic names and because OCaml provides powerful pattern matching support. Experienced OCaml programmers use them all the time.

```ocaml
# let {x = a; y = b} = p;;  (* vars a & b matched to the values of the x & y fields. *)
val a : int = 4
val b : int = 8

# let {x; y} = p;     (* choosing var names same as field names allows abbreviation *)
val x : int = 4
val y : int = 8

# let {x} = p;;       (* matching only the x field *)
val x : int = 4

# let makePoint x y = {x; y};;       (* using var names same as field names *)
val makePoint : int -> int -> point

let q = makePoint 2 3;;
val q : point = {x = 2; y = 3}
```

Records make great payload bays for sum types. 

```ocaml
type employ = Admin | Faculty

type person = Student of { name : string
                         ; classOf : int
                         }
            | Staff of { name : string
                       ; job : employ
                       }
                       
let alice = Staff { name = "Alice"; job = Faculty }
let bob = Student { name = "Bob"; classOf = 2023 }
```

### Recursive Types

Most programming languages support recursive types in some way. For example, in C and Java it's very common to find recursive data structure declarations such as

```java
// C                                  // Java
struct Node {                         class Node {
int info;                               int info;
struct Node* next;                      Node next;
}                                     }
```

The occurrences of `Node` in the definitions makes this type recursive.  In order for a recursive type to be well-defined, it must have a base case. Although it isn't explicit in any of the C-based languages, It turns out that `null` is used as a base case for all recursive types. 

In OCaml, recursive types are usually defined as recursive, sums of products. Let's see a simple example: a type for an arbitrarily long list of integers.

```ocaml
type ilist = Empty | Node of { data : int      (* Elm-style notation for records *)
                             ; next : ilist        
                             }
                             
let ns = Node { data = 2
              ; next = Node { data = 4
                            ; next = Empty
                            }
              }
              
val ns : ilist = Node { ... }
```

This is the basic idea. But the notation above is too heavy and the restriction to a payload of type `int` is too narrow.

#### Lists — The Third Built-in Sum Type in OCaml

Earlier we alluded to three important built-in sum types. The first two were `bool` and `'a option`. The third is probably the most important built-in structured type: the `'a list`. 

```ocaml
type 'a list = [] | :: of 'a * 'a list
```

A list is either empty (`[]`) or it's a *cons* (`::`) with a payload consisting of a pair with a value of some type `'a` together with another list. As noted above, the list type is a *recursive*, *sum* of *products*. The recursive part allows values of the type to be arbitrarily large, the sum part ensures that the type has at least one base (non-recursive) case to ensure that the type actually defines something and the product part allows values of the type to carry a payload (a value of any type `'a` ).

The type is so important in functional programming that parsers for FP compilers are usually geared up to support special syntax for values of this type. Notwithstanding the notation in the definition above, the *cons* operator `::` is an *infix* operator. And sequences of conses ending in `[]` are notated with square brackets `[ ... ]`. The following are all equivalent.

```ocaml
[1; 2]                1 :: (2 :: [])              1 :: 2 :: []
```

At run-time, when `(x :: xs)` is evaluated,  OCaml's run-time support allocates a small block of storage for a pair, dubbed a *cons cell* by its inventor [John McCarthy](https://en.wikipedia.org/wiki/John_McCarthy_(computer_scientist)), in the heap:

```
                               Cons cells are usually drawn side-by-side
         +-------+      
  o----->|   x   |                          +------+------+
         +-------+                  o-----> |   x  |  xs  |
         |   xs  |                          +------+------+
         +-------+
```

We'll discuss memory in more detail later.

## 3. Recursive Types & Recursive Functions

In OCaml, the natural way to express repetition in a function is to define it recursively. In order to define a recursive function, the keyword `rec` is required as an annotation:

```ocaml
  let rec functionName x1 ... xn = expr1                    --- top-level
  let rec functionName x1 ... xn = expr1 in expr2           --- let-in
```

In a recursive function, the function name can be used in `expr1`. 

We'll start with a few simple recursive functions dispatching on the two cases of (the recursively defined) lists. Of the four functions, only `sum` cares about the type of the payload — it must be a value of type `int`. So `sum` is a monomorphic function, the others are all polymorphic.

**Example** `length : 'a list -> int`

```ocaml
(* length : 'a list -> int *)
let rec length xs =
  match xs with
  | [] -> 0
  | _ :: xs -> 1 + length xs
```

**Example** `sum : int list -> int`

```ocaml
(* sum : int list -> int *)
let rec sum ns =
  match ns with
  | [] -> 0
  | n :: ns -> n + sum ns
```

**Example** `last : 'a list -> 'a`

```ocaml
(* last : 'a list -> 'a *)
let rec last xs =
  match xs with
  | [] -> failwith "last: there's nothing in this list."
  | [x] -> x
  | _ :: xs -> last xs
```

**Example ** `append : 'a list -> 'a list -> 'a list`

```ocaml
(* append : 'a list -> 'a list -> 'a list *)
let rec append xs ys =
  match xs with
  | [] -> ys
  | x :: xs -> x :: append xs ys
```

These are different functions with their own properties. But they are all defined similarly — they first check the base case and yield an answer. They all make a recursive call on the field of the cons with the recursively defined type. This is a very common pattern. 

In the case of `length`, `sum` and `append` there is some work to do after the recursive call returns. In the case of `last`, nothing remains to be done, the result of the recursive call is the result of the function call. The function `last` is said to be [tail recursive](https://en.wikipedia.org/wiki/Tail_call), while the others are not. Tail recursive functions are desirable because they can be implemented efficiently by an optimizing compiler. Non-tail-recursive functions can often be re-written in a tail-recursive style.

**Exercise** `length : 'a list -> int`

```ocaml
let length xs =
  let rec loop xs answer = 
    match xs with
    | [] -> answer
    | _ :: xs -> loop xs (1 + answer)
  in
  loop xs 0
```



**Exercise** `sublists : 'a list -> 'a list list`

```ocaml
let rec sublists xs =
  match xs with
  | [] -> [[]]
  | x :: xs -> 
    let almost = sublists xs in
    let extend xs = x :: xs 
    in
    almost @ (List.map extend )
```



Write the function `power : int -> int -> int` such that a call `(power m n)` returns `m` raised to the `n`.



**Example**

A function `downFrom : int -> int list` a call `(downFrom n)` returns a descending list `[n - 1; …; 0]`.

```ocaml
let rec downFrom n =
  match n = 0 with
  | true  -> []
  | false ->
    let m = n - 1
    in
    m :: downFrom m
```

**Exercise**

Write a function `range : int -> int list` such that a call `(range n)` returns a list of integers ascending from 0 to `n -1`  `[0; …; n - 1]`.

```ocaml
# let foods = [Fruit Lemon; Herb Banana; Fruit Lime; Fruit Apple];;
val foods : food list = [Fruit Lemon; Herb Banana; Fruit Lime; Fruit Apple]

(* countFruits : food list -> int
*)
let rec countFruits foods =
  match foods with
  | [] -> 0
  | (Fruit _) :: foods -> 1 + countFruits foods
  | _ :: foods -> countFruits foods
```

**Key Idea**

> *when writing a function that processes a value of a recursive type, one can often solve a major sub-problem by applying the function recursively to those parts of the value that are defined recursively in the type.*

```ocaml
(* copy : 'a -> int -> 'a list *)
let rec copy item n =
  match n = 0 with
  | true  -> []
  | false -> item :: copy item (n - 1)
```

Two versions of a list reversal function.

```ocaml
(* reverse : 'a list -> 'a list

   For a call a (reverse xs), this function is QUADRATIC in (List.length xs). Why? It calls
   a linear function a linear number of times. Not good!
*)
let rec reverse xs =
  match xs with
  | [] -> []
  | x :: xs -> append (reverse xs) [x]

(* A more efficient, tail-recursive version. This version is LINEAR in (List.length xs)
*)
let reverse xs =
  let rec loop xs answer =
    match xs with
    | [] -> answer
    | x :: xs -> loop xs (x :: answer)
  in
  loop xs []
```

**Trees**

```ocaml
type 'a tree = Empty
             | Node of { info : a'
                       ; left : 'a tree
                       ; right: 'a tree
                       }
```

A `'a tree` is a binary tree carrying information of polymorphic type `'a`. Since the `left` and right fields are defined recursively, processing `'a tree`s will usually involve some sort of recursive calls on those fields. **Note that there is no null in OCaml — the base case of the recursive definition is explicitly defined as `Empty`.**

```ocaml
type sym = A | B | C | D | E                                                          

let t : sym tree = Node { info = A
                        ; left = Node { info  = B                              A
                                      ; left  = Empty                         / \
                                      ; right = Node { info  = D             B   C
                                                     ; left  = Empty          \  
                                                     ; Right = Empty           D
                                                     }
                                      }
                        ; right = Node { info  = C
                                       ; left  = Empty
                                       ; Right = Empty
                                       }
                        }  

(* preorder : 'a tree -> 'a list *)
let rec preorder tree =
  match tree with
  | Empty -> []
  | Node{info; left; right} -> info :: (preorder left) @ (preorder right)

(* breadthFirst : 'a tree -> 'a list *)
let breadthFirst tree =
  let rec loop trees =
    match trees with
    | [] -> []
    | Empty :: trees -> loop trees
    | Node{info; left; right} :: trees ->
      info :: loop (trees @ [left; right])
  in
  loop [tree]                 
```

**Abstract Syntax Trees**

```ocaml
type value = Value of int

type ast = Literal of int
         | Plus of  {left : ast; right : ast}
         | Times of {left : ast; right : ast}

(* format : ast -> string *)
let rec format ast =
  match ast with
  | Literal i -> string_of_int i
  | Plus{left; right}  -> Lib.fmt "(%s + %s)" (format left) (format right)
  | Times{left; right} -> Lib.fmt "(%s * %s)" (format left) (format right)

(* eval : ast -> value *)
let rec eval ast =
  match ast with
  | Literal i -> Value i
  | Plus {left; right}  ->
    let Value v1 = eval left in
    let Value v2 = eval right
    in
    Value (v1 + v2)
  | Times {left; right}  ->
    let Value v1 = eval left in
    let Value v2 = eval right
    in
    Value (v1 * v2)
```

## 4. Functions are Values

Types can be understood as denoting sets of values. For example, the literals `1` and `2` are elements of the set denoted by the type `int` and the literals `'A'` and `'B'` are elements of the set denoted by the type `char`. This idea is orthogonal in OCaml: it applies to structured types as well as the base types. Thus, the pair value `(1, 2)` is an element of the product set denoted by the type `int * int`. And so forth.

In this chapter, we consider *function values* i.e., the values occupying the sets denoted by function types. For example, the `double` function in:

```ocaml
(* double : int -> int *)
let double n = n * 2
```

is of type `int -> int`, so we can usefully view it as an element of the set denoted by the type `int -> int`. This is a rich and interesting topic and a fundamental aspect of modern coding.

The function definition notation in this example is shorthand for

```ocaml
let double = fun n -> n * 2
```

The expression `fun n -> n * 2` denotes an *anonymous function*.

#### Mapping Functions over Lists

Many common computational idioms or *patterns* as they are sometimes called, can be captured by treating functions as *first-class* values. That is, by treating functions in the same way that one treats values of other types such as integers or floats — to allow them to be passed as arguments to functions, returned as results of functions, stored in lists, records and tuples and so forth.

Let the polymorphic `pair` function be defined as:

```ocaml
(* pair 'a -> ('a * 'a) list *)
let pair x = (x, x)
```

and consider the following four example list processing functions:

```ocaml
(* codes : char list -> int list *)
let rec codes chars =
  match chars with
  | [] -> []
  | char :: chars -> (Char.code char) :: codes chars

(* doubles : int list -> int list *)
let rec doubles ns =
  match ns with
  | [] -> []
  | n::ns -> (double n) :: doubles ns

(*  stringLens : string list -> int list *)
let rec stringLens strings =
  match strings with
  | [] -> []
  | string :: strings -> (String.length string) :: stringLens strings

(* pairAll : 'a list -> ('a * 'a) list *)
let rec pairAll xs =
  match xs with
  | [] -> []
  | x :: xs -> pair x :: pairAll xs
```

All four of these functions accept a list of items and return a new list wherein each element is the image of some function applied to the corresponding element of the input list. For `codes` that function is `Char.code`, for `doubles` that function is `double`, for `stringLens` that function is `String.length` and for `pairAll` that function is `pair`.

We prefer to capture this common pattern in a procedural abstraction. We do this by abstracting with respect to the parts that varied in the concrete examples above. The result is the famous `map` function:

```ocaml
(* map : ('a -> 'b) -> 'a list -> 'b list *)
let rec map f xs =
  match xs with
  | [] -> []
  | x :: xs -> (f x) :: map f xs
```

The `map` function is so useful that it is included in the Standard Library's `List` module. So we could write:

```ocaml
let doubles ns    = List.map double ns
let codes chars   = List.map List.code chars                  (* 1 *)
let stringLens ss = List.map String.length strings
let pairAll xs    = List.map pair xs                          (* 2 *)
```

Here we see that the functions `double`, `Char.code` and so on are being passed to the `List.map` function as input arguments. This is fine in OCaml and in most other modern programming languages.

#### Polymorphism

It's worth noting the role of the polymorphism of the `List.map` function. It accepts a function mapping `'a`s to `'b`s and a list of `'a`s. When provided inputs of these types, it returns a list of `'b`s. In the application of map in `(1)` above, the first argument `Char.code`, is of type `char -> int`. Then the second argument is *required* to be a list of `chars`. In the application in `(2)` above, the first argument `pair` is of polymorphic type `'a -> ('a * 'a)`. Thus, the second argument `xs` can be any type `t` and the result wil be a list of pairs of `t`s, i.e., a value of type `(t * t) list` for any type `t`.

#### Filtering Lists

Another common idiom using functions as arguments is filtering a list to retain only those elements that pass a given test.

```ocaml
(* filter : ('a -> bool) -> 'a list -> 'a list *)
let rec filter test xs =
  match xs with
  | [] -> []
  | x :: xs ->
    (match test x with
     | true  -> x :: filter test xs
     | false -> filter test xs)
```

#### Folding/Reducing Lists

Another common computational pattern involving lists is combining the elements of a list together into a single value. For example, we may wish to find the largest integer in a list:

```ocaml
(* maxList : int list -> int *)
let rec maxList ns =
  match ns with
  | [] -> min_int
  | n :: ns -> max n (maxList ns)
```

Or, we may wish to add a list of floats:

```ocaml
(* addAll : float list -> float *)
let rec addAll ns =
  match ns with
  | [] -> 0.0
  | n :: ns -> (+.) n (addAll ns)
```

or we may wish to concatenate a list of strings:

```ocaml
(* concatAll : string list -> string *)
let rec concatAll strings =
  match strings with
  | [] -> ""
  | string :: strings -> (^) string (concatAll strings)
```

**Folding Left and Right**

There are two ways to fold a list: folding left and folding right. (NB: In some languages (e.g., Python) fold is called reduce.) Each method requires an input function `f`, a list `xs` and an identity element `id`.

```ocaml
(* fold_left : ('a -> 'b -> 'a) -> 'a -> 'b list -> 'a *)
let rec fold_left (f : 'a -> 'b -> 'a) (id : 'a) (xs : 'b list) : 'a =
  match xs with
  | [] -> id
  | x :: xs -> fold_left f (f id x) xs
```

```ocaml
(* fold_right : ('a -> 'b -> 'b) -> 'a list -> 'b -> 'b *)
let rec fold_right (f : 'a -> 'b -> 'b) (xs : 'a list) (id : 'b) : 'b =
  match xs with
  | [] -> id
  | x :: xs -> f x (fold_right f xs id)
```

These two alternatives combine values in different orders. For example, using `a`, `b`, `c` and `d` as values of the same type, we see that calls of `fold_left` and `fold_right` simplify as in:

```ocaml
fold_left f d [a; b; c] ->> f (f (f d a) b) c

fold_right f [a; b; c] d ->> f a (f b (f c d))
```

For [associative](https://en.wikipedia.org/wiki/Associative_property) operators such as `+`, `*` or `^` either folding function will do. But for non-associative operators such as `-` and`/` one has to choose the appropriate fold. For example, to subtract off integers  `a` and then `b` and then `c` from integer `k` one could write:

```ocaml
List.fold_left (-) k [a; b; c]
```

 But one could not arrive at this result by writing:

```ocaml
List.fold_right [a; b; c] k
```

The types of the first argument are important too. Is the first argument of type `('a -> 'b -> 'a)` or is it of type `('a -> 'b -> 'b)`? Sometimes the latter is what is required.

#### Example: Permutations

As an example of the use of `List.map` and `List.fold_left`, consider a set of $k$ symbols $A = \{a_1, …, a_k\}$ and the problem of producing all length $n$ permutations of symbols from $A$. As we've noted, there are $k^n$ of them. We write

```ocaml
(* permutations : 'a list -> int -> 'a list list

 The call (permutations syms n) returns all length n permutations of symbols in syms. For
 example, the call (permutations [0; 1] 2) returns the list [[0; 0]; [0; 1]; [1; 0]; [1; 1]].
 *)
let rec permutations symbols n =
  match n = 0 with
  | true  -> [[]]
  | false ->
    let previous = permutations symbols (n - 1) in
    let oneMore  = List.map (fun sym -> (List.map (fun perm -> sym :: perm) previous)) symbols
    in
    List.fold_left (@) [] oneMore
```

#### Currying

Earlier we touched on the mysterious fact that `(+) : int -> int -> int`. This apparent oddity is related to another apparent oddity: that function calls look like `(append xs ys)` or even `append xs ys` rather than the more familiar `append(xs, ys)`.

The type of `int -> int -> int` is parenthesize associating to the right `int -> (int -> int)`. Roughly speaking, this type means "if you give me an `int` I'll give you back a function from `int` to `int`. Now consider the following definition

```ocaml
# let plus(x, y) = x + y;;
val plus : int * int -> int = <fun>
```

This looks more familiar, the `plus` function appears to take *two* arguments, `x` and `y` and return an integer result. In fact, `plus` , like every other function in OCaml, is a function of exactly one argument — in this case a 2-tuple or pair.

Thinking about all this from the vantage of set theory, our friend `plus` looks like

```
{ ..., ((2, 3), 5), ((2, 4), 6), ..., ((105, 9), 114), ((105, 10), 115), ... }
```

The "input" is a pair of integer addends, e.g., `(2, 3)` and the "output" is the sum, e.g., `5`.  The same vantage point shows that `(+)` which again is of type `int -> (int -> int)` looks like

```
{..., (2, {..., (3, 5), (4, 6),...}), ..., (105, {..., (9, 114), (10, 115), ...}), ...}
```

So when we write `(+) 2 3`, OCaml parenthesizes it as `((+) 2) 3`. I.e., apply the one-argument function `(+)` to `2`. This gives a one-argument function expecting an `int`. Fire up a REPL and try it out!

```ocaml
# let add5 = (+) 5;;
val add5 : int -> int

# add5 10;;
- : int = 15

# add5 1019;;
- : int = 1024
```

Currying seems quite mysterious for most beginners. Don't worry about it too much. It's very handy sometimes, but it doesn't come up all the time.

## 5. Imperative Features

OCaml encourages a natural, mathematical style of programming. But, as we discuss up ahead, it also has a full set of imperative features: mutable references, arrays, while and for-loops, exceptions and I/O. These features are used sparingly but the are sometimes exactly what is required.

#### Mutable References

We'll talk more about mutation and aliasing in the next section. For now we introduce `ref` by example.

```ocaml
# let count = ref 5;;
val count : int ref = {contents = 5}

# count;;
- : int ref = {contents = 5}

# !count;;                           (* The ! "bang" is the dereference operator *)
- : int = 5

# count := !count + 1;;              (* The := is the "gets" or "assign-to" operator*)
- : unit = ()

# !count;;
- : int = 6
```

#### Mutable Fields of Records

```ocaml
# type student = { name : string; mutable enrolled : bool }

# let bob = { name = "Bob"; enrolled = true };;
val bob : student = {name = "Bob"; enrolled = true}

# bob.enrolled <- false;;        (* The <- is record field mutation operator *)
- : unit = ()

# bob;;
- : student = {name = "Bob"; enrolled = false}
```

#### Arrays

There is an `Array` module in StdLib.

```ocaml
# let a = [| 2; 3 |];;
val a : int array = [|2; 3|]

# a.(0);;
- : int = 2

# a.(1) <- 343;
- : unit = ()

# a;;
val a : int array = [|2; 343|]

# let bc = Array.make 10 "BC";;
val bc = [| "BC"; "BC"; "BC"; "BC"; "BC"; "BC"; "BC"; "BC"; "BC"; "BC"; ]
```

---

## 6. The Module System

In many programming languages, definitions that are inherently related to one another can be packaged up in *modules*. Consider an implementation of rational numbers — numbers such as $1/3$ that can be expressed as the ratio of two integers. An implementation of rational numbers would require some representation type, in OCaml, by convention this is often called simply `t`,  together with whatever operations one might want for working with rational numbers.

#### An Abstract Data Type for Rational Numbers

For the purposes of illustration, let's create a simple [abstract data type](https://en.wikipedia.org/wiki/Abstract_data_type) implementing rational numbers. We specify the new type with type signatures for the following 4 operations. In OCaml, we would house this specification, a *module signature*, in an *interface* *file* with the `.mli` extension, say in the file `rational.mli`:

```ocaml
type t

val make : int -> int -> t
val add : t -> t -> t
val compareTo : t -> t -> int
val toString : t-> string
```

A module `Rational` implementing this specification would then be stored in a companion file `rational.ml` (NB: the specification is in a `.mli` file and the implementation is in a `.ml` file.)

```ocaml
type t = { numerator : int     (* Choosing to represent a rational number as a record. *)
         ; denominator : int
         }

let rec gcd m n =
  match n = 0 with
  | true  -> m
  | false -> gcd n (m mod n)

let make numerator denominator =
  let gcd = gcd numerator denominator
  in
  match denominator < 0 with
  | true  ->
    { numerator = - (numerator / gcd)
    ; denominator = - (denominator / gcd)
    }
  | false ->
    { numerator = numerator / gcd
    ; denominator = denominator / gcd
    }

let add {numerator=n1; denominator=d1} {numerator=n2; denominator=d2} =
  { numerator   = n1 * d2 + n2 * d1
  ; denominator = d1 * d2
  }

let compareTo rat1 rat2 =
  let a = rat1.numerator * rat2.denominator in
  let b = rat1.denominator * rat2.numerator
  in
  a - b

let toString {numerator; denominator} =
  (string_of_int numerator) ^ "/" ^ (string_of_int denominator)
```

When compiled as in

```
> ocamlc rational.mli rational.ml -o rational
> ls
rational*          rational.cmi    rational.cmo    rational.ml     rational.mli
```

The compiler will check to ensure that the implementation satisfies the specification. The file `rational*` is the linked and executable byte-code object file, the file `rational.cmi` is the compiled interface file, the file `rational.cmo` is the (unlinked) byte-code object file resulting from the compilation of the source file `rational.ml`.

Then one could use the module as in

```ocaml
open Rational

let r1 = Rational.make 1 3
let r2 = Rational.make 3 5
let r3 = Rational.add r1 r2

print_string (Rational.toString r3)
```

The new type `Rational` is "abstract" because the definition of the implementation type `t` is hidden from users of the ADT. A user knows there is some type `Rational.t`, but its definition is opaque — the signature specifies it as `type t`. It should also be noted that the private helper function `gcd` isn't accessible outside the implementation file `rational.ml` because it isn't specified at all in the signature.

#### Modules in One File

In OCaml the module specification and module implementation can also be defined in one file as follows.

```ocaml
module type RATIONAL =
  sig
    type t
    val make : int -> int -> t
    val add : t -> t -> t
    val compareTo : t -> t -> int
    val toString : t-> string
  end

module Rational : RATIONAL =
  struct
    type t = {numerator : int; denominator : int}
    ...
  end
```

## 

## 5. Solutions to Exercises

1. Write  a function `coinFlip : unit -> string` that has a 50/50 chance of returning `"heads"` or `"tails"`.

   ```ocaml
   let coinFlip () =
     match Random.int 2 = 0 with
     | true  -> "heads"
     | false -> "tails"
   ```

2. Write the function `power : int -> int -> int` such that a call `(power m n)` returns `m` raised to the `n`.

   ```ocaml
   let rec power m n =
     match n = 0 with
     | true  -> 1
     | false -> m * power m (n - 1)
   ```

   ```ocaml
   let rec power m n =
     if n = 0 then 1 else m * power m (n - 1)
   ```

   ```ocaml
   let power m n =
     let rec fastLoop n answer =
       match n = 0 with
       | true  -> answer
       | false -> fastloop (n - 1) (m * answer)
     in
     fastLoop n 1  
   ```

3. Write a function `range : int -> int list` such that a call `(range n)` returns an ascending list `[0; …; n - 1]`.

   ```ocaml
   let range n =
     let rec loop i answer =
       match i = n with
       true  -> answer
       false -> loop (i - 1) (i :: answer)
     in
     loop 0 []
   ```
