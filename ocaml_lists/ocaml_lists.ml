(*  Aditya Eswaran
    OCaml Lists [Feb.1] Practice Examples. *)

(* Computes the sum of all the elements in the list. *)
let rec sum lst =
  match lst with
  | [] -> 0
  | (h::t) -> h + sum t
;;

(* Negates the integer elements in the list. *)
let rec neg lst =
  match lst with
  | [] -> []
  | (h::t) -> (-h):: neg t
;;

(* Gets the last element in the list. *)
let rec last lst =
  match lst with
  | [t_element] -> t_element
  | (_::t) -> last t
;;

(* Appends two lists (lst and olst). *)
let rec append lst olst =
  match lst with
  | [] -> olst
  | (h::t) -> h::(append t olst)
;;

(* Reverses the list. *)
let rec rev lst =
  match lst with
  | [] -> []
  | (h::t) -> append (rev t) (h::[])
;;

(* A better way to reverse the list using a helper function. *)
let rec rev_helper lst acc =
  match lst with
  | [] -> acc
  | (h::t) -> rev_helper (t) (h::acc)
;;

let rev lst = rev_helper lst [];;

