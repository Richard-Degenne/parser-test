{
  open Parser

  exception SyntaxError of string
}

let int = '-'? ['0'-'9'] ['0'-'9']*

let white = [' ' '\t']+
let newline = '\r' | '\n' | "\r\n"

rule read =
  parse
  | int { INT (int_of_string(Lexing.lexeme lexbuf)) }
