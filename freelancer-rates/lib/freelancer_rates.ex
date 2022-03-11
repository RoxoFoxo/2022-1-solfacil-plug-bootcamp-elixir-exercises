defmodule FreelancerRates do
  def daily_rate(hourly_rate) do
    hourly_rate * 8
    |> Kernel.*(1.0)
  end

  def apply_discount(before_discount, discount) do
    before_discount * ((100 - discount) * 0.01)
  end

  def monthly_rate(hourly_rate, discount) do
    daily_rate(hourly_rate)
    |> apply_discount(discount)
    |> Kernel.*(22)
    |> Float.ceil()
    |> trunc()
  end

  def days_in_budget(budget, hourly_rate, discount) do
    discounted_rate =
      daily_rate(hourly_rate)
      |> apply_discount(discount)

    Float.floor(budget / discounted_rate, 1)
  end
end
