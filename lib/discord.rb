require_all 'app/discord/**/*.rb'

$bot = Discordrb::Commands::CommandBot.new(
  token:       configatron.discord_token,
  client_id:   configatron.discord_client_id,
  prefix:      configatron.discord_bot_prefix,
  ignore_bots: true
)

$bot.include! Discord::Events
$bot.include! Discord::Commands
$bot.include! Discord::FunCommands
