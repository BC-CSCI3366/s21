# CSCI 3366 Programming Languages

### Spring 2021

---

## The Lib Module

+ `val fresh : unit -> int` generates a fresh integer starting with 0.

+ Four abbreviations of pervasive type conversion functions:

  ```ocaml
  val i2S : int -> string      (* abbreviates pervasive string_of_int *)
  val i2F : int -> float
  val f2S : float -> string
  val f2I : float -> int
  ```


+ `val fmt : ('a, unit, string) format -> 'a` formatting strings.

  ```ocaml
  # Lib.fmt "Hello %s!" "Martha";;
  - : string = "Hello Martha"
  
  # Lib.fmt "Here are the hole specifiers: %c %d %f %s.\n" 'A' 343 3.14 "Martha"
  Here are the hole specifiers: A 343 3.14 Martha.
  ```

+ `val pfmt : ('a, out_channel, unit) format -> 'a` formatted printing to `stdout`.

+ `val explode : string -> char list` convert a string to a char list.

  ```ocaml
  # Lib.explode "Boston";;
  - : char list = ['B'; 'o'; 's'; 't'; 'o'; 'n']
  
  # Lib.explode "2 + 3";;
  - : char list = ['2'; ' '; '+'; ' '; '3']
  ```

+ `val implode : char list -> string`

  ```ocaml
  # Lib.implode ['2'; ' '; '+'; ' '; '3'];;
  - : string = "2 + 3"
  ```

+ `val run_test : string -> (unit -> bool) -> unit` run unit tests

+ Four miscellaneous functions

  ```ocaml
  val ( % ) : int -> int -> int          (* an alias of pervasive mod *)
  val pi : float
  val closeEnough : ?error:float -> float -> float -> bool
  val range : int -> int list            (* ala Python *)
  ```

  
