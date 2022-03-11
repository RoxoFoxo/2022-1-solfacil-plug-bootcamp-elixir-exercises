defmodule Rules do
  def eat_ghost?(power_pellet_active, touching_ghost) do
    # Please implement the eat_ghost?/2 function
    case power_pellet_active and touching_ghost do
      true ->
        true

      false ->
        false
    end
  end

  def score?(touching_power_pellet, touching_dot) do
    # Please implement the score?/2 function
    case touching_power_pellet or touching_dot do
      true ->
        true

      false ->
        false
    end
  end

  def lose?(power_pellet_active, touching_ghost) do
    # Please implement the lose?/2 function
    case power_pellet_active do
      false when touching_ghost ->
        true

      _ ->
        false
    end
  end

  def win?(has_eaten_all_dots, power_pellet_active, touching_ghost) do
    # Please implement the win?/3 function
    case lose?(power_pellet_active, touching_ghost) do
      false when has_eaten_all_dots ->
        true

      _ ->
        false
    end
  end
end
