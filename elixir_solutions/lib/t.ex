x = Stream.unfold(0, fn n -> {n, n+1} end)

IO.inspect(Stream.with_index(x) |> Enum.take(10))
