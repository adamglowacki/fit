{-# LANGUAGE StrictData #-}

module RealParser.Internal where

import qualified Control.Monad as CM
import qualified Data.ByteString as B
import qualified Data.Map.Strict as M
import qualified Data.Text as T

import qualified CommonType as COMMON
import qualified RawType as RAW
import qualified RealType as REAL

data FromRawCbs m = FromRawCbs
  { fixIssueId :: REAL.Issue -> RAW.TextData -> m COMMON.Id
  , fixDuplicateIssueId :: REAL.Issue -> REAL.Issue -> COMMON.Id -> m COMMON.Id
  , fixIssueName :: RAW.Issue -> RAW.TextData -> m T.Text
  , fixTypeId :: REAL.Type -> RAW.TextData -> m COMMON.Id
  , fixDuplicateTypeId :: REAL.Type -> REAL.Type -> COMMON.Id -> m COMMON.Id
  , fixTypeName :: RAW.Type -> B.ByteString -> m T.Text
  , fixTypeDesc :: RAW.Type -> B.ByteString -> m T.Text
  }

fromRawSystem :: Monad m => RAW.System -> FromRawCbs m -> m REAL.System
fromRawSystem rawSystem cbs = do
    types <- getTypes
    issues <- getIssues types
    return $ REAL.System issues types
  where
    getTypes = CM.foldM addType M.empty (RAW.sTypes rawSystem)
    getIssues types = CM.foldM (addIssue types) M.empty (RAW.sIssues rawSystem)
    addType typeMap (typeId, rawType) = do
      realType <- fromRawType rawType cbs
      addType' typeMap typeId realType
    addType' typeMap (RAW.IncorrectId text) realType = do
      correctId <- fixTypeId cbs realType text
      addType' typeMap (RAW.CorrectId correctId) realType
    addType' typeMap (RAW.CorrectId typeId) realType =
      case M.lookup typeId typeMap of
        Nothing -> return (M.insert typeId realType typeMap)
        Just prevType -> do
          anotherId <- fixDuplicateTypeId cbs realType prevType typeId
          addType' typeMap (RAW.CorrectId anotherId) realType
    addIssue types issueMap (issueId, rawIssue) = do
      realIssue <- fromRawIssue rawIssue types cbs
      addIssue' issueMap issueId realIssue
    addIssue' issueMap (RAW.IncorrectId text) realIssue = do
      correctId <- fixIssueId cbs realIssue text
      addIssue' issueMap (RAW.CorrectId correctId) realIssue
    addIssue' issueMap (RAW.CorrectId issueId) realIssue =
      case M.lookup issueId issueMap of
        Nothing -> return (M.insert issueId realIssue issueMap)
        Just prevIssue -> do
          anotherId <- fixDuplicateIssueId cbs realIssue prevIssue issueId
          addIssue' issueMap (RAW.CorrectId anotherId) realIssue

fromRawIssue :: Monad m => RAW.Issue -> M.Map COMMON.Id REAL.Type
             -> FromRawCbs m -> m REAL.Issue
fromRawIssue typeMap rawIssue cbs = do
    name <- getName
    desc <- getDesc
    issueType <- getType
    state <- getState
    discoverCommit <- getDiscoverCommit
    fixCommit <- getFixCommit
    comments <- getComments
    return REAL.Issue
             { REAL.iName = name
             , REAL.iDesc = desc
             , REAL.iType = issueType
             , REAL.iState = state
             , REAL.iDiscoverCommit = discoverCommit
             , REAL.iFixCommit = fixCommit
             , REAL.iComments = comments
             }
  where
    getName = undefined
    getDesc = undefined
    getType = undefined
    getState = undefined
    getDiscoverCommit = undefined
    getFixCommit = undefined
    getComments = undefined

fromRawType :: Monad m => RAW.Type -> FromRawCbs m -> m REAL.Type
fromRawType rawType cbs = REAL.Type <$> getName <*> getDesc
  where
    getName =
      case RAW.tName rawType of
        RAW.CorrectTextData text -> return text
        RAW.IncorrectTextData bs -> fixTypeName cbs rawType bs
    getDesc =
      case RAW.tDesc rawType of
        RAW.CorrectTextData text -> return text
        RAW.IncorrectTextData bs -> fixTypeDesc cbs rawType bs
