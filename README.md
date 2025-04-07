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
21. [ ] Dart
22. [ ] Assembly
23. [ ] Ocaml
24. [ ] Pascal
25. [ ] Julia
26. [ ] Racket
27. [ ] Ada
28. [x] Ruby
29. [ ] Coffeescript
30. [ ] Elixir

## Running Things with Docker Containers

With 30 different programming languages comes 30 different potential headaches to set each up. To try
and deal with that, I use docker to set up the envs and work with them there.

Each programming language has a `dockerfile` setting up a minimal environment / toolchain for that language.

The following commands are helpful:

```bash
# builds an image
docker buildx build --load -t container-name .

# runs shell inside a built image and mounts the current folder to it under /app
docker run -it -v "$(pwd)":/app container-name /bin/bash
```
