module Test.Main
  ( main
  ) where

import Prelude

import Effect (Effect)
import Test.Bouzuya.HTTP.Request.NormalizedPath as NormalizedPath
import Test.Unit.Main as TestUnitMain

main :: Effect Unit
main = TestUnitMain.runTest do
  NormalizedPath.tests
