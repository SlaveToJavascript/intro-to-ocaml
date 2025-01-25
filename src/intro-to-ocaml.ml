open! Core

(* Exercise 01 *)
module Basic_types = struct
  let int_average x y =
    (* The compiler will normally complain if we have unused variables in our function. In
       order to get by this, we use the "ignore" function to tell the compiler that we
       expect these variables to be unused.

       Once you implement this function, the variables will no longer be unused, so you
       can delete the calls to "ignore". *)
    (x + y) / 2
    (* Float.of_int converts integer to float *)
  ;;

  let float_average x y =
    (x +. y) /. (2.)
  ;;

  (* Print the string "Hello, world!" *)
  let print () = printf "Hello, world!"
end

(* Exercise 02 *)
module Call_functions = struct
  (* Here are a few example functions. *)
  let half x   = x / 2
  let add  x y = x + y

  (* Try to write [average] by reusing [add] and [half], first ordering your
     function invocations using parentheses, then using let bindings. *)
  let average x y =
    half (add x y)
  ;;

  let average x y =
    let sum = add x y in
    half sum
  ;;
end

(* Exercise 03 *)
module Labeled_arguments = struct
  let divide ~numerator ~denominator = numerator / denominator
  (* returns an int *)

  (* Implement [modulo] using [divide].

     The [:_] after each labeled argument is another way to tell the compiler we expect
     these variables to be unused. You can delete these characters when writing your
     implementation. *)
  let modulo ~dividend:x ~divisor:y = x - ((divide ~numerator:x ~denominator:y) * y)
end

(* Exercise 04 *)
module Higher_order_functions = struct
  (* Write a function that adds 1 to an int. *)
  let add1 x =
    1 + x
  ;;

  (* Functions are "first class" in OCaml. This means that you can take a function
     and pass it around as an argument to other functions. We call functions that
     take other functions as arguments "higher order functions".

     Let's write a function named [twice], which will take a function as its first
     argument, and apply that function two times to its second argument.

     Hint: Remember that you can use parenthese or let bindings to order function
     calls. *)
  let twice f x =
    f (f x)
  ;;

  (* Take a second to look at the function signature for [twice] in the mli
     file. Note that the first argument of twice is a function, [f], which has
     type [int -> int]. We had to wrap its type in parentheses when representing
     it in the function signature.

     Now that we have [twice], try writing [add2] using [add1] and [twice].
  *)
  let add2 x =
    twice add1 x
  ;;
end

(* Exercise 05 *)
module Pattern_matching = struct
  (* Let's write our own pattern matching. Write a function that returns whether [x]
     is non-zero by matching on [x]. *)
  let non_zero x =
    match x with
    | 0 -> false
    | _ -> true
  ;;

  (* Now, write a function that returns true if [x] and [y] are both non-zero by
     matching on both of them at the same time. *)
  let both_non_zero x y =
    match non_zero x, non_zero y with
    | true, true -> true
    | _ -> false
  ;;

  (* Now, let's write a function to take the product of every number up to [x].

     Note: In OCaml, we need to denote recursive functions explicitly using the "rec"
     flag. *)
  let rec factorial x =
    assert (x >= 0);
    match x with
    | 0 | 1 -> 1
    | _ -> x * factorial(x-1)
  ;;
end

(* Exercise 06 *)
module List_matching = struct
  (* Write a function to add up the elements of a list by matching on it. *)
  let rec sum lst =
    match lst with
    | [] -> 0
    | head :: tail -> head + sum tail
  ;;
end

(* Exercise 07 *)
module Tuples = struct
  (* Write a function to get the first element of a tuple of length two. Remember to check
     the mli to see the type of this function. *)
  let first tuple =
    let element, _ = tuple in
    element
  ;;

  (* Write a function that computes the Manhattan distance
     (https://www.omnicalculator.com/math/manhattan-distance#what-is-the-manhattan-distance)
     between two 3-dimensional coordinates.

     (Hint: you can use the [abs] function to get the absolute value of an int) *)
  let manhattan_distance coord1 coord2 =
    let (x1, y1, z1) = coord1 in
    let (x2, y2, z2) = coord2 in
    let d = abs(x1 - x2) + abs(y1 - y2) + abs(z1 - z2) in
    d
  ;;
end

(* Exercise 08 *)
module Variants = struct
  type card_value =
    | Ace
    | King
    | Queen
    | Jack
    | Number of int
  [@@deriving sexp]

  (* Write a function that computes the score of a card (aces should score 11
     and face cards should score 10). *)
  let card_value_to_score card_value =
    match card_value with
    | Ace -> 11
    | King | Queen | Jack -> 10
    | Number x -> x
  ;;
end

(* Exercise 09 *)
module Option_variants = struct
  (* Implement the function [safe_divide ~dividend ~divisor], which takes two
     [int]s and returns an [int option]. It should return [None] if [divisor = 0],
     and otherwise return [Some x] where [x] is the division result *)
  let safe_divide ~dividend ~divisor =
    match divisor with
    | 0 -> None
    | _ -> Some (dividend / divisor)
  ;;

  (* Implement a function [option_concatenate], which takes two [string option]s and
     returns a [string option] that is:

     - [Some x], where x is the concatenation of the two strings, if they both exist

     - [None] if either of the strings is [None]

     You can concatenate strings using the "^" operator, like so:
     {[
       let hello_world = "hello" ^ " " ^ "world"
     ]}
  *)
  let option_concatenate string1 string2 =
    match string1, string2 with
    | None, _ | _, None -> None
    | Some s1, Some s2 -> Some(s1 ^ s2)
  ;;
end

(* Exercise 10 *)
module Record_types = struct
  type person =
    { age            : int
    ; first_name     : string
    ; last_name      : string
    ; number_of_cars : int
    }
  [@@deriving sexp]

  (* Write a function that does different things for different people:

     - When the person's first name is "Jan", you should return a new record with the age
       set to 30.

     - Otherwise, you should return a new record with the number of cars increased
       by 6. *)
  let update_person (person : person) =
    match person.first_name with
    | "Jan" -> {person with age = 30}
    | _ -> {person with number_of_cars = person.number_of_cars + 6}
  ;;
end

(* Exercise 11 *)
module Mutable_record_types = struct
  type person =
    { mutable age            : int
    ; first_name             : string
    ; last_name              : string
    ; mutable number_of_cars : int
    }
  [@@deriving sexp]

  (* Write a function that:

     - Increments the person's age (in place).

     - If the person's age is now a multiple of 10, also increment the number of cars by
       one (also in place)
  *)
  let modify_person (person : person) =
    person.age <- person.age + 1;
    match person.age % 10 with
    | 0 -> person.number_of_cars <- person.number_of_cars + 1
    | _ -> ()
  ;;
end