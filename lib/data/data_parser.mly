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
// %token COMMA
%token EOF

%start <(int * string * string) option> doc

%type <int * string * string> value

%%

doc:
  | EOF { None }
  | v = value { Some v }
  ;
value:
  | i = INT ; COLON ; s1 = STRING ; COLON ; s2 = STRING { i, s1, s2 }
  ;
