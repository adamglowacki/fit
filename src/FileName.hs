{-# LANGUAGE StrictData #-}

module FileName where

-- TOP DIRECTORY
issueDir, typeDir, coderDir, severityDir, versionDir :: String
issueDir = "issue"
typeDir = "type"
coderDir = "coder"
severityDir = "severity"
versionDir = "version"

nextRefFile :: String
nextRefFile = ".next-ref"

-- ISSUE
issueTitleFile, issueDescFile, issueTypeFile, issueAuthorFile :: String
issueTitleFile = "title"
issueDescFile = "description"
issueTypeFile = "type"
issueAuthorFile = "author"

issueAssignedToFile, issueSeverityFile, issueStateFile :: String
issueAssignedToFile = "assigned-to"
issueSeverityFile = "severity"
issueStateFile = "state"

issueDiscoverVersionFile, issueDiscoverCommitFile :: String
issueDiscoverVersionFile = "discover-version"
issueDiscoverCommitFile = "discover-commit"

issueFixVersionFile, issueFixCommitFile :: String
issueFixVersionFile = "fix-version"
issueFixCommitFile = "fix-commit"

issueCommentDir :: String
issueCommentDir = "comment"

-- ISSUE/COMMENT
issueCommentAuthorFile, issueCommentTextFile :: String
issueCommentAuthorFile = "author"
issueCommentTextFile = "text"

-- TYPE
typeNameFile :: String
typeNameFile = "name"

-- CODER
coderNameFile, coderEmailFile, coderDescFile :: String
coderNameFile = "name"
coderEmailFile = "email"
coderDescFile = "description"

-- SEVERITY
severityNameFile, severityPriorityFile :: String
severityNameFile = "name"
severityPriorityFile = "priority"

-- VERSION
versionName :: String
versionName = "name"

versionNumber1, versionNumber2, versionNumber3, versionNumber4 :: String
versionNumber1 = "number1"
versionNumber2 = "number2"
versionNumber3 = "number3"
versionNumber4 = "number4"

-- PROJECT
projectNameFile, projectDescFile :: String
projectNameFile = "name"
projectDescFile = "description"
