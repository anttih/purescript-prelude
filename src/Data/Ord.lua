
local function unsafeCompareImpl(lt)
  return function (eq)
    return function (gt)
      return function (x)
        return function (y)
          if x < y then
            return lt
          else
            if rawequal(x, y) then
              return eq
            else
              return gt
            end
          end
        end
      end
    end
  end
end

local function ordArrayImpl(f)
  return function (xs)
    return function (ys)
      local i = 0
      while i < #xs and i < #ys do
        local x = xs[i]
        local y = ys[i]
        local o = f(x)(y)
        if o ~= 0 then
          return o
        end
        i = i + 1
      end

      if #xs == #ys then
        return 0
      elseif #xs > #ys then
        return -1
      else
        return 1
      end
    end
  end
end

return {
  ordBooleanImpl = unsafeCompareImpl,
  ordIntImpl = unsafeCompareImpl,
  ordNumberImpl = unsafeCompareImpl,
  ordStringImpl = unsafeCompareImpl,
  ordCharImpl = unsafeCompareImpl
}
