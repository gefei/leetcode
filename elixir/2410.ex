defmodule Solution do
  def match_players_and_trainers(players, trainers) do
    t = trainers |> Enum.sort(:desc)
    p = players |> Enum.sort(:desc) |> Enum.drop_while(&(&1 > (hd t)))
    count(t, p, 0)
  end

  def count([], _, acc), do: acc
  def count(_, [], acc), do: acc
  def count(t=[h_trainer|t_trainer], [h_player|t_player], acc) do
    cond do
      h_trainer >= h_player -> count(t_trainer, t_player, acc+1)
      true -> count(t, t_player, acc)
    end
  end
end
