return {
  "nvim-neo-tree/neo-tree.nvim",
  optional = true, -- LazyVim extra에서 이미 로드되므로
  opts = {
    filesystem = {
      filtered_items = {
        visible = true, -- 필터된 아이템을 보이게
        hide_dotfiles = false, -- dotfiles 표시
        hide_gitignored = false, -- gitignore 파일도 표시
        hide_by_name = {
          ".git",
          ".DS_Store",
          "thumbs.db",
          "node_modules",
          "__pycache__",
        },
        always_show = { -- 항상 표시할 파일/폴더
          ".github",
          ".gitignore",
          ".env",
        },
        never_show = {}, -- 절대 표시하지 않을 파일/폴더
      },
      follow_current_file = {
        enabled = true,
      },
    },
    window = {
      mappings = {
        ["H"] = "toggle_hidden", -- H 키로 숨김 파일 토글
      },
    },
  },
}