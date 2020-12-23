
-- local function showIntImpl(n)
--   return n.toString()
-- end

local function showNumberImpl(n)
  local str = tostring(n);
  -- TODO add decimals
  return str
end

local function showCharImpl(c)
  local code = string.byte(c)
  if (code < 0x20 or code == 0x7F) then 
    if c == "\x07" then return "'\\a'" end
    if c == "\b" then return "'\\b'" end
    if c == "\f" then return "'\\f'" end
    if c == "\n" then return "'\\n'" end
    if c == "\r" then return "'\\r'" end
    if c == "\t" then return "'\\t'" end
    if c == "\v" then return "'\\v'" end
    return "'\\" .. string.char(c) .. "'"
  end
  if c == "'" or c == "\\" then
    return "'\\" .. c .. "'"
  else
    return "'" .. c .. "'"
  end
end

-- TODO
local function showStringImpl(s)
  return "\"" .. s .. "\""
end

local function showArrayImpl(f)
  return function (xs)
    local ss = {};
    for i = 1, #xs do
      ss[i] = f(xs[i])
    end

    return "[" .. table.concat(ss, ",") .. "]"
  end
end

local function cons(head)
  return function (tail)
    local result = {head}
    for i = 1, #tail do
      result[i + 1] = tail[i]
    end

    return result
  end
end

local function join(separator)
  return function (xs)
    return table.concat(xs, separator)
  end
end

return {
  showNumberImpl = showNumberImpl,
  showCharImpl = showCharImpl,
  showStringImpl = showStringImpl,
  showArrayImpl = showArrayImpl,
  cons = cons,
  join = join
}
