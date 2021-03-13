- Intro
  - Language running on BEAM VM, the virtual machine created to run Erlang
  - Created by José Valim
  - Concurrent, parallel, fault tolerant
- Hit the ground running
  - iex
  ```bash
  $ iex
  iex(3)> x = 1
  1
  ```
  - scripts
  ```bash
  $ elixir sample.exs
  ```
  - compiled
  ```bash
  $ elixirc sample.ex

  $ ls -lsha
  0 drwxr-xr-x   9 user  staff   288B Mar 15 22:15 .
  0 drwxr-xr-x  15 user  staff   480B Mar  9 22:58 ..
  8 -rw-r--r--   1 user  staff   1.4K Mar 15 22:15 Elixir.Sample.beam

  $ iex
  iex(1)> Sample.say_hi
  Hello, stranger!
  :ok
  iex(2)>
  ```
- Basics
  - basic types: integer, float, boolean, atom / symbol, string, list, tuple
  - string vs charlist
  - keyword list, map
  - documentation: 
    - h
    ```bash
    iex(1)> h String.upcase/1

                        def upcase(string, mode \\ :default)

    Converts all characters in the given string to uppercase according to mode.

    mode may be :default, :ascii or :greek. The :default mode considers all
    non-conditional transformations outlined in the Unicode standard. :ascii
    uppercases only the letters a to z. :greek includes the context sensitive
    mappings found in Greek.

    ## Examples

        iex> String.upcase("abcd")
        "ABCD"

        iex> String.upcase("ab 123 xpto")
        "AB 123 XPTO"

        iex> String.upcase("olá")
        "OLÁ"

    The :ascii mode ignores Unicode characters and provides a more performant
    implementation when you know the string contains only ASCII characters:

        iex> String.upcase("olá", :ascii)
        "OLá"

    ```
    - i
    ```bash
    iex(1)> i "olá"
    Term
      "olá"
    Data type
      BitString
    Byte size
      4
    Description
      This is a string: a UTF-8 encoded binary. It's printed surrounded by
      "double quotes" because all UTF-8 encoded code points in it are printable.
    Raw representation
      <<111, 108, 195, 161>>
    Reference modules
      String, :binary
    Implemented protocols
      Collectable, IEx.Info, Inspect, List.Chars, String.Chars
    ```
    - String.__info__(:functions)
    ```bash
    String.__info__(:functions)
    [
      at: 2,
      bag_distance: 2,
      capitalize: 1,
      capitalize: 2,
      chunk: 2,
      codepoints: 1,
      contains?: 2,
      downcase: 1,
      downcase: 2,
      duplicate: 2,
      ends_with?: 2,
      equivalent?: 2,
      first: 1,
      graphemes: 1,
      jaro_distance: 2,
      last: 1,
      length: 1,
      ljust: 2,
      ljust: 3,
      lstrip: 1,
      lstrip: 2,
      match?: 2,
      myers_difference: 2,
      next_codepoint: 1,
      next_grapheme: 1,
      next_grapheme_size: 1,
      normalize: 2,
      pad_leading: 2,
      pad_leading: 3,
      pad_trailing: 2,
      pad_trailing: 3,
      printable?: 1,
      printable?: 2,
      replace: 3,
      replace: 4,
      replace_leading: 3,
      replace_prefix: 3,
      replace_suffix: 3,
      replace_trailing: 3,
      reverse: 1,
      rjust: 2,
      rjust: 3,
      rstrip: 1,
      rstrip: 2,
      slice: 2,
      slice: 3,
      split: 1,
      split: 2,
      split: 3,
      split_at: 2,
      ...
    ]
    ```
  - anonymous functions, function capturing
  - match operator, pin operator, pattern matching
  - case, cond, if/else
  - loops: for, recursion, Enum, Stream, pipe operator
    - https://en.wikipedia.org/wiki/Tail_call
  - protocols
  - struct
- Processes
  - spawn, send, receive
  - state using Agent
- Mix
  - mix new sample_project
  - dependencies
    - https://hex.pm/
    - https://hexdocs.pm/
  - mix test
    - ExUnit
    - doctest
  - typespecs
    - http://erlang.org/doc/man/dialyzer.html
- What more?
  - OTP, open telecom platform
  - Erlang
