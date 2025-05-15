-- ~/.config/nvim/lua/kickstart/plugins/terminal.lua
return {{
    "akinsho/toggleterm.nvim",
    version = "*", -- 如果你在 toggleterm.lua 已加载，可删 version
    config = function()
        local Terminal = require("toggleterm.terminal").Terminal
        local tmux = Terminal:new({
            cmd = "tmux",
            direction = "horizontal",
            size = 15
        })

        function _TMUX_TOGGLE()
            tmux:toggle()
        end

        vim.keymap.set("n", "<leader>t", _TMUX_TOGGLE, {
            noremap = true,
            silent = true
        })
    end
}}
