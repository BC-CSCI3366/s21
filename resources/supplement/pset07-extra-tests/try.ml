(* file: try.ml
   author: Bob Muller --- Feb 22, 2019

   This is a simple system for trying out various compiler phases
   when the earlier phases aren't finished.

   Some symbols.
*)
module A = Ast

let two  = A.Literal {typ = Typ.Int; bits = 2}
let four = A.Literal {typ = Typ.Int; bits = 4}

let a = Symbol.fromString "a"
let b = Symbol.fromString "b"
let c = Symbol.fromString "c"
let f = Symbol.fromString "f"
let x0 = Symbol.fromString "x0"
let x1 = Symbol.fromString "x1"
let x2 = Symbol.fromString "x2"
let x3 = Symbol.fromString "x3"
let x4 = Symbol.fromString "x4"
let x5 = Symbol.fromString "x5"
let x6 = Symbol.fromString "x6"
let x7 = Symbol.fromString "x7"
let x8 = Symbol.fromString "x8"
let ab = A.{id = a; typ = Typ.Int}
let bb = A.{id = b; typ = Typ.Int}
let cb = A.{id = c; typ = Typ.Int}

let plus = Symbol.fromString "+"
let times = Symbol.fromString "*"
let less = Symbol.fromString "<"

let makeLet id defn body =
  A.Let { decl = ValBind { bv = {id; typ = Typ.Int}
                         ; defn
                         }
        ; body
        }

module TryName =
struct
  let pgm0 = (* int f(int a, int b) {
                   int c;
                   c = 2 + a + 4 * b;
                   return c;
                 }  *)
    let expr = A.App { rator = plus
                     ; rands = [ A.App { rator = plus
                                       ; rands = [two; A.Id a]
                                       }
                               ; A.App { rator = times
                                       ; rands = [four; A.Id b]
                                       }
                               ]
                     } in
    let stmt1 = A.Assign {id = c; expr} in
    let stmt2 = A.Return (A.Id c) in
    let block = A.Block { decls = [cb]
                        ; statements = [stmt1; stmt2]
                        } in
    let proc = A.Procedure { id = f
                           ; formals = [ab; bb]
                           ; typ = Typ.Int
                           ; body = block
                           }
    in
    A.Program [proc]
  let pgms = [| pgm0 |]
end

module TryLift =
struct
  let pgm0 =  (* int f(int a, int b) {
                   int c;
                   c = (2 + a) + (4 * b);
                   return c;
                 }
                 int f(int a, int b)
                 {
                 int c;
                 c = let
                       x0 : int =
                         let
                           x6 : int = 2
                           x7 : int = a
                           x8 : int = +(x6, x7)
                         in
                         x8
                       x1 : int =
                         let
                           x3 : int = 4
                           x4 : int = b
                           x5 : int = *(x3, x4)
                         in
                         x5
                       x2 : int = +(x0, x1)
                       in
                       x2;
                 return c
                 }
              *)

    let letx8 = makeLet x8 (A.App { rator = plus
                                  ; rands = [A.Id x6; A.Id x7]
                                  }) (A.Id x8) in
    let letx7 = makeLet x7 (A.Id a) letx8 in
    let letx6 = makeLet x6 (A.Literal {typ = Typ.Int; bits = 2}) letx7 in
    let letx5 = makeLet x5 (A.App { rator = times
                                  ; rands = [A.Id x3; A.Id x4]
                                  }) (A.Id x5) in
    let letx4 = makeLet x4 (A.Id b) letx5 in
    let letx3 = makeLet x3 (A.Literal {typ = Typ.Int; bits = 4}) letx4 in
    let letx2 = makeLet x2 (A.App { rator = plus
                                  ; rands = [A.Id x0; A.Id x1]
                                  }) (A.Id x2) in
    let letx1 = makeLet x1 letx3 letx2 in
    let letx0 = makeLet x0 letx6 letx1 in
    let stmt1 = A.Assign {id = c; expr = letx0} in
    let stmt2 = A.Return (A.Id c) in
    let block = A.Block { decls = [cb]
                        ; statements = [stmt1; stmt2]
                        } in
    let proc = A.Procedure { id = f
                           ; formals = [ab; bb]
                           ; typ = Typ.Int
                           ; body = block
                           }
    in
    A.Program [proc]

    let pgms = [| pgm0 |]
end

