return {
  --fzf
  'airblade/vim-rooter',
  { 'junegunn/fzf', dir = '~/.fzf', name = 'fzf', build = './install --all' },
  'junegunn/fzf.vim',
  { 'catppuccin/nvim', name = 'catppuccin', priority = 1000 },
  {
    'stevearc/dressing.nvim',
    opts = {},
  },

  -- file
  {
    'stevearc/oil.nvim',
    opts = {},
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    keys = {
      { '<leader>-', '<cmd>Oil<cr>' },
    },
  },
  {
    'christoomey/vim-tmux-navigator',
    cmd = {
      'TmuxNavigateLeft',
      'TmuxNavigateDown',
      'TmuxNavigateUp',
      'TmuxNavigateRight',
      'TmuxNavigatePrevious',
    },
    keys = {
      { '<c-h>', '<cmd><C-U>TmuxNavigateLeft<cr>' },
      { '<c-j>', '<cmd><C-U>TmuxNavigateDown<cr>' },
      { '<c-k>', '<cmd><C-U>TmuxNavigateUp<cr>' },
      { '<c-l>', '<cmd><C-U>TmuxNavigateRight<cr>' },
      { '<c-\\>', '<cmd><C-U>TmuxNavigatePrevious<cr>' },
    },
  },
}
