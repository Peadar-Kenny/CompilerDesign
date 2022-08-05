let multiply = fun a -> fun b -> a*b in
let divide = fun a -> fun b -> a/b in 
let subtract = fun a -> fun b -> a-b in
multiply (divide (subtract 10 2) subtract(4 2)) (multiply 5 3)