return {
    { 'VonHeikemen/lsp-zero.nvim',        branch = 'v4.x' },
    { 'williamboman/mason.nvim' },
    { 'williamboman/mason-lspconfig.nvim' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'onsails/lspkind.nvim' },
    {
        'neovim/nvim-lspconfig',
        config = function()
            local lsp_zero = require('lsp-zero')

            local lsp_attach = function(_, bufnr)
                local opts = { buffer = bufnr }

                vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
                vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
                vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
                vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
                vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
                vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
                vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
                vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
                vim.keymap.set({ 'n', 'x' }, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
                vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)

                local augroup = vim.api.nvim_create_augroup('LspFormatting', {})

                vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
                vim.api.nvim_create_autocmd('BufWritePre', {
                    group = augroup,
                    buffer = bufnr,
                    callback = function()
                        vim.lsp.buf.format()
                    end,
                })
            end

            lsp_zero.extend_lspconfig({
                sign_text = true,
                lsp_attach = lsp_attach,
                capabilities = require('cmp_nvim_lsp').default_capabilities(),
            })

            require('mason').setup({})
            require('mason-lspconfig').setup({
                handlers = {
                    function(server_name)
                        require('lspconfig')[server_name].setup({})
                    end,
                },
            })
        end
    },
    {
        'hrsh7th/nvim-cmp',
        config = function()
            local cmp = require('cmp')
            local cmp_action = require('lsp-zero').cmp_action()
            local lspkind = require('lspkind')

            -- C for custom xd !
            vim.api.nvim_set_hl(0, "CPmenu", { bg = "" })

            cmp.setup({
                sources = {
                    { name = 'nvim_lsp' },
                },
                window = {
                    completion = cmp.config.window.bordered({
                        winhighlight = "Normal:CPmenu,FloatBorder:CPmenu,CursorLine:PmenuSel,Search:None"
                    }),
                    documentation = cmp.config.window.bordered()
                },
                mapping = cmp.mapping.preset.insert({
                    ['<C-p>'] = cmp.mapping.select_prev_item({ behavior = 'select' }),
                    ['<C-n>'] = cmp.mapping.select_next_item({ behavior = 'select' }),
                    ['<CR>'] = cmp.mapping.confirm({ select = false }),
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-f>'] = cmp_action.vim_snippet_jump_forward(),
                    ['<C-b>'] = cmp_action.vim_snippet_jump_backward(),
                    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-d>'] = cmp.mapping.scroll_docs(4),
                }),
                snippet = {
                    expand = function(args)
                        vim.snippet.expand(args.body)
                    end,
                },
                formatting = {
                    format = lspkind.cmp_format({
                        mode = "symbol_text",
                        maxwidth = 50,
                        ellipsis_char = "...",
                        show_labelDetails = true
                    })
                }
            })
        end
    },

    -- RUST
    {
        {
            'mrcjkb/rustaceanvim',
            version = '^5',
            lazy = false,
        },
        {
            'saecki/crates.nvim',
            event = { "BufRead Cargo.toml" },
            config = function()
                require('crates').setup()
            end,
        }
    }
}
