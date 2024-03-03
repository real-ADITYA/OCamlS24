(*  Aditya Eswaran
    OCaml Map & Fold [Feb. 8] Lecture Examples / More Practice *)

(* This uses the map function to multiply all the elements by 4. *)
List.map (fun x -> x * 4) [4; 8; 2];;

(* Using the map function, this returns a list that tells whether each element is a non-zero element. *)
List.map (fun x -> x <> 0) [4; 0; 33];;

(* Using fold_left, this computes the sum of all the elements in the list: *)
List.fold_left (+) 0 [4; 56; 87];;

(* To differentiate between fold_left and fold_right, the following can be used: *)
let list_elements = [10; 15; 5];;
let baseCase = 0;;

    (* Using fold_left, denoted as just fold in lecture, we get -30. (((baseCase-10)-15)-5)=-30 *)
    List.fold_left (fun x y -> x - y) baseCase list_elements;;
    List.fold_left (-) baseCase list_elements;;

    (* Using fold_right, we get 0. (10-(15-(5-baseCase)))=0 *)
    List.fold_right (fun x y -> x - y) list_elements baseCase;;
    List.fold_right (-) list_elements baseCase;;

(* Using fold, we can collect the even values in the list: *)
let even_fun acc element =
  if element mod 2 = 0 then
    element::acc
  else
    acc
;;
List.fold_left even_fun [] [4;5;6;7;8;9];;

(* We can use both map and fold in this function. Given a list with 3 seperate sublists, we can find the
   sum of each of the 3 lists and return a list of the sums. *)
List.map (List.fold_left (fun x y -> x + y) 0) [[3;4;5]; [5;6;7;8;9]; [8; 9]];;
