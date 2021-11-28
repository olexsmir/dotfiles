local ok, dapi = pcall(require, "dap-install")
if not ok then
  return
end

dapi.config("jsnode", {})
