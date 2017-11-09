{-# LANGUAGE StrictData #-}

module FileName where

-- TOP DIRECTORY
issueDir, typeDir :: String
issueDir = "issue"
typeDir = "type"

nextIdFile :: String
nextIdFile = ".next-id"

-- ISSUE
issueTitleFile, issueDescFile, issueTypeFile, issueStateFile :: String
issueTitleFile = "title"
issueDescFile = "description"
issueTypeFile = "type"
issueStateFile = "state"

issueDiscoverCommitFile, issueFixCommitFile :: String
issueDiscoverCommitFile = "discover-commit"
issueFixCommitFile = "fix-commit"

issueCommentDir :: String
issueCommentDir = "comment"

-- ISSUE/COMMENT
issueCommentTextFile :: String
issueCommentTextFile = "text"

-- TYPE
typeNameFile, typeDescFile :: String
typeNameFile = "name"
typeDescFile = "description"
