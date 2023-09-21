return {
  settings = {
    ["rust-analyzer"] = {
      checkOnSave = true,
      check = { command = "clippy" },
      procMacro = { ignored = { leptos_macro = { "server", "component" } } },
    },
  },
}
