defmodule Chat.Server do

    use GenServer 

    @chat_room  :chat_room
    def start_link do 
        GenServer.start_link(__MODULE__, [], name: @chat_room)
    end


    def init(msgs) do
        {:ok, msgs}
    end

    def get_msg() do 
        GenServer.call(@chat_room, :get_msg)
    end

    def add_msg( msg) do
        GenServer.cast(@chat_room, {:add_msg, msg})
    end


    def handle_call(:get_msg, _from, msgs) do 
        {:reply, msgs, msgs}
    end

    def handle_cast({:add_msg, msg},  msgs) do
        {:noreply, [msg | msgs]}
    
    end


end
