
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

return {
  unsafeCompareImpl = unsafeCompareImpl
}
