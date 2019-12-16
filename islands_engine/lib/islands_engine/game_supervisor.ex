defmodule IslandsEngine.GameSupervisor do
        use Supervisor
        alias IslandsEngine.Game

        def start_link(_option) do
            Supervisor.start_link(__MODULE__, :ok, name: __MODULE__)
        end

       
        def init(:ok) do
            Supervisor.init([Game], strategy: :simple_one_for_one)
        end

        def start_game(name) do
            Supervisor.start_child(__MODULE__, [name])
        end

        def stop_game(name) do
            :ets.delete(:game_state, name)
            Supervisor.terminate_child(__MODULE__, pid_from_name(name))
        end

        def pid_from_name(name) do
            name 
            |> Game.via_tuple
            |> GenServer.whereis
        end

end 