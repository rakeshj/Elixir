defmodule Example do 
  def fun(bar, baz) do 
    1
  end
end


case System.argv() do 
  ["--testoo"] ->
    ExUnit.start()

    defmodule ExampleTest do 
      use ExUnit.Case

      import Example

      test "my code" do
        assert fun(2,3) == 1
      end 
    end

  [arg1, arg2] -> Example.fun(arg1, arg2) |> IO.puts()
end

# to run the script execute the below command
# elixir example.ex --test
# elixir example.exs --test //if you created the scripting file. 
