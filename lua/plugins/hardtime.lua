-- Hardtime is enabled by default. You can change its state with the following commands:
--
--     :Hardtime enable enable Hardtime
--     :Hardtime disable disable Hardtime
--     :Hardtime toggle toggle Hardtime
--
-- You can view the most frequently seen hints with :Hardtime report.
return {
  "m4xshen/hardtime.nvim",
  lazy = false,
  dependencies = { "MunifTanjim/nui.nvim" },
  opts = {},
}
