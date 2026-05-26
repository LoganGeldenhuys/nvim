-- Single-namespace AI dispatcher.
--
-- One <leader>j* keymap surface that routes to either opencode.nvim or
-- claudecode.nvim depending on vim.g.ai_agent. Swap at runtime with
-- <leader>jx.
--
-- vim.g.ai_agent precedence:
--   1. Existing in-session value (so <leader>jx swaps stick within the session)
--   2. $AI_AGENT inherited from tmux (so fresh nvims pick up the tmux toggle)
--   3. Default: "opencode"

local M = {}

vim.g.ai_agent = vim.g.ai_agent or os.getenv("AI_AGENT") or "opencode"

local function is_opencode()
  return vim.g.ai_agent == "opencode"
end

function M.toggle()
  if is_opencode() then
    require("opencode").toggle()
  else
    vim.cmd("ClaudeCode")
  end
end

function M.focus()
  if is_opencode() then
    require("opencode").toggle()
  else
    vim.cmd("ClaudeCodeFocus")
  end
end

function M.ask()
  if is_opencode() then
    require("opencode").ask("@this: ", { submit = true })
  else
    vim.cmd("ClaudeCodeFocus")
  end
end

function M.send_visual()
  if is_opencode() then
    require("opencode").prompt("@this ")
  else
    vim.cmd("ClaudeCodeSend")
  end
end

function M.pick()
  if is_opencode() then
    require("opencode").select()
  else
    vim.notify("pick: not supported for claudecode", vim.log.levels.WARN)
  end
end

function M.swap()
  vim.g.ai_agent = is_opencode() and "claude" or "opencode"
  vim.notify("AI agent: " .. vim.g.ai_agent)
end

return M
