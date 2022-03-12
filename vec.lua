local vec = {}
vec.__index = vec
vec.new = function(x, y, z)
    return setmetatable({ x = x, y = y, z = z }, vec) end
local operation = function(a, b, f)
    local z = nil if a.z~=nil and b.z~=nil then z = f(a.z, b.z) end
    return vec.new(f(a.x, b.x), f(a.y, b.y), z) end
vec.__add = function(a, b)
    return operation(a,b, function(c,d) return c+d end) end
vec.__sub = function(a, b)
    return operation(a,b, function(c,d) return c-d end) end
vec.__mul = function(a, b)
    if getmetatable(b) == vec then
        return operation(a,b, function(c,d) return c*d end) end
    if type(b) == "number" then
        local z = nil if a.z ~= nil then z = a.z*b end
        return vec.new(a.x*b, a.y*b, z) end
end
vec.__div = function(a, b)
    if getmetatable(b) == vec then
        return operation(a,b, function(c,d) return c/d end) end
    if type(b) == "number" then
        local z = nil if a.z ~= nil then z = a.z/b end
        return vec.new(a.x/b, a.y/b, z) end
end
vec.__unm = function(a)
    local z if a.z ~= nil then z = -a.z end
    return vec.new(-a.x, -a.y, z) end
vec.__eq = function(a, b)
    return a.x == b.x and a.y == b.y and a.z == b.z end
vec.__tostring = function(a)
    local z = a.z ~= nil and ", " .. a.z or ""
    return "("..a.x..", "..a.y..z..")" end
return vec