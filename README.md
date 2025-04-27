# Readme

On the night of the 25th of march, 2025, I challenged myself to explore a bunch of programming
languages, inspired by a developer on youtube called tsoding ([here's](https://github.com/tsoding/aoc-2020) his challenge implementation).

The languages I aim to do are the following (in no particular order):

1. [x] Typescript
2. [x] Rust
3. [x] C
4. [x] C++
5. [x] D
6. [x] Go
7. [x] C#
8. [x] Lisp
9. [x] Lua
10. [x] Java
11. [x] Kotlin
12. [x] Haskell
13. [x] Python
14. [x] Php
15. [x] Perl
16. [x] Nim
17. [x] Zig
18. [x] Scala
19. [x] Groovy
20. [x] Dart
21. [x] Ocaml
22. [x] Pascal
23. [x] Julia
24. [x] Racket
25. [x] Ada
26. [x] Ruby
27. [x] Coffeescript
28. [x] Elixir
29. [x] Erlang
30. [x] Clojure
31. [ ] Gleam
32. [ ] Swift
33. [ ] Prolog
34. [x] F#
35. [ ] Elm
36. [ ] Assembly

## Running Things with Docker Containers

With 30+ languages comes 30+ potential headaches to set each up. I deal with that using docker.

Each solution has a `dockerfile` setting up a minimal environment for the given language.

The following commands are helpful:

```bash
# 1. builds an image
docker buildx build --load -t container-name .

# 2. runs shell inside a built image and mounts the current folder to it under /app
docker run -it -v "$(pwd)":/app container-name /bin/bash
```
