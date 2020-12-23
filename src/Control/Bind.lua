
local function arrayBind(arr)
  return function (f)
    local result = {}
    local n = 1
    for i = 1, #arr do
      local ys = f(arr[i])
      for y = 1, #ys do
        result[n] = ys[y]
        n = n + 1
      end
    end
    return result
  end
end

return {
  arrayBind = arrayBind
}
