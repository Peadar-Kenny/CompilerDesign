let multiply = fun x -> fun y -> x * y in
let add = fun x -> fun y -> x + y in
multiply (add 3 2) (add 2 1)