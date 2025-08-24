return {
{
    "lervag/vimtex",
    ft = { "tex", "latex" },
    config = function()
    -- Compilation settings
         vim.g.vimtex_compiler_latexmk_engines = {["_"] = "-lualatex -shell-escape"}

    -- Viewer settings
         vim.g.vimtex_view_method = "sioyek"

    -- Quickfix window behavior - disabled
         vim.g.vimtex_quickfix_mode = 0

    -- Environment settings
         vim.g.vimtex_indent_on_ampersands = 0

    -- Integration with other plugins
         vim.g.matchup_override_vimtex = 1

    -- Indentation tool settings
         vim.g.latexindent_opt = "-m"

    -- File patterns to ignore
      local wildignores = {".aux", ".out", ".toc"}
      for _, pattern in ipairs(wildignores) do
        if not vim.tbl_contains(vim.opt.wildignore:get(), pattern) then
              vim.opt.wildignore:append(pattern)
        end
      end
    end,
    },
}
