module Controllers.GetCellsController ( getCells ) where

import Datas

getCells :: [Lines]
getCells = [(Lines x y z) | x <- [1,5,9], y <- [2,6,7], z <- [3,4,8]]