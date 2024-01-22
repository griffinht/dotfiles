local jdtls = require('jdtls')

-- todo hot reload!

-- java java :doc output for documentation??
-- https://github.com/mfussenegger/nvim-jdtls/issues?q=jdt+%3A%2F%2Fcontents
-- https://github.com/mfussenegger/nvim-jdtls/discussions/124

-- todo do i really even need this??????
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#jdtls

local root_files = {
    '.project', -- eclipse
    'build.xml', -- Ant
    'pom.xml', -- Maven
    'settings.gradle', -- Gradle
    'settings.gradle.kts', -- Gradle
}

local bundles = {
    -- JdtUpdateDebugConfig
    vim.fn.expand("~/.guix-home/profile/lib/java-debug");
}
-- vscode-java-test
-- https://github.com/mfussenegger/nvim-jdtls#vscode-java-test-installation
-- :lua require ("jdtls.dap").test_class()
-- see :help dap i think?
vim.list_extend(bundles, vim.split(vim.fn.glob("~/.guix-home/profile/lib/vscode-java-test/*.jar"), "\n"));

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
        bundles = bundles;
    },
}

jdtls.start_or_attach(config)

local jdtls_dap = require("jdtls.dap")
vim.keymap.set('n', '<Leader>tT', jdtls_dap.test_class)
vim.keymap.set('n', '<Leader>tt', jdtls_dap.test_nearest_method)
vim.keymap.set('n', '<Leader>tf', jdtls_dap.pick_test)

local jdtls_tests = require("jdtls.tests")
vim.keymap.set('n', '<Leader>tG', jdtls_tests.generate)
vim.keymap.set('n', '<Leader>tg', jdtls_tests.goto_subjects)

-- todo update debug config, or maybe do that automatically?
-- magical hot code reload
vim.keymap.set('n', '<Leader>th', function() vim.cmd("JdtUpdateHotcode") end)
vim.keymap.set('n', '<Leader>ts', function() vim.cmd("JdtJshell") end)


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
