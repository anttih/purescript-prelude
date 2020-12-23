
local function unsafeHas (label)
  return function (rec)
  end
end

local function unsafeGet (label)
  return function (rec)
  end
end

local function unsafeSet (label)
  return function (value)
    return function (rec)
    end
  end
end

local function unsafeDelete (label)
  return function (rec)
  end
end

return {
  unsafeHas = unsafeHas,
  unsafeGet = unsafeGet,
  unsafeSet = unsafeSet,
  unsafeDelete = unsafeDelete
}
