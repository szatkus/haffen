module Paths_haffen (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName
  ) where

import Data.Version (Version(..))
import System.Environment (getEnv)

version :: Version
version = Version {versionBranch = [0,0,0], versionTags = []}

bindir, libdir, datadir, libexecdir :: FilePath

bindir     = "/home/szatkus/.cabal/bin"
libdir     = "/home/szatkus/.cabal/lib/haffen-0.0.0/ghc-7.0.3"
datadir    = "/home/szatkus/.cabal/share/haffen-0.0.0"
libexecdir = "/home/szatkus/.cabal/libexec"

getBinDir, getLibDir, getDataDir, getLibexecDir :: IO FilePath
getBinDir = catch (getEnv "haffen_bindir") (\_ -> return bindir)
getLibDir = catch (getEnv "haffen_libdir") (\_ -> return libdir)
getDataDir = catch (getEnv "haffen_datadir") (\_ -> return datadir)
getLibexecDir = catch (getEnv "haffen_libexecdir") (\_ -> return libexecdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
