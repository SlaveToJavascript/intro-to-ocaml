open! Core
open! Intro_to_ocaml.Call_functions

let%expect_test "int average" =
  let test x y =
    let result = average x y in
    print_s [%message (x : int) (y : int) (result : int)]
  in
  test 2 8;
  [%expect {| ((x 2) (y 8) (result 5)) |}];
  test 5 4;
  [%expect {| ((x 5) (y 4) (result 4)) |}]
;;
