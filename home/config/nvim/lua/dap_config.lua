--todo refactor to other file
local dap = require("dap")

require("dap_java").configure(dap)


-- caused by not defining "program"
-- Error on launch: executable module does not exist


-- to find log location:
-- :lua print(vim.fn.stdpath('cache'))
dap.set_log_level("DEBUG")

-- todo build process
--https://github.com/mfussenegger/nvim-dap/issues/720

-- todo apply runInTerminal for everything c related including launch.json
do
    -- /path/to/program.c -> /path/to/
    local working_directory = vim.fs.dirname(vim.api.nvim_buf_get_name(0));
    -- /path/to/program.c -> /path/to/program
    local program_path = vim.fn.expand("%:r")
    -- /path/to/program.c -> program
    --local program = vim.fn.expand("%:t:r")
    local program = vim.fs.basename(program_path)

    -- dap.configurations
        -- keys are filetypes

    -- default c configuration
    -- assumes the current file example.c can be run as example
    -- todo add build???
    dap.configurations.c = {}

    -- local program
    do
        table.insert(dap.configurations.c, {
            -- https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation#ccrust-via-lldb-vscode
            -- https://llvm.googlesource.com/lldb/+/master/tools/lldb-vscode/
            -- see section "Launch Configuration Settings"

            -- friendly name, shown in certain menus
            name = "Launch C debugger for \"" .. program_path .. "\" (default)";
            -- which adapter to use
            -- note that type does not actually have to be "lldb-vscode" as states on the docs
            -- type is what nvim-dap uses to find the adapter to use
            type = "lldb-vscode";
            request = "launch";

            --initCommands = { "platform shell touch /tmp/aslidufh"};

            -- cwd of lldb-vscode i think?
            --debuggerRoot = working_directory;

            -- program to launch
            program = program_path;
            -- cwd of program
            --cwd = working_directory;

            -- super secret barely document feature that exposes the terminal
            -- todo find the documentation for this
            --https://github.com/llvm/llvm-project/blob/main/lldb/tools/lldb-dap/package.json
            runInTerminal = true;

            --stopOnEntry = true,
        })
    end

    -- make
    do
        table.insert(dap.configurations.c, {
            name = "Launch C debugger for \"" .. "make " .. program .. "\" (from Makefile kind of)";
            type = "lldb-vscode";
            request = "launch";
            program = function()
                local output = vim.fn.system("cd " .. working_directory .. " && make " .. program)
                if vim.v.shell_error ~= 0 then
                    error("error while building " .. program .. ": exited with code " .. vim.v.shell_error .. ", output:\n" .. output)
                    --todo improve error reporting to user (its ugly right now, maybe try a modal?)
                    --todo find a way to gracefully cancel the lsp launch
                    --return nil
                end

                return program_path
            end;
            runInTerminal = true;
        })
    end
end


--[[
dap.configurations.sh = {}
do
    -- todo
    --https://github.com/williamboman/mason.nvim/discussions/539
    --https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation#bash
    local program_path = vim.api.nvim_buf_get_name(0);

    table.insert(dap.configurations.sh, {
        name = "Launch Bash debugger for \"" .. program_path .. "\" (default)";
        type = "bashdb";
        request = "launch";
        -- cwd of lldb-vscode i think?
        --debuggerRoot = working_directory;
        -- program to launch
        program = program_path;
        pathBashdb = BASHDB_DIR .. "/bashdb",
        pathBashdbLib = BASHDB_DIR,
        -- cwd of program
        --cwd = working_directory;
        --stopOnEntry = true,
    })
end]]--

-- .vscode/launch.json
do
    local dap_current_file = vim.fs.dirname(vim.api.nvim_buf_get_name(0))
    local dap_project_root = vim.fs.dirname(vim.fs.find({'.vscode'}, {
        upward = true,
        path = dap_current_file,
    })[1])

    if dap_project_root ~= nil then
        local type_to_filetypes = {}
        type_to_filetypes["lldb-vscode"] = { "c", "cpp", "h", "hpp" }
        require("dap.ext.vscode").load_launchjs(dap_project_root .. "/.vscode/launch.json", type_to_filetypes)
    else
        print("couldn't find dap project root for file " .. dap_current_file)
    end
end



-- terminal config
do
    -- for external terminal to work it needs to be forced and there needs to be a fallback.external_terminal configuration defined, as below
    --dap.defaults.fallback.force_external_terminal = true
    dap.defaults.fallback.external_terminal = {
        -- spawns a foot terminal window with some nice formatting
        -- todo debug why the cwd on this is borked
        -- i hate dap! i hate dap!
        command = "debug-client.sh";
        --args = {};
    }
end

-- ADAPTER CONFIG

-- lldb-vscode is included in the guix lldb package
-- it is simply a dap adapter for lldb, and will probably be renamed to lldb-dap soon
-- https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation#ccrust-via-lldb-vscode
local function find_executable(executable)
    local path = vim.fn.exepath(executable)
    if path == "" then
        -- vim.fn.exepath returns "" empty string when not found
        -- this causes a confusing error message when nvim-dap tries to run the configuration
        -- so instead, return the executable (which won't be found) but will provide a more helpful error
        return executable
    end

    return path
end
dap.adapters["lldb-vscode"] = {
    type = "executable";
    --must be an absolute path
    -- this is because lldb will try to reexecute itself to pipe the terminal in if runInTerminal is true
    -- putting a relative path here breaks this
    --command = "lldb-vscode"
    --todo when lldb-vscode is not found this gives an empty string
    command = find_executable("lldb-vscode");
    options = {
        cwd = "/";
    };
}
dap.adapters.bashdb = {
    type = "executable";
    --command = find_executable("bashdb")
    command = "bashdb"
}



-- set leader to space
-- todo centralize keymap config?
vim.g.mapleader = " "
--vim.keymap.set("n", "gD", vim.lsp.buf.declaration, options)
--dap.toggle_breakpoint()
vim.keymap.set('n', '<F5>', dap.continue)
vim.keymap.set('n', '<F10>', dap.step_over)
vim.keymap.set('n', '<F11>', dap.step_into)
vim.keymap.set('n', '<F12>', dap.step_out)
vim.keymap.set('n', '<Leader>b', dap.toggle_breakpoint)
vim.keymap.set('n', '<Leader>B', dap.set_breakpoint)

vim.keymap.set('n', '<Leader>dp', dap.pause)
vim.keymap.set('n', '<Leader>dt', dap.terminate)

vim.keymap.set('n', '<Leader>lp', function() dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
vim.keymap.set('n', '<Leader>dr', function() dap.repl.open() end)
vim.keymap.set('n', '<Leader>dl', function() dap.run_last() end)

local dap_widgets = require("dap.ui.widgets")
vim.keymap.set({'n', 'v'}, '<Leader>dh', dap_widgets.hover)
--vim.keymap.set({'n', 'v'}, '<Leader>dp', dap_widgets.preview)
vim.keymap.set('n', '<Leader>df', function() dap_widgets.centered_float(dap_widgets.frames) end)
vim.keymap.set('n', '<Leader>ds', function() dap_widgets.centered_float(dap_widgets.scopes) end)





