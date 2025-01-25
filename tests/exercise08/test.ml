open! Core
open! Intro_to_ocaml.Variants

let%expect_test "score" =
  let test card =
    let result = card_value_to_score card in
    print_s [%message (card : card_value) (result : int)]
  in
  test Ace;
  [%expect {| ((card Ace) (result 11)) |}];
  test Queen;
  [%expect {| ((card Queen) (result 10)) |}];
  test (Number 10);
  [%expect {| ((card (Number 10)) (result 10)) |}];
  test (Number 5);
  [%expect {| ((card (Number 5)) (result 5)) |}]
;;
