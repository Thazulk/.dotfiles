local harpoon = require("harpoon")

-- REQUIRED
harpoon:setup()
-- REQUIRED

vim.keymap.set("n", "<leader>a", function() harpoon:list():append() end, { desc = "Add current file to harpoon" })
vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Toggle harpoon menu" })
vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end, { desc = "Select harpoon item 1" })
vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end, { desc = "Select harpoon item 2" })
vim.keymap.set("n", "<leader>4", function() harpoon:list():select(3) end, { desc = "Select harpoon item 3" })
vim.keymap.set("n", "<leader>5", function() harpoon:list():select(4) end, { desc = "Select harpoon item 4" })
