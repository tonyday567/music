import Protolude
import Sound.Tidal.Context
import Sound.Tidal.Scales
import Sound.Tidal.Chords

-- this is all just to get imports really

main :: IO ()
main = do
  let t1 =
          sound "voodoo:6 drum:2 drum:1 [~ voodoo:6]" |+|
          speed "0.3 0.2 0.4 0.3" |+|
          vowel "o" |+|
          shape "0.05 0.2 0.4 0.6" |+|
          vowel "a e i o u ~"
  print t1
  putStrLn ("👍" :: Text)
