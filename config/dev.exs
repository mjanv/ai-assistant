import Config

config :ai_assistant,
  pipeline: [
    AiAssistant.Agents.TwitchChat,
    AiAssistant.Agents.WakeWord,
    {AiAssistant.Agents.SpeechToText, model: "small", language: "fr"},
    AiAssistant.Agents.ChatAssistant,
    AiAssistant.Agents.TextToSpeech,
    AiAssistant.Agents.SpeechToSpeaker
  ]

config :ai_assistant, AiAssistant.Repo,
  database: Path.expand("../ai_assistant_dev.db", Path.dirname(__ENV__.file)),
  pool_size: 5,
  stacktrace: true,
  show_sensitive_data_on_connection_error: true

config :ai_assistant, AiAssistantWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4000],
  check_origin: false,
  code_reloader: true,
  debug_errors: true,
  secret_key_base: "IbINSUAbtpgsXdb+IrnqdRmP8GQoRVvgzJDTf23NDTZk0Vorng8Chs6LhSqguU+Y",
  watchers: [
    esbuild: {Esbuild, :install_and_run, [:default, ~w(--sourcemap=inline --watch)]},
    tailwind: {Tailwind, :install_and_run, [:default, ~w(--watch)]}
  ]

# ## SSL Support
#
# In order to use HTTPS in development, a self-signed
# certificate can be generated by running the following
# Mix task:
#
#     mix phx.gen.cert
#
# Run `mix help phx.gen.cert` for more information.
#
# The `http:` config above can be replaced with:
#
#     https: [
#       port: 4001,
#       cipher_suite: :strong,
#       keyfile: "priv/cert/selfsigned_key.pem",
#       certfile: "priv/cert/selfsigned.pem"
#     ],
#
# If desired, both `http:` and `https:` keys can be
# configured to run both http and https servers on
# different ports.

config :ai_assistant, AiAssistantWeb.Endpoint,
  live_reload: [
    patterns: [
      ~r"priv/static/.*(js|css|png|jpeg|jpg|gif|svg)$",
      ~r"priv/gettext/.*(po)$",
      ~r"lib/ai_assistant_web/(controllers|live|components)/.*(ex|heex)$"
    ]
  ]

config :ai_assistant, dev_routes: true

config :logger, :console, format: "[$level] $message\n"

config :phoenix, :stacktrace_depth, 20

config :phoenix, :plug_init_mode, :runtime
