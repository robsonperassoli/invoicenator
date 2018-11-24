defmodule InvoicenatorWeb.InvoiceController do
  use InvoicenatorWeb, :controller
  alias InvoicenatorWeb.InvoiceView
  alias Phoenix.View
  alias PdfGenerator

  defp invoice_data() do
    sender = %{
      "name" => "MY COMPANY NAME - ME",
      "cpf" => "063.033.050-67",
      "cnpj" => "56.912.239/0001-92"
    }
    
    receiver = %{
      "name" => "LALALA, INC",
      "number" => "C22115445",
      "address_line1" => "100 FIRST LANE ST",
      "address_line2" => "SAN FRANCISCO CA 94025",
      "approved_by" => "JOSH PETERSON CEO"
    }

    details = %{
      "total" => 100,
      "currency" => "$",
      "items" => [
        %{"description" => "MONITORING AND PROGRAMMING SERVICES", "qty" => 2, "unit" => "hr", "unit_value" => 50, "total" => 100}
      ]
    }

    %{
      "date" => "2018-10-10",
      "sender" => sender,
      "receiver" => receiver,
      "details" => details
    }
  end

  defp parse_data("default", %{"sender" => sender, "receiver" => receiver, "date" => date_raw, "details" => details }) do
    {:ok, date} = Timex.parse(date_raw, "{YYYY}-{M}-{D}")
    %{
      :date => date,
      :sender => sender,
      :receiver => receiver,
      :details => details
    }
  end

  def print(conn, _params) do  
    invoice_params = parse_data("default", invoice_data())
    binary_pdf = View.render_to_string(InvoiceView, "default.html", invoice_params)
    |> PdfGenerator.generate_binary!

    conn
    |> put_resp_content_type("application/pdf")
    |> send_resp(200, binary_pdf)
  end

  def create(conn, params) do
    invoice_params = parse_data("default", params)
    
    binary_pdf = View.render_to_string(InvoiceView, "default.html", invoice_params)
    |> PdfGenerator.generate_binary!

    conn
    |> put_resp_content_type("application/pdf")
    |> send_resp(200, binary_pdf)
  end

  def view(conn, _params) do
    invoice_params = parse_data("default", invoice_data())
    conn
    |> put_layout(false)
    |> render("default.html", invoice_params)
  end
end