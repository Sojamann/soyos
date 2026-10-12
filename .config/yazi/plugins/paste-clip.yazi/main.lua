-- Paste clipboard text into a new file in cwd (prompts for filename, never overwrites)
local get_cwd = ya.sync(function() return tostring(cx.active.current.cwd) end)

return {
	entry = function()
		local name, ev = ya.input { title = "Paste clipboard as:", pos = { "top-center", y = 3, w = 50 } }
		if ev ~= 1 or name == "" then return end

		local path = get_cwd() .. "/" .. name
		local out, err = Command("sh"):arg({ "-c", 'set -C; pbpaste > "$1"', "sh", path }):stderr(Command.PIPED):output()
		if not out or not out.status.success then
			ya.notify { title = "Paste", content = err and tostring(err) or out.stderr, level = "error", timeout = 5 }
		end
	end,
}
