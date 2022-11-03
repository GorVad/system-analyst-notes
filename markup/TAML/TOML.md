# TOML

## What is TOML?
TOML (Tom's Obvious, Minimal Language) aims to be a minimal configuration file format that's easy to read due to obvious semantics. TOML is designed to map unambiguously to a hash table. TOML should be easy to parse into data structures in a wide variety of languages.  
TOML example
```
# This is a TOML document

title = "TOML Example"

[owner]
name = "Tom Preston-Werner"
dob = 1979-05-27T07:32:00-08:00

[database]
enabled = true
ports = [ 8000, 8001, 8002 ]
data = [ ["delta", "phi"], [3.14] ]
temp_targets = { cpu = 79.5, case = 72.0 }

[servers]

[servers.alpha]
ip = "10.0.0.1"
role = "frontend"

[servers.beta]
ip = "10.0.0.2"
role = "backend"
```

## Why Use TOML?
TOML aims to be a minimal configuration file format that:
- is easy to read due to obvious semantics
- maps unambiguously to a hash table
- is easy to parse into data structures in a wide variety of languages

TOML has useful native types
- Key/Value Pairs
- Arrays
- Tables
- Inline tables
- Arrays of tables
- Integers & Floats
- Booleans
- Dates & Times, with optional offsets

TOML already has implementations in most of the most popular programming languages in use today: C, C#, C++, Clojure, Dart, Elixir, Erlang, Go, Haskell, Java, Javascript, Lua, Objective-C, Perl, PHP, Python, Ruby, Swift, Scala.

## Sources
### Web
1. [https://toml.io/en/](https://toml.io/en/) [eng]
2. [GitHub: TOML](https://github.com/toml-lang/toml) [eng]
### Articles
1. [Habr: TOML](https://habr.com/ru/post/503240/) [ru]
2. [W3schools: TOML - Tutorials](https://www.w3schools.io/file/toml-introduction/) [eng]