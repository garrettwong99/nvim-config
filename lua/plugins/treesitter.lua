return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = { "lua", "python", "ruby" }, -- Add more languages as needed
      highlight = {
        enable = true, -- Enable Treesitter-based highlighting
        additional_vim_regex_highlighting = false,
      },
      indent = {
        enable = true, -- Enable Treesitter-based indentation
      },
    })
  end,
}
