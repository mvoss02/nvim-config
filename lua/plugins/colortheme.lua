-- Custom styling
-- More information can be found under: https://github.com/catppuccin/nvim

return {
  "catppuccin/nvim",
  lazy = false,
  name = "catppuccin",
  priority = 1000,
  config = function()
    local bg_transparent = true

    local function apply_catppuccin_theme()
      require("catppuccin").setup({
        flavour = "macchiato",
        transparent_background = bg_transparent,
        show_end_of_buffer = false,
        term_colors = false,
        dim_inactive = {
          enabled = false,
          shade = "dark",
          percentage = 0.15,
        },
        no_italic = false,
        no_bold = false,
        no_underline = false,
        styles = {
          comments = {},
          conditionals = { "italic" },
          loops = {},
          functions = {},
          keywords = {},
          strings = {},
          variables = {},
          numbers = {},
          booleans = {},
          properties = {},
          types = {},
          operators = {},
        },
        color_overrides = {},
        custom_highlights = {},
        default_integrations = true,
        integrations = {
          cmp = true,
          gitsigns = true,
          nvimtree = true,
          treesitter = true,
          notify = false,
          mini = {
            enabled = true,
            indentscope_color = "",
          },
        },
      })

      vim.cmd.colorscheme("catppuccin")

      if bg_transparent then
        vim.cmd [[
          highlight Normal guibg=NONE ctermbg=NONE
          highlight NormalNC guibg=NONE ctermbg=NONE
          highlight EndOfBuffer guibg=NONE ctermbg=NONE
          highlight VertSplit guibg=NONE ctermbg=NONE
          highlight SignColumn guibg=NONE ctermbg=NONE
          highlight MsgArea guibg=NONE ctermbg=NONE
        ]]
      end
    end

    apply_catppuccin_theme()

    local function toggle_transparency()
      bg_transparent = not bg_transparent
      apply_catppuccin_theme()
    end

    vim.keymap.set('n', '<leader>bg', toggle_transparency, { noremap = true, silent = true })
  end
}

