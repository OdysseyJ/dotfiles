return {
  {
    "mg979/vim-visual-multi",
    branch = "master",
    event = "VeryLazy",
    init = function()
      vim.g.VM_maps = {
        ["Find Under"] = "<C-n>",
        ["Find Subword Under"] = "<C-n>",
        ["Add Cursor Down"] = "<C-Down>",
        ["Add Cursor Up"] = "<C-Up>",
        ["Select All"] = "<C-a>",
        ["Skip Region"] = "<C-x>",
        ["Remove Region"] = "<C-p>",
        ["Increase"] = "+",
        ["Decrease"] = "-",
      }
      vim.g.VM_theme = "nord"
      vim.g.VM_mouse_mappings = 1
    end,
    keys = {
      { "<C-n>", mode = { "n", "v" }, desc = "Select word/selection" },
      { "<C-Down>", mode = { "n", "v" }, desc = "Add cursor down" },
      { "<C-Up>", mode = { "n", "v" }, desc = "Add cursor up" },
    },
  },
}

