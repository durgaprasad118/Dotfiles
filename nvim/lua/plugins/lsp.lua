-- Neovim configuration for LSP and Tailwind CSS IntelliSense
return {
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "stylua",
        "selene",
        "luacheck",
        "shellcheck",
        "shfmt",
        "tailwindcss-language-server",
        "typescript-language-server",
        "css-lsp",
        "vls", -- Vue Language Server
      })
    end,
  },

  -- LSP servers configuration
  {
    "neovim/nvim-lspconfig",
    init = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      keys[#keys + 1] = {
        "gd",
        function()
          require("telescope.builtin").lsp_definitions({ reuse_win = false })
        end,
        desc = "Goto Definition",
        has = "definition",
      }
      keys[#keys + 1] = { "K", vim.lsp.buf.hover, desc = "Hover Documentation" }
      keys[#keys + 1] = { "<leader>gd", vim.lsp.buf.definition, desc = "Goto Definition" }
      keys[#keys + 1] = { "<leader>gr", vim.lsp.buf.references, desc = "References" }
      keys[#keys + 1] = { "<leader>ca", vim.lsp.buf.code_action, desc = "Code Action" }
      keys[#keys + 1] = { "<leader>rn", vim.lsp.buf.rename, desc = "Rename" }
      keys[#keys + 1] = { "<space>rn", vim.lsp.buf.rename, desc = "Rename" }
    end,
    opts = {
      inlay_hints = { enabled = false },
      servers = {
        cssls = {},
        tailwindcss = {
          cmd = { "tailwindcss-language-server", "--stdio" },
          filetypes = { "html", "css", "scss", "javascript", "javascriptreact", "typescript", "typescriptreact", "vue" },
          settings = {
            tailwindCSS = {
              validate = true,
              lint = {
                cssConflict = "warning",
                invalidApply = "error",
              },
            },
          },
          root_dir = function(...)
            return require("lspconfig.util").root_pattern(".git", "tailwind.config.js")(...)
          end,
        },
        tsserver = {
          root_dir = function(...)
            return require("lspconfig.util").root_pattern(".git")(...)
          end,
          single_file_support = false,
          settings = {
            typescript = {
              inlayHints = {
                includeInlayParameterNameHints = "literal",
                includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHints = false,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayEnumMemberValueHints = true,
              },
            },
            javascript = {
              inlayHints = {
                includeInlayParameterNameHints = "all",
                includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHints = true,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayEnumMemberValueHints = true,
              },
            },
          },
        },
        html = {},
        yamlls = {
          settings = {
            yaml = {
              keyOrdering = false,
            },
          },
        },
        lua_ls = {
          single_file_support = true,
          settings = {
            Lua = {
              workspace = {
                checkThirdParty = false,
              },
              completion = {
                workspaceWord = true,
                callSnippet = "Both",
              },
              hint = {
                enable = true,
                setType = false,
                paramType = true,
                paramName = "Disable",
                semicolon = "Disable",
                arrayIndex = "Disable",
              },
              diagnostics = {
                disable = { "incomplete-signature-doc", "trailing-space" },
              },
            },
          },
        },
        vls = {
          cmd = { "vls" },
          filetypes = { "vue" },
          root_dir = function(...)
            return require("lspconfig.util").root_pattern("vue.config.js", "package.json", ".git")(...)
          end,
        },
        astro = {
          root_dir = function(...)
            return require("lspconfig.util").root_pattern("astro.config.js", "astro.config.ts")(...)
          end,
        },
      },
      setup = {},
    },
  },
}
