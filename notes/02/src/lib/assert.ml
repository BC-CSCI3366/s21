(* You do not need to modify this file. *)


(* When set to true, stop immediately on a failing test *)
let stop_on_failure_flag = ref false

let stop_on_failure () = stop_on_failure_flag := true

let error_mesg (s: string) =
  print_endline s;
  if !stop_on_failure_flag then exit 1 else ()

type result = Succ | Fail | Err of string

let assert_eqf (msg: string) actual_fcn expected : unit =
  let _ = print_string ("Running: "^msg^" ... ") in
  let _ = flush_all () in
  let outcome = try if expected = (actual_fcn ()) then Succ else Fail
                with Failure s -> Err s
                   | e         -> Err (Printexc.to_string e) in

  begin match outcome with
             | Succ -> print_endline ("Test passed!")
             | Fail ->
                print_newline ();
                error_mesg ("Test failed: "^msg^"\n")
             | Err s ->
                print_newline ();
                error_mesg ("Test error: `"^msg^"` reported `" ^ s ^ "`\n")
            end

let assert_eq (msg:string) actual expected : unit =
  assert_eqf msg (fun () -> actual) expected

let run_test msg f = assert_eqf msg f true

let run_failing_test msg f =
  let _ = print_string ("Running: "^msg^" ... ") in
  let _ = flush_all () in
  let result = (try (ignore (f ()) ; Fail) with
  | _ -> Succ) in
  match result with
  | Succ -> print_endline ("Test passed!")
  | Fail -> error_mesg ("Test error: should have failed.")
  | Err _ -> error_mesg ("run_failing_test BUG: shouldn't get here.")
