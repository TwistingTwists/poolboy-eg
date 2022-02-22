defmodule PoolboyPyElixir.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  defp poolboy_config do
    [
      name: {:local, :square_worker},
      worker_module: PoolboyPyElixir.SquareWorker,
      size: 5,
      max_overflow: 1
    ]
  end

  @impl true
  def start(_type, _args) do
    children = [
      # Starts a worker by calling: PoolboyPyElixir.Worker.start_link(arg)
      # {PoolboyPyElixir.Worker, arg}
      :poolboy.child_spec(:square_worker, poolboy_config())
    ]

    opts = [strategy: :one_for_one, name: PoolboyPyElixir.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
