local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

local actions = require "telescope.actions"

-- https://github.com/ravenxrz/dotfiles/blob/master/nvim/lua/user/conf/telescope.lua
-- disable preview binaries
-- local previewers = require("telescope.previewers")
-- local Job = require("plenary.job")
-- local new_maker = function(filepath, bufnr, opts)
--   filepath = vim.fn.expand(filepath)
--   Job:new({
--     command = "file",
--     args = { "--mime-type", "-b", filepath },
--     on_exit = function(j)
--       local mime_type = vim.split(j:result()[1], "/")[1]
--       if mime_type == "text" then
--         previewers.buffer_previewer_maker(filepath, bufnr, opts)
--       else
--         -- maybe we want to write something to the buffer here
--         vim.schedule(function()
--           vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, { "BINARY" })
--         end)
--       end
--     end
--   }):sync()
-- end


telescope.setup {
  defaults = {
    -- buffer_previewer_maker = new_maker,

    prompt_prefix = " ",
    selection_caret = " ",
    path_display = { "smart" },
    -- path_display = {
    --   shorten= {
    --     -- e.g. for a path like
    --     --   `alpha/beta/gamma/delta.txt`
    --     -- setting `path_display.shorten = { len = 1, exclude = {1, -1} }`
    --     -- will give a path like:
    --     --   `alpha/b/g/delta.txt`
    --     len = 3, exclude = {1, -1}
    --   },
    -- },

    mappings = {
      i = {
        ["<C-n>"] = actions.cycle_history_next,
        ["<C-p>"] = actions.cycle_history_prev,

        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,

        ["<C-c>"] = actions.close,

        ["<Down>"] = actions.move_selection_next,
        ["<Up>"] = actions.move_selection_previous,

        ["<CR>"] = actions.select_default,
        ["<C-x>"] = actions.select_horizontal,
        ["<C-v>"] = actions.select_vertical,
        ["<C-t>"] = actions.select_tab,

        ["<C-u>"] = actions.preview_scrolling_up,
        ["<C-d>"] = actions.preview_scrolling_down,

        ["<PageUp>"] = actions.results_scrolling_up,
        ["<PageDown>"] = actions.results_scrolling_down,

        ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
        ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
        ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
        ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
        ["<C-l>"] = actions.complete_tag,
        ["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
      },

      n = {
        ["<esc>"] = actions.close,
        ["<CR>"] = actions.select_default,
        ["<C-x>"] = actions.select_horizontal,
        ["<C-v>"] = actions.select_vertical,
        ["<C-t>"] = actions.select_tab,

        ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
        ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
        ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
        ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,

        ["j"] = actions.move_selection_next,
        ["k"] = actions.move_selection_previous,
        ["H"] = actions.move_to_top,
        ["M"] = actions.move_to_middle,
        ["L"] = actions.move_to_bottom,

        ["<Down>"] = actions.move_selection_next,
        ["<Up>"] = actions.move_selection_previous,
        ["gg"] = actions.move_to_top,
        ["G"] = actions.move_to_bottom,

        ["<C-u>"] = actions.preview_scrolling_up,
        ["<C-d>"] = actions.preview_scrolling_down,

        ["<PageUp>"] = actions.results_scrolling_up,
        ["<PageDown>"] = actions.results_scrolling_down,

        ["?"] = actions.which_key,
      },
    },
  },
  pickers = {
    -- find_files = {
    --   theme = "dropdown",
    --   previewer = false,
    --   -- find_command = { "find", "-type", "f" },
    --   find_command = {"fd"},
    -- },

    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
  },
  extensions = {
    -- Your extension configuration goes here:
    -- extension_name = {
    --   extension_config_key = value,
    -- }
    -- please take a look at the readme of the extension you want to configure
  },
}

-- 不是预览的插件
-- telescope.load_extension('live_grep_raw')
