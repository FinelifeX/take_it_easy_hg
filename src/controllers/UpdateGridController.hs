-- This controller updates current field state by saving it into a .json file.
-- That made for not loosing game state after refreshing page.
module Controllers.UpdateGridController ( updateGrid, respond ) where

import GHC.Generics
import Data.Text.Lazy.IO as I
import Data.Aeson.Text (encodeToLazyText)
import Data.Text.Lazy ( Text, pack )
import Datas

currentUser :: String
currentUser = "1_"

updateGrid :: Field -> IO ()
updateGrid field = I.writeFile ("grids/" ++ currentUser ++ "field.json") (encodeToLazyText field)

respond :: Text
respond = pack "Success"