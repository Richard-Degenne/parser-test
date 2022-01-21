# Parser test

A dummy repo to toy around with OCaml parsers.

## Usage

```
parser_test -p int file.txt
```

Parses a file containing an integer.

```
parser_test -p data file.txt
```

Parses a file containing a colon-separated triple (integer, string, string)

```
parser_test -p data_seq file.txt
```

Parses a file containing a list of colon-separated triples (integer, string, string) one per line.

### Examples

Example data can be found in [`test/data`](test/data).

```
$ parser_test -p int test/data/int.txt

Found 42
```

```
$ parser_test -p data test/data/data.txt

Found
  - 42
  - bonjour
  - oui
```
