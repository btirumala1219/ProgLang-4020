bubble (x:y:ys)
  | x > y = (y : fst (bubble (x:ys)), True)
  | otherwise = (x : fst yys, snd yys)
  where
    yys = bubble (y:ys)
bubble x = (x, False)
bubblesort xs
  | snd bxs = bubblesort (fst bxs)
  | otherwise = fst bxs
  where
    bxs = bubble xs
