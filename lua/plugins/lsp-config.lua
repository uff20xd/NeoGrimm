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
		cmd = { "rust-analyzer" }
		filetypes = { "rust" }
		root_dir = function(fname)
		      local cargo_crate_dir = util.root_pattern 'Cargo.toml'(fname)
		      local cmd = 'cargo metadata --no-deps --format-version 1'
		      if cargo_crate_dir ~= nil then
		        cmd = cmd .. ' --manifest-path ' .. util.path.join(cargo_crate_dir, 'Cargo.toml')
		      end
		      local cargo_metadata = vim.fn.system(cmd)
		      local cargo_workspace_dir = nil
		      if vim.v.shell_error == 0 then
		        cargo_workspace_dir = vim.fn.json_decode(cargo_metadata)['workspace_root']
		      end
		      return cargo_workspace_dir
		        or cargo_crate_dir
		        or util.root_pattern 'rust-project.json'(fname)
		        or util.find_git_ancestor(fname)
		    end,
		settings = {
		  ["rust-analyzer"] = {}
		}	
		vim.cmd(":LspStart")
	end,
}

