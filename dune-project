(lang dune 2.9)

(name parser_test)

(generate_opam_files true)

(license GPL)

(authors "Richard Degenne <richard.degenne@gmail.com>")
(maintainers "Richard Degenne <richard.degenne@gmail.com>")

(source
  (github Richard-Degenne/parser-test))
(bug_reports "https://github.com/Richard-Degenne/parser-test/issues")
(homepage "https://github.com/Richard-Degenne/parser-test")
(documentation "https://github.com/Richard-Degenne/parser-test")

(package
  (name parser_test)
  (synopsis "A dummy repo to toy around with parsers")
  (description "A dummy repo to toy around with parsers")
  (depends
    (ocaml (>= 4.02.3))
    (alcotest :with-test)
    dune
    menhir
  )
)

(using menhir 2.0)
