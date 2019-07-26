{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE FlexibleInstances #-}
{-# OPTIONS_GHC -Wall #-}

import Protolude
import Sound.Tidal.Context

import HSoM
import Euterpea
import Control.Concurrent as C
import Codec.Midi
import VividEuterpea
import Vivid hiding (forever, line)
import Data.List ((!!))

-- d1 $ sound "drum drum" # speed "0.6 0.4 0.8 0.6"

t1 = sound "bd bd bd bd bd bd [bd*4] [bd*4]"

m f = do
    (Right t) <- importFile f
    pure t

m1 = m "other/New_Order_-_Blue_Monday.mid"

m2 = m "Movie_Themes_-_Star_Wars_-_by_John_Willams.mid"

setup = do
  tidal <- startTidal (superdirtTarget {oLatency = 0.1, oAddress = "127.0.0.1", oPort = 57120}) (defaultConfig {cFrameTimespan = 1/20})
  -- (cps, getNow) <- cpsUtils
  -- cps (63/60/4)
  pure $ (streamReplace tidal) 1 . (|< orbit 0)

midN ns = do
    m <- m1
    playV synthTable $ fromMidi $ m {tracks = ((\x -> (tracks m)!!x) <$> ns)}

midf f = do
    m_ <- m f
    playV synthTable $ fromMidi $ m_

-- http://www.midialternative.com/pixies/
-- http://remixpacks.ru/


sound1 :: VInstr
sound1 d ap _ _ = let d' = fromRational d in sd (1 ::I "gate", 0 ::I "fadeSecs") $ do
   wobble <- sinOsc (freq_ (5::Integer)) ? KR ~* (10::Integer)
   s <- (0.2 :: Float) ~* sinOsc (freq_ $ midiCPS ap ~+ wobble)
   out (0::Integer) [s ~* envGate , s ~* envGate] -- this will expect an EXTERNAL release (External)

sound2 :: VInstr
sound2 d ap _ _ = let d' = fromRational d in sd (1 ::I "gate", 0 ::I "fadeSecs") $ do
   wobble <- sinOsc (freq_ (15::Integer)) ? KR ~* (30::Integer)
   s <- (0.2 :: Float) ~* sinOsc (freq_ $ midiCPS ap ~+ wobble)
   e <- envGen (env 0.0 [(1.0,0.1),(1.0, d' - 0.1), (0.0,0.5)] Curve_Linear) FreeEnclosing
   out (0::Integer) [s ~* e ,s  ~* e]

sound3 :: VInstr
sound3 d ap _ _ = let d' = fromRational d in sd (1 ::I "gate", 0 ::I "fadeSecs") $ do
   s <- (0.2::Float) ~* sinOsc (freq_ $ midiCPS ap)
   e <- envGen (env 0.0 [(1.0,0.01),(1.0, d' - 0.01), (0.0,0.25)] Curve_Linear) FreeEnclosing
   out (0::Integer) [s ~* e ,s  ~* e]

synthTable = [(CustomInstrument "Synth1", SynthInfo sound1 0.25 External), 
              (CustomInstrument "Synth2", SynthInfo sound2 0.5 Internal), 
              (CustomInstrument "Synth3", SynthInfo sound3 0.25 Internal)]

main :: IO ()
main = do
  d1 <- setup
  d1 t1
  C.threadDelay (floor $ 20 * 1e6)
  d1 silence

  putStrLn ("👍" :: Text)
