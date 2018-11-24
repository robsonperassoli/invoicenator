defmodule InvoicenatorWeb.PageController do
  use InvoicenatorWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
