local dap_status_ok, dap = pcall(require, "dap")
if not dap_status_ok then
    return
end

local dappy_status_ok, dappy = pcall(require, "dap-python")
if not dappy_status_ok then
    return
end

local dapui_status_ok, dapui = pcall(require, "dapui")
if not dapui_status_ok then
    return
end

local dapvt_text_status_ok, dapvt = pcall(require, "nvim-dap-virtual-text")
if not dapvt_text_status_ok then
    return
end

dappy.setup()
dapui.setup()
dapvt.setup()

-- hook
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

