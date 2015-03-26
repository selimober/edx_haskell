ss = sum' 0
    where
        sum' v [] = v
        sum' v (x:xs) = sum'(v+x) xs
