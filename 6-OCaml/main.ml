let parse_input filename =
  let in_channel = open_in filename in
  let line = input_line in_channel in
  close_in in_channel;
  line;;

let find_start window_size input =
  let rec all_unique s n =
    if n < 0 then true
    else 
      if String.contains_from s (n+1) s.[n] then false
      else all_unique s (n-1) in
        let rec rfind a = if all_unique (String.sub input a window_size) (window_size - 2) then a else rfind (a + 1) in
        window_size + rfind 0;;

let silver input = find_start 4 input;;
let gold input = find_start 14 input;;

let main () =
  let input = parse_input "./input.txt" in
    (* Printf.printf "Silver: %d\n" (silver input);; *)
    Printf.printf "Gold: %d\n" (gold input);;

main()
