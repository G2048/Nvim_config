local M = {}

function M.setup()
    local npairs = require("nvim-autopairs")

    npairs.setup {
    check_ts = true,
    enable_afterquote = true,
    }

    npairs.add_rules(require("nvim-autopairs.rules.endwise-lua"))
    -- npairs.add_rules(require('nvim-treesitter.configs').setup {
        -- endwise = { enable = true, },
        -- })

end

return M
