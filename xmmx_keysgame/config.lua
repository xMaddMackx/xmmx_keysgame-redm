

Config = Config or {}

Config = {
    VerChk      = true,            -- Enable or Disable Version Checks?
    Debug       = true,            -- Enables the test commands below.
    Command     = "keygame",       -- Only useable when `Debug = true` above.
}

if Config.Debug then
    -- OPTIONS IN ORDER:

    -- mode: "arrows", "numbers", or "letters"
    -- keys:  how many keys need to be pressed (expandable but consider screen sizes, up to 20 max)
    -- time:  time in seconds for all keys to be pressed.
    -- title: Title of Action
    -- color  Main color of the UI.
    -- color: Color of the Active Button.

    -- Example:
    -- exports.xmmx_keysgame:StartKeyGame(mode, keys, time, title, color, color)

    RegisterCommand(Config.Command, function()
        -- exports.xmmx_keysgame:StartKeyGame("numbers", 7, 5, "Lock Picking", "#177a28", "#65ca7c") -- Title, Mode, Keys, Time, Main Color, Active Button Color

        exports.xmmx_keysgame:StartKeyGame("letters", 7, 4, "CRAFTING:") -- options with title, no chosen colors.

        -- exports.xmmx_keysgame:StartKeyGame("letters", 7, 5) -- Mode, Keys, Time (No color options or title will use defaults.)
    end)
end