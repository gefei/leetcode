defmodule Solution do
  @spec valid_square(p1 :: [integer], p2 :: [integer], p3 :: [integer], p4 :: [integer]) :: boolean
  def valid_square(p1, p2, p3, p4) when p1 == p2, do: false

  def valid_square(p1, p2, p3, p4) do
    [a,b,c,d] = [p1, p2, p3, p4] |> Enum.sort() |> IO.inspect()
    (dist(a,b) == dist(a,c))
       and (dist(b,d) == dist(c,d))
       and (dist(a,b) == dist(b,d))
       and (dot([a,b],[a,c]) == 0)
  end

  def compare([x1, y1], [x2, y2]) do
    cond do
      x1 < x2 -> true
      x1 > x2 -> false
      true -> y1 < y2
    end
  end

  def dist([x1, y1], [x2, y2]) do
    x = x1 - x2
    y = y1 - y2
    x*x + y*y
  end

  def dot([[x1, y1], [x2, y2]], [[a1, b1], [a2, b2]]) do
    x = x1 - x2
    y = y1 - y2
    a = a1 - a2
    b = b1 - b2
    x*a + y*b
  end
end
