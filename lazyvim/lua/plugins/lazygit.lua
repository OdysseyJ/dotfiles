-- Lazygit integration for Neovim
return {
  "kdheepak/lazygit.nvim",
  cmd = {
    "LazyGit",
    "LazyGitConfig",
    "LazyGitCurrentFile",
    "LazyGitFilter",
    "LazyGitFilterCurrentFile",
  },
  -- optional for floating window border decoration
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
  -- setting the keybinding for LazyGit with 'keys' is recommended in
  -- order to load the plugin when the command is run for the first time
  keys = {
    { "<leader>gg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
    { "<leader>gG", "<cmd>LazyGitCurrentFile<cr>", desc = "LazyGit Current File" },
    { "<leader>gc", "<cmd>LazyGitConfig<cr>", desc = "LazyGit Config" },
    { "<leader>gf", "<cmd>LazyGitFilter<cr>", desc = "LazyGit Filter" },
  },
  config = function()
    -- Basic configuration
    vim.g.lazygit_floating_window_scaling_factor = 0.9
    vim.g.lazygit_floating_window_use_plenary = 1
    vim.g.lazygit_use_neovim_remote = 1
    
    -- Custom keybindings within lazygit can be defined here
    vim.api.nvim_create_autocmd("BufEnter", {
      pattern = "*.git/COMMIT_EDITMSG",
      command = "setlocal spell"
    })
  end,
}