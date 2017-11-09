{-# LANGUAGE StrictData #-}

module RawType where

import qualified Data.ByteString as B
import qualified Data.Text as T

import qualified CommonType as CT

data System = System
  { sIssues :: [(Id, Issue)]
  , sTypes :: [(Id, Type)]
  } deriving Eq

data Issue = Issue
  { iName :: TextData
  , iDesc :: TextData
  , iType :: Ref
  , iState :: State
  , iDiscoverCommit :: Commit
  , iFixCommit :: Commit
  , iComments :: [(Id, TextData)]
  } deriving Eq

data Type = Type
  { tName :: TextData
  , tDesc :: TextData
  } deriving Eq

data Ref
  = CorrectRef CT.Ref
  | IncorrectRef TextData
  deriving Eq

data Id
  = CorrectId CT.Id
  | IncorrectId TextData
  deriving Eq

data State
  = CorrectState CT.State
  | IncorrectState TextData
  deriving Eq

data Commit
  = CorrectCommit CT.Commit
  | IncorrectCommit TextData
  deriving Eq

data TextData
  = CorrectTextData T.Text
  | IncorrectTextData B.ByteString
  deriving Eq
