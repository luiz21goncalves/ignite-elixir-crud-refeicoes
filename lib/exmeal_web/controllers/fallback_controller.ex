defmodule ExmealWeb.FallbackController do
  use ExmealWeb, :controller

  def call(conn, {:error, %{status: status, result: result}}) do
    conn
    |> put_status(status)
    |> put_view(json: ErrorJSON)
    |> render("error.json", result: result)
  end
end
