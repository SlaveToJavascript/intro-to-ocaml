open! Core
open! Intro_to_ocaml.Labeled_arguments

let%expect_test "test modulo" =
  let test ~dividend ~divisor =
    let modulus = modulo ~dividend ~divisor in
    print_s [%message (modulus : int)]
  in
  test ~dividend:10 ~divisor:3;
  [%expect {| (modulus 1) |}];
  test ~dividend:10 ~divisor:2;
  [%expect {| (modulus 0) |}]
;;
