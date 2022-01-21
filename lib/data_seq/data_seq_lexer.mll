{
  open Data_seq_parser
  open Lexing

  exception SyntaxError of string

  let next_line lexbuf =
    let pos = lexbuf.lex_curr_p in
    lexbuf.lex_curr_p <- { pos with
      pos_bol = pos.pos_cnum;
      pos_lnum = pos.pos_lnum + 1
    }
}

let int = '-'? ['0'-'9'] ['0'-'9']*
let string = [^':' '\n']*

let white = [' ' '\t']+
let newline = ('\r' | '\n' | "\r\n")

let end = newline* eof

rule read =
  parse
  | int { INT (int_of_string(Lexing.lexeme lexbuf)) }
  | string { STRING (Lexing.lexeme lexbuf) }
  | ":" { COLON }
  | newline { next_line lexbuf; NEWLINE }
  | end { EOF }
  | _ { raise (SyntaxError ("Unexpected character `" ^ String.escaped (Lexing.lexeme lexbuf) ^ "`")) }
