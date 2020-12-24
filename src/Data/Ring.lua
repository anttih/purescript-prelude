
local function intSub(x)
  return function (y)
    return bit.bor(x - y, 0)
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
