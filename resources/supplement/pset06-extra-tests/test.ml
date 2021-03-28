(* file: test.ml
   author: Bob Muller, Joseph Tassarotti, Brian Ward

   CSCI 3366 Programming Languages

   This is a test harness for testing the evaluator for the
   mini-language Earth.

 ******************************************************
*)
let makeTest input expected =
  (fun () ->
     let tokens = Tokenizer.tokenizer input in
     let ast = Parser.parser tokens
     in
     match Typechecker.typeOf Static.env ast with
     | Some typ -> Typ.equal typ expected
     | None -> false)

let makeFailTest input =
  (fun () ->
     let tokens = Tokenizer.tokenizer input in
     let ast = Parser.parser tokens
     in
     match Typechecker.typeOf Static.env ast with
     | Some _ -> false
     | None   -> true)

(* Basic tests - Literals, let and var *)

let input1a =
  Tokenizer.Test "343"
let expected1a = Typ.Int
let test1a = ( "test literal integer"
             , makeTest input1a expected1a
             )
let input1b =
  Tokenizer.Test "34.3"
let expected1b = Typ.Real
let test1b = ( "test literal real"
             , makeTest input1b expected1b
             )

let input1c =
  Tokenizer.Test "()"
let expected1c = Typ.Unit
let test1c = ( "test literal unit"
             , makeTest input1c expected1c
             )

(* Product tests - Pairs, first, second *)

let input2 =
  Tokenizer.Test
    "let i : int = 343
     in
     (i * 2, 3.14)"
let expected2 = Typ.Product { left = Typ.Int
                            ; right = Typ.Real
                            }
let test2 = ( "test let & product"
            , makeTest input2 expected2
            )

let input3a =
  Tokenizer.Test
    "let x : int * real = (1, 1.1) in first x"
let expected3a = Typ.Int
let test3a = ( "test first"
             , makeTest input3a expected3a
             )

let input3b =
  Tokenizer.Test
    "let x : int * real = (1, 1.1) in second x"
let expected3b = Typ.Real
let test3b = ( "test second"
             , makeTest input3b expected3b
             )

(* Record tests *)

let input4a =
  Tokenizer.Test
    "{a = 2 + 3; b = i2r(2)}"
let expected4a =
  Typ.RecType [{label = Label.fromString "a"; typ = Typ.Int}
              ;{label = Label.fromString "b"; typ = Typ.Real}]
let test4a = ( "test record"
             , makeTest input4a expected4a
             )

let input4b =
  Tokenizer.Test
    "{a = 2 + 3; b = i2r(2.0)}"
let test4b = ( "test bad record"
             , makeFailTest input4b
             )

let input5a =
  Tokenizer.Test
    "{a = 2 + 3; b = false}.a"
let expected5a = Typ.Int
let test5a = ( "test record projection"
             , makeTest input5a expected5a
             )

let input5b =
  Tokenizer.Test
    "{a = 2 + 3; b = false}.c"
let test5b = ( "test bad record projection"
             , makeFailTest input5b
             )

(* Sum Tests - InL, InR, and Cases*)

let input6 =
  Tokenizer.Test
    "if (true) then 1 else 3.14" (* NB parser turns this into a case statement *)
let test6 = ( "test bad branches of conditional"
            , makeFailTest input6
            )

let input7a =
  Tokenizer.Test
    "let x : int = 3 in inl(x, real)"
let expected7a = Typ.Sum {left = Typ.Int; right = Typ.Real}
let test7a = ( "test sum left"
             , makeTest input7a expected7a
             )

let input7b =
  Tokenizer.Test
    "let x : int*real = (3,3.5) in inr(x, real)"
let expected7b = Typ.Sum {left = Typ.Real; right = Typ.Product {left=Typ.Int; right=Typ.Real}}
let test7b = ( "test sum right"
             , makeTest input7b expected7b
             )

let input8 =
  Tokenizer.Test
    "let x: int+real = inl(3, real) in
    case x of inl(x:int) => x + x | inr(x:real) => 3"
let expected10 = Typ.Int
let test8 = ( "test case"
            , makeTest input8 expected10
            )

let input9 =
  Tokenizer.Test
    "case inl(3, real) of inl(x:int) => x | inr(x:real) => x"
