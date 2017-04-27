{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE KindSignatures #-}

module MatrixTest where

--
-- Doesn't actually need the kind signature here; impressively, it inferred it
-- without it (due to multiply :: c a -> ...) but I left it in for clarity.
--

class (Num a, Fractional a, Ord a, Foldable c) =>
    Calculator (c :: * -> *) a
  where
    multiply :: c a -> c a -> c a
    transpose :: c a -> c a
    inverse :: c a -> c a
    identity :: Int -> c a
    scale :: a -> c a -> c a
    create :: [[a]] -> c a


