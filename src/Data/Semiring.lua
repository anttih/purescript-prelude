
local function intAdd(x)
  return function (y)
    return math.floor(x + y)
  end
end

local function intMul(x)
  return function (y)
    return math.floor(x * y)
  end
end

local function numAdd(n1)
  return function (n2)
    return n1 + n2
  end
end

local function numMul(n1)
  return function (n2)
    return n1 * n2
  end
end

return {
  intAdd = intAdd,
  intMul = intMul,
  numAdd = numAdd,
  numMul = numMul
}
