defmodule RobotSimulator do
  @valid_directions [:north, :east, :south, :west]
  defstruct position: {0, 0}, direction: :north

  @doc """
  Create a Robot Simulator given an initial direction and position.

  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """
  def create(direction \\ :north, position \\ {0, 0}) do
    with {:ok, direction} <- validate_direction(direction),
         {:ok, position} <- validate_position(position) do
      %RobotSimulator{direction: direction, position: position}
    end
  end

  defp validate_direction(direction) do
    if direction in @valid_directions do
      {:ok, direction}
    else
      {:error, "invalid direction"}
    end
  end

  defp validate_position(position) do
    with {x, y} <- position,
         true <- is_integer(x),
         true <- is_integer(y) do
      {:ok, position}
    else
      _error ->
        {:error, "invalid position"}
    end
  end

  @doc """
  Simulate the robot's movement given a string of instructions.

  Valid instructions are: "R" (turn right), "L", (turn left), and "A" (advance)
  """
  @spec simulate(robot :: any, instructions :: String.t()) :: any
  def simulate(robot, instructions) do
    instructions
    |> String.split("", trim: true)
    |> Enum.reduce(robot, fn command, robot_acc ->
      run_commands(robot_acc, command)
    end)
    |> validate_instructions()
  end

  defp run_commands(robot, "R") do
    new_direction =
      case robot.direction do
        :north -> :east
        :east -> :south
        :south -> :west
        :west -> :north
      end

    %{robot | direction: new_direction}
  end

  defp run_commands(robot, "L") do
    new_direction =
      case robot.direction do
        :north -> :west
        :west -> :south
        :south -> :east
        :east -> :north
      end

    %{robot | direction: new_direction}
  end

  defp run_commands(robot, "A") do
    {x, y} = robot.position

    new_position =
      case robot.direction do
        :north -> {x, y + 1}
        :south -> {x, y - 1}
        :east -> {x + 1, y}
        :west -> {x - 1, y}
      end

    %{robot | position: new_position}
  end

  defp run_commands(robot, _invalid) do
    Map.put(robot, :invalid, true)
  end

  defp validate_instructions(robot) do
    if Map.has_key?(robot, :invalid) do
      {:error, "invalid instruction"}
    else
      robot
    end
  end

  @doc """
  Return the robot's direction.

  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """
  @spec direction(robot :: any) :: atom
  def direction(robot) do
    robot.direction
  end

  @doc """
  Return the robot's position.
  """
  @spec position(robot :: any) :: {integer, integer}
  def position(robot) do
    robot.position
  end
end
