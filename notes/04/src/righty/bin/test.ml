(* file: test.ml
   author: Bob Muller

   CSCI 3366 Programming Languages

   This is a test harness for testing the parser for the
   mini-language Mercury.

 ******************************************************
   Some simple hand-made ASTs for testing the parser.
*)
let two   = Ast.Literal 2
let three = Ast.Literal 3
let four  = Ast.Literal 4
let five  = Ast.Literal 5

let plus = List.hd Basis.operatorNames
let times = List.hd (List.tl (List.tl Basis.operatorNames))

let threeTimesFour =
  Ast.App { rator = times
          ; rands = [ three; four ]}
let twoPlus =
  Ast.App { rator = plus
          ; rands = [two; threeTimesFour ]}
let timesFive =
  Ast.App { rator = times
          ; rands = [ twoPlus; five ]}

let makeTest input expected =
  (fun () ->
     let tokens = Tokenizer.tokenizer input in
     let ast = Parser.parser tokens
     in
     Ast.equal ast expected)

let makeFailTest input =
  (fun () ->
     let tokens = Tokenizer.tokenizer input
     in
     try
       let _ = Parser.parser tokens in false
     with
       Failure _-> true)

(* Succeeding Tests
*)
let input1 = Tokenizer.Test "2 + 3 * 4"
let input2 = Tokenizer.Test "(2 + 3 * 4) * 5"
let input3 = Tokenizer.Test "((((3))))"

(* Failing Tests --- parser should failwith
*)
let input4 = Tokenizer.Test "(2 + 3 * 4 * 5"
let input5 = Tokenizer.Test "-3"
let input6 = Tokenizer.Test "()"
let input7 = Tokenizer.Test "2 % 4)"

let expected1 = twoPlus
let test1 = makeTest input1 expected1

let expected2 = timesFive
let test2 = makeTest input2 expected2

let expected3 = three
let test3 = makeTest input3 expected3

let test4 = makeFailTest input4
let test5 = makeFailTest input5
let test6 = makeFailTest input6
let test7 = makeFailTest input7

let run () =
  let tests = [ ("test1", test1)
              ; ("test2", test2)
              ; ("test3", test3)
              ; ("test4", test4)
              ; ("test5", test5)
              ; ("test6", test6)
              ; ("test7", test7)
              ]
  in
  List.iter (fun (name, test) -> Lib.run_test name test) tests
