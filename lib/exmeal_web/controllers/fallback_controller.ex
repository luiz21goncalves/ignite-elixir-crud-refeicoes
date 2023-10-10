defmodule ExmealWeb.FallbackController do
  use ExmealWeb, :controller

  alias Exmeal.Error
  alias ExmealWeb.ErrorJSON

  def call(conn, {:error, %Error{status: status, result: result}}) do
    conn
    |> put_status(status)
    |> put_view(json: ErrorJSON)
    |> render("error.json", result: result)
  end
end
