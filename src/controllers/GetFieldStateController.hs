-- This controller returns current field state.
-- It reads .json file and parses it into a Field type and returns to route handler
{-# LANGUAGE BlockArguments #-}

module Controllers.GetFieldStateController ( getFieldState ) where
--
import qualified Data.ByteString as B
import Control.Monad.IO.Class ( liftIO )
import           Data.Aeson
import           Datas
--

getField :: IO Field
getField = do
  rawJSON <- B.readFile "grids/1_field.json"
  let result = decodeStrict rawJSON
  return $ case result of
    Nothing    -> Field [Cell (-1) (Neighbors (-1) (-1) (-1) (-1) (-1) (-1)) (Lines 0 0 0)]
    Just field -> field

getFieldState :: IO Field
getFieldState = do
  field <- getField
  return field