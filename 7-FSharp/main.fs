let cwd = []
let filesystem = Map.empty

use fh = System.IO.File.OpenRead("./input.txt")

let stdout = fh.ReadLines()
  |> Seq.skip 1
  |> Seq.map (fun line -> line.Split("\n"))

for line in stdout do
  let cmd = line.[0].Split()

  if cmd.[0] = "cd" then
    if cmd.[1] = ".." then cwd.Pop()
    else cwd.Append(cmd.[1])

  if cmd.[0] = "ls" then
    let diskUsage = line
      |> Seq.map (fun file -> file.Split())
      |> Seq.filter (fun data -> data.[0] <> "dir")
      |> Seq.map (fun data -> int data.[0])
      |> Seq.sum

    for i in 0 .. cwd.Length - 1 do
      let key = String.Join("/", cwd.[..cwd.Length - i - 1])
      let default() = 0
      let usage = filesystem.TryFind key |> Option.defaultValue default
      filesystem.[key] <- usage + diskUsage

let part1 = filesystem
  |> Map.values
  |> Seq.filter (fun size -> size <= 100_000)
  |> Seq.sum

printfn "Part 1: %d" part1

let part2 = filesystem
  |> Map.values
  |> Seq.filter (fun size -> size >= 30_000_000 - (70_000_000 - filesystem.["/"]))
  |> Seq.min

printfn "Part 2: %d" part2

