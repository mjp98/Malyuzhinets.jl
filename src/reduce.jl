# Aidi eq 4
function reduce_conj(f,alpha,z)
    return conj(reduce_and_eval(f,alpha,conj(z)))
end
# Aidi eq 5
function reduce_even(f,alpha,z)
    return reduce_and_eval(f,alpha,-z)
end
# Aidi eq 6
function reduce_prod(f,alpha,z)
    return cos(alpha*(z-π/2))/reduce_and_eval(f,alpha,z-π)
end
# Aidi eq 7
function reduce_div(f,alpha,z)
    return cot((z+(π/2)*(alpha+1)/alpha)/2)*reduce_and_eval(f,alpha,z-π/alpha)
end
function reduce_and_eval(f,alpha,z)
    @assert alpha > 0 "alpha must be a positive real"
    zr,zi = reim(z)
    zr < -π/2 && return reduce_even(f,alpha,z)
    zr >= π/2 && return reduce_prod(f,alpha,z)
    zr < 0 && return reduce_even(f,alpha,z)
    zi < 0 && return reduce_conj(f,alpha,z)
    return f(alpha,z)
end
