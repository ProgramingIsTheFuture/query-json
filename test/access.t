Empty query makes the identity

  $ echo '{}' | query-json ''
  {}

  $ echo '{ "flores": 12 }' | query-json '.'
  { "flores": 12 }

  $ echo '{ "flores": 12 }' | query-json '.flores'
  12

Literals should return themselves

  $ echo '{}' | query-json '23'
  23

  $ echo '{ "foo": { "bar": 23 }}' | query-json '.foo.bar'
  23

non defined field gives back null when "?"

  $ echo '{ "foo": { "bar": {} }}' | query-json '.foo.bar.baz?'
  null

  $ echo '{}' | query-json '.foo'
  
  Error:  Trying to ".foo" on an object, that don't have the field "foo":
  {}
  
  $ echo '{ "foo": { "bar": {} }}' | query-json '.foo.bar.baz'
  
  Error:  Trying to ".baz" on an object, that don't have the field "baz":
  {}
  
  $ echo '{"foo":[1,2,3]}' | query-json '.foo[]'
  1
  2
  3

  $ echo '{"foo":[1,2,3]}' | query-json '.fool[]'
  
  Error:  Trying to ".fool" on an object, that don't have the field "fool":
  { "foo": ... }
  
  $ echo '{"foo":[1,2,3]}' | query-json '.fool?[]?'
  null
