--
-- Comparison benchmark matrix to hmatrix
--
-- Copyright © 2014,2017 Operational Dynamics Consulting, Pty Ltd
--
-- The code in this file, and the program it is a part of, is made
-- available to you by its authors as open source software: you can
-- redistribute it and/or modify it under a BSD licence.
--

{-# LANGUAGE OverloadedStrings #-}
{-# OPTIONS -fno-warn-unused-do-bind #-}

import Data.Foldable
import PureMatrixCalculation
--import WrappedBlasLapackCalculation (BlasLapack)
import MatrixTest
import SampleMatrixData

main :: IO ()
main =
  let
    d = createPureFrom threeByThree
  in do
    forM_ [1..5] $ \i -> do
        print $ calculateNonsense i d

--
-- | Run some computation n times on an input matrix and return the result.
--
calculateNonsense :: Calculator matrix a => Int -> matrix a -> matrix a
calculateNonsense n x = foldl' nonsense x [1..n]

nonsense :: Calculator matrix a => matrix a -> Int -> matrix a
nonsense x _ = normalize (multiply x (transpose x))

normalize :: Calculator matrix a => matrix a -> matrix a
normalize x = scale (recip factor) x
  where
    factor = maximum x