let test9 = ( "test case bad branches"
            , makeFailTest input9
            )

let input10 =
  Tokenizer.Test
    "case inl(3, real) of inl(x:real) => r2i(x) | inr(x:real) => 3"
let test10 = ( "test case sum/annotation mismatch"
             , makeFailTest input10
             )

let input11 =
  Tokenizer.Test
    "case (3,1) of inl(x:int) => x + x | inr(x:real) => 3"
let test11 = ( "test case non-sum input"
             , makeFailTest input11
             )

let input12 =
  Tokenizer.Test
    "let x: int+real = inl(3, real) in
    case x of inl(x:int) => x + x | inr(y:real) => x"
let test12 = ( "test leaky case"
             , makeFailTest input12
             )

let input13 =
  Tokenizer.Test
    "case inl(3.14, real) of inl(x:int) => x + x | inr(x:real) => 3"
let test13 = ( "test bad inl case type"
             , makeFailTest input13
             )

let input14 =
  Tokenizer.Test
    "case inl(3, real) of inl(x:int) => x +. x | inr(x:real) => x +. x"
let test14 = ( "test bad inl case type"
             , makeFailTest input14
             )

let input15 =
  Tokenizer.Test
    "case inr(3.14, real) of inl(x:real) => 3 | inr(x:real) => x + x"
let test15 = ( "test bad inr case type"
             , makeFailTest input15
             )

let input16 =
  Tokenizer.Test
    "case inr(3.14, real) of inl(x:real) => x +. x | inr(x:int) => x +. x"
let test16 = ( "test bad inr case type"
             , makeFailTest input16
             )

(* Function Tests *)

let input17 =
  Tokenizer.Test
    "let f(x : int) : real = i2r(x) in f"
let expected17 = Typ.Arrow {from = [Typ.Int]; too = Typ.Real }
let test17 = ( "test fun type"
             , makeTest input17 expected17
             )

let input18 =
  Tokenizer.Test
    "let f(i : int, x : real) : real = i2r(i) +. x
     in
     f(r2i(3.14), 3.14)"
let expected18 = Typ.Real
let test18 = ( "test function call & type conversions"
             , makeTest input18 expected18
             )

let input19 =
  Tokenizer.Test
    "let fact(n : int) : int =
       if (n = 0) then 1
       else n * fact(n - 1)
     in fact(5)"
let expected19 = Typ.Int
let test19 = ( "test recursion"
             , makeTest input19 expected19
             )

let input20 =
  Tokenizer.Test
    "let f(x : int) : int =
       let g(y : int) : int = x + y
       in g(12)
     in f(4)"
let expected20 = Typ.Int
let test20 = ( "test nested scope"
             , makeTest input20 expected20
             )

let input21 =
  Tokenizer.Test
    "let f(x : int) : int = x + 2
     in f(3, 4)"
let test21 = ( "test wrong number of arguments"
             , makeFailTest input21
             )

let input22 =
  Tokenizer.Test
    "let f(x : int) : int = i2r(x) in f(i2r(3))"
let test22 = ( "test bad fun argument type application"
             , makeFailTest input22
             )

let input23 =
  Tokenizer.Test
    "let f(x : int) : int = r2i(x) in f"
let test23 = ( "test bad fun argument type annotation"
             , makeFailTest input23
             )

let input24 =
  Tokenizer.Test
    "let f(x : int) : int = i2r(x) in f"
let test24 = ( "test bad fun return type annotation"
             , makeFailTest input24
             )

let input25 =
  Tokenizer.Test "let f(x:int, y:real) : int = x + r2i(y) in y"
let test25 = ( "test leaky function"
             , makeFailTest input25
             )

let run () =
  let tests = [ test1a
              ; test1b
              ; test1c
              ; test2
              ; test3a
              ; test3b
              ; test4a
              ; test4b
              ; test5a
              ; test5b
              ; test6
              ; test7a
              ; test7b
              ; test8
              ; test9
              ; test10
              ; test11
              ; test12
              ; test13
              ; test14
              ; test15
              ; test16
              ; test17
              ; test18
              ; test19
              ; test20
              ; test21
              ; test22
              ; test23
              ; test24
              ; test25
              ]
  in
  List.iter (fun (name, test) -> Lib.run_test name test) tests
