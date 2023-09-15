return {
    'neovim/nvim-lspconfig',
    dependencies = {
        'hrsh7th/cmp-nvim-lsp',
        { 'antosha417/nvim-lsp-file-operations', config = true },
    },
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
        local lspconfig = require('lspconfig')
        local cmp_nvim_lsp = require('cmp_nvim_lsp')
        local on_attach = function(client, bufnr)
            local opts = { noremap = true, silent = true }
            opts.buffer = bufnr
            local builtin = require('telescope.builtin')
            vim.keymap.set('n', 'gr', builtin.lsp_references, opts)
            vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
            vim.keymap.set('n', 'gd', builtin.lsp_definitions, opts)
            vim.keymap.set('n', 'gi', builtin.lsp_implementations, opts)
            vim.keymap.set('n', 'gt', builtin.lsp_type_definitions, opts)
            vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
            vim.keymap.set('n', '<leader>k', vim.lsp.buf.hover, opts)
            vim.keymap.set('n', '<leader>K', vim.lsp.buf.signature_help, opts)
            vim.keymap.set('n', '<leader>D', function () builtin.diagnostics({severity_limit = 'error'}) end, opts)
            vim.keymap.set('n', '<leader>d', function () builtin.diagnostics({bufnr = 0}) end, opts)
            vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
            vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
            vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
            vim.api.nvim_create_autocmd('CursorHold', {
                buffer = bufnr,
                callback = function()
                    local options = {
                        focusable = false, source = 'always', scope = 'cursor',
                        close_events = { 'BufLeave', 'CursorMoved', 'InsertEnter', 'FocusLost' },
                    }
                    vim.diagnostic.open_float(nil, options)
                end,
            })
            print('lsp server (' .. client .. ') attached')
        end
        local signs = { Error = ' ', Warn = ' ', Hint = '󰠠 ', Info = ' ' }
        for type, icon in pairs(signs) do
            local hl = 'DiagnosticSign' .. type
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
        end
        vim.diagnostic.config({ virtual_text = false })
        local capabilities = cmp_nvim_lsp.default_capabilities()
        lspconfig['html'].setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })
        lspconfig['cssls'].setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })
        lspconfig['jdtls'].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            cmd_env = {
                JAVA_HOME = '/Library/Java/JavaVirtualMachines/temurin-17.jdk/Contents/Home',
            },
            root_dir = function(fname)
                return lspconfig.util.root_pattern('gradlew', 'mvnw', '.git')(fname) or vim.fn.getcwd()
            end,
            settings = {
                java = {
                    signatureHelp = {
                        enabled = true,
                        description = { enabled = true },
                    },
                },
            },
        })
        lspconfig['lua_ls'].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { 'vim' },
                    },
                    workspace = {
                        library = {
                            [vim.fn.expand('$VIMRUNTIME/lua')] = true,
                            [vim.fn.stdpath('config') .. '/lua'] = true,
                        },
                    },
                },
            },
        })
    end,
}
