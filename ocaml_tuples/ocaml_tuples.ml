(*  Aditya Eswaran
    OCaml Tuples [Feb. 6] Lecture Examples / More Practice *)

(* Pattern matching with tuples the normal way. Below this function is the simplified way. *)
let sumof3 tup =
  match tup with
  | (x, y, z) -> x + y + z
;;

let sumof3_alt (x, y, z) = x + y + z;;

(* Adds 1 to every element in the tuple. *)
let incr1 tup =
  match tup with
  | (x, y, z) -> (x+1, y+1, z+1)
;;

(* Only increments the first two values in the tuple. This function returns only those two values in a tuple. *)
let incr_first2 tup =
  match tup with
  | (a::b::_, adder) -> (a+adder, b+adder)