
local function arrayApply (fs)
  return function (xs)
    local result = {}
    local n = 1
    for i = 1, #fs do
      local f = fs[i]
      for j = 1, #xs do
        result[n] = f(xs[j])
        n = n + 1
      end
    end
    return result
  end
end

return {
  arrayApply = arrayApply
}
