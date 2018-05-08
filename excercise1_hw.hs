{-# LANGUAGE OverloadedStrings #-}
import CodeWorld

botCircle :: Color -> Picture
botCircle c = colored c (translated 0 (-2.5) (solidCircle 1))

midCircle :: Color -> Picture
midCircle c = colored c (translated 0 0 (solidCircle 1))

topCircle :: Color -> Picture
topCircle c = colored c (translated 0 2.5 (solidCircle 1))

frame :: Picture
frame = rectangle 2.5 7.5

trafficLight :: Int -> Picture
trafficLight 0 = botCircle green & midCircle black & topCircle black & frame
trafficLight 1 = botCircle black & midCircle yellow & topCircle black & frame
trafficLight 2 = botCircle black & midCircle black & topCircle red & frame

trafficController :: Double -> Picture
trafficController t 
  | round (t/3) `mod` 2 == 0 = trafficLight 0
  | otherwise                = trafficLight 1

main :: IO ()
main = animationOf trafficController
