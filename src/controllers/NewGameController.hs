module Controllers.NewGameController (newGame) where
--
import Datas

import Servant.Server.Internal.Handler
--
emptyLines :: Lines
emptyLines = Lines 0 0 0

--cells' :: [Cell]
--cells' = generate [] 0 0 where
--  generate list 24 _  = list
--  generate list acc index =
--    if acc == 0 || acc == 1 || acc == 3 || acc == 4 || acc == 20 || acc == 24
--    then (Cell (-1) emptyLines) : generate list (acc + 1) index
--    else (Cell index emptyLines) : generate list (acc + 1) (index + 1)

cells' :: [Cell]
cells' = [
             (Cell (-1) (Neighbors (-1) (-1) (-1) (-1) (-1) (-1)) emptyLines),
             (Cell (-1) (Neighbors (-1) (-1) (-1) (-1) (-1) (-1)) emptyLines),
             (Cell (0) (Neighbors (-1) (3) (-1) (2) (-1) (4)) emptyLines),
             (Cell (-1) (Neighbors (-1) (-1) (-1) (-1) (-1) (-1)) emptyLines),
             (Cell (-1) (Neighbors (-1) (-1) (-1) (-1) (-1) (-1)) emptyLines),
             (Cell (1) (Neighbors (-1) (6) (2) (-1) (-1) (7)) emptyLines),
             (Cell (2) (Neighbors (-1) (7) (-1) (1) (-1) (3)) emptyLines),
             (Cell (3) (Neighbors (0) (8) (4) (7) (2) (9)) emptyLines),
             (Cell (4) (Neighbors (-1) (9) (-1) (3) (0) (5)) emptyLines),
             (Cell (5) (Neighbors (-1) (10) (-1) (9) (4) (-1)) emptyLines),
             (Cell (6) (Neighbors (1) (11) (7) (-1) (-1) (12)) emptyLines),
             (Cell (7) (Neighbors (2) (12) (3) (6) (1) (8)) emptyLines),
             (Cell (8) (Neighbors (3) (13) (9) (12) (7) (14)) emptyLines),
             (Cell (9) (Neighbors (4) (14) (5) (8) (3) (10)) emptyLines),
             (Cell (10) (Neighbors (5) (15) (-1) (14) (9) (-1)) emptyLines),
             (Cell (11) (Neighbors (6) (-1) (12) (-1) (-1) (16)) emptyLines),
             (Cell (12) (Neighbors (7) (16) (8) (11) (6) (13)) emptyLines),
             (Cell (13) (Neighbors (8) (17) (14) (16) (12) (18)) emptyLines),
             (Cell (14) (Neighbors (9) (18) (10) (13) (8) (15)) emptyLines),
             (Cell (15) (Neighbors (10) (-1) (-1) (18) (14) (-1)) emptyLines),
             (Cell (-1) (Neighbors (-1) (-1) (-1) (-1) (-1) (-1)) emptyLines),
             (Cell (16) (Neighbors (12) (-1) (13) (-1) (11) (17)) emptyLines),
             (Cell (17) (Neighbors (13) (-1) (18) (-1) (16) (-1)) emptyLines),
             (Cell (18) (Neighbors (14) (-1) (15) (17) (13) (-1)) emptyLines),
             (Cell (-1) (Neighbors (-1) (-1) (-1) (-1) (-1) (-1)) emptyLines)
         ]

newGame :: Field
newGame = Field cells'

