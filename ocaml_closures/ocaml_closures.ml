(*  Aditya Eswaran
    OCaml Currying & Closures [Feb. 13] Lecture Examples / More Practice *)

(* When we enter any number, it will RETURN a function based on the input. *)
  (* This is one logical implementation. *)
  let pick_num n =
    if n > 0 then (fun x -> x + 3) else (fun x -> x + 4);;

  (* Alternate Implementation *)
  let pick_num_alt n =
    (fun x -> if n > 0 then x+3 else x+4);;

(* Add function  (int -> int -> int -> int = <fun>), which takes in 3 integers and returns 1 integer. *)
let add x y z = x + y + z;;

    (* If we only give a value for x, then (int -> int -> int = <fun>). *)
    add 10;;

    (* If we only give two values, then (int -> int = <fun>). *)
    let two_vars = add 10 20;;

    (* We call this function on another number since two_vars is a (int -> int = <fun>). THIS IS CURRYING(!) *)
    two_vars 30;;

    (* CURRYING allows us to only pass a portion of the arguments to return another function. *)

(* These two functions are equal. *)
let g lst = List.fold_left (+) 0 lst;;
let g_alt = List.fold_left (+) 0;;

(* We can use the g_alt function by inserting a list since it is (int list -> int = <fun>). *)
g_alt [1;2;3;4];;

(* ============================================================================================================ *)

(* Closure is using the idea of functions being returned and knowing what variables are used where. *)
  (* The mult_sum function has: (int * int -> int -> int = <fun>), taking in a tuple and an int to return an int. *)
  let mult_sum (x, y) =
    let z = x + y in
      fun w -> w*z;;

  (* When we just give it a tuple, it will return a function (fun w -> w * z), where z already has a value.*)
  mult_sum (5, 6);;

  (* This will return an int because of currying. The code in the parenthesis will evaluate to a function run on 8. *)
  (mult_sum (5, 6)) 8;;