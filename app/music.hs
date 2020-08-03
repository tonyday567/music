{-# OPTIONS_GHC -fno-warn-type-defaults #-}
{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE FlexibleInstances #-}
{-# OPTIONS_GHC -Wall #-}

import NumHask.Prelude
import Sound.Tidal.Context
import Sound.Tidal.Scales
import Sound.Tidal.Chords

p1 :: ControlPattern
p1 = sound "bd bd bd bd bd bd [bd*4] [bd*4]"

p2 :: Pattern ControlMap
p2 =
          sound "voodoo:6 drum:2 drum:1 [~ voodoo:6]" |+|
          speed "0.3 0.2 0.4 0.3" |+|
          vowel "o" |+|
          shape "0.05 0.2 0.4 0.6" |+|
          vowel "a e i o u ~"

setup :: IO (Pattern ControlMap -> IO ())
setup = do
  -- 6010
  tidal <- startTidal (superdirtTarget {oLatency = 0.1, oAddress = "127.0.0.1", oPort = 57120}) (defaultConfig {cFrameTimespan = 1/20})
  -- (cps, getNow) <- cpsUtils
  -- cps (63/60/4)
  pure $ streamReplace tidal (1::Integer) . (|< orbit 0)

main :: IO ()
main = do
  d1 <- setup
  d1 p1
  print p2
  threadDelay (floor (10 * 1e6 :: Double))
  d1 silence
  putStrLn ("👍" :: Text)


