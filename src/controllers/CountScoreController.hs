-- This controller implements score counting algorithm
module Controllers.CountScoreController ( countCurrentScore ) where

import Datas
import Prelude hiding ( lines )

-- Getting a cell from Field type
getCell :: Field -> Integer -> Cell
getCell f pos = [cell | cell <- (cells f), (position cell) == pos]!!0

-- These functions return values of lines
getCenter :: Cell -> Integer
getCenter c = center $ lines c

-- Next three functions return position of the next cell in each direction
getNextCellDown :: Cell -> Integer
getNextCellDown c = b $ neighbors c

-- Score counting algorithms
-- From top to bottom
countDown :: Field -> Integer -> Integer -> Integer -> Integer
countDown _ center acc (-1) = center * acc
countDown f center acc pos  =
  if getCenter (getCell f pos) /= center
  then countDown f 0 0 (-1)
  else countDown f center (acc+1) (getNextCellDown (getCell f pos))

-- Addition of all countings
countScoreCenter :: Field -> Integer
countScoreCenter f =
    countDown f (getCenter $ getCell f 0) 0 0
  + countDown f (getCenter $ getCell f 1) 0 1
  + countDown f (getCenter $ getCell f 2) 0 2
  + countDown f (getCenter $ getCell f 4) 0 4
  + countDown f (getCenter $ getCell f 5) 0 5

-- Returning final result
countCurrentScore :: Field -> Integer
countCurrentScore f =
  countScoreCenter f
