defmodule BirdCount do
  def today([today | _]), do: today

  def today(_), do: nil

  def increment_day_count([today | tail]) do
    [today + 1 | tail]
  end

  def increment_day_count(_), do: [1]

  def has_day_without_birds?(list) do
    Enum.member?(list, 0)
  end

  def total([]), do: 0

  def total(list), do: Enum.sum(list)

  def busy_days(list) do
    Enum.count(list, fn bird_qtd -> bird_qtd >= 5 end)
  end
end
