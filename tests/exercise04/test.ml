open! Core
open! Intro_to_ocaml.Higher_order_functions

let%expect_test "test twice" =
  let test f x ~f_desc =
    let result = twice f x in
    print_s [%message f_desc (x : int) (result : int)]
  in
  test (fun x -> x / 2) 64 ~f_desc:"Divide by 2 twice";
  [%expect {| ("Divide by 2 twice" (x 64) (result 16)) |}]
;;

let%expect_test "test add2" =
  let test x =
    let result = add2 x in
    print_s [%message (x : int) (result : int)]
  in
  test (-2);
  [%expect {| ((x -2) (result 0)) |}];
  test 10;
  [%expect {| ((x 10) (result 12)) |}]
;;
