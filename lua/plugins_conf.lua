local M = {}

function M.setup()
  -- Indicate first time installation
  local packer_bootstrap = false

  -- packer.nvim configuration
  local conf = {
    profile = {
        enable = true,
        threshold = 0, -- the amount in ms that a plugins load time must be over for it to be included in the profile
      },
    display = {
      open_fn = function()
        return require("packer.util").float { border = "rounded" }
      end,
    },
  }

  -- Check if packer.nvim is installed
  -- Run PackerCompile if there are changes in this file
local function packer_init()
    local fn = vim.fn
    local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
    if fn.empty(fn.glob(install_path)) > 0 then
      packer_bootstrap = fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
      }
      vim.cmd [[packadd packer.nvim]]
    end
    vim.cmd "autocmd BufWritePost plugins.lua source <afile> | PackerCompile"
end

  -- Plugins
local function plugins(use)
    use { "wbthomason/packer.nvim" }


    -- Colorscheme
    use {
            "ajmwagar/vim-deus",
            config = function()
                vim.cmd "colorscheme deus"
              end,
        }

    use {
            "jacoborus/tender.vim",
            config = function()
                -- vim.cmd "colorscheme tender"
            end,
    }
    use {
            "dracula/vim",
            config = function()
                -- vim.cmd "colorscheme dracula"
            end,
    }
    use {
            "sainnhe/everforest",
                -- vim.cmd "colorscheme everforest"
            config = function()
            end,
    }
    use {
            "nanotech/jellybeans.vim",
                -- vim.cmd "colorscheme jellybeans"
            config = function()
            end,
    }
    use {
            "gregsexton/Atom",
        config = function()
                -- vim.cmd "colorscheme atom"
        end,
    }


    -- Startup screen
    use {
          'goolord/alpha-nvim',
          wants = { 'kyazdani42/nvim-web-devicons' },
          config = function()
            require("config.alpha").setup()
          end,
          requires = { 'kyazdani42/nvim-web-devicons'},
        }

    -- LSP
    use {
      "neovim/nvim-lspconfig",
      opt = true,
      event = "BufReadPre",
      wants = {"nvim-lsp-installer", "lsp_signature.nvim" }, -- "coq_nvim"
      config = function()
        require("config.lsp").setup()
      end,

      requires = {
        "williamboman/nvim-lsp-installer",
        "ray-x/lsp_signature.nvim",
      },
    }


    -- use {
    --   "ms-jpq/coq_nvim",
    --   disable = false,
    -- }

     -- Completion
    -- use {
    --   "ms-jpq/coq_nvim",
    --   branch = "coq",
    --   event = "InsertEnter",
    --   opt = true,
    --   run = ":COQdeps",
    --   config = function()
    --     require("config.coq").setup()
    --   end,
    --   requires = {
    --     { "ms-jpq/coq.artifacts", branch = "artifacts" },
    --     { "ms-jpq/coq.thirdparty", branch = "3p", module = "coq_3p" },
    --   },
    --   disable = false,
    -- }

    --AutoCompletition
    use {
      "hrsh7th/nvim-cmp",
      event = "InsertEnter",
      opt = true,
      config = function()
        require("config.cmp").setup()
      end,
      wants = { "LuaSnip" },
      requires = {
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-nvim-lua",
        "ray-x/cmp-treesitter",
        "hrsh7th/cmp-cmdline",
        "saadparwaiz1/cmp_luasnip",
        "hrsh7th/cmp-calc",
        "f3fora/cmp-spell",
        "hrsh7th/cmp-emoji",
        {
        'tzachar/cmp-tabnine',
        -- after = "nvim-cmp",
        -- run='./install.sh',
        requires = 'hrsh7th/nvim-cmp',
        config = function()
            require("config.cmp_tabnine").setup()
        end,
        },
        {
          "L3MON4D3/LuaSnip",
          wants = "friendly-snippets",
          config = function()
            require("config.luasnip").setup()
          end,
        },
            "rafamadriz/friendly-snippets",
            disable = false,
      },
    }


    -- Treesitter
    use {
      "nvim-treesitter/nvim-treesitter",
      opt = true,
      event = "BufRead",
      run = ":TSUpdate",
      config = function()
        require("config.treesitter").setup()
      end,
      requires = {
        { "nvim-treesitter/nvim-treesitter-textobjects" },
      },
    }
    -- print(math.random(1, 10))


    -- Auto pairs
    use {
      "windwp/nvim-autopairs",
      wants = "nvim-treesitter",
      module = { "nvim-autopairs.completion.cmp", "nvim-autopairs" },
      config = function()
        require("config.autopairs").setup()
      end,
    }

    -- Better surround: command to replace quotes or brackets csth the substittute cs <sth> for <sth>
    use { "tpope/vim-surround", event = "InsertEnter" }

    -- FZF Lua
    use {
      "ibhagwan/fzf-lua",
      event = "BufEnter",
      wants = "nvim-web-devicons",
    }

    -- User interface
    use {
      "stevearc/dressing.nvim",
      event = "BufEnter",
      config = function()
        require("dressing").setup {
            select = {
            backend = { "telescope", "fzf", "builtin" },
          },
        }
      end,
      disable = true,
    }
    use { "nvim-telescope/telescope.nvim", module = "telescope", as = "telescope" }

    -- WhichKey
    use {
       "folke/which-key.nvim",
       config = function()
         require("config.whichkey").setup()
       end,
    }

    -- Lualine
    use {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true },
      config = function()
          require('config.lualine')
      end,
    }

    -- Git
    use {
      "TimUntersberger/neogit",
      cmd = "Neogit", -- For a specific startup
      requires = "nvim-lua/plenary.nvim",
      config = function()
        require("config.neogit").setup()
      end,
    }

    -- Indent Blankline
    use {
        "lukas-reineke/indent-blankline.nvim",
        event = "BufReadPre", --A specific startup
        requires = "lukas-reineke/indent-blankline.nvim",
        config = function()
            require("config.indent_blankline").setup {
                    space_char_blankline = " ",
                    char_highlight_list = {
                        "IndentBlanklineIndent1",
                        "IndentBlanklineIndent2",
                        "IndentBlanklineIndent3",
                        "IndentBlanklineIndent4",
                        "IndentBlanklineIndent5",
                        "IndentBlanklineIndent6",
                    },
            -- for example, context is off by default, use this to turn it on
                show_current_context = true,
                show_current_context_start = true,
            }
        end,
    }

    -- Load only when require
    use { "nvim-lua/plenary.nvim", module = "plenary" }

     -- Better icons
    use {
      "kyazdani42/nvim-web-devicons",
      module = "nvim-web-devicons",
      config = function()
        require("nvim-web-devicons").setup { default = true }
      end,
    }

    -- Better Comment
    use {
      "numToStr/Comment.nvim",
      opt = true,
      keys = { "gc", "gcc", "gbc" },
      config = function()
        require("Comment").setup {}
      end,
    }

    -- Easy hopping
    use {
      "phaazon/hop.nvim",
      cmd = { "HopWord", "HopChar1" },
      config = function()
        require("hop").setup {}
      end,
    }

     -- Easy motion
    use {
      "ggandor/lightspeed.nvim",
      keys = { "s", "S", "f", "F", "t", "T" },
      config = function()
        require("lightspeed").setup {}
      end,
    }




    -- Bootstrap Neovim
    if packer_bootstrap then
      print "Restart Neovim required after installation!"
      require("packer").sync()
    end
  end

    -- Init and start packer
    packer_init()
    local packer = require "packer"
    packer.init(conf)
    packer.startup(plugins)

end

return M
