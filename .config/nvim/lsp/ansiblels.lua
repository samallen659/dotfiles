return {
	cmd = { "ansible-language-server", "--stdio" },
	filetypes = { "yaml.ansible" },
	-- root_markers = { "ansible.cfg", ".ansible-lint" },
	on_init = function(client)
		client.server_capabilities.documentFormattingProvider = true
	end,
}
