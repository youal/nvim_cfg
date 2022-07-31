local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<Leader>cp", "<cmd>PickColor<cr>", opts)
-- vim.keymap.set("i", "<C-c>", "<cmd>PickColorInsert<cr>", opts)

-- vim.keymap.set("n", "your_keymap", "<cmd>ConvertHEXandRGB<cr>", opts)
-- vim.keymap.set("n", "your_keymap", "<cmd>ConvertHEXandHSL<cr>", opts)

require("color-picker").setup({ -- for changing icons & mappings
	["icons"] = { "ﱢ", "" },
	["border"] = "rounded", -- none | single | double | rounded | solid | shadow
	["keymap"] = { -- mapping example:
		["U"] = "<Plug>ColorPickerSlider5Decrease",
		["O"] = "<Plug>ColorPickerSlider5Increase",
	},
})

vim.cmd([[hi FloatBorder guibg=NONE]]) -- if you don't want weird border background colors around the popup.
