local M = {}

function M.setup(opts)
   opts = opts or {}

   local group = vim.api.nvim_create_augroup("LineNumberChangeMode", {
      clear = true,
   })

   local line_number_map = opts

   local function set_hl_for_mode(mode)
      if line_number_map[mode] then
         vim.api.nvim_set_hl(0, "CursorLineNr", line_number_map[mode])

         -- Have to force a redraw to repaint line number if switching to cmd mode
         if mode == "c" then
            vim.cmd.redraw()
         end
      end
   end

   -- set mode on setup to set CursorLineNr in case it's not already set
   set_hl_for_mode(vim.api.nvim_get_mode().mode)

   vim.api.nvim_create_autocmd("ModeChanged", {
      group = group,
      callback = function()
         set_hl_for_mode(vim.v.event.new_mode)
      end,
   })
end

return M
