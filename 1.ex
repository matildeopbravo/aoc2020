defmodule Numbers do
   def check_numbers(l,index_pivot,index_move) do
     last_index = length(l) - 1
     unless (l == [] || (index_pivot == index_move && index_move == last_index)) do
       if(index_move == last_index + 1) do
           check_numbers(l,index_pivot + 1,0)
       else
          comparison = Enum.at(l,index_move) + Enum.at(l,index_pivot)
          cond do
            comparison > 2020 -> check_numbers(l,index_pivot + 1,0)
            comparison < 2020 -> check_numbers(l,index_pivot,index_move + 1)
            true ->
                   number1 = Enum.at(l,index_pivot)
                   number2 = Enum.at(l,index_move)
                   IO.puts("The numbers whose sum is 2020 are : #{number1} and #{number2}.\nTheir product is #{number1*number2}")
          end
        end
     end
   end
end

{:ok, file} = File.read("input.txt")
numbers = file |> String.split("\n")
numbers
  |> List.delete_at(length(numbers)-1)
  |> Enum.map(&String.to_integer/1)
  |> Enum.sort
  |> Numbers.check_numbers(0,1)

