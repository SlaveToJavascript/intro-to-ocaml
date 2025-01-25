open! Core
open! Intro_to_ocaml.Tuples

let%expect_test "first" =
  let result = first (1, 2) in
  print_s [%message (result : int)];
  [%expect {| (result 1) |}];
  let result = first ("hello", "world") in
  print_s [%message (result : string)];
  [%expect {| (result hello) |}]
;;

let%expect_test "manhattan_distance" =
  let test c1 c2 =
    let result = manhattan_distance c1 c2 in
    print_s [%message (result : int)]
  in
  test (1, 2, 3) (3, 2, 1);
  [%expect {| (result 4) |}];
  test (-1, -1, -1) (3, 4, 5);
  [%expect {| (result 15) |}]
;;
