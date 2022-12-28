local M = {}

function M.setup()
  local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match "%s" == nil
  end

    local luasnip = require "luasnip"
    local cmp = require "cmp"
    -- local compare = require('cmp.config.compare')

  cmp.setup {
    -- sorting = {
    --     priority_weight = 3,
    --     comparators = {
    --       -- require('cmp_tabnine.compare'),
    --       compare.offset,
    --       compare.exact,
    --       compare.score,
    --       compare.recently_used,
    --       compare.kind,
    --       compare.sort_text,
    --       compare.length,
    --       compare.order,
    --     },
    -- },
    completion = { completeopt = "menu,menuone,noinsert", keyword_length = 5 },
    experimental = { native_menu = false, ghost_text = true },

    --[[ It's  really bad jocke.
        Issues: Error executing vim.schedule lua callback: Vim:E785: complete()
        Solution: https://github.com/hrsh7th/nvim-cmp/issues/936 ]]
    -- view = { entries =  "native" },
    -- Work Around:
    view = cmp.config.window.bordered(),

    snippet = {
      expand = function(args)
        require("luasnip").lsp_expand(args.body)
      end,
    },

    formatting = {
      format = function(entry, vim_item)
        vim_item.menu = ({
          buffer = "[Buffer]",
          -- luasnip = "[Snip]",
          nvim_lua = "[Lua]",
          treesitter = "[Treesitter]",
          cmp_tabnine = "[Tabnine]"
        })[entry.source.name]

        return vim_item
      end,
    },

    mapping = {
      ["<C-k>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
      ["<C-j>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
      ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
      ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
      ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
      ["<C-e>"] = cmp.mapping { i = cmp.mapping.close(), c = cmp.mapping.close() },
      ["<CR>"] = cmp.mapping {
        i = cmp.mapping.confirm { behavior = cmp.ConfirmBehavior.Replace, select = false },
        c = function(fallback)
          if cmp.visible() then
            cmp.confirm { behavior = cmp.ConfirmBehavior.Replace, select = false }
          else
            fallback()
          end
        end,
      },
      ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        elseif has_words_before() then
          cmp.complete()
        else
          fallback()
        end
      end, {
        "i",
        "s",
        "c",
      }),
      ["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, {
        "i",
        "s",
        "c",
      }),
    },
    sources = {
      { name = "treesitter", priority = 1 },
      { name = "buffer", priority = 4 },
      { name = "luasnip", priority = 10 },
      { name = "nvim_lua", priority = 2},
      { name = "path" },
      { name = "spell" },
      { name = "emoji" },
      { name = "calc" },
      { name = 'cmp_tabnine', priority = 1 },
    },

    window = {
        documentation = {
          border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
          winhighlight = "NormalFloat:NormalFloat,FloatBorder:TelescopeBorder",
        },
    }
  }

  -- Use buffer source for `/`
  cmp.setup.cmdline("/", {
    sources = {
      { name = "buffer" },
    },
  })

  -- Use cmdline & path source for ':'
  cmp.setup.cmdline(":", {
    sources = cmp.config.sources({
      { name = "path" },
    }, {
      { name = "cmdline" },
    }),
  })

  -- Auto pairs
  local cmp_autopairs = require("nvim-autopairs.completion.cmp")
  cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done { map_char = { tex = "" } })

end

return M
