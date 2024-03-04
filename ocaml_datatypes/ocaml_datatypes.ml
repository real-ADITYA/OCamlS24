(*  Aditya Eswaran
    OCaml Datatypes [Feb. 13] Lecture Examples / More Practice *)

(* Creating a type shape below: *)
type shape =
| Rectangle of float * float
| Circle of float

(* Using the aforementioned shape in a method: *)
let area my_shape =
  match my_shape with
  | Rectangle (width, length) -> width *. length
  | Circle (radius) -> radius *. radius *. 3.14
;;

(* We can even make a shape list: *)
let my_shape_list = [Rectangle(3.1, 4.2); Circle 3.5]

(* The Option type is used when we want to account for a case that could cause an error like stack overflow *)
  (* In the case below, using option type avoids the divide by 0 error. *)
  let divide x y =
    if y <> 0 then
      Some (x/y)
    else
      None
  ;;

  (* In the case below, using option type avoids possible errors when translating a number to a string. *)
  let num_to_string number =
    match number with
    | Some num -> string_of_int num
    | None -> "invalid number input"
  ;;

(* We can take a binary tree as an example of recursive data types: *)
  (* Creating the type tree with Leaf and Node. *)
  type 'a tree =
  | Leaf
  | Node 'a tree * 'a * 'a tree

  (* Created a tree with root of 100, and the right node goes to 200. *)
  let tree = Node(Leaf, 100, Node(Leaf, 200, Leaf))

  (* Found the sum of the tree by recursively calling the sum on the nodes. *)
  let rec sum tree =
    match tree with
    | Leaf -> 0
    | Node(left, root, right) -> sum left + root + sum right

(* Side Note: OCaml Exceptions that are useful: *)
let divide x y =
  if y = 0 then
    failwith "why are you trying to divide by zero..."
  else
    x/y
;;