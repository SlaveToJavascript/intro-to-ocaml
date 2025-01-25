open! Core

module Basic_types : sig
  val int_average   : int   -> int -> int
  val float_average : float -> float -> float
  val print         : unit  -> unit
end

module Call_functions : sig
  val half    : int -> int
  val add     : int -> int -> int
  val average : int -> int -> int
end

module Labeled_arguments : sig
  val divide : numerator:int -> denominator:int -> int
  val modulo : dividend: int -> divisor:    int -> int
end

module Higher_order_functions : sig
  val add1  : int -> int
  val twice : (int -> int) -> int -> int
  val add2  : int -> int
end

module Pattern_matching : sig
  val non_zero      : int -> bool
  val both_non_zero : int -> int -> bool
  val factorial     : int -> int
end

module List_matching : sig
  val sum : int list -> int
end

module Tuples : sig
  val first : 'a * 'b -> 'a
  val manhattan_distance : int * int * int -> int * int * int -> int
end

module Variants : sig
  type card_value =
    | Ace
    | King
    | Queen
    | Jack
    | Number of int

  val sexp_of_card_value  : card_value -> Sexp.t
  val card_value_to_score : card_value -> int
end

module Option_variants : sig
  val safe_divide        : dividend:int  ->        divisor:int -> int    option
  val option_concatenate : string option -> string option      -> string option
end

module Record_types : sig
  type person =
    { age            : int
    ; first_name     : string
    ; last_name      : string
    ; number_of_cars : int
    }

  val sexp_of_person : person -> Sexp.t
  val update_person  : person -> person
end

module Mutable_record_types : sig
  type person =
    { mutable age            : int
    ; first_name             : string
    ; last_name              : string
    ; mutable number_of_cars : int
    }

  val sexp_of_person : person -> Sexp.t
  val modify_person  : person -> unit
end