local separator = package.config:sub(1,1);

local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local workspace_dir = vim.fn.stdpath("data") .. separator .. "jdtls-workspace" .. separator .. project_name
local os_name = vim.loop.os_uname().sysname

local config = {
    cmd = {
        "java",
        "-Declipse.application=org.eclipse.jdt.ls.core.id1",
        "-Dosgi.bundles.defaultStartLevel=4",
        "-Declipse.product=org.eclipse.jdt.ls.core.product",
        "-Dlog.protocol=true",
        "-Dlog.level=ALL",
        "-Xmx1g",
        "--add-modules=ALL-SYSTEM",
        "--add-opens",
        "java.base/java.util=ALL-UNNAMED",
        "--add-opens",
        "java.base/java.lang=ALL-UNNAMED",

        "-jar",
        vim.fn.glob(vim.fn.stdpath("data") .. separator .. "mason" .. separator .. "packages" .. separator .. "jdtls" .. separator .. "plugins" .. separator .. "org.eclipse.equinox.launcher_*.jar"),

        "-configuration",
        vim.fn.stdpath("data") .. separator .. "mason" .. separator .. "packages" .. separator .. "jdtls" .. separator .. "config_" .. (os_name == "Windows_NT" and "win" or os_name == "Linux" and "linux" or "mac"),

        "-data",
        workspace_dir,
    },

    root_dir = vim.fs.root(vim.fs.dirname(vim.api.nvim_buf_get_name(0)), { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }),

    settings = {
        java = {
            signatureHelp = { enabled = true },
            eclispe = {
                downloadSources = true,
            },
            maven = {
                downloadSources = true,
            },
            import = {
                maven = { enabled = true },
            },
            configuration = {
                updateBuildConfiguration = "interactive",
            },
            implementationsCodeLens = "all",
            referencesCodeLens = {
                enabled = true,
            },
            inlayHints = {
                enabled = true,
            },
            references = {
                includeDecompiledSources = true,
            },
            symbols = {
                includeSourceMethodDeclarations = true,
            },
            sources = {
                organizeImports = {
                    starThreshold = 9999,
                    staticStarThreshold = 9999,
                }
            },
            completion = { importOrder = { "java", "javax", "com", "org" } },
        },
    },

    init_options = {
        bundles = {},
    },
}

return config
