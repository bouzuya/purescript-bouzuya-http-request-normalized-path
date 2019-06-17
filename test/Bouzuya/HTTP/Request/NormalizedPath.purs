module Test.Bouzuya.HTTP.Request.NormalizedPath
  ( tests
  ) where

import Prelude

import Bouzuya.HTTP.Request.NormalizedPath as NormalizedPath
import Test.Unit (TestSuite)
import Test.Unit as TestUnit
import Test.Unit.Assert as Assert

tests :: TestSuite
tests = TestUnit.suite "Bouzuya.HTTP.Request.NormalizedPath" do
  TestUnit.test "normalize / toString" do
    Assert.equal
      "/"
      (NormalizedPath.toString (NormalizedPath.normalize "/"))
    Assert.equal
      "/"
      (NormalizedPath.toString (NormalizedPath.normalize "//"))
    Assert.equal
      "/foo"
      (NormalizedPath.toString (NormalizedPath.normalize "/foo"))
    Assert.equal
      "/foo"
      (NormalizedPath.toString (NormalizedPath.normalize "/foo/"))
    Assert.equal
      "/foo"
      (NormalizedPath.toString (NormalizedPath.normalize "/foo//"))
    Assert.equal
      "/foo/bar"
      (NormalizedPath.toString (NormalizedPath.normalize "/foo/bar"))
    Assert.equal
      "/foo/bar"
      (NormalizedPath.toString (NormalizedPath.normalize "/foo/bar/"))
    Assert.equal
      "/foo/bar"
      (NormalizedPath.toString (NormalizedPath.normalize "/foo/bar//"))

  TestUnit.test "toPieces" do
    Assert.equal
      []
      (NormalizedPath.toPieces (NormalizedPath.normalize "/"))
    Assert.equal
      ["foo"]
      (NormalizedPath.toPieces (NormalizedPath.normalize "/foo"))
    Assert.equal
      ["foo", "bar"]
      (NormalizedPath.toPieces (NormalizedPath.normalize "/foo/bar"))
