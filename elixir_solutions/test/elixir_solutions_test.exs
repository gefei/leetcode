defmodule ElixirSolutionsTest do
  use ExUnit.Case
  doctest ElixirSolutions

  test "0001" do
    x = Solution0001.two_sum([2,7,11,15], 9)
    assert MapSet.new(x) == MapSet.new([0,1])
    x = Solution0001.two_sum([3,2,4], 6)
    assert MapSet.new(x) == MapSet.new([1,2])
    x = Solution0001.two_sum([3,3], 6)
    assert MapSet.new(x) == MapSet.new([0,1])
  end



  test "0055" do
    assert Solution0055.can_jump([2,3,1,1,4])
    assert not Solution0055.can_jump([3,2,1,0,4])
    assert Solution0055.can_jump([3,2,1,0])
    assert Solution0055.can_jump([0])
    assert Solution0055.can_jump([2,0,0])
    assert Solution0055.can_jump([5,9,3,2,1,0,2,3,3,1,0,0])
  end

end
