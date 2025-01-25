open! Core
open! Intro_to_ocaml.Record_types

let%expect_test "test person function" =
  let test age first_name last_name number_of_cars =
    let person = { age; first_name; last_name; number_of_cars } in
    let modified_person = update_person person in
    print_s [%message (person : person) (modified_person : person)]
  in
  test 20 "Jan" "Doe" 5;
  [%expect
    {|
    ((person ((age 20) (first_name Jan) (last_name Doe) (number_of_cars 5)))
     (modified_person
      ((age 30) (first_name Jan) (last_name Doe) (number_of_cars 5)))) |}];
  test 25 "John" "Doe" 6;
  [%expect
    {|
    ((person ((age 25) (first_name John) (last_name Doe) (number_of_cars 6)))
     (modified_person
      ((age 25) (first_name John) (last_name Doe) (number_of_cars 12)))) |}]
;;
