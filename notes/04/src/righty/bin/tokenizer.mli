
type source = Repl of string     (* string is prompt *)
            | File of in_channel
            | Test of string     (* string is input text *)

val tokenizer : source -> Token.t list
