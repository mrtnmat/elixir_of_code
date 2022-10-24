defmodule AoC2015.Day1 do
  def read_input(path) when is_bitstring(path) do
    {:ok, content} = File.read(path)
    String.graphemes(content)
  end
  def solve_part1(path) do
    read_input(path)
    |> Stream.map(
    fn
      "(" -> 1
      ")" -> -1
    end)
    |> Enum.reduce(fn e, acc -> acc + e end)
  end

  def solve_part2(path) do
    read_input(path)
    |> Stream.map(
    fn
      "(" -> 1
      ")" -> -1
    end)
    |> Stream.scan(&(&1 + &2))
    |> Enum.find_index(&(&1 == -1))
    |> (&(&1 + 1)).()
  end
end
