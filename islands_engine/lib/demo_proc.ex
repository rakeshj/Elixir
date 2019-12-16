defmodule IslandsEngine.DemoProc do
    def loop do
        receive do
            msg -> IO.inspect "your's message is #{msg}"
        end
        loop()
    end
end
