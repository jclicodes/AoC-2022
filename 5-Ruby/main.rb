crate_def, moves_def =
  IO.read('input.txt').split(/\n\n/).map { |s| s.split(/\n/) }

def parse_stacks(crate_def)
  crate_def.reverse!
  ids = crate_def[0]
  crates = crate_def[1..-1]
  stacks = Array.new(ids.split.count) { [] }

  crates.map do |crate_list|
    crate_list.chars.each_with_index do |crate, i|
      next unless /[A-Z]/.match?(crate)

      stacks[i / 4].append(crate)
    end
  end
  stacks
end

def part_1(stacks, moves)
  moves.map do |move|
    n, src, dest = move.split(/\D+/).drop(1).map(&:to_i)
    (0..n - 1).each { stacks[dest - 1].append(stacks[src - 1].pop) }
  end
  stacks
end

def part_2(stacks, moves)
  moves.map do |move|
    n, src, dest = move.split(/\D+/).drop(1).map(&:to_i)
    load = []
    (0..n - 1).each { load.append(stacks[src - 1].pop) }
    stacks[dest - 1].append(*load.reverse)
  end
  stacks
end

silver = parse_stacks(crate_def)
gold = parse_stacks(crate_def)

print(
  'Part 1: ',
  part_1(silver, moves_def).map { |stack| stack[-1] }.join(''),
  "\n"
)

print('Part 2: ', part_2(gold, moves_def).map { |stack| stack[-1] }.join(''))
