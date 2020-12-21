use Bitwise
defmodule Day2 do
  def part(l,part_number) do
    [limits,letter,password] = String.split(l," ")
    [min,max] = String.split(limits,"-")
                |>  Enum.map(&String.to_integer/1)
    letter = String.slice(letter,0..-2)

    if (part_number == 1)do
      n_times = password
                |> String.graphemes()
                |>Enum.count(fn ltr -> ltr == letter end)

      n_times >= min && n_times <= max
    else
      (String.at(password,min-1) == letter) !=
      (String.at(password,max-1) == letter)
    end


  end
end
fun = fn part ->
  len = "2.txt"
    |> File.read!()
    |> String.split("\n", trim: true)
    |> Enum.filter(&Day2.part(&1,part))
    |> length
  IO.puts("Part #{part}: There are #{len} valid passwords")
  end

fun.(1)
fun.(2)

