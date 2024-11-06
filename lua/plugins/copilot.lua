return {
  -- Inline suggestions plugin
  {
    "github/copilot.vim",
    config = function()
      vim.g.copilot_no_tab_map = true -- disable default tab mapping
      vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
    end
  },
  -- Chatbot interface plugin
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "canary",
    dependencies = {
      { "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
      { "nvim-lua/plenary.nvim" },  -- for curl, log wrapper
    },
    opts = {
      debug = true, -- Enable debugging
    },
    panel = {
      width = 30,  -- Set this to your preferred width
    },
    config = function()
      vim.keymap.set('n', '<leader>co', ':CopilotChat<cr>', { silent = true, noremap = true })
      vim.keymap.set('v', '<leader>co', ':CopilotChat<cr>', { silent = true, noremap = true })
      require('CopilotChat').setup({
        auto_insert_mode = true,
        title = 'nexia',
        prompts = {
          Commit = {
            prompt =
              'Write a commit message for the change with commitizen convention. Make sure the title has maximum 50 characters and message is wrapped at 72 characters. Wrap the whole message in code block with language gitcommit.  Keep the message concise and clear.',
            mapping = "<leader>ccc"
          },
          Fix = {
            prompt =
              'Fix the following code. Only output the result in format ```$filetype\n...\n```:\n```$filetype\n$text\n```',
            mapping = "<leader>ccf"
          },
          CommitStaged = {
            prompt =
              'Write a commit message for the change with commitizen convention. Make sure the title has maximum 50 characters and message is wrapped at 72 characters. Wrap the whole message in code block with language gitcommit.  Make the message very concise.  Make sure the message does not exceed 128 characters. Make sure the message is terse and clear.  Make sure the message is written in active tense.  Make sure the message starts with a verb in the present tense',
            mapping = "<leader>ccs"
          },
          Docs = {
            mapping = "<leader>ccd"
          },
          FixDiagnostic = {
            mapping = "<leader>ccx"
          },
        },
        mappings = {
          complete = {
            insert = '',
          },
          reset = {
            normal = '<C-p>',
            insert = '<C-p>'
          },
        },
      })
    end,
  },
}
