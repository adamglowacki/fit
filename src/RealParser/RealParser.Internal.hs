{-# LANGUAGE StrictData #-}

module RealParser.Internal where

import qualified Data.ByteString as B
import qualified Data.Text as T

import qualified CommonType as COMMON
import qualified RawType as RAW
import qualified RealType as REAL

data FromRawCbs m = FromRawCbs
  { fixRawIssueId :: RAW.Issue -> RAW.TextData -> m T.Text
  , fixRawDuplicateIssueId :: RAW.Issue -> RAW.Issue -> COMMON.Id -> m COMMON.Id
  , fixRawIssueName :: RAW.Issue -> RAW.TextData -> m T.Text
  , fixRawTypeId :: RAW.Type -> RAW.TextData -> m T.Text
  , fixRawDuplicateTypeId :: RAW.Type -> RAW.Type -> COMMON.Id -> m COMMON.Id
  , fixRawTypeName :: RAW.Type -> B.ByteString -> m T.Text
  , fixRawTypeDesc :: RAW.Type -> B.ByteString -> m T.Text
  }

fromRawSystem :: Monad m => RAW.System -> FromRawCbs m -> m REAL.System
fromRawSystem = undefined

fromRawIssue :: Monad m => RAW.Issue -> FromRawCbs m -> m REAL.Issue
fromRawIssue = undefined

fromRawType :: Monad m => RAW.Type -> FromRawCbs m -> m REAL.Type
fromRawType rawType cbs = REAL.Type <$> getName <*> getDesc
  where
    getName =
      case RAW.tName rawType of
        RAW.CorrectTextData text -> return text
        RAW.IncorrectTextData bs -> fixRawTypeName cbs rawType bs
    getDesc = undefined
