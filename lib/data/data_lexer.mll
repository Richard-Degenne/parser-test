{
  open Data_parser

  exception SyntaxError of string
}

let int = '-'? ['0'-'9'] ['0'-'9']*
let string = [^':' '\n']*

let white = [' ' '\t']+
let newline = '\r' | '\n' | "\r\n"

rule read =
  parse
  | int { INT (int_of_string(Lexing.lexeme lexbuf)) }
  | string { STRING (Lexing.lexeme lexbuf) }
  | ":" { COLON }
  | eof { EOF }
  | _ { raise (SyntaxError ("Unexpected character `" ^ String.escaped (Lexing.lexeme lexbuf) ^ "`")) }
