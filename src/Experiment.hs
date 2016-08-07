{-# LANGUAGE OverloadedStrings #-}
{-# OPTIONS -fno-warn-unused-imports #-}

module Main where

import Data.Text (Text)
import qualified Data.Text.IO as T
import Linear.Matrix
import Linear.V2

one :: V2 Int
one = V2 1 1

two :: V2 Int
two = V2 2 2

thr :: V2 Int
thr = V2 3 3

fur :: V2 Int
fur = V2 4 4 

a :: M22 Int
a = V2 one two

b :: M22 Int
b = V2 thr fur


main :: IO ()
main = do
     putStrLn "Hello"
     print a 
     print b 
     print $ a !+! b
