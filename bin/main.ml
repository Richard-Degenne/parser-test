let parse_int filename =
  match (Parser_test.Int_reader.read filename) with
  | None -> print_endline "No triple found"
  | Some i -> Printf.printf "Found %d\n" i

let parse_data filename =
  match (Parser_test.Data_reader.read filename) with
  | None -> print_endline "No triple found"
  | Some (i, s1, s2) -> Printf.printf "Found:\n  - %d\n  - %s\n  - %s\n" i s1 s2

let () =
  let filename = ref "" in

  let parser = ref "" in
  let parser_spec = "-p", (Arg.Set_string parser), "a" in
  Arg.parse [parser_spec] ((:=) filename) "Usage: parser_test FILE";

  match !parser with
  | "int" -> parse_int !filename
  | "data" -> parse_data !filename
    ;
  | _ as s ->
    Printf.printf "Unknown parser `%s`\n" s
