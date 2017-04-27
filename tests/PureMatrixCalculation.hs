--
-- Comparison benchmark matrix to hmatrix
--
-- Copyright © 2014,2017 Operational Dynamics Consulting, Pty Ltd
--
-- The code in this file, and the program it is a part of, is made
-- available to you by its authors as open source software: you can
-- redistribute it and/or modify it under a BSD licence.
--

{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE InstanceSigs #-}

module PureMatrixCalculation
(
    createPureFrom
) where

import Data.Matrix (Matrix)
import qualified Data.Matrix as Matrix

import MatrixTest
import SampleMatrixData

createPureFrom :: [[a]] -> Matrix a
createPureFrom elements = Matrix.fromLists elements

instance (Num a, Fractional a, Ord a) => Calculator Matrix a where
    transpose x = Matrix.transpose x
    multiply x1 x2 = Matrix.multStd2 x1 x2
    identity = Matrix.identity
    inverse x = case Matrix.inverse x of
        Left err     -> error err
        Right result -> result
    scale factor x = Matrix.scaleMatrix factor x
    create = Matrix.fromLists
