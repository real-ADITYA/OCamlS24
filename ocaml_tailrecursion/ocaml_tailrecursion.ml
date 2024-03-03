(*  Aditya Eswaran
    OCaml Tail Recursion [Feb. 8] Lecture Examples / More Practice *)

(* The easiest example is factorial, where the function has a recursive call at the tail. *)
let rec fact n =
  if n = 0 then 1
  else n * fact (n-1)
;;

(* The implementation above can easily cause errors, so we use a helper function. *)
let fact n =
  let rec fact_helper n acc =
    (* 2. When n equals 0, just return the accumulator since it already has the multiplied value. *)
    if n = 0 then
      acc
    (* 1. When n doesnt equal 0, keep multiplying the next number * the accumulator (goes down until it hits 0). *)
    else
      fact_helper (n-1) n*acc
(* fact calls on fact_helper with n and base case of 1. *)
in fact_helper n 1;;

(* fold_left is tail-recursive, while fold_right is NOT. *)
let rec fold_left f a l =
  match l with
    [] -> a
  | h::t -> fold_left f (f a h) t

  let rec fold_right f l a =
    match l with
      [] -> a
    | h::t -> f h (fold_right f t a)