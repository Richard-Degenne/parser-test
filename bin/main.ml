let parse_int filename =
  match (Parser_test.Int_reader.read filename) with
  | None -> print_endline "No int found"
  | Some i -> Printf.printf "Found %d\n" i

let print_triple (i, s1, s2) =
  Printf.printf "Found:\n  - %d\n  - %s\n  - %s\n" i s1 s2

let parse_data filename =
  match (Parser_test.Data_reader.read filename) with
  | None -> print_endline "No data found"
  | Some t -> print_triple t

let parse_data_seq filename =
  let triples = Parser_test.Data_seq_reader.read filename in
  List.iter print_triple triples

let () =
  let filename = ref "" in

  let parser = ref "" in
  let parser_spec = "-p", (Arg.Set_string parser), "int,data,data_seq" in
  Arg.parse [parser_spec] ((:=) filename) "Usage: parser_test -p [PARSER] FILE";

  match !parser with
  | "int" -> parse_int !filename
  | "data" -> parse_data !filename
  | "data_seq" -> parse_data_seq !filename
  | _ as s ->
    Printf.printf "Unknown parser `%s`\n" s
