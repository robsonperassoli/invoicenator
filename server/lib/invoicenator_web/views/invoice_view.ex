defmodule InvoicenatorWeb.InvoiceView do
  use InvoicenatorWeb, :view
  use Timex

  def format_money(value, currency) do
    Number.Currency.number_to_currency(value, unit: currency)
  end

  defp long_date_format(date) do
    Timex.format!(date, "{WDfull}, {Mfull} {D} {YYYY}")
    |> String.upcase
  end
end