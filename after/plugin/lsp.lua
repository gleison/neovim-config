-- default configuration
local lsp = require('lsp-zero')

lsp.preset('recommended')

lsp.on_attach(function(_, bufnr) --client
    lsp.default_keymaps({
        buffer = bufnr,
        preserve_mappings = false
    })
    vim.api.nvim_create_autocmd("CursorHold", {
        buffer = bufnr,
        callback = function()
            local opts = {
                focusable = false,
                close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
                border = 'rounded',
                source = 'always',
                prefix = ' ',
                scope = 'cursor',
            }
            vim.diagnostic.open_float(nil, opts)
        end
    })
end)

local root_markers = {'gradlew', 'mvnw', '.git'}
local root_dir = function ()
    return vim.fs.dirname(vim.fs.find(root_markers, { upward = true })[1])
end

lsp.configure('jdtls', {
  cmd_env = {
      JAVA_HOME = '/Library/Java/JavaVirtualMachines/temurin-17.jdk/Contents/Home',
  },
  root_dir = root_dir,
  settings = {
      java = {
        signatureHelp = { enabled = true },
      },
  },
})

lsp.configure('lua_ls', {
  settings = {
    Lua = {
      diagnostics = { globals = {'vim'} },
    },
  },
})

require('lspconfig').lua_ls.setup({})
lsp.setup()

