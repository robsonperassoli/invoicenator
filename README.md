# Invoicenator

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Install Node.js dependencies with `cd assets && npm install`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.


## GENERATE INVOICE
```
curl -X POST -H 'Content-Type: application/json' -d '{"date":"2018-10-10","sender":{"name":"MY COMPANY NAME - ME","cpf":"063.033.050-67","cnpj":"56.912.239/0001-92"},"receiver":{"name":"LALALA, INC","number":"C22115445","address_line1":"100 FIRST LANE ST","address_line2":"SAN FRANCISCO CA 94025","approved_by":"JOSH PETERSON CEO"},"details":{"total":100,"currency":"$","items":[{"description":"MONITORING AND PROGRAMMING SERVICES","qty":2,"unit":"hr","unit_value":50,"total":100}]}}' --output invoicenator.pdf https://invoicenator.herokuapp.com/api/invoice
```

## Sample invoice
![Sample](/img/sample.png)
