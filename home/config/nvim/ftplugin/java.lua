local jdtls = require('jdtls')

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
        bruh = {
            signatureHelp = { enabled = true },
        }
    },
    init_options = {
        bundles = {
            vim.fn.glob("~/.local/share/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar", 1)
        };
    },
}

jdtls.start_or_attach(config)
