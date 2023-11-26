local jdtls = require('jdtls')

-- todo hot reload!

-- java java :doc output for documentation??
-- https://github.com/mfussenegger/nvim-jdtls/issues?q=jdt+%3A%2F%2Fcontents
-- https://github.com/mfussenegger/nvim-jdtls/discussions/124

-- todo do i really even need this??????
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#jdtls

local root_files = {
    'build.xml', -- Ant
    'pom.xml', -- Maven
    'settings.gradle', -- Gradle
    'settings.gradle.kts', -- Gradle
}

local config = {
    cmd = {
        'jdtls',
        -- todo shell expand /home/griffin to ~/ !!!
        '-data', '/home/griffin/.cache/jdtls/workspace'
        -- todo provide --configuration??
    },
    --root_dir = vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw'}, { upward = true })[1]),
    root_dir = jdtls.setup.find_root(root_files),
    settings = {
        java = {
            signatureHelp = { enabled = true },
        },
    },
    init_options = {
        bundles = {
            vim.split(vim.fn.glob("~/.local/share/vscode-java-test/server/*.jar", 1), "\n")
            --vim.fn.glob("~/.local/share/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar", 1)
        };
    },
}

jdtls.start_or_attach(config)

--todo do this automatically
--it needs to wait for the lsp to attach
--require('jdtls.dap').setup_dap_main_class_configs()

--[[
    JdtCompile
    JdtSetRuntime
    JdtUpdateConfig
    JdtUpdateDebugConfig (if dap and java-debug bundles are available)
    JdtUpdateHotcode (if dap and java-debug bundles are available)
    JdtBytecode
    JdtJol
    JdtJshell
    JdtRestart
    ]]--
    --todo!

    --[[
function BruhBruh()
    print("excused me")
    local command = {
        command = "vscode.java.startDebugSession";
        --args = {"mainClass", "projectName"};
    }
    print(vim.lsp.buf.execute_command(command))
      print("excusme")
      print("excusme")
      print("excusme")
      print("excusme")
      print("excusme")
    --[[
    local err, is_test_file = execute_command({ command = "vscode.java.startDebugSession" }, callback, vim.api.nvim_get_current_buf())
    if err then
        print("error: " .. err.message)
    end
    print("result:")
    print(is_test_file)]]--

    --[[
    local dap = require("dap")
    dap.adapters.java = function(callback)
        -- FIXME:
        -- Here a function needs to trigger the `vscode.java.startDebugSession` LSP command
        -- The response to the command must be the `port` used below
        local command = {
            command = "vscode.java.startDebugSession"
        }
        callback({
            type = 'server';
            host = '127.0.0.1';
            port = port;
        })
    end
end

]]--
