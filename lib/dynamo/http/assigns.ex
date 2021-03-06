defmodule Dynamo.HTTP.Assigns do
  @moduledoc false

  @doc """
  Generates functions related to assigns API. It expects a connection
  record macro with fields:

  * assigns with an empty list as default;

  """
  defmacro __using__(_) do
    quote location: :keep do
      def assigns(connection(assigns: assigns)) do
        assigns
      end

      def assign(key, value, connection(assigns: assigns) = conn) do
        connection(conn, assigns: Keyword.put(assigns, key, value))
      end
    end
  end
end