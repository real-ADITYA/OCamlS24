(*  Aditya Eswaran
    Imperative OCaml [Feb. 15] Lecture Examples / More Practice *)

(* References *)
  (* Normally set x to 5. *)
  let x = 5;

  (* Set y to the ref of x, (int ref = {contents = 5}). *)
  let y = ref x;;

  (* Set z to y, (int ref = {contents = 5}). *)
  let z = y;;

  (* Change the value at the ref. *)
  z := 23;;

  (* When we check the value of y, (int = 23). *)
  !y;;

  (* We notice that the value of x has not changed. (int = 5) *)
  x;;

(* Implementing a counter. *)
  (* counter : int ref = {contents = 0} *)
  let counter = ref 0;;

  (* Creating a next function that increases the counter by 1 (val next : unit -> int = <fun>). *)
  let next () =
    counter := !counter + 1;
    !counter
  ;;
  
  (* When we call next () [next is the function name and () is a unit], it iterates counter by 1 and returns the value. *)
  next ();;

  (* To combine everything, we can write this: *)
  let next = 
    let counter = ref 0 in
      fun () -> counter := !counter + 1; !counter
  ;;

(* When comparing elements, we can use the following: *)
  x = [1;2;3];;
  y = [1;2;3];;

  (* The following are true: *)
  x = y;;
  x != y;;

  (* The following are false: *)
  x <> y;;
  x == y;;