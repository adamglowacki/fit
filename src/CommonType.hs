{-# LANGUAGE StrictData #-}

module CommonType where

import Data.Word

data Issue = Issue
  { iTitle :: String
  , iDesc :: String
  , iType :: Type
  , iAuthor :: Coder
  , iAssignedTo :: Maybe Coder
  , iSeverity :: Maybe Severity
  , iState :: State
  , iDiscoverVersion :: Maybe Version
  , iDiscoverCommit :: Maybe CommitId
  , iFixVersion :: Maybe Version
  , iFixCommit :: Maybe CommitId
  , iComments :: [Comment]
  } deriving (Eq, Show)

data Comment = Comment
  { cmAuthor :: Coder
  , cmText :: String
  } deriving (Eq, Show)

newtype Type = Type
  { tName :: String
  } deriving (Eq, Show)

data Coder = Coder
  { cdName :: String
  , cdEmail :: String
  , cdDesc :: String
  } deriving (Eq, Show)

data Severity = Severity
  { svName :: String
  , svPriority :: Integer
  } deriving (Eq, Show)

data Version = Version
  { vName :: String
  , vNumber1 :: Integer
  , vNumber2 :: Integer
  , vNumber3 :: Integer
  , vNumber4 :: Integer
  } deriving (Eq, Show)

data State
  = StateOpen
  | StateClose
  | StatedReopen
  deriving (Eq, Show)

data Ref = Ref Word64 | RefDummy deriving (Eq, Show)

newtype CommitId = CommitId String deriving (Eq, Show)
