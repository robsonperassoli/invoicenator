defmodule InvoicenatorWeb.Router do
  use InvoicenatorWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", InvoicenatorWeb do
    pipe_through :browser

    get "/", PageController, :index
    get "/invoice", InvoiceController, :print
    get "/invoice/view", InvoiceController, :view
  end

  scope "/api", InvoicenatorWeb do
    pipe_through :api

    post "/invoice", InvoiceController, :create    
  end
end
