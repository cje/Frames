{-# LANGUAGE DataKinds, TypeFamilies, TypeOperators #-}
-- | Helpers for working with type-level lists.
module Frames.TypeLevel where
import GHC.Prim (Constraint)

-- | Remove the first occurence of a type from a type-level list.
type family RDelete r rs where
  RDelete r (r ': rs) = rs
  RDelete r (s ': rs) = s ': RDelete r rs

-- | A constraint on each element of a type-level list.
type family LAll c ts :: Constraint where
  LAll c '[] = ()
  LAll c (t ': ts) = (c t, LAll c ts)
