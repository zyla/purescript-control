-- | This module defines the `Lazy` type class and associated
-- | helper functions.

module Control.Lazy where

-- | The `Lazy` class represents types which allow evaluation of values
-- | to be _deferred_.
-- |
-- | Usually, this means that a type contains a function arrow which can
-- | be used to delay evaluation.
class Lazy l where
  defer :: (Unit -> l) -> l

-- | `fix` defines a value as the fixed point of a function.
-- |
-- | The `Lazy` instance allows us to generate the result lazily.
fix :: forall l a. (Lazy l) => (l -> l) -> l
fix f = defer (\_ -> f (fix f))
