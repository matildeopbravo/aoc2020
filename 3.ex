defmodule Day3 do
  def part_one(l,column) do
    if ( l == []) do
      0
    else
        [head | tail] = l
        width = String.length(head)
        head
            |> String.at(column)
            |> (fn (y) -> if y == "#", do: 1, else: 0 end).()
            |> (&(&1 + part_one(tail,rem(column+3,width)))).()
    end
  end
  def part_two(l,{x,y},{row,column}) do
          if row >= length(l) do
          0
    else
         width = Enum.at(l,0) |> String.length
         l
           |> Enum.at(row)
           |> String.at(column)
           |> (fn (y) -> if y == "#", do: 1, else: 0 end).()
           |> (&(&1 + part_two(l,{x,y},{row+x,rem(column+y,width)}))).()
    end
  end
end
l = "3.txt"
  |> File.read!()
  |> String.split("\n",trim: true)

# Part 1
l
  |> (fn ([_ | tail]) -> tail end).()
  |> Day3.part_one(3)
  |> IO.puts

# Part 2
slopes = [{1,1},{1,3},{1,5},{1,7},{2,1}]
(for slp <- slopes, true, do: (Day3.part_two(l,slp,{0,0})))
  |> List.foldr(1,&(*/2))
  |> IO.inspect
