{-# LANGUAGE StrictData #-}

module CommonType where

import Data.Word

data State
  = StateOpen
  | StateClose
  | StatedReopen
  deriving (Eq, Show)

type Id = Word64

data Ref = RealRef Id | DummyRef deriving (Eq, Show)

newtype Commit = Commit String deriving (Eq, Show)
