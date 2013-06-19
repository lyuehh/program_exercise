rev [] = []
rev xs = last xs : rev (init xs)
