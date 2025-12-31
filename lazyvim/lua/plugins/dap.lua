return {
  -- nvim-dap 설정
  {
    "mfussenegger/nvim-dap",
    optional = true,
    dependencies = {
      {
        "mason-org/mason.nvim",
        opts = function(_, opts)
          opts.ensure_installed = opts.ensure_installed or {}
          table.insert(opts.ensure_installed, "debugpy")
        end,
      },
    },
  },
  -- nvim-dap-python 설정
  {
    "mfussenegger/nvim-dap-python",
    dependencies = {
      "mfussenegger/nvim-dap",
      "mason-org/mason.nvim",
    },
    config = function()
      -- 시스템의 Python 경로 사용
      local debugpy_path = vim.fn.exepath("python")
      require("dap-python").setup(debugpy_path)
    end,
    keys = {
      { "<leader>dpr", function() require("dap-python").test_method() end, desc = "Debug Python Run" },
      { "<leader>dpc", function() require("dap-python").test_class() end, desc = "Debug Python Class" },
      { "<leader>dps", function() require("dap-python").debug_selection() end, desc = "Debug Python Selection", mode = "v" },
    },
  },
}