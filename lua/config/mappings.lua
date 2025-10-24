local opts = { noremap = true, silent = true }

-- Tabs
vim.keymap.set("n", "<leader>to", ":tabnew<CR>", opts)   -- open new tab
vim.keymap.set("n", "<leader>tx", ":tabclose<CR>", opts) -- close current tab

-- Picker
vim.keymap.set("n", "<leader>s<leader>", function()
        require("snacks").picker.smart()
end, { desc = "Smart Find" })
vim.keymap.set("n", "<leader>s/", function()
        require("snacks").picker.grep()
end, { desc = "Grep" })
vim.keymap.set("n", "<leader>sk", function()
        require("snacks").picker.keymaps()
end, { desc = "Keymaps" })
vim.keymap.set("n", "<leader>sr", function()
        require("snacks").picker.recent()
end, { desc = "Recent" })
vim.keymap.set("n", "<leader>sp", function()
        require("snacks").picker.projects()
end, { desc = "Projects" })
vim.keymap.set("n", "<leader>sm", function()
        require("snacks").picker.marks()
end, { desc = "Marks" })
vim.keymap.set("n", "<leader>sd", function()
        require("snacks").picker.diagnostics_buffer()
end, { desc = "Diagnostics" })

-- not saving deleted text
vim.keymap.set({ "n", "v" }, "d", '"_d')
vim.keymap.set({ "n", "v" }, "x", '"_x')
vim.keymap.set({ "n", "v" }, "c", '"_c')
vim.keymap.set("n", "dd", '"_dd')

-- Buffers
vim.keymap.set("n", "<leader>x", "<cmd>bdelete!<CR>", opts)
vim.keymap.set("n", "<leader>b", "<cmd>enew<CR>", opts)

-- Change buffer with leader + number
for i = 1, 9 do
        vim.keymap.set("n", "<leader>" .. i, function()
                local buflist = vim.fn.getbufinfo({ buflisted = 1 })
                if buflist[i] then
                        vim.cmd("buffer " .. buflist[i].bufnr)
                else
                        vim.notify("No buffer in slot " .. i, vim.log.levels.WARN)
                end
        end, { desc = "Go to buffer " .. i })
end

-- Save with ctrl+s
vim.keymap.set("n", "<C-s>", ":update<CR>", { noremap = true, silent = true })
vim.keymap.set("v", "<C-s>", "<C-C>:update<CR>", { noremap = true, silent = true })
vim.keymap.set("i", "<C-s>", "<C-O>:update<CR>", { noremap = true, silent = true })

-- Quit with ctrl+q
vim.keymap.set("n", "<C-q>", ":q<CR>")
vim.keymap.set("v", "<C-q>", ":q<CR>")
vim.keymap.set("i", "<C-q>", ":q<CR>")

-- Flash
vim.keymap.set({ "n", "x", "o" }, ",", function()
        require("flash").jump()
end, { desc = "Flash" })
vim.keymap.set({ "n", "x", "o" }, "<", function()
        require("flash").treesitter()
end, { desc = "Flash Treesitter" })
vim.keymap.set("o", "r", function()
        require("flash").remote()
end, { desc = "Remote Flash" })

-- Oil related in oil.lua

-- Undo Tree
vim.keymap.set("n", "<leader>u", function()
        require("undotree").toggle()
end, { desc = "Toggle Undotree" })

-- Terminal
vim.keymap.set("n", "<leader>tt", function()
        require("snacks").terminal()
end, { desc = "Toggle Terminal" })
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

-- Trailspace
vim.keymap.set("n", "<leader>l", function()
        require("mini.trailspace").trim()
end, { desc = "Trim Trailspaces" })
