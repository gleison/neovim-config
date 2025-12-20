-- Initial configurations
require('config.remap')
require('config.set')

vim.pack.add({
    { src = 'https://github.com/rose-pine/neovim', name = 'rose-pine' },
    { src = 'https://github.com/neovim/nvim-lspconfig', name = 'lspconfig'},
    { src = 'https://github.com/mason-org/mason.nvim', name = 'mason'},
    { src = 'https://github.com/mason-org/mason-lspconfig.nvim', name = 'mason-lspconfig'},
})

vim.cmd('colorscheme rose-pine')

require('mason').setup({
    ui = { icons = {
        package_installed = '✓',
        package_pending = '➜',
        package_uninstalled = '✗'
    } }
})

local mason_lspconfig = require('mason-lspconfig')

mason_lspconfig.setup({
    ensure_installed = { 'lua_ls', 'jdtls' },
})

vim.lsp.enable('lua_ls')
vim.lsp.enable('jdtls')

local code_action = function(action)
    vim.lsp.buf.code_action({
         context = { only = { action } }, apply = true
    })
end
local organize_imports = function() code_action("source.organizeImports") end
local assign_new_local_variable = function()
    vim.lsp.buf.code_action({
    apply = true,
    filter = function(action)
        return action.title == 'Assign statement to new local variable' or
             action.title == 'Assign to new local variable' or
             action.title == 'Create local variable'
        end
    })
end

vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(ev)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_completion) then
            vim.opt.completeopt = { 'menu', 'menuone', 'noinsert', 'fuzzy', 'popup' }
            vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
            vim.keymap.set('i', '<C-Space>', function()
                vim.lsp.completion.get()
            end)
            local opts = { buffer = ev.buf, remap = false }
            vim.keymap.set("n", "grd", function() vim.lsp.buf.definition() end, vim.tbl_deep_extend("force", opts, { desc = "LSP Goto Definition" }))
            vim.keymap.set("n", "<C-S-o>", organize_imports, vim.tbl_deep_extend("force", opts, { desc = "LSP Organize Imports" }))
            vim.keymap.set("n", "<C-S-l>", assign_new_local_variable, vim.tbl_deep_extend("force", opts, { desc = "LSP Assign To New Local Variable" }))
            vim.keymap.set({ "n", "v" }, "<A-Up>", ":m .-2<CR>==", vim.tbl_deep_extend("force", opts, { desc = "Move Line Up" }))
            vim.keymap.set({ "n", "v" }, "<A-Down>", ":m .+1<CR>==", vim.tbl_deep_extend("force", opts, { desc = "Move Line Down" }))
        end
    end,
})
vim.cmd('set completeopt+=noselect')

vim.diagnostic.config({ virtual_lines = true })

