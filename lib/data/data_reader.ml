type t = int * string * string

let position (lexbuf : Lexing.lexbuf) =
  let pos = lexbuf.lex_curr_p in
  Printf.sprintf "%s:%d:%d" pos.pos_fname pos.pos_lnum (pos.pos_cnum - pos.pos_bol + 1)

let read filename =
  let inx = open_in filename in
  let lexbuf = Lexing.from_channel inx in
  lexbuf.lex_curr_p <- { lexbuf.lex_curr_p with pos_fname = filename };

  try Data_parser.doc Data_lexer.read lexbuf with
    | Data_parser.Error ->
        Printf.fprintf stderr "%s: syntax error\n" (position lexbuf);
        None
    | Data_lexer.SyntaxError msg ->
        Printf.fprintf stderr "%s: %s\n" (position lexbuf) msg;
        None
