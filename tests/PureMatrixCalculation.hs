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

module PureMatrixCalculation (sampleViaMatrix) where

import Data.Matrix -- matrix package

import SampleMatrixData

d :: Matrix Float
d = fromLists threeByThree

main :: IO ()
main = do
    print $ sampleViaMatrix 3

sampleViaMatrix :: Int -> Float
sampleViaMatrix _ =
    detLU (d * transpose d)

