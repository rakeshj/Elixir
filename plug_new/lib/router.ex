defmodule PlugNew.Router do

    use Plug.Router

    plug :match 
    plug :dispatch 



    get "/" do
        send_resp(conn, 200, "Hi there!")
    end

    get "about/:user_name" do
        send_resp(conn, 200, "Hello , #{user_name}")
    end


    match _, do: send_resp(conn, 404, "page not found")


    
end