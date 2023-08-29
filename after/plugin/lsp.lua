-- default configuration
local lsp = require('lsp-zero')

lsp.preset('recommended')

local root_markers = {'gradlew', 'mvnw', '.git'}
local root_dir = vim.fs.dirname(vim.fs.find(root_markers, { upward = true })[1]),

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

require('lspconfig').lua_ls.setup({})
lsp.setup()

