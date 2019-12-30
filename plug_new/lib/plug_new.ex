defmodule PlugNew do
  use Application
  require Logger


  def start(_type, _args) do

    port = Application.get_env(:plug_new, :cowboy_port)
    children  =
    [
      # Plug.Adapters.Cowboy.child_spec(:http, PlugNew.Router, [], port: 8000 )
      {Plug.Cowboy, scheme: :http, plug: PlugNew.Router, options: [port: port]}
    ]

    opts = [strategy: :one_for_one, name: PlugNew.Supervisor]
    Logger.info("App started")
    Supervisor.start_link(children, opts)
  end

end
