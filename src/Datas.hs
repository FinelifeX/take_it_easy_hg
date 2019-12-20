-- In this file there are all type descriptions
{-# LANGUAGE DeriveGeneric #-}
--
module Datas where
--
import qualified Data.Aeson.Parser
import Data.Aeson.Types
import GHC.Generics
--
-- Type for a field
data Field = Field
  { cells :: [Cell]
  } deriving (Eq, Show, Generic)

-- Type for a game cell
data Cell = Cell
  { position :: Integer
  , neighbors :: Neighbors
  , lines :: Lines
  } deriving (Eq, Show, Generic)

-- Type for three lines in each direction
data Lines = Lines
  { center :: Integer
  , left :: Integer
  , right :: Integer
  } deriving (Eq, Show, Generic)

-- This type describes neighbors touching in each direction
data Neighbors = Neighbors
  { t  :: Integer
  , b  :: Integer
  , lt :: Integer
  , lb :: Integer
  , rt :: Integer
  , rb :: Integer
  } deriving (Eq, Show, Generic)

-- Instance definition for Aeson to parse json to types and vise versa
instance ToJSON Field
instance FromJSON Field

instance ToJSON Cell
instance FromJSON Cell

instance ToJSON Lines
instance FromJSON Lines

instance ToJSON Neighbors
instance FromJSON Neighbors
