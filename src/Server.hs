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
type ServerAPI =
        Get '[JSON] Text
--
-- Route handlers
serverRoutes :: Server ServerAPI
serverRoutes =
        home
   where
    home = return "Hello from Home"


-- Server initialization
serverProxy :: Proxy ServerAPI
serverProxy = Proxy

router :: Application
router = serve serverProxy serverRoutes

startServer :: IO ()
startServer = run 3000 $ allowCsrf . corsified $ router