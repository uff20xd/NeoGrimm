return {
	"neovim/nvim-lspconfig",
	config = function() 
		require("lspconfig").lua_ls.setup{ settings = {diagnostics = {globals = {"vim"}}}}
		require("lspconfig").nixd.setup({
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
		require('lspconfig')['rust_analyzer'].setup {
    		capabilities = capabilities
  		}
		vim.cmd(":LspStart")
	end,
}

