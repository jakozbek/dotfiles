-- init.lua
local orgmode = require("orgmode")

-- Load custom treesitter grammar for org filetype
orgmode.setup_ts_grammar()

orgmode.setup({
	org_blank_before_new_entry = {
		heading = false,
		plain_list_item = false,
	},
	org_agenda_files = { "~/my-orgs/**/*" },
	org_default_notes_file = "~/my-orgs/refile.org",
})
