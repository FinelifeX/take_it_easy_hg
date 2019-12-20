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

getRight :: Cell -> Integer
getRight c = right $ lines c

getLeft :: Cell -> Integer
getLeft c = left $ lines c

-- Next three functions return position of the next cell in each direction
getNextCellDown :: Cell -> Integer
getNextCellDown c = b $ neighbors c

getNextCellRightBottom :: Cell -> Integer
getNextCellRightBottom c = rb $ neighbors c

getNextCellLeftBottom :: Cell -> Integer
getNextCellLeftBottom c = lb $ neighbors c

-- Score counting algorithms
-- From top to bottom
countDown :: Field -> Integer -> Integer -> Integer -> Integer
countDown _ center acc (-1) = center * acc
countDown f center acc pos  =
  if getCenter (getCell f pos) /= center
  then countDown f 0 0 (-1)
  else countDown f center (acc+1) (getNextCellDown (getCell f pos))

-- From up-right to down-left
countLeft :: Field -> Integer -> Integer -> Integer -> Integer
countLeft _ left acc (-1) = left * acc
countLeft f left acc pos = 
  if getLeft (getCell f pos) /= left
  then countLeft f 0 0 (-1)
  else countLeft f left (acc + 1) (getNextCellLeftBottom $ getCell f pos)

-- From up-left to down-right
countRight :: Field -> Integer -> Integer -> Integer -> Integer
countRight _ right acc (-1) = right * acc
countRight f right acc pos = 
  if getRight (getCell f pos) /= right
  then countRight f 0 0 (-1)
  else countRight f right (acc + 1) (getNextCellRightBottom $ getCell f pos)

-- Addition of all countings
countScoreCenter :: Field -> Integer
countScoreCenter f =
    countDown f (getCenter $ getCell f 0) 0 0
  + countDown f (getCenter $ getCell f 1) 0 1
  + countDown f (getCenter $ getCell f 2) 0 2
  + countDown f (getCenter $ getCell f 4) 0 4
  + countDown f (getCenter $ getCell f 5) 0 5

countScoreLeft :: Field-> Integer
countScoreLeft f =
  countLeft f (getLeft $ getCell f 0) 0 0
  + countLeft f (getLeft $ getCell f 4) 0 4
  + countLeft f (getLeft $ getCell f 5) 0 5
  + countLeft f (getLeft $ getCell f 10) 0 10
  + countLeft f (getLeft $ getCell f 15) 0 15

countScoreRight :: Field -> Integer
countScoreRight f =
  countRight f (getRight $ getCell f 0) 0 0
  + countRight f (getRight $ getCell f 2) 0 2
  + countRight f (getRight $ getCell f 1) 0 1
  + countRight f (getRight $ getCell f 6) 0 6
  + countRight f (getRight $ getCell f 11) 0 11

-- Returning final result
countCurrentScore :: Field -> Integer
countCurrentScore f =
  countScoreCenter f
  + countScoreLeft f
  + countScoreRight f



