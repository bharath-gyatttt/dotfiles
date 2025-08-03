return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    -- Define a custom transparent theme
    local transparent_theme = require("lualine.themes.auto") -- or "nightfly" if you prefer
    for _, mode in pairs(transparent_theme) do
      for section, opts in pairs(mode) do
        opts.bg = "none"
        if section == "a" then
          opts.fg = "white"
        end
      end
    end

    require("lualine").setup({
      options = {
        theme = transparent_theme,
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
      },
    })
  end,
}

