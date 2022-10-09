require('neorg').setup {
	load = {
		["core.defaults"] = {},
		["core.norg.dirman"] = {
			config = {
				workspaces = {
					work = "~/notes/work",
					home = "~/notes/home",
					home = "~/notes/vim",
				}
			}
		},
		["core.norg.concealer"] = {},
		["core.export"] = {},
		["core.export.markdown"] = {},
	}
}
