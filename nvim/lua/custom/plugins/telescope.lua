local M = {}
M = {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
    dependencies = { { 'nvim-lua/plenary.nvim' } },
    config = function()
      require('telescope').setup({
        --
        extensions = {
          ['ui-select'] = {
            require('telescope.themes').get_dropdown(),
          },
        },
        vimgrep_arguments = {
          'rg',
          '--color=never',
          '--no-heading',
          '--with-filename',
          '--line-number',
          '--column',
          '--smart-case',
        },
      })

      -- Enable Telescope extensions if they are installed
      pcall(require('telescope').load_extension, 'fzf')
      pcall(require('telescope').load_extension, 'ui-select')
      pcall(require('telescope').load_extension, 'neoclip')
      require('neoclip').setup({
        default_register = '+',
        enable_persistent_history = true,

        keys = {
          telescope = {
            i = {
              select = { '<c-y>', '<cr>' },
              paste = '<cr>',
              paste_behind = '<c-P>',
              custom = {
                ['<c-p>'] = function()
                  print('p pressed')
                  -- move to previous item by telescope
                  require('telescope').extensions.neoclip.move()
                end,
              },
            },
            n = {
              select = { '<c-y>', '<cr>' },
              paste = 'p',
              paste_behind = 'P',
            },
          },
        },
      })
      -- See `:help telescope.builtin`
      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
      vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
      vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
      vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
      vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
      vim.keymap.set('n', '<leader>sg', builtin.git_files, { desc = '[S]earch [G]it files' })
      vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
      vim.keymap.set(
        'n',
        '<leader>s.',
        builtin.oldfiles,
        { desc = '[S]earch Recent Files ("." for repeat)' }
      )
      vim.keymap.set('n', '<leader>b', builtin.buffers, { desc = '[ ] Find existing buffers' })
      vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
      vim.keymap.set('n', '<leader>sc', builtin.commands, { desc = '[S]earch [C]ommands' })
      vim.keymap.set('n', '<leader>sm', builtin.marks, { desc = '[S]earch [M]rks' })
      vim.keymap.set(
        'n',
        '<leader>sp',
        '<cmd>Telescope neoclip a extra=plus<cr>',
        { desc = '[S]earch [P]aste' }
      )

      vim.keymap.set('n', '<leader>rg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
      vim.keymap.set(
        'n',
        '<leader>rh',
        builtin.command_history,
        { desc = 'search command history' }
      )

      vim.keymap.set('n', '<leader>gc', builtin.git_commits, { desc = 'search git commits' })
      vim.keymap.set(
        'n',
        '<leader>gm',
        builtin.git_bcommits,
        { desc = 'search git commits in different branch' }
      )
      vim.keymap.set('n', '<leader>gb', builtin.git_branches, { desc = 'search git branch' })
      vim.keymap.set('n', '<leader>gs', builtin.git_stash, { desc = 'search git stash' })
      -- Slightly advanced example of overriding default behavior and theme
      vim.keymap.set('n', '<leader>/', function()
        -- You can pass additional configuration to Telescope to change the theme, layout, etc.
        builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown({
          winblend = 10,
          previewer = false,
        }))
      end, { desc = '[/] Fuzzily search in current buffer' })

      -- It's also possible to pass additional configuration options.
      --  See `:help telescope.builtin.live_grep()` for information about particular keys
      vim.keymap.set('n', '<leader>s/', function()
        builtin.live_grep({
          grep_open_files = true,
          prompt_title = 'Live Grep in Open Files',
        })
      end, { desc = '[S]earch [/] in Open Files' })

      -- Shortcut for searching your Neovim configuration files
      vim.keymap.set('n', '<leader>sn', function()
        builtin.find_files({ cwd = vim.fn.stdpath('config') })
      end, { desc = '[S]earch [N]eovim files' })
    end,
  },
  {
    'folke/flash.nvim',
    event = 'VeryLazy',
    opts = {},
    keys = {
      {
        's',
        mode = { 'n', 'x', 'o' },
        function()
          require('flash').jump()
        end,
        desc = 'Flash',
      },
      {
        'S',
        mode = { 'n', 'x', 'o' },
        function()
          require('flash').treesitter()
        end,
        desc = 'Flash Treesitter',
      },
      {
        'r',
        mode = 'o',
        function()
          require('flash').remote()
        end,
        desc = 'Remote Flash',
      },
      {
        'R',
        mode = { 'o', 'x' },
        function()
          require('flash').treesitter_search()
        end,
        desc = 'Treesitter Search',
      },
      {
        '<c-s>',
        mode = { 'c' },
        function()
          require('flash').toggle()
        end,
        desc = 'Toggle Flash Search',
      },
    },
  },
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  {
    'AckslD/nvim-neoclip.lua',
    dependencies = {
      { 'kkharji/sqlite.lua', module = 'sqlite' },
      { 'nvim-telescope/telescope.nvim' },
    },
    opts = {},
  },
  {
    'dhruvmanila/browser-bookmarks.nvim',
    version = '*',
    -- Only required to override the default options
    opts = {
      -- Override default configuration values
      -- selected_browser = 'chrome'
    },
    dependencies = {
      --   -- Only if your selected browser is Firefox, Waterfox or buku
      'kkharji/sqlite.lua',
      --
      --   -- Only if you're using the Telescope extension
      'nvim-telescope/telescope.nvim',
    },
    keys = {
      {
        '<leader>sb',
        function()
          require('browser_bookmarks').select()
        end,
        desc = 'Fuzzy search browser bookmarks',
      },
    },
  },
}
return M
