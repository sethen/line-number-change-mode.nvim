local M = {}

function M.setup(opts)
   opts = opts or {}

   local group = vim.api.nvim_create_augroup("LineNumberChangeMode", {
      clear = true
   })

   vim.api.nvim_create_autocmd('ModeChanged', {
      group = group,
      callback = function()
         local new_mode = vim.v.event.new_mode
         local line_number_map = {
            i = opts.i and opts.i or nil,
            n = opts.n and opts.n or nil,
            no = opts.no and opts.no or nil,
            R = opts.R and opts.R or nil,
            v = opts.n and opts.v or nil,
            V = opts.V and opts.V or nil,
         }

         if line_number_map[new_mode] ~= nil and opts[new_mode] ~= nil then
            vim.api.nvim_set_hl(0, 'CursorLineNr', line_number_map[new_mode])
         end
      end
   })
end

return M
