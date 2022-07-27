#! WIP only appears to be working for alpha = 1/2,1/4,1/8

function malyuzhinets_modifiedosipov(z, alpha; tol=1e-5, Atol=1e-12, Btol=1e-12, jmax=100, kmax=100)
    dropped = Int[]

    @assert Atol > 0 "Atol must be positive"
    @assert Btol > 0 "Btol must be positive"

    a = -exp(2im * z * alpha)
    aj = exp(2im * z * alpha)
    j = 1
    ΣA = 0
    Aε = 1
    while (Aε > Atol) && (j < jmax)
        k, ϵ = divrem(alpha * j + 1 / 2, 1)
        if ϵ < tol
            push!(dropped, k)
            Y = inv(2k - 1)
            T = 2π * j * Y
            c0 = -Y + im * z
            c1 = (π + T) * (π - T) / 12 + z * (z + 2im * Y)
            Aj = aj * ((-1)^k) * (c0 + ϵ * c1) / (j * π)
        else
            Aj = aj / (2j * cospi(alpha * j))
        end
        j += 1
        aj *= a
        ΣA += Aj
        Aε = abs(Aj / ΣA)
    end
    j == jmax && @warn "maximum length A expansion reached before tol: increase jmax"

    b = -exp(2im * z)
    bk = exp(im * z)
    k = 1
    ΣB = 0
    Bε = Inf
    while (Bε > Btol) && (k < kmax)
        bk *= b
        j = round((2k - 1) / (2alpha))
    #    @show j
        ϵ = alpha * j - k + 1 / 2
        if abs(ϵ) < tol
            if j in dropped
            #    @show j
                k += 1
                continue
            end
            Y = inv(2k - 1)
            T = 2π * j * Y
            c0 = -Y + im * z
            c1 = (π + T) * (π - T) / 12 - z^2
            Bk = bk * ((-1)^j) * (c0 + ϵ * c1) / (j * π)
        else
            Bk = bk / ((2k - 1) * sinpi((2k - 1) / (2alpha)))
        end
        ΣB += Bk
   #     @show ΣB
        Bε = abs(Bk / (ΣA + ΣB))
        k += 1
    end
    k == kmax && @warn "maximum length B expansion reached before tol: increase kmax"

    return exp(-im * alpha * z / 2 + ΣA + ΣB) / sqrt(2)
end
