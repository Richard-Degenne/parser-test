let () =
  let filename = ref "" in
  Arg.parse [] ((:=) filename) "Usage: parser_test FILE";

  match (Parser_test.Int.read (filename.contents)) with
  | None -> print_endline "No int found"
  | Some i -> Printf.printf "Found %d\n" i
