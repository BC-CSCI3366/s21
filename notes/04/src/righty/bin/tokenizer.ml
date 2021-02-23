(* file: tokenizer.ml
   author: Bob Muller

   CSCI 3366 Programming Languages

   This file contains a general purpose tokenizer for Programming
  languages used in CSCI 3366.
*)
type source = Repl of string
            | File of in_channel
            | Test of string

let isDigit c = ('0' <= c) && (c <= '9')
let isLetter c = ('A' <= c && c <= 'Z') || ('a' <= c && c <= 'z')
let isLetterOrDigit c = (isLetter c) || (isDigit c)
let toInt dc = (Char.code dc) - (Char.code '0')

let makeString (chars : char list) =
  Lib.implode (List.rev chars)

let rec makeId idChars chars =
  match chars with
  | [] -> (makeString idChars, [])
  | ch :: chars ->
    (match isLetterOrDigit ch with
     | true  -> makeId (ch :: idChars) chars
     | false -> (makeString idChars, ch :: chars))

let rec readFromChannel inch letters =
  try
    let line  = input_line inch in
    let chars = Lib.explode line
    in
    readFromChannel inch (letters @ chars)
  with
    End_of_file -> close_in inch ;
    letters

let scan inputSource =
  match inputSource with
  | File inch   -> readFromChannel inch []
  | Test text   -> Lib.explode text
  | Repl prompt ->
    let _ = print_string prompt in
    let input = read_line () in
    let chars = Lib.explode input
    in
    chars

let rec makeFloat r n chars =
  match chars with
  | [] -> (Token.FLOATING (r /. 10.0 ** n), [])
  | char :: chars ->
    (match isDigit char with
     | true  ->
       let d = toInt char
       in
       makeFloat (r *. 10.0 +. (float d)) (n +. 1.0) chars
     | false -> (Token.FLOATING (r /. 10.0 ** n), char :: chars))

let rec makeNumber i chars =
  match chars with
  | [] -> (Token.INTEGER i, [])
  | char :: chars ->
    match isDigit char with
    | true  ->
      let d = (toInt char)
      in
      makeNumber (i * 10 + d) chars
    | false ->
      (match char = '.' with
       | true  -> makeFloat (float i) 0.0 chars
       | false -> (Token.INTEGER i, char :: chars))

let tokenizer inputSource =
  let chars = scan inputSource in
    let rec repeat chars =
    match chars with
    | [] -> []
    | 'q'::_ -> [Token.QUIT]
    | ' '::chars | '\t'::chars | '\n'::chars -> repeat chars
    | ';'::';'::chars -> repeat chars
    | '('::')'::chars -> Token.UNIT :: repeat chars
    | '('::chars -> Token.LPAR :: repeat chars
    | ')'::chars -> Token.RPAR :: repeat chars
    | '|'::chars -> Token.BAR :: repeat chars
    | '+'::'.'::chars -> Token.RPLUS :: repeat chars
    | '+'::chars -> Token.PLUS :: repeat chars
    | '-'::'>'::chars -> Token.ARROW :: repeat chars
    | '-'::'.'::chars -> Token.RMINUS :: repeat chars
    | '-'::chars -> Token.MINUS :: repeat chars
    | '*'::'.'::chars -> Token.RTIMES :: repeat chars
    | '*'::chars -> Token.TIMES :: repeat chars
    | '/'::'.'::chars -> Token.RDIV :: repeat chars
    | '/'::chars -> Token.DIV :: repeat chars
    | '%'::chars -> Token.MOD :: repeat chars
    | '^'::chars -> Token.POW :: repeat chars
    | '='::'>'::chars -> Token.DARROW :: repeat chars
    | '='::chars -> Token.EQ :: repeat chars
    | '<'::'>'::chars -> Token.NE :: repeat chars
    | '>'::'='::chars -> Token.GE :: repeat chars
    | '>'::chars -> Token.GT :: repeat chars
    | '<'::'='::chars -> Token.LE :: repeat chars
    | '<'::chars -> Token.LT :: repeat chars
    | '.'::chars -> Token.DOT :: repeat chars
    | ','::chars -> Token.COMMA :: repeat chars
    | ';'::chars -> Token.SEMI :: repeat chars
    | ':'::chars -> Token.COLON :: repeat chars
    | '{'::chars -> Token.LBRACE :: repeat chars
    | '}'::chars -> Token.RBRACE :: repeat chars
    | 'l'::'e'::'t'::chars -> Token.LET :: repeat chars
    | 'i'::'n'::'t'::chars -> Token.INT_TYPE :: repeat chars
    | 'i'::'n'::'l'::chars -> Token.INL :: repeat chars
    | 'i'::'n'::'r'::chars -> Token.INR :: repeat chars
    | 'i'::'n'::chars -> Token.IN :: repeat chars
    | 'i'::'f'::chars -> Token.IF :: repeat chars
    | 't'::'r'::'u'::'e'::chars -> Token.TRUE :: repeat chars
    | 'f'::'a'::'l'::'s'::'e'::chars -> Token.FALSE :: repeat chars
    | 'f'::'i'::'r'::'s'::'t'::chars -> Token.FIRST :: repeat chars
    | 's'::'e'::'c'::'o'::'n'::'d'::chars -> Token.SECOND :: repeat chars
    | 't'::'h'::'e'::'n'::chars -> Token.THEN :: repeat chars
    | 'e'::'l'::'s'::'e'::chars -> Token.ELSE :: repeat chars
    | 'c'::'a'::'s'::'e'::chars -> Token.CASE :: repeat chars
    | 'o'::'f'::chars -> Token.OF :: repeat chars
    | 'r'::'e'::'a'::'l'::chars -> Token.REAL_TYPE :: repeat chars
    | 'u'::'n'::'i'::'t'::chars -> Token.UNIT_TYPE :: repeat chars
    | 'b'::'o'::'o'::'l'::chars -> Token.BOOL_TYPE :: repeat chars
    | other :: chars ->
      (match isDigit other with
       | true  ->
         let (token, chars) = makeNumber (toInt other) chars
         in
         token :: repeat chars
       | false ->
         (match isLetter other with
          | true  ->
            let (id, chars) = makeId [other] chars
            in
            (Token.ID (Symbol.fromString id)) :: repeat chars
          | false -> failwith "bad token."))
  in
  repeat chars
