module Whispers (runLearning) where

import Data.List
import Data.Map (Map)
import qualified Data.Map as Map

runLearning :: IO ()
runLearning = putStrLn "someFunc"

data Point = Point Int Int
instance Eq Point where
    Point x1 y1 == Point x2 y2 = x1 == x2 && y1 == y2
instance Ord Point where
    Point x1 y1 <= Point x2 y2 = x1 <= x2 || y1 <= y2

data TileType = Mine | Empty | Eight | Seven | Six | Five | Four | Three | Two | One
instance Show TileType where
    show Mine = "*"
    show Empty = " "
    show Eight = "8"
    show Seven = "7"
    show Six = "6"
    show Five = "5"
    show Four = "4"
    show Three = "3"
    show Two = "2"
    show One = "1"

data Tile = Tile
    { explored :: Bool
    , tileType :: TileType 
    }

generateEmptyBoard :: Int -> Int -> Map Point Tile
generateEmptyBoard w h = Map.empty

buildBoard :: Int -> Int -> Int -> Map Point Tile
buildBoard width height mineNum = generateEmptyBoard width height