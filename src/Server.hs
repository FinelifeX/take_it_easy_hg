-- Main server file
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE FlexibleInstances #-}

module Server ( startServer ) where
--
-- Libraries import
import Servant
import Network.Wai
import Network.Wai.Handler.Warp
import Network.Wai.Middleware.Cors
import Data.Text.Lazy ( Text, pack )
import Control.Monad.IO.Class ( liftIO )

-- Custom modules import
import Datas
import Controllers.NewGameController ( newGame )
import Controllers.UpdateGridController ( updateGrid, respond )
import Controllers.GetCellsController ( getCells )
import Controllers.GetFieldStateController ( getFieldState )
import Controllers.CountScoreController ( countCurrentScore )
import Middlewares
--
-- Route mapping
type ServerAPI =
        Get '[JSON] Text
   :<|> "new_game" :> Get '[JSON] Field
   :<|> "get_cells" :> Get '[JSON] [Lines]
   :<|> "update_grid" :> ReqBody '[JSON] Field :> Post '[JSON] Text
   :<|> "get_field_state" :> Post '[JSON] Field
   :<|> "get_current_score" :> ReqBody '[JSON] Field :> Post '[JSON] Integer
--
-- Route handlers
serverRoutes :: Server ServerAPI
serverRoutes =
        home
   :<|> startNewGame
   :<|> return getCells
   :<|> update
   :<|> fieldState
   :<|> countScore
   where
    home = return "Hello from Home"
    startNewGame = return newGame
    update field = do
      liftIO $ updateGrid field
      return respond
    fieldState = do
          liftIO $ getFieldState
      >>= return
    countScore f = return $ countCurrentScore f


-- Server initialization
serverProxy :: Proxy ServerAPI
serverProxy = Proxy

router :: Application
router = serve serverProxy serverRoutes

startServer :: IO ()
startServer = run 3000 $ allowCsrf . corsified $ router