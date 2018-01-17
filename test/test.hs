{-# OPTIONS_GHC -Wall #-}

module Main where

import Protolude
import Test.Tasty (TestTree, testGroup, defaultMain)
import Test.DocTest

main :: IO ()
main = do
    doctest ["example/example.hs"]
    defaultMain tests

tests :: TestTree
tests =
    testGroup ""
    [
    ]