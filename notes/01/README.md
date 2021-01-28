# CSCI 3366 Programming Languages

#### R. Muller, J. Tassarotti

### Lecture Notes: Week 1

1. Course Overview
2. Course Admin
3. Brief review of Machine Representations
4. Review of Sets, Relations, Maps & Orders

---

>  **NB**: The markdown files posted in this course sometimes contain mathematical notation expressed in the LaTeX typesetting language. Since GitHub's website doesn't process LaTeX, to view these documents with proper LaTeX rendering, consider downloading them to your host computer and opening them with a LaTeX-savvy markdown editor such as  [Typora](https://typora.io/).

---

## 1. Course Overview

[![a](./img/code2014.png)](http://www.code2014.com/)

There are hundreds of different programming languages with varying purposes and user communities. Some are the result of concerted design and implementation initiatives with institutional processes and standards and maybe even with some underlying mathematical model. 

But the truth is that, up until now anyway, most programming languages just sort of happen — they come into existence as the result of a side-project by a non-specialist. There's a spark, a stirring, it catches on and — for better or worse — it's off the table and out the door.

![Frankenstein](./img/javascript.jpg)



> "*I don’t know how to stop it, there was never any intent to write a programming language […] I have absolutely no idea how to write a programming language, I just kept adding the next logical step on the way*."
>
>   **Rasmus Lerdorf** on his invention of the widely used programming language PHP

CSCI 3366 is primarily concerned with the *design*, *specification* and *implementation* of general purpose programming languages. Take-aways from the course include:

1. A deeper understand of computer software that will yield long-term benefits;
2. You'll be able to master new programming languages faster;
3. You 'll be able to design and implement new languages if/when you need to.
4. Introduction to an interesting and increasingly important style of programming.

---

Some languages are general purpose (e.g., Python, Java and C#) while some (e.g., PDF, JavaScript and R) are domain specific (DSLs). Some languages have large user communities, some have small communities. 

Almost all programming languages

+ provide for the introduction and management of symbolic names that are meaningful to humans;

+ are centered around some variation of the idea of a mathematical *function*;

+ support the manipulation of multiple types of data;

+ are text-based.


For most people, the phrase "programming language" refers to systems that support the expression of *repetitive* algorithms. By this standard, Python, Java and JavaScript would be considered programming languages but, say, CSS and HTML would not.

### Language Design

There are four principals and one principle in play. The principals are:

1. the software consumer;
2. the application developer;
3. the compiler developer and
4. the language designer.

Each of these might be groups and in many cases the roles are conflated. Whatever the case may be, the principle that we might hope for

> *to design programming languages in such a way that the software consumer is justified in being confident that code delivered by the application developer is **correct** and is developed and performs within the required constraints.*

This goal turns out to be a high bar as of 2020, so for the purposes of this course we'll settle for the less ambitious principle:

> *to design programming languages in such a way that the compiler developer can implement the language in such a way that the software consumer is justified in being confident that the software does what the application developer thinks it does.*

The core idea of CSCI 3366 is to design and develop a sequence of increasingly more realistic languages, with variations, introducing a few key additional features from one language to the next and seeing how the new features impact the language. The languages we'll develop are:

1. **Mercury** — a trivial language of integer expressions; the only possible errors are division by zero and integer overflow. We use this language to learn about specifications of syntax & semantics and for learning how to write parsers.
2. **Venus** — this language extends Mercury with one additional data type (real) and with block-structured variables. This language introduces many of the fundamental ideas of PLs in the simplest possible setting.
3. **Earth** — this language extends Venus with block-structured recursive functions and (non-recursive) structured types: tuples, records, variants; This language can be thought of as a mini-Pascal.
4. **Mars** — this language *restricts* Earth in order to make it easier to compile (as C restricted Algol); We'll write a simple compiler for Mars.

#### Reliability

What does it mean for code to be "reliable"? Informally, we mean that it does the right thing in a timely manner. But what is "the right thing"? There are hundreds of examples of carefully tested code — code that the authors would bet their last dollar on — doing the wrong thing, in too many cases with disastrous results.

When a language supports repetition, it turns out to be extraordinarily difficult to confirm that a program obeys even simple requirements. For example, there exist programs for which it cannot be determined whether or not a given variable might ever hold a particular value. So if `a` is an array and `i` is an integer variable, no amount of program inspection determine for these programs whether `a[i]` is a valid array reference — it has to be checked when the program is executing.

For embedded systems such as cars, airplanes etc there are industry-standard guidelines for *software testing*. This usually involves running the code with inputs selected to test the major pathways through the code. The problem here is that even for a 1000-line program, the number of execution paths is unmanageable. And even an inexpensive car, essentially a multi-computer on wheels, has upwards of 80 different computers and on the order of 10M lines of code. (Higher end cars have on the order of 100M lines of code.)

#### Cardelli's Summary of Typed vs Untyped Languages

The situation with testing may be a little unsatisfactory. However, languages *can* be designed so that we can verify more general properties of even 100M-line programs. For the array indexing example above, we can feasibly verify that `i` is used only in places where integers are expected. That is, we can rule out programmer mistakes where they might accidentally use `i` where a real was expected.

A *type* is an annotation for a variable or piece of data. A language in which variables and data can be consistently associated with types is called a *typed language*.  Otherwise the language is *untyped*. A *type system* is that part of a typed language that keeps track of the types associated with variables and expressions.

#### Execution Errors

Errors that occur during program execution are either *trapped* *errors* or *untrapped* *errors*. Trapped errors can be trapped either by the underlying hardware or in software:

+ hardware trap (e.g., overflow);
+ software trap (e.g., divide by zero).

Examples of untrapped errors include

+ adding two floating point numbers with an integer ADD instruction;
+ Array index out of bounds.

A language is *safe* if its implementation does not allow untrapped errors. An untyped language can enforce safety by performing run-time checks. Typed languages may enforce safety by statically rejecting all programs that are potentially unsafe. Typed languages may also use a mixture of run time and static checks.

Typed languages usually also aim to rule out a large classes of trapped errors, along with the untrapped ones.

#### Execution errors and well-behaved programs

For any given language, we may designate a subset of the possible execution errors as *forbidden* errors. The forbidden errors should include all of the untrapped errors, plus a subset of the trapped errors. A program fragment is said to be *well*-*behaved*, if it does not cause any forbidden error to occur. A well behaved fragment is safe. A language where all of the (legal) programs have good behavior is called strongly checked.

Thus, with respect to a given type system, the following holds for a strongly checked language:

  • No untrapped errors occur (safety guarantee).

  • None of the trapped errors designated as forbidden errors occur.

  • Other trapped errors may occur; it is the programmer’s  responsibility to avoid them.

Typed languages can enforce good behavior (including safety) by performing static (i.e., compile time) checks to prevent unsafe and ill behaved programs from ever running. These languages are statically checked; the checking process is called typechecking, and the algorithm that performs this checking is called the typechecker.

A program that passes the typechecker is said to be well typed; otherwise, it is ill-typed, which may mean that it is actually ill-behaved, or simply that it could not be guaranteed to be well-behaved. Examples of statically checked languages are ML and Pascal (with the caveat that Pascal has some unsafe features).

Untyped languages can enforce good behavior (including safety) by performing sufficiently detailed run time checks to rule out all forbidden errors. For example, they may check all array bounds, and all division operations, generating recoverable exceptions when forbidden errors would happen. The checking process in these languages is called dynamic checking; LISP and JavaScript are examples of such languages. These languages are strongly checked even though they have neither static checking, nor a type system.

Even statically checked languages usually need to perform tests at run time to achieve safety. As we noted above, array bounds must in general be tested dynamically. The fact that a language is statically checked does not necessarily mean that execution can proceed entirely blindly.

#### Efficiency

Efficiency of development & maintenance versus efficiency of execution. Execution efficiency includes both time and memory. Sometimes efficiency is balanced against reliability.

```
                       Efficiency ----------o----------- Reliability
                                           / \
```

### Language Specification

**PL = Syntax + Semantics**

+ Syntax — we can use the theory of grammars to automate much of the processing of the syntactic form of a language;
+ Semantics — we can use formal logical systems (e.g., [Natural Semantics](https://en.wikipedia.org/wiki/Operational_semantics#Natural_semantics)) to specify language semantics.

### Implementation

We'll use the programming language OCaml to write parsers, type-checkers, interpreters and mini-compilers. Our interpreters will interpret abstract syntax trees (ASTs); our compilers will translate from ASTs to byte code for stack machines.

The structure of a simple language implementation:

  ```
program -> LEXER -> token stream -> PARSER -> ast -> INTERPRETER
  ```

 or

 ```
program -> LEXER -> token stream -> PARSER -> ast -> TRANSLATOR -> byte-code
 ```

where the byte-code is in the language of a given *virtual machine* (VM) e.g., JVM, .NET, …, or

  ```
pgm -> LEXER -> token stream -> PARSER -> ast -> TRANSLATOR -> ast -> optimizer -> machine-code
  ```

where the machine-code is in the native language of a particular computing device.

---

## 2. Course Administration

Like most CS courses, CSCI 3366 is a "learn by doing" course. Reflecting this, grades will emphasize the problem sets. Grades will be computed on a **120** point scale. For the 2021 semester,
grades will be derived solely from problem sets. There are no exams.

We'll be using GitHub to distribute course materials and collect course work, the details are spelled out in the first problem set. Grades will be recorded on the Canvas website.

#### Notes:

- Unless specified otherwise, problem sets must be submitted by pushing your repository to GitHub by midnight on the due date. NB: under no circumstances at all can code be submitted for grading by attaching it to an email message. An attempt to submit code via email probably won't receive a reply notifying the sender that the attempted submission failed.
- Late problem sets will be penalized 20% each day.
- Students missing an exam without prior permission of the instructor will receive a zero for that exam unless they provide a note from their doctor.
- Any violation of the [university's policy on academic integrity](http://www.bc.edu/offices/stserv/academic/integrity.html) will result in a failing grade for the course.

---

## 3. Brief review of Machine Representations

### Bytes and Words; Integers and Floats

Memory storage consists of a sequence of addressable 8-bit **bytes**:

```
               7 6 5 4 3 2 1 0
              +---------------+
     address  |               |
              +---------------+
```

The bits stored in a byte can be abbreviated with a pair of hexadecimal digits. Depending or the particulars of the computer, sequences of 4 or 8 bytes (i.e., 32-bit or 64-bit) are combined to form a **word** of memory:

```
            +---------------+
       0000 |               |
            +---------------+
       0004 |               |
            +---------------+
       0008 |               |
            +---------------+
            ...
```

How is a sequence of 4 (or 8) bytes concatenated to form words? Some computers use big endian, some use little endian.

```
     +--------+
0000 |   AA   |                  +--------+--------+--------+--------+
     +--------+                  |   AA   |   BB   |   CC   |   DD   |   big
0001 |   BB   |                  +--------+--------+--------+--------+   endian
     +--------+
0002 |   CC   |                  +--------+--------+--------+--------+
     +--------+                  |   DD   |   CC   |   BB   |   AA   |   little
0003 |   DD   |                  +--------+--------+--------+--------+   endian
     +--------+
```

A **signed integer** is represented using the two's complement system — the leftmost bit is the sign bit. For example, a 4-byte signed integer layout:

```
               31                                                            0
              +-+-----------------------------------------------------------+-+
     address  |S|                           ...                             | |
              +-+-----------------------------------------------------------+-+
```

A **floating point number** is represented using the IEEE-754 Floating Point Standard:![IEEE](./img/IEEE754.png)

The computer's ALU is designed with integer circuitry (e.g., ADDI) for processing two's complement representations and different circuitry (e.g., ADDF) for processing IEEE-754 representations. Importantly, if an ADDI instruction is supplied with words of memory representing floating point numerals, it will misinterpret the bits, adding them as though they were two's complement numerals. This will produce unpredictable results.

### Memory Architecture

```
+-------------------------------------+
|                                     |
|           Dynamic Memory            |
|                                     |
+-------------------------------------+                    User Space
|                                     |
|           Static Memory             |
|                                     |
+-------------------------------------+
```

Dynamic memory has representations of data created (dynamically) as a program executes. Static memory has representations of machine code as well as data of fixed size.

```
+-------------------------------------+
|                Stack                |
|                  |                  |
|                  v                  |
+-------------------------------------+                    Dynamic Memory
|                  ^                  |
|                  |                  |
|                Heap                 |
+-------------------------------------+
```

The Stack has [activation records](https://en.wikipedia.org/wiki/Call_stack), i.e., records with storage for activations of functions. The Heap has storage for representations of large and/or long-lived data.

The Stack is generally managed by PUSH and POP operations in the generated machine code while the Heap is usually managed by a run-time support library called a [garbage collector](https://en.wikipedia.org/wiki/Garbage_collection_(computer_science)).

------
