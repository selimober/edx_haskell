import Prelude hiding ((||))
safetail xs
    | null xs = []
    | otherwise = tail xs

False || b = b
True || _ = True

True ab False = False
