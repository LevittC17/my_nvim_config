return {
  {
    'akinsho/toggleterm.nvim',
    version = "*",
    config = function()
      require("toggleterm").setup{
        size = function(term)
          if term.direction == 'horizontal' then
            return 10
          elseif term.direction == 'vertical' then
            return vim.o.columns * 0.4
          end
        end,
        open_mapping = [[<c-\>]],
        hide_numbers = true,
        shade_filetypes = {},
        autochdir = true,
        shade_terminals = true,
        start_in_insert = true,
        insert_mappings = true,
        terminal_mappings = true,
        persist_size = true,
        persist_mode = true,
        direction = 'horizontal',
        close_on_exit = true,
        float_opts = {
          border = "curved",
          winblend = 3,
        },
        winbar = {
          enabled = false,
          name_formatter = function (term)
            return term.name
          end
        },

        -- Callback function when the terminal is first created
        on_create = function(term)
          -- Add any initialization code here
        end,

        -- -- Callback function when the terminal opens
        -- on_open = function(term)
        --   -- Change directory to the current Neovim working directory
        --   local cwd = vim.fn.getcwd()
        --   term:send("cd " .. cwd, true)
        -- end,

        -- Callback function when the terminal closes
        on_close = function (term)
          -- Any cleanup code goes here
        end,

        -- Callback function for stdout
        on_stdout = function (term, job, data, name)
          -- Process the terminal's stdout here 
        end,

        -- Callback function for stderr
        on_stderr = function (term, job, data, name)
          -- Handle the terminal's stderr here 
        end,

        -- Callback function when the terminal process exits
        on_exit = function (term, job, exit_code, name)
          -- Actions to perform when the terminal process exits 
        end,
      }

      -- Define keymaps function
      function _G.set_terminal_keymaps()
        local opts = { buffer = 0 }
        vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
        vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
        vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
        vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
        vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
        vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
        vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
      end

      -- Auto command to set terminal keymaps when a terminal is opened
      vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
    end
  }
}

