return {
  -- Python LSP 추가 설정 (basedpyright 사용)
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- Pyright 명시적으로 비활성화
        pyright = { enabled = false },
        -- Basedpyright 사용 (Django 지원이 더 나음)
        basedpyright = {
          enabled = true,
          mason = true, -- Mason으로 설치된 것 사용
          settings = {
            python = {
              analysis = {
                -- 자동 import를 위한 핵심 설정
                autoImportCompletions = true,
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                indexing = true, -- 전체 프로젝트 인덱싱 활성화
                -- import 관련 추가 설정
                importFormat = "absolute",
                completeFunctionCalls = true,
                -- Type checking: off로 설정하면 경고 없음, basic은 최소한의 경고만
                typeCheckingMode = "off",
                -- 제외 폴더
                exclude = { "**/migrations/**", "**/__pycache__/**", "**/node_modules/**", "**/.venv/**" },
              },
            },
          },
          -- 추가 capabilities 설정
          capabilities = {
            textDocument = {
              codeAction = {
                dynamicRegistration = true,
                codeActionLiteralSupport = {
                  codeActionKind = {
                    valueSet = {
                      "quickfix",
                      "refactor",
                      "source.organizeImports",
                      "source.fixAll",
                    },
                  },
                },
              },
            },
          },
        },
      },
    },
  },
  -- Python 가상환경 선택기
  {
    "linux-cultist/venv-selector.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      "nvim-telescope/telescope.nvim",
      "mfussenegger/nvim-dap-python", -- 디버깅 지원 (선택사항)
    },
    opts = {
      -- 가상환경 자동 감지 설정
      auto_refresh = true,
      search_venv_managers = true,
      search_workspace = true,
      -- 가상환경 검색 경로
      parents = 2, -- 상위 디렉토리 2단계까지 검색
      name = {
        "venv",
        ".venv",
        "env",
        ".env",
      },
      -- 가상환경 변경 시 LSP 재시작
      changed_venv_hooks = {
        function()
          vim.cmd("LspRestart")
        end,
      },
    },
    event = "VeryLazy",
    keys = {
      { "<leader>cv", "<cmd>VenvSelect<cr>", desc = "Select VirtualEnv" },
      { "<leader>cV", "<cmd>VenvSelectCached<cr>", desc = "Select Cached VirtualEnv" },
    },
  },
}