defmodule AdventOfCode.Day01 do
  @moduledoc """
  Documentation for `Day01`.
  """

  def part_one() do
    input = File.read!("./lib/day01/input.txt")

    input
    |> input_to_list
    |> Enum.map(&remove_alphanumerics/1)
    |> Enum.map(fn x ->
      (x |> String.first()) <> (x |> String.last())
    end)
    |> Enum.map(&String.to_integer/1)
    |> Enum.sum()
  end

  def part_two() do
    input = File.read!("./lib/day01/input.txt")

    only_numbers = input
    |> input_to_list
    |> Enum.map(fn x -> x |> convert_text_to_number |> remove_alphanumerics end)


    only_numbers
    |> Enum.map(fn x ->
      (x |> String.first()) <> (x |> String.last())
    end)
    |> IO.inspect
    |> Enum.map(&String.to_integer/1)
    |> Enum.sum()
  end

  def remove_alphanumerics(line), do: String.replace(line, ~r/[^\d]/, "")
  def input_to_list(input), do: String.split(input, "\n", trim: true)

  # Elixir always check from up to down which pattern to match
  def convert_text_to_number("one" <> rest), do: "1" <> convert_text_to_number("e" <> rest)
  def convert_text_to_number("two" <> rest), do: "2" <> convert_text_to_number("o" <> rest)
  def convert_text_to_number("three" <> rest), do: "3" <> convert_text_to_number("e" <> rest)
  def convert_text_to_number("four" <> rest), do: "4" <> convert_text_to_number("r" <> rest)
  def convert_text_to_number("five" <> rest), do: "5" <> convert_text_to_number("e" <> rest)
  def convert_text_to_number("six" <> rest), do: "6" <> convert_text_to_number("x" <> rest)
  def convert_text_to_number("seven" <> rest), do: "7" <> convert_text_to_number("n" <> rest)
  def convert_text_to_number("eight" <> rest), do: "8" <> convert_text_to_number("t" <> rest)
  def convert_text_to_number("nine" <> rest), do: "9" <> convert_text_to_number("e" <> rest)
  def convert_text_to_number(<<char, rest::binary>>), do: <<char>> <> convert_text_to_number(rest)
  # For some reason the operations are leaving an empty char thats why I had to made this pattern
  def convert_text_to_number(""), do: ""


end
