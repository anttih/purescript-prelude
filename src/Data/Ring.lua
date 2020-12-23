
local function intSub(x)
  return function (y)
    return x - y
  end
end

local function numSub(n1)
  return function (n2)
    return n1 - n2
  end
end

return {
  intSub = intSub,
  numSub = numSub
}
