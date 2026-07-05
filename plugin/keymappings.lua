local map = vim.keymap.set

vim.g.mapleader = " " --leader
-------------base mappings---------------
-- stock hjkl movement; arrow keys also work

-- enter, quit and save
map("n", "Q", ":q<CR>")
map("n", "S", ":w <CR>")

-- insert moving
map("i", "<A-h>", "<Left>")
map("i", "<A-j>", "<Down>")
map("i", "<A-k>", "<Up>")
map("i", "<A-l>", "<Right>")
map("i", "<C-l>", "<End>")

--terminal
map("n", "tej", ":execute 16 .. 'new +terminal' | let b:term_type = 'hori' | startinsert <CR>")
map("n", "tel", ":execute 'vnew +terminal' | let b:term_type = 'vert' | startinsert <CR>")
map("t", "JK", "<C-\\><C-n><C-w>w")

-- indent
map("n", ">", ">>")
map("n", "<", "<<")
map("v", ">", ">gv")
map("v", "<", "<gv")

-- move line
map("v", "<A-j>", ":m '>+1<CR>gv-gv")
map("v", "<A-k>", ":m '<-2<CR>gv-gv")
map("n", "<A-j>", ":m .+1<CR>==")
map("n", "<A-k>", ":m .-2<CR>==")

-- resize with ctrl+arrows (plain arrows move the cursor)
map("n", "<C-Up>", ":resize -1<CR>")
map("n", "<C-Down>", ":resize +1<CR>")
map("n", "<C-Left>", ":vertical resize -1<CR>")
map("n", "<C-Right>", ":vertical resize +1<CR>")

-- move up/down the view port without moving the cursor
map("n", "<C-Y>", "5<C-y>") -- rarely used
map("n", "<C-E>", "5<C-e>")
map("n", "<C-D>", "<C-D>zz")
map("n", "<C-U>", "<C-U>zz")
map("n", "n", "nzz")
map("n", "N", "Nzz")

-- use ESC to turn off search highlighting
map("n", "<Esc>", ":noh <CR>")

-- split window (key = direction the new window opens)
map("n", "s", "<nop>")
map("n", "sh", ":set nosplitright<CR>:vsplit<CR>:set splitright<CR>")
map("n", "sj", ":set splitbelow<CR>:split<CR>")
map("n", "sk", ":set nosplitbelow<CR>:split<CR>:set splitbelow<CR>")
map("n", "sl", ":set splitright<CR>:vsplit<CR>")

-- window jump: <C-h/j/k/l> via vim-tmux-navigator (see plugins/basic.lua),
-- works across nvim splits and tmux panes with the same keys

-- spell and warp
map("n", "sw", ":set wrap!<CR>")
map("n", "ss", ":set spell!<CR>")

-- file path(rarely used)
map("n", "\\p", ":echo expand('%:p')<CR>")
map("n", "\\w", ":pwd<CR>")

-- <++>
map("n", "<LEADER><LEADER>", '<Esc>/<++><CR>:nohlsearch<CR>"_c4l')

map("x", "<leader>p", '"_dP')

-- location list
map("n", "[t", "<cmd>lprev<CR>zz")
map("n", "]t", "<cmd>lnext<CR>zz")

-- comment
map("n", "<LEADER>c", "gcc", { remap = true })
map("v", "<LEADER>c", "gc", { remap = true })

-- personal test file
local function goto_test_file()
	local buf_dir = vim.fn.expand("%:p:h")
	local git_root =
		vim.trim(vim.fn.system("git -C " .. vim.fn.shellescape(buf_dir) .. " rev-parse --show-toplevel 2>/dev/null"))

	local base_dir
	if vim.v.shell_error == 0 and git_root ~= "" then
		base_dir = git_root
	else
		base_dir = buf_dir
	end

	local target
	if vim.fn.isdirectory(base_dir .. "/runs") == 1 then
		target = base_dir .. "/runs/1.py"
	else
		target = base_dir .. "/1.py"
	end

	vim.cmd("e " .. vim.fn.fnameescape(target))
	vim.cmd("normal! zz")
end
map("n", "g1", goto_test_file)

-- make buffer executable
map("n", "<leader>x", ":!chmod +x %<CR>")

-------------plugins mappings---------------
-- tmux
map("n", "<C-G>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- swith true and false
map("n", "gw", ":Antovim<CR>")

-- undotree
map("n", "U", ":UndotreeToggle<CR>")

-- lspsaga
map("n", "gr", ":Lspsaga finder<CR>")
-- map("n", "gD", ":Lspsaga peek_definition<CR>")
map("n", "gD", ":vsplit<CR>:lua vim.lsp.buf.definition()<CR>")

-- copliot
map("n", "<leader>kk", "<cmd>CopilotChat<CR>", { desc = "CopilotChat", nowait = true, remap = false })
map(
	{ "v", "n" },
	"<leader>ke",
	"<cmd>CopilotChatExplain<CR>",
	{ desc = "CopilotExplain", nowait = true, remap = false }
)
map({ "v", "n" }, "<leader>kr", "<cmd>CopilotChatReview<CR>", { desc = "CopilotReview", nowait = true, remap = false })
map({ "v", "n" }, "<leader>kf", "<cmd>CopilotChatFix<CR>", { desc = "CopilotFix", nowait = true, remap = false })
map(
	{ "v", "n" },
	"<leader>ko",
	"<cmd>CopilotChatOptimize<CR>",
	{ desc = "CopilotOptimize", nowait = true, remap = false }
)
map({ "v", "n" }, "<leader>kd", "<cmd>CopilotChatDocs<CR>", { desc = "CopilotDocs", nowait = true, remap = false })
map({ "v", "n" }, "<leader>kt", "<cmd>CopilotChatTests<CR>", { desc = "CopilotTests", nowait = true, remap = false })
map(
	{ "v", "n" },
	"<leader>kc",
	"<cmd>CopilotChatCommit<CR>",
	{ desc = "CopilotCommitInfo", nowait = true, remap = false }
)

map("", "]c", "]]zz", { desc = "Next class start", nowait = true, remap = true })
map("", "]f", "]mzz", { desc = "Next function start", nowait = true, remap = true })
map("", "[c", "[[zz", { desc = "Previous class start", nowait = true, remap = true })
map("", "[f", "[mzz", { desc = "Previous function start", nowait = true, remap = true })
map("", "]C", "][zz", { desc = "Next class end", nowait = true, remap = true })
map("", "]F", "]Mzz", { desc = "Next function end", nowait = true, remap = true })
map("", "[C", "[]zz", { desc = "Previous class end", nowait = true, remap = true })
map("", "[F", "[Mzz", { desc = "Previous function end", nowait = true, remap = true })
