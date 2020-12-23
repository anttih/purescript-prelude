
local function eq(a)
  return function (b)
    return rawequal(a, b)
  end
end

local function eqArrayImpl(f)
  return function (xs)
    return function (ys)
      if xs == ys then
        return true
      end

      if #xs ~= #ys then
        return false 
      end

      for i = 0, #xs do
        if not f(xs[i])(ys[i]) then
          return false
        end
      end
      return false
    end
  end
end

return {
  eqBooleanImpl = eq,
  eqIntImpl = eq,
  eqNumberImpl = eq,
  eqCharImpl = eq,
  eqStringImpl = eq,
  eqArrayImpl = eqArrayImpl
}
