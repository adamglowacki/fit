{-# LANGUAGE StrictData #-}

module RealType where

import qualified Data.Map.Strict as M
import qualified Data.Text as T

import qualified CommonType as CT

data System = System
  { sIssues :: M.Map CT.Id Issue
  , sTypes :: M.Map CT.Id Type
  } deriving Eq

data Issue = Issue
  { iName :: T.Text
  , iDesc :: T.Text
  , iType :: CT.Ref
  , iState :: CT.State
  , iDiscoverCommit :: CT.Commit
  , iFixCommit :: CT.Commit
  , iComments :: M.Map CT.Id T.Text
  } deriving Eq

data Type = Type
  { tName :: T.Text
  , tDesc :: T.Text
  } deriving Eq
