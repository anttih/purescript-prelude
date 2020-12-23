
local function boolConj(b1)
  return function (b2)
    return b1 and b2
  end
end

local function boolDisj(b1)
  return function (b2)
    return b1 or b2
  end
end

local function boolNot(b)
  return not b
end

return {
  boolConj = boolConj,
  boolDisj = boolDisj,
  boolNot = boolNot
}
