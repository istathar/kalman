{-# LANGUAGE OverloadedStrings #-}
{-# OPTIONS -fno-warn-unused-imports #-}

module Main where

import Data.Text (Text)
import qualified Data.Text.IO as T
import Data.Matrix

a :: Matrix Float
a = fromLists [[1,1], [2,2]]

b :: Matrix Float
b = fromLists [[3,3], [4,-5]]

c :: Matrix Float
c = fromLists [[3,3], [4,4]]


main :: IO ()
main = do
    putStrLn "Hello"
    print a
    putStrLn (prettyMatrix b)
    print (a + b)
    print (multStd2 a b)
    print (transpose b)
    case detLaplace b of
        0 -> putStrLn "b: No inverse"
        _ -> case inverse b of
               Left err -> error err
               Right m  -> print m

    let c' = inverse c
    case c' of
               Left err -> putStrLn "c: No inverse"
               Right m  -> print m
 
