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
7. [ ] C#
8. [x] Lisp
9. [x] Lua
10. [ ] Objective C
11. [x] Java
12. [x] Kotlin
13. [x] Haskell
14. [x] Python
15. [x] Php
16. [ ] Perl
17. [x] Nim
18. [x] Zig
19. [x] Scala
20. [ ] Groovy
21. [x] Dart
22. [ ] Assembly
23. [x] Ocaml
24. [x] Pascal
25. [ ] Julia
26. [ ] Racket
27. [ ] Ada
28. [x] Ruby
29. [x] Coffeescript
30. [ ] Elixir
31. [ ] Clojure
32. [ ] Elm
33. [ ] Gleam

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
