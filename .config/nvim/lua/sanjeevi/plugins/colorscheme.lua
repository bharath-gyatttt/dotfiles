return {
  "projekt0n/github-nvim-theme",
  name = "github-theme",
  lazy = false,    -- Load during startup
  priority = 1000, -- Load before all other plugins
  config = function()
    require("github-theme").setup({
      options = {
        transparent = true, -- Enable transparent background
      },
    })
    vim.cmd("colorscheme github_dark")
  end,
}

