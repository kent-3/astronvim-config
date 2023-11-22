return {
  settings = {
    ["rust-analyzer"] = {
      checkOnSave = true,
      -- check = { command = "clippy" },
      -- check = { command = "check" },
      procMacro = { ignored = { leptos_macro = { "server", "component" } } },
    },
  },
}
