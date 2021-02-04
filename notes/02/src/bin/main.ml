(* file: main.ml
   author: Bob Muller

   CSCI 3366 Programming Languages

   This is an introduction to writing functions in OCaml.

   double : int -> int --- less or more explicit with types.
*)
let double1 n = n * 2
let double2 (n : int) = n * 2
let double3 (n : int) : int = n * 2

(* Sum Types *)
type fruit = Lemon | Lime | Apple | Pear

(* isCitrus : fruit -> bool *)
let isCitrus fruit =
  match fruit with
  | Lemon | Lime -> true
  | _ -> false                       (* _ is a wildcard *)

(* Three variations of the power function ***********************)

(* power : int -> int -> int *)
let rec power1 m n =
  match n = 0 with
  | true  -> 1
  | false -> m * (power1 m (n - 1))

(* Simplification Process

   power 3 (1 + 1) ->
   power 3 2 ->            Plug 3 in for m and 2 in for n
   match 2 = 0 with | true -> 1 | false -> 3 * (power 3 (2 - 1)) ->
   match false with | true -> 1 | false -> 3 * (power 3 (2 - 1)) ->
   3 * (power 3 (2 - 1)) ->
   3 * (power 3 1) ->
   3 * (match 1 = 0 with | true -> 1 | false -> 3 * (power 3 (1 - 1))) ->
   3 * (match false with | true -> 1 | false -> 3 * (power 3 (1 - 1))) ->
   3 * (3 * (power 3 (1 - 1))) ->
   3 * (3 * (power 3 0)) ->
   3 * (3 * (match 0 = 0 with | true -> 1 | false -> 3 * (power 3 (0 - 1)))) ->
   3 * (3 * (match true with | true -> 1 | false -> 3 * (power 3 (0 - 1)))) ->
   3 * (3 * 1) ->
   3 * 3 ->
   9        an irreducible expression, i.e., a value, in 14 steps
*)

(* power : int -> int -> int
   This version is motivated by the observation that m is invariant wrt
   power (the version above).
*)
let power2 m n =                    (* NB: m & n are variables wrt power *)
  let rec loop n =                 (* A local recursive function loop *)
    match n = 0 with
    | true  -> 1
    | false -> m * (loop (n - 1))  (* NB: m is constant wrt loop so we *)
  in                               (* don't pass it as an argument. *)
  loop n

(* power : int -> int -> int *)
let power3 m n =                           (* NB: tail-recursion *)
  let rec loop n answer =                 (* product computed on *)
    match n = 0 with                      (* the way in rather than *)
    | true  -> answer                     (* on the way out. => JMP *)
    | false -> loop (n - 1) (m * answer)
  in
  loop n 1

(* Simplification Process

 power 3 (1 + 1) ->
 power 3 2 ->
 let rec loop n ans =
   match n=0 with | true -> ans | false -> loop (n-1) (3*ans) in loop 2 1 ->
 match 2 = 0 with | true -> 1 | false -> loop (2 - 1) (3 * 1) ->
 match false with | true -> 1 | false -> loop (2 - 1) (3 * 1) ->
 loop (2 - 1) (3 * 1) ->
 loop 1 (3 * 1) ->
 loop 1 3 ->
 match 1 = 0 with | true -> 3 | false -> loop (1 - 1) (3 * 3) ->   width is
 match false with | true -> 3 | false -> loop (1 - 1) (3 * 3) ->   constant
 loop (1 - 1) (3 * 3) ->
 loop 0 (3 * 3) ->
 loop 0 9 ->
 match 0 = 0 with | true -> 9 | false -> loop (0 - 1) (3 * 9) ->
 match true with | true -> 9 | false -> loop (0 - 1) (3 * 9) ->
 9      an irreducible expression, i.e., a value, in 15 steps
*)

(* More recursive functions *)

(* length : 'a list -> int *)
let rec length xs =
  match xs with
  | [] -> 0
  | _ :: ys -> 1 + length ys

(* mem : 'a  * 'a list -> bool *)
let rec mem x xs =
  match xs with
  | [] -> false
  | y :: ys -> (x = y) || mem x ys

(* fact : int -> int *)
let rec fact1 n =
  match n = 0 with
  | true  -> 1
  | false -> n * fact1 (n - 1)

(* A tail-recursive version *)
let fact2 n =
  let rec loop n answer =
    match n = 0 with
    | true  -> answer
    | false -> loop (n - 1) (n * answer)
  in
  loop n 1

(* Sum Types where the summands carry information *)
type number = Int of int | Flt of float

let numbers : number list = [Flt 3.14; Int 343]

(* addNumbers : number list -> float *)
let rec addNumbers ns =
  match ns with
  | [] -> 0.0
  | (Flt m) :: ms -> m +. addNumbers ms
  | (Int m) :: ms -> (float m) +. addNumbers ms

(* union : 'a list -> 'a list -> 'a list *)
let rec union xs ys =
  match xs with
  | [] -> ys
  | z :: zs ->
    let answer = union zs ys
    in
    match mem z answer with
    | true  -> answer
    | false -> z :: answer

(* append : 'a list -> 'a list -> 'a list

   NB: In OCaml @ is the infix list append operator.
*)
let rec append xs ys =
  match xs with
  | [] -> ys
  | z :: zs -> z :: append zs ys

(* rev : 'a list -> 'a list

   Two versions of list reversal, the first is quadratic
   in the length of the input list. The second is linear
   (and tail-recursive).
*)
let rec rev1 xs =
  match xs with
  | [] -> []
  | x :: xs -> append (rev1 xs) [x]

let rev2 xs =
  let rec loop xs answer =
    match xs with
    | [] -> answer
    | x :: xs -> loop xs (x :: answer)
  in
  loop xs []
