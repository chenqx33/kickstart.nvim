-- 文件路径: lua/custom/plugins/java.lua
local M = {}

local home = os.getenv("HOME")

M.setup = function()
    local jdtls = require('jdtls')

    local config = {
        cmd = {home .. '/.sdkman/candidates/java/current/bin/java', '-javaagent:' .. home .. '/Library/Java/lombok.jar',
               '-Xms1g', '--add-modules=ALL-SYSTEM', '--add-opens', 'java.base/java.util=ALL-UNNAMED', '--add-opens',
               'java.base/java.lang=ALL-UNNAMED', '-jar',
               home ..
            '/.local/share/nvim/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_1.7.0.v20250331-1702.jar',
               '-configuration', home .. '/.local/share/nvim/mason/packages/jdtls/config_mac', '-data',
               home .. '/.cache/jdtls/workspace/' .. vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')},

        root_dir = require('jdtls.setup').find_root({'.git', 'mvnw', 'gradlew'}),
        settings = {
            java = {
                configuration = {
                    runtimes = {{
                        name = "JavaSE-21",
                        path = home .. '/.sdkman/candidates/java/current'
                    }}
                }
            }
        }
    }

    jdtls.start_or_attach(config)
end

return M
