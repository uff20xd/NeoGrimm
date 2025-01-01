return {
	"neovim/nvim-lspconfig",
	config = function() 
		lspconfig = require("lspconfig")
		lspconfig.lua_ls.setup{ settings = {diagnostics = {globals = {"vim"}}}}
		lspconfig.nixd.setup({
		  cmd = { "nixd" },
		  settings = {
		    nixd = {
		      nixpkgs = {
		        expr = "import <nixpkgs> { }",
		      },
		      formatting = {
		        command = { "nixfmt" }, -- or nixfmt or nixpkgs-fmt
		      },
		      -- options = {
		      --   nixos = {
		      --       expr = '(builtins.getFlake "/PATH/TO/FLAKE").nixosConfigurations.CONFIGNAME.options',
		      --   },
		      --   home_manager = {
		      --       expr = '(builtins.getFlake "/PATH/TO/FLAKE").homeConfigurations.CONFIGNAME.options',
		      --   },
		      -- },
		    },
		  },
		})
		vim.cmd(":LspStart")
	end,
}

