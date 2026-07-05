local map = vim.keymap.set

vim.g.mapleader = " " -- leader = <Space>

-- =============================================================================
-- STANDARDIZED CORE KEYS
-- Movement and core editing are stock Vim, so the muscle memory you build here
-- works in any Vim/Neovim, anywhere:
--   * move:            h j k l   (+ arrow keys)
--   * save / quit:     :w   :q     (also <C-s> to save, below)
--   * split windows:   <C-w>s (horizontal)   <C-w>v (vertical)
--   * indent:          >>  <<   for a line, or > / < as operators (e.g. >ap, >j)
--   * substitute:      s  (char)   S (line)   — back to stock behaviour
-- Nothing below retrains a standard key; it's leader / Alt / Ctrl conveniences
-- and access to the plugins you use.
-- =============================================================================

-- Clear search highlight with <Esc>
map("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Ctrl-S to save (works like every other editor; doesn't shadow a Vim motion)
map({ "n", "i", "v" }, "<C-s>", "<cmd>write<CR><Esc>", { desc = "Save file" })

-- Keep the cursor centred when jumping around
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzz")
map("n", "N", "Nzz")

-- Move the selected / current line up and down with Alt-j / Alt-k
map("v", "<A-j>", ":m '>+1<CR>gv=gv")
map("v", "<A-k>", ":m '<-2<CR>gv=gv")
map("n", "<A-j>", ":m .+1<CR>==")
map("n", "<A-k>", ":m .-2<CR>==")

-- Keep the selection after indenting in visual mode (still the standard > / <)
map("v", ">", ">gv")
map("v", "<", "<gv")

-- Paste over a selection without clobbering the yank register
map("x", "<leader>p", '"_dP', { desc = "Paste without yanking selection" })

-- Insert-mode arrow keys on the home row (optional convenience)
map("i", "<A-h>", "<Left>")
map("i", "<A-j>", "<Down>")
map("i", "<A-k>", "<Up>")
map("i", "<A-l>", "<Right>")

-- Resize splits with Ctrl + arrow keys
map("n", "<C-Up>", "<cmd>resize -2<CR>", { desc = "Shrink window height" })
map("n", "<C-Down>", "<cmd>resize +2<CR>", { desc = "Grow window height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<CR>", { desc = "Shrink window width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<CR>", { desc = "Grow window width" })

-- Window jump: <C-h/j/k/l> via vim-tmux-navigator (see plugins/basic.lua),
-- works across nvim splits and tmux panes with the same keys.

-- Make the current file executable
map("n", "<leader>x", "<cmd>!chmod +x %<CR>", { desc = "chmod +x current file", silent = true })

-- Location-list navigation
map("n", "[t", "<cmd>lprev<CR>zz")
map("n", "]t", "<cmd>lnext<CR>zz")

-- =============================================================================
-- PLUGIN KEYS (unchanged — the plugins you use, on their usual keys)
-- =============================================================================

-- Comment.nvim
map("n", "<leader>c", "gcc", { remap = true, desc = "Comment line" })
map("v", "<leader>c", "gc", { remap = true, desc = "Comment selection" })

-- undotree
map("n", "U", "<cmd>UndotreeToggle<CR>", { desc = "Toggle undotree" })

-- antovim: toggle words like true<->false
map("n", "gw", "<cmd>Antovim<CR>", { desc = "Toggle word (true/false, etc.)" })

-- lspsaga
map("n", "gr", "<cmd>Lspsaga finder<CR>", { desc = "LSP finder (references)" })
map("n", "gD", "<cmd>vsplit<CR><cmd>lua vim.lsp.buf.definition()<CR>", { desc = "Definition in split" })

-- CopilotChat
map("n", "<leader>kk", "<cmd>CopilotChat<CR>", { desc = "CopilotChat", nowait = true })
map({ "v", "n" }, "<leader>ke", "<cmd>CopilotChatExplain<CR>", { desc = "Copilot Explain", nowait = true })
map({ "v", "n" }, "<leader>kr", "<cmd>CopilotChatReview<CR>", { desc = "Copilot Review", nowait = true })
map({ "v", "n" }, "<leader>kf", "<cmd>CopilotChatFix<CR>", { desc = "Copilot Fix", nowait = true })
map({ "v", "n" }, "<leader>ko", "<cmd>CopilotChatOptimize<CR>", { desc = "Copilot Optimize", nowait = true })
map({ "v", "n" }, "<leader>kd", "<cmd>CopilotChatDocs<CR>", { desc = "Copilot Docs", nowait = true })
map({ "v", "n" }, "<leader>kt", "<cmd>CopilotChatTests<CR>", { desc = "Copilot Tests", nowait = true })
map({ "v", "n" }, "<leader>kc", "<cmd>CopilotChatCommit<CR>", { desc = "Copilot Commit msg", nowait = true })

-- Treesitter class / function motions
map("", "]c", "]]zz", { desc = "Next class start", nowait = true, remap = true })
map("", "]f", "]mzz", { desc = "Next function start", nowait = true, remap = true })
map("", "[c", "[[zz", { desc = "Previous class start", nowait = true, remap = true })
map("", "[f", "[mzz", { desc = "Previous function start", nowait = true, remap = true })
map("", "]C", "][zz", { desc = "Next class end", nowait = true, remap = true })
map("", "]F", "]Mzz", { desc = "Next function end", nowait = true, remap = true })
map("", "[C", "[]zz", { desc = "Previous class end", nowait = true, remap = true })
map("", "[F", "[Mzz", { desc = "Previous function end", nowait = true, remap = true })
