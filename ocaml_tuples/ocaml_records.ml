(*  Aditya Eswaran
    OCaml Records [Feb. 6] Lecture Examples / More Practice *)

(* Creating a record following the MM/DD/YYYY format. *)
type date = {month:string ; day:int ; year:int};;

  (* Using our newly created record: *)
  let todays_date = {month="March" ; day=3 ; year=2024};;

  (* Accessing fields: *)
  todays_date.month;;

  (* To dissect the record, you can use the let keyword. This adds the year and the day. *)
  let {year; day; month} = todays_date in day + year;;

  (* This takes today's date and finds your age if you were born in 2004. *)
  let {year} = todays_date in (year - 2004);;