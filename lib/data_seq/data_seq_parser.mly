%token <int> INT
// %token <float> FLOAT
// %token <string> ID
%token <string> STRING
// %token TRUE
// %token FALSE
// %token NULL
// %token LEFT_BRACKET
// %token RIGHT_BRACKET
// %token LEFT_BRACE
// %token RIGHT_BRACE
%token COLON
%token NEWLINE
// %token COMMA
%token EOF

%start <(int * string * string) list> doc

%%

doc:
  | l = values EOF { List.rev l }
  ;

values:
  // | vs = separated_list(NEWLINE, value)  { vs }
  | (* empty *) { [] }
  | h = value { [h] }
  | t = values ; NEWLINE ; h = value { h :: t }
  | t = values ; NEWLINE { t }
  ;

value:
  | i = INT ; COLON ; s1 = STRING ; COLON ; s2 = STRING {
      i, s1, s2
    }
  ;
