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
{-# LANGUAGE BangPatterns #-}
{-# OPTIONS -fno-warn-unused-imports #-}

module PureMatrixCalculation (sampleViaMatrix) where

import Data.Foldable
import Data.Matrix -- matrix package

import SampleMatrixData

d :: Matrix Float
d = fromLists threeByThree

main :: IO ()
main = do
    forM_ [1..5] $ \i -> do
        print $ sampleViaMatrix i


sampleViaMatrix :: Int -> Matrix Float
sampleViaMatrix n = foldl' nonsense d [1..n]

nonsense :: (Ord a, Fractional a) => Matrix a -> Int -> Matrix a
nonsense x _ = normalize (x * transpose x) * i
  where
    i = case inverse x of
            Left _       -> identity (nrows x)
            Right result -> result

normalize :: (Ord a, Fractional a) => Matrix a -> Matrix a
normalize x = scaleMatrix (recip factor) x
  where
    factor = maximum x
    
