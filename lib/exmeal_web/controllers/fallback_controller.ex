defmodule ExmealWeb.FallbackController do
  use ExmealWeb, :controller

  def call(conn, {:error, result}) do
    conn
    |> put_status(:bad_request)
    |> put_view(json: ErrorJSON)
    |> render("400.json", result: result)
  end
end
