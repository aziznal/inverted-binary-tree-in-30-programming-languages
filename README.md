# Readme

On the night of the 25th of march, 2025, I challenged myself to explore a bunch of programming 
languages, inspired by a developer on youtube called tsoding ([here's](https://github.com/tsoding/aoc-2020) his challenge implementation).

The languages I aim to do are the following (in no particular order):

1. [x] Typescript
2. [x] Rust
3. [x] C
4. [x] C++
5. [ ] D
6. [x] Go
7. [ ] C#
8. [ ] Lisp
9. [ ] Lua
10. [ ] Objective C
11. [ ] Java
12. [ ] Kotlin
13. [ ] Haskell
14. [x] Python
15. [ ] Php
16. [ ] Perl
17. [ ] Nim
18. [ ] Zig
19. [ ] Scala
20. [ ] Groovy
21. [ ] Dart
22. [ ] Assembly
23. [ ] Ocaml
24. [ ] Pascal
25. [ ] Nim
26. [ ] Julia
27. [ ] Racket
28. [ ] Ada
29. [ ] Ruby
30. [ ] Coffeescript

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

