-- Alternative lazygit configuration using toggleterm
return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = {
      size = function(term)
        if term.direction == "horizontal" then
          return 15
        elseif term.direction == "vertical" then
          return vim.o.columns * 0.4
        else
          return 20
        end
      end,
      open_mapping = [[<c-\>]],
      hide_numbers = true,
      shade_terminals = true,
      shading_factor = 2,
      start_in_insert = true,
      insert_mappings = true,
      persist_size = true,
      direction = "float",
      close_on_exit = true,
      shell = vim.o.shell,
      float_opts = {
        border = "curved",
        winblend = 0,
        highlights = {
          border = "Normal",
          background = "Normal",
        },
        width = function()
          return math.floor(vim.o.columns * 0.9)
        end,
        height = function()
          return math.floor(vim.o.lines * 0.9)
        end,
      },
    },
    config = function(_, opts)
      require("toggleterm").setup(opts)
      
      -- Create a lazygit terminal
      local Terminal = require("toggleterm.terminal").Terminal
      local lazygit = Terminal:new({
        cmd = "lazygit",
        dir = "git_dir",
        direction = "float",
        float_opts = {
          border = "double",
          width = function()
            return math.floor(vim.o.columns * 0.95)
          end,
          height = function()
            return math.floor(vim.o.lines * 0.95)
          end,
        },
        -- function to run on opening the terminal
        on_open = function(term)
          vim.cmd("startinsert!")
          vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", {noremap = true, silent = true})
        end,
        -- function to run on closing the terminal
        on_close = function(term)
          vim.cmd("startinsert!")
        end,
      })

      function _lazygit_toggle()
        lazygit:toggle()
      end

      -- Add keymapping
      vim.api.nvim_set_keymap("n", "<leader>gg", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true, desc = "LazyGit"})
    end,
  },
}