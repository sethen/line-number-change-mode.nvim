# line-number-change-mode.nvim

A Neovim plugin that allows you to change the color and text decoration your line number based on the current mode.  Accepts anything that `vim.api.nvim_set_hl()` accepts!


https://github.com/user-attachments/assets/4da5fb44-ba0a-47d3-941e-944d86189a1a

Example using `lazy`:

```lua
return {
    'sethen/line-number-change-mode.nvim',
    config = function()
        require('catppuccin').setup({
            flavour = 'mocha',
        });
        local palette = require('catppuccin.palettes').get_palette('mocha')

        if (palette == nil) then
            return nil
        end

        require("line-number-change-mode").setup({
            mode = {
                i = {
                    bg = palette.green,
                    fg = palette.mantle,
                    bold = true,
                },
                n = {
                    bg = palette.blue,
                    fg = palette.mantle,
                    bold = true,
                },
                R = {
                    bg = palette.maroon,
                    fg = palette.mantle,
                    bold = true,
                },
                v = {
                    bg = palette.mauve,
                    fg = palette.mantle,
                    bold = true,
                },
                V = {
                    bg = palette.mauve,
                    fg = palette.mantle,
                    bold = true,
                },
            }
        })
    end
}
```
