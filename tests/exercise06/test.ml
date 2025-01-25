open! Core
open! Intro_to_ocaml.List_matching

let%expect_test "sum of int list" =
  let test lst =
    let result = sum lst in
    print_s [%message (lst : int list) (result : int)]
  in
  test [ 1; 1; 1; 1; 1 ];
  [%expect {| ((lst (1 1 1 1 1)) (result 5)) |}];
  test [];
  [%expect {| ((lst ()) (result 0)) |}];
  test [ -2; 3; -5 ];
  [%expect {| ((lst (-2 3 -5)) (result -4)) |}]
;;
