music
=====

[![Build
Status](https://travis-ci.org/tonyday567/music.svg)](https://travis-ci.org/tonyday567/music)
[![Hackage](https://img.shields.io/hackage/v/music.svg)](https://hackage.haskell.org/package/music)
[![lts](https://www.stackage.org/package/music/badge/lts)](http://stackage.org/lts/package/music)
[![nightly](https://www.stackage.org/package/music/badge/nightly)](http://stackage.org/nightly/package/music)

results
-------

recipe
------

    stack build --test --exec "$(stack path --local-install-root)/bin/music-example" --exec "$(stack path --local-bin)/pandoc -f markdown -i other/header.md example/example.md other/footer.md -t html -o index.html --filter pandoc-include --mathjax" --exec "$(stack path --local-bin)/pandoc -f markdown -i example/example.md -t markdown -o readme.md --filter pandoc-include --mathjax" --file-watch

reference
---------

-   [ghc
    options](https://downloads.haskell.org/~ghc/latest/docs/html/users_guide/flags.html#flag-reference)
-   [pragmas](https://downloads.haskell.org/~ghc/latest/docs/html/users_guide/lang.html)
-   [libraries](https://www.stackage.org/)
-   [protolude](https://www.stackage.org/package/protolude)
-   [optparse-generic](https://www.stackage.org/package/optparse-generic)
-   [hoogle](https://www.stackage.org/package/hoogle)
-   [doctest](https://www.stackage.org/package/doctest)

