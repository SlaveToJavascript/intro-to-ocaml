open! Core
open! Intro_to_ocaml.Option_variants

let%expect_test "safe divide" =
  let test dividend divisor =
    let result = safe_divide ~dividend ~divisor in
    print_s [%message (dividend : int) (divisor : int) (result : int option)]
  in
  test 10 5;
  [%expect {| ((dividend 10) (divisor 5) (result (2))) |}];
  test 3 0;
  [%expect {| ((dividend 3) (divisor 0) (result ())) |}]
;;

let%expect_test "string concat" =
  let test string1 string2 =
    let result = option_concatenate string1 string2 in
    print_s
      [%message
        (string1 : string option) (string2 : string option) (result : string option)]
  in
  test None (Some "last_name");
  [%expect {| ((string1 ()) (string2 (last_name)) (result ())) |}];
  test (Some "first_name") None;
  [%expect {| ((string1 (first_name)) (string2 ()) (result ())) |}];
  test (Some "first_name") (Some "last_name");
  [%expect
    {| ((string1 (first_name)) (string2 (last_name)) (result (first_namelast_name))) |}]
;;
