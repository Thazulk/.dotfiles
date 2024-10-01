return {
  "zbirenbaum/copilot.lua",
  opts = {
    suggestion = { enabled = false },
    panel = { enabled = false },
    filetypes = {
      -- ["*"] = false,
      markdown = true,
      help = true,
    },
  },
  keys = {
    {
      "<leader>at",
      function()
        if require("copilot.client").is_disabled() then
          require("copilot.command").enable()
          print("Copilot enabled")
        else
          require("copilot.command").disable()
          print("Copilot disabled")
        end
      end,
      desc = "Toggle (Copilot)",
    },
  },
}
