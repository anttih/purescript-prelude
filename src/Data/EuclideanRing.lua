
local function intDegree(x)
  return math.min(math.abs(x), 2147483647)
end

-- See the Euclidean definition in
-- https://en.m.wikipedia.org/wiki/Modulo_operation.
local function intDiv(x)
  return function (y)
    if (y == 0) then return 0 end
    if y > 0 then
      return math.floor(x / y)
    else
      return -math.floor(x / -y)
    end
  end
end

local function intMod(x)
  return function (y)
    if (y == 0) then return 0 end
    local yy = math.abs(y)
    return ((x % yy) + yy) % yy
  end
end

local function numDiv (n1)
  return function (n2)
    return n1 / n2
  end
end

return {
  intDegree = intDegree,
  intDiv = intDiv,
  intMod = intMod,
  numDiv = numDiv
}
