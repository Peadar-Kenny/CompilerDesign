let divide = fun a -> fun b -> a/b in 
let subtract = fun a -> fun b -> a-b in
divide (subtract 8 2) (subtract 6 3)