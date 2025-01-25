open! Core
open! Intro_to_ocaml.Mutable_record_types

let%expect_test "test person function" =
  let test age first_name last_name number_of_cars =
    let person = { age; first_name; last_name; number_of_cars } in
    print_s [%message "" ~original_person:(person : person)];
    modify_person person;
    print_s [%message "" ~modified_person:(person : person)]
  in
  test 20 "Jan" "Doe" 5;
  [%expect
    {|
    (original_person
     ((age 20) (first_name Jan) (last_name Doe) (number_of_cars 5)))
    (modified_person
     ((age 21) (first_name Jan) (last_name Doe) (number_of_cars 5))) |}];
  test 29 "John" "Doe" 6;
  [%expect
    {|
    (original_person
     ((age 29) (first_name John) (last_name Doe) (number_of_cars 6)))
    (modified_person
     ((age 30) (first_name John) (last_name Doe) (number_of_cars 7))) |}]
;;
