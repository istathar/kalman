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
{-# OPTIONS -fno-warn-unused-imports #-}

module WrappedBlasLapackCalculation (sampleViaBlasLapack) where

import Data.Foldable
import Numeric.LinearAlgebra hiding (normalize) -- hmatrix

import SampleMatrixData

d :: Matrix R
d = fromLists threeByThree

main :: IO ()
main = do
    forM_ [1..5] $ \i -> do
        print $ sampleViaBlasLapack i

sampleViaBlasLapack :: Int -> Matrix R
sampleViaBlasLapack n = foldl' nonsense d [1..n]

nonsense :: Matrix R -> Int -> Matrix R
nonsense x _ = normalize (x * tr x)

normalize :: Matrix R -> Matrix R
normalize x = scale (recip factor) x
  where
    factor = maxElement x
    
