open! Core

let%expect_test "int average" =
  let test x y =
    let result = Intro_to_ocaml.Basic_types.int_average x y in
    print_s [%message (x : int) (y : int) (result : int)]
  in
  test 2 8;
  [%expect {| ((x 2) (y 8) (result 5)) |}];
  test 5 4;
  [%expect {| ((x 5) (y 4) (result 4)) |}]
;;

let%expect_test "float average" =
  let test x y =
    let result = Intro_to_ocaml.Basic_types.float_average x y in
    print_s [%message (x : float) (y : float) (result : float)]
  in
  test 2. 8.;
  [%expect {| ((x 2) (y 8) (result 5)) |}];
  test 5. 4.;
  [%expect {| ((x 5) (y 4) (result 4.5)) |}]
;;

let%expect_test "test print" =
  Intro_to_ocaml.Basic_types.print ();
  [%expect {| Hello, world! |}]
;;
