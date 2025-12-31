return {
  "nvim-telescope/telescope.nvim",
  optional = true, -- LazyVim extra에서 이미 로드되므로
  opts = function(_, opts)
    -- 기본 설정 확장
    opts.defaults = vim.tbl_extend("force", opts.defaults or {}, {
      -- ripgrep 설정: 숨김 파일과 gitignore 파일도 검색
      vimgrep_arguments = {
        "rg",
        "--color=never",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
        "--smart-case",
        "--no-ignore", -- .gitignore 무시
        "--glob",
        "!**/.git/*", -- .git 폴더는 제외
        "--glob",
        "!**/node_modules/*",
        "--glob",
        "!**/__pycache__/*",
      },
    })

    -- picker별 설정
    opts.pickers = vim.tbl_extend("force", opts.pickers or {}, {
      find_files = {
        hidden = true,
        no_ignore = true,
        find_command = {
          "rg",
          "--files",
          "--hidden",
          "--no-ignore",
          "--glob",
          "!**/.git/*",
          "--glob",
          "!**/node_modules/*",
        },
      },
      live_grep = {
        additional_args = function()
          return { "--no-ignore" }
        end,
      },
      grep_string = {
        additional_args = function()
          return { "--no-ignore" }
        end,
      },
    })

    return opts
  end,
}

