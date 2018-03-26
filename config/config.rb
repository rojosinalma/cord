configatron.env                = ENV["APP_ENV"] || "development"
configatron.discord_token      = ENV["DISCORD_TOKEN"]
configatron.discord_client_id  = ENV["DISCORD_CLIENT_ID"]
configatron.discord_bot_prefix = ENV["DISCORD_BOT_PREFIX"]
configatron.discord_owner_id   = ENV["DISCORD_OWNER_ID"]
configatron.discord_bot_game   = ENV["DISCORD_BOT_GAME"]
configatron.disable_web        = ENV["DISABLE_WEB"] || false
configatron.discord_bot_mode   = configatron.disable_web ? nil : :async

configatron.web_only           = ENV["WEB_ONLY"] || false
configatron.basic_auth_user    = ENV["BASIC_AUTH_USER"] || false
configatron.basic_auth_pass    = ENV["BASIC_AUTH_PASS"] || false