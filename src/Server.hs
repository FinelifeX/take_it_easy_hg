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
import Data.Text.Lazy ( Text, pack )

import Middlewares
--
-- Route mapping
Server.hs:
type ServerAPI =
        Get '[JSON] Text
   :<|> "new_game" :> Get '[JSON] Field
   :<|> "get_cells" :> Get '[JSON] [Lines]
--
-- Route handlers
serverRoutes :: Server ServerAPI
serverRoutes =
        home
   :<|> startNewGame
   :<|> return getCells
  where
    home = return "Hello from Home"
    startNewGame = return newGame


-- Server initialization
serverProxy :: Proxy ServerAPI
serverProxy = Proxy

router :: Application
router = serve serverProxy serverRoutes

startServer :: IO ()
startServer = run 3000 $ allowCsrf . corsified $ router