module TryControl =
struct
  (*  int f(int a)
{
  int c;
  if ( let x7 : int = 7 in
       let x8 : int = <(a, x7)
       in
       x8
  ) then
    {
      c = let x4 : int = 3
          let x5 : int = +(a, x4)
          in
          x5
    }
  else
    {
      c = let x1 : int = 4
          let x2 : int = +(a, x1)
          in
          x2
    }
  return c
}
*)
  let pgm0 =
    let letx8 = makeLet x8 (A.App { rator = less
                                  ; rands = [A.Id a; A.Id x7]
                                  }) (A.Id x8) in
    let letx7 = makeLet x7 (A.Literal {typ = Typ.Int; bits = 7}) letx8 in
    let letx5 = makeLet x5 (A.App { rator = plus
                                  ; rands = [A.Id a; A.Id x4]
                                  }) (A.Id x5) in
    let letx4 = makeLet x4 (A.Literal {typ = Typ.Int; bits = 3}) letx5 in
    let letx2 = makeLet x2 (A.App { rator = plus
                                  ; rands = [A.Id a; A.Id x1]
                                  }) (A.Id x2) in
    let letx1 = makeLet x1 (A.Literal {typ = Typ.Int; bits = 4}) letx2 in

    let stmt1 = A.Assign {id = c; expr = letx4} in
    let stmt2 = A.Assign {id = c; expr = letx1} in
    let stmt3 = A.IfS { expr = letx7
                      ; thn = stmt1
                      ; els = stmt2
                      } in
    let stmt4 = A.Return (A.Id c) in
    let block = A.Block { decls = [cb]
                        ; statements = [stmt3; stmt4]
                        } in
    let proc = A.Procedure { id = f
                           ; formals = [ab]
                           ; typ = Typ.Int
                           ; body = block
                           }
    in
    A.Program [proc]
  let pgms = [| pgm0 |]
end

module TryCodegen =
struct
  module Q = Quads

  let pgm0 =
    let entry = Label.fromString "main" in
    let n1 = Symbol.fromString "n1" in
    let n2 = Symbol.fromString "n2" in
    let plus = Symbol.fromString "+" in
    let x = Symbol.fresh() in
    let plus = Q.BinPrimOp { op = plus
                           ; opnds = { Q.src1 = Q.Id n1
                                     ; Q.src2 = Q.Id n2
                                     }
                           } in
    let i1 = Q.Instruction { label = None
                           ; op = Q.Gets { dst = Q.Id x
                                         ; src = plus
                                         }
                           } in
    let i2 = Q.Instruction { label = None
                           ; op = Q.Ret (Q.Id x)
                           }
    in
    [ Q.Procedure { entry
                  ; formals = [n1; n2]
                  ; code = [i1; i2]
                  }
    ]
  let pgms = [| Q.Program pgm0 |]
end

(************************************************************)

let name () =
  let rec loop tests =
    match tests with
    | (name, pgm, solution) :: tests ->
      let named = Name.translate pgm in
      Printf.printf "Testing %s" name;
      (if Equiv.testEquivProgram named solution then
        Printf.printf "-- passed!\n"
      else
        (Printf.printf "-- failed!\n";
        Printf.printf "==========================\n";
        Printf.printf "Before the naming phase:\n";
        Ast.pp pgm;
        Printf.printf "\n\nAfter the naming phase:\n";
        Ast.pp named;
        Printf.printf "\n\nReference solution:\n";
         Ast.pp solution;
        Printf.printf "==========================\n";
        ));
      loop tests
    | [] -> ()
  in loop Cases.tests

let lift () =
  let filename = "see.mc" in
  let dbgOut = Debug.debugSetup filename in
  let pgm = TryLift.pgms.(0) in
  Debug.debugInfo(dbgOut, "Before the lifting phase:", pgm) ;
  let lifted = Lift.translate pgm
  in
  Debug.debugInfo(dbgOut, "After the lifting phase:", lifted)

let control () =
  let filename = "see.mc" in
  let dbgOut = Debug.debugSetup filename in
  let pgm = TryControl.pgms.(0) in
  Debug.debugInfo(dbgOut, "Before the control phase:", pgm) ;
  let quads = Control.translate pgm in
  let _ = output_string dbgOut "\nAfter the control phase:\n"
  in
  Quads.emit quads

let codegen () =
  let filename = "see.mc" in
  let codestream = Codegen.translate TryCodegen.pgms.(0)
  in
  Mips.Codestream.emit(filename, codestream)


