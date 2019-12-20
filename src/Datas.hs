{-# LANGUAGE DeriveGeneric #-}
--
module Datas where
--
import qualified Data.Aeson.Parser
import Data.Aeson.Types
import GHC.Generics
--
data Field = Field
  { cells :: [Cell]
  } deriving (Eq, Show, Generic)

data Cell = Cell
  { position :: Integer
  , neighbors :: Neighbors
  , lines :: Lines
  } deriving (Eq, Show, Generic)

data Lines = Lines
  { center :: Integer
  , left :: Integer
  , right :: Integer
  } deriving (Eq, Show, Generic)

data Neighbors = Neighbors
  { t  :: Integer
  , b  :: Integer
  , lt :: Integer
  , lb :: Integer
  , rt :: Integer
  , rb :: Integer
  } deriving (Eq, Show, Generic)

instance ToJSON Field
instance FromJSON Field

instance ToJSON Cell
instance FromJSON Cell

instance ToJSON Lines
instance FromJSON Lines

instance ToJSON Neighbors
instance FromJSON Neighbors
