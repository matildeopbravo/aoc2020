defmodule Day1 do
   def part_one(l,index_pivot,index_move) do
     last_index = length(l) - 1
     unless (l == [] || (index_pivot == index_move && index_move == last_index)) do
       if(index_move == last_index + 1) do
           part_one(l,index_pivot + 1,0)
       else
          comparison = Enum.at(l,index_move) + Enum.at(l,index_pivot)
          cond do
            comparison > 2020 -> part_one(l,index_pivot + 1,0)
            comparison < 2020 -> part_one(l,index_pivot,index_move + 1)
            true ->
                   number1 = Enum.at(l,index_pivot)
                   number2 = Enum.at(l,index_move)
                   IO.puts("The numbers whose sum is 2020 are : #{number1} and #{number2}.\nTheir product is #{number1*number2}")
          end
        end
     end
   end
  def part_two(numbers) do
    [product | _ ]= for x <- numbers, y <- numbers, z <- numbers, x + y + z == 2020, do: x * y * z
    IO.puts("The 3-number-product is #{product}")
  end
end

{:ok, file} = File.read("1.txt")
numbers = file
  |> String.split("\n", trim: true)
  |> Enum.map(&String.to_integer/1)

numbers
  |> Enum.sort
  |> Day1.part_one(0,1)

numbers |> Day1.part_two

