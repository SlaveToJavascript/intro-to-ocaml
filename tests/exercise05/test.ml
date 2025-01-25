open! Core
open! Intro_to_ocaml.Pattern_matching

let%expect_test "non zero" =
  let test x =
    let result = non_zero x in
    print_s [%message (x : int) (result : bool)]
  in
  test 1;
  [%expect {| ((x 1) (result true)) |}];
  test (-1);
  [%expect {| ((x -1) (result true)) |}];
  test 0;
  [%expect {| ((x 0) (result false)) |}]
;;

let%expect_test "both non zero" =
  let test x y =
    let result = both_non_zero x y in
    print_s [%message (x : int) (y : int) (result : bool)]
  in
  test 1 0;
  [%expect {| ((x 1) (y 0) (result false)) |}];
  test 0 1;
  [%expect {| ((x 0) (y 1) (result false)) |}];
  test 1 1;
  [%expect {| ((x 1) (y 1) (result true)) |}];
  test 0 0;
  [%expect {| ((x 0) (y 0) (result false)) |}]
;;

let%expect_test "factorial" =
  let test x =
    let result = factorial x in
    print_s [%message (x : int) (result : int)]
  in
  test 1;
  [%expect {| ((x 1) (result 1)) |}];
  test 6;
  [%expect {| ((x 6) (result 720)) |}];
  test 12;
  [%expect {| ((x 12) (result 479001600)) |}]
;;
