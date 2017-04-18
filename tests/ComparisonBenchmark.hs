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

import Criterion.Main
import GHC.Conc

{-
    The actual sample request code are in separate modules to avoid
    namespace collision nightmares.
-}

import PureMatrixCalculation (sampleViaMatrix)
import WrappedBlasLapackCalculation (sampleViaBlasLapack)

main :: IO ()
main = do
    GHC.Conc.setNumCapabilities 4
    defaultMain
       [ bench "matrix  (native Haskell code)" (nf sampleViaMatrix 25)
       , bench "hmatrix (wrapper around BLAS/LAPACK)" (nf sampleViaBlasLapack 25)
       ]
    putStrLn "Complete."

