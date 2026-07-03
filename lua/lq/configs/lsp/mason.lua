local present, mason = pcall(require, "mason")

if not present then
  return
end

local options = {
  ui = {
    icons = {
      package_installed = " ",
      package_pending = " ",
      package_uninstalled = " 󰚌",
    },
    keymaps = {
      toggle_package_expand = "<CR>",
      install_package = "I",
      update_package = "u",
      check_package_version = "c",
      update_all_packages = "U",
      check_outdated_packages = "C",
      uninstall_package = "X",
    },
  },

  max_concurrent_installers = 10,
}

mason.setup(options)

-- mason.nvim's own "automatic_installation" option no longer exists, so
-- explicitly ensure the LSP servers we enable via lspconfig are installed.
local ensure_installed = {
  "lua-language-server",
  "bash-language-server",
  "pyright",
  "clangd",
  "cmake-language-server",
}

local registry_present, registry = pcall(require, "mason-registry")
if not registry_present then
  return
end

registry.refresh(function()
  for _, name in ipairs(ensure_installed) do
    local ok, pkg = pcall(registry.get_package, name)
    if ok and not pkg:is_installed() then
      pkg:install()
    end
  end
end)
