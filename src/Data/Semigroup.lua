
local function concatString(s1)
  return function (s2)
    return s1 .. s2
  end
end

local function concatArray(xs)
  return function (ys)
    if (#xs == 0) then return ys end
    if (#ys == 0) then return xs end
    local result = {}
    for i = 1, #xs do
      result[i] = xs[i]
    end

    local xslen = #result
    for i = 1, #ys do
      result[xslen + i] = ys[i]
    end
    return result
  end
end

return {
  concatString = concatString,
  concatArray = concatArray
}
