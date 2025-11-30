-- Highlight on yank
local augroup = vim.api.nvim_create_augroup("UserConfig", { clear = true })


-- Highlight yanked text
vim.api.nvim_create_autocmd('TextYankPost', {
  group = augroup,
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd('LspAttach', {
  group = augroup,
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if client:supports_method('textDocument/completion') then
      vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
    end
    if client:supports_method("textDocument/inlayHint") or client.server_capabilities.inlayHintProvider then
      vim.lsp.inlay_hint.enable(true, { bufnr = ev.buf })
    end
  end,
})

