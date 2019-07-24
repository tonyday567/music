music
===

[![Build Status](https://travis-ci.org/tonyday567/music.svg)](https://travis-ci.org/tonyday567/music) [![Hackage](https://img.shields.io/hackage/v/music.svg)](https://hackage.haskell.org/package/music) [![lts](https://www.stackage.org/package/music/badge/lts)](http://stackage.org/lts/package/music) [![nightly](https://www.stackage.org/package/music/badge/nightly)](http://stackage.org/nightly/package/music) 


tidal
--

Super Collider needs to be on an listening:

double-click SuperCollider.app

startup script is here:

  ../other/start.scd

but maybe here if this is the default:

  ~/Library/Application Support/SuperCollider/startup.scd


results
---

```
#stack build --test --exec "$(stack path --local-install-root)/bin/music-example" 
music-example: Network.Socket.bind: resource busy (Address already in use)
👍
```


old tidal notes
===

notes
-----

https://tidalcycles.org/patterns.html

https://github.com/supercollider/sc3-plugins/releases

midi
----

http://hackage.haskell.org/package/midi-0.2.2.1

Usage
-----

The haskell helper code is delivered to emacs via the emacs package. To
deliver in the normal way try:

    :{
    import Protolude
    import Sound.Tidal.Context
    import Sound.Tidal.Scales
    import Sound.Tidal.Chords
    (cps, nudger, getNow) <- cpsUtils'
    (d1,t1) <- superDirtSetters getNow
    (d2,t2) <- superDirtSetters getNow
    (d3,t3) <- superDirtSetters getNow
    (d4,t4) <- superDirtSetters getNow
    (d5,t5) <- superDirtSetters getNow
    (d6,t6) <- superDirtSetters getNow
    (d7,t7) <- superDirtSetters getNow
    (d8,t8) <- superDirtSetters getNow
    (d9,t9) <- superDirtSetters getNow
    (d10,t10) <- superDirtSetters getNow
    (c1,ct1) <- dirtSetters getNow
    (c2,ct2) <- dirtSetters getNow
    (c3,ct3) <- dirtSetters getNow
    (c4,ct4) <- dirtSetters getNow
    (c5,ct5) <- dirtSetters getNow
    (c6,ct6) <- dirtSetters getNow
    (c7,ct7) <- dirtSetters getNow
    (c8,ct8) <- dirtSetters getNow
    (c9,ct9) <- dirtSetters getNow
    (c10,ct10) <- dirtSetters getNow
    let bps x = cps (x/2)
    let hush = mapM_ ($ silence) [c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,d1,d2,d3,d4,d5,d6,d7,d8,d9,d10]
    let solo = (>>) hush
    :}

The port also needs to be set eg:

    TIDAL_TEMPO_PORT=9160 stack ghci


recipe
---

```
stack build --test --exec "$(stack path --local-install-root)/bin/music-example" --exec "$(stack path --local-bin)/pandoc -f markdown -i other/header.md example/example.md other/footer.md -t html -o index.html --filter pandoc-include --mathjax" --exec "$(stack path --local-bin)/pandoc -f markdown -i example/example.md -t markdown -o readme.md --filter pandoc-include --mathjax" --file-watch
```

reference
---

- [ghc options](https://downloads.haskell.org/~ghc/latest/docs/html/users_guide/flags.html#flag-reference)
- [pragmas](https://downloads.haskell.org/~ghc/latest/docs/html/users_guide/lang.html)
- [libraries](https://www.stackage.org/)
- [protolude](https://www.stackage.org/package/protolude)
- [optparse-generic](https://www.stackage.org/package/optparse-generic)
- [hoogle](https://www.stackage.org/package/hoogle)
- [doctest](https://www.stackage.org/package/doctest)
