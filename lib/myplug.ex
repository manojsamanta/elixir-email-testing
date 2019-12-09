defmodule Example.Myplug do

  def init(default_opts) do
    IO.puts "starting up Helloplug..."
    default_opts
  end

  def call(conn, _opts) do
    IO.puts "here again"
    route(conn.method, conn.path_info, conn)
  end

  def route("POST", ["form1"], conn) do
    {:ok ,body,_} = Plug.Conn.read_body(conn)
    body=body |> Plug.Conn.Query.decode
    IO.inspect body
    message="hey, you should get an email"
    msg="hey you"
    email="manoj.samanta@gmail.com"
    Helloplug.Email.welcome_email(email,msg) |> Helloplug.Mailer.deliver_later
    conn |> Plug.Conn.send_resp(200, "POST #{message}")
  end

  def route(_method, _path, conn) do
    # this route is called if no other routes match
    conn |> Plug.Conn.send_resp(404, "Couldn't find that page, sorry!")
  end
end

