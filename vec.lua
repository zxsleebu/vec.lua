local vec = {}
vec.__index = vec
vec.new = function(x, y, z)
    return setmetatable({ x = x, y = y, z = z }, vec) end
vec.check3 = function(a, b)
    return a.z ~= nil and b.z ~= nil end
vec.__add = function(a, b)
    return vec.check3(a, b)
    and vec.new(a.x+b.x, a.y+b.y, a.z+b.z)
    or vec.new(a.x+b.x, a.y+b.y)
end
vec.__sub = function(a, b)
    return vec.check3(a, b)
    and vec.new(a.x-b.x, a.y-b.y, a.z-b.z)
    or vec.new(a.x-b.x, a.y-b.y)
end
vec.__mul = function(a, b)
    if getmetatable(b) == vec then
        return vec.check3(a, b)
        and vec.new(a.x*b.x, a.y*b.y, a.z*b.z)
        or vec.new(a.x*b.x, a.y*b.y) end
    if type(b) == "number" then
        return vec.check3(a, b)
        and vec.new(a.x*b, a.y*b, a.z*b)
        or vec.new(a.x*b, a.y*b) end
end
vec.__div = function(a, b)
    if getmetatable(b) == vec then
        return vec.check3(a, b)
        and vec.new(a.x/b.x, a.y/b.y, a.z/b.z)
        or vec.new(a.x/b.x, a.y/b.y) end
    if type(b) == "number" then
        return vec.check3(a, b)
        and vec.new(a.x/b, a.y/b, a.z/b)
        or vec.new(a.x/b, a.y/b) end
end
vec.__unm = function(a)
    return a ~= nil
    and vec.new(-a.x, -a.x, -a.z)
    or vec.new(-a.x, -a.x)
end
vec.__eq = function(a, b)
    return a.x == b.x and a.y == b.y and a.z == b.z end
vec.__tostring = function(a)
    local z = a.z ~= nil and (", " .. a.z) or ""
    return "("..a.x..", "..a.y..z..")" end
return vec