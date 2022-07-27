function malyuzhinets_laguerre(z,alpha,n = alpha < 1 ? 24 : 64)
    p = (π/2)*(alpha+1)/alpha

    num(s) = (4*(sinh(s*π/(4p))^2 - sinh(s*z/(2p))^2))
    den(s) = (s*(1-exp(-π*s/(p*alpha)))*(1+exp(-π*s/p)))
    F(s) = num(s)/den(s)

    x,w = gausslaguerre(n)

    exp(dot(w,F.(x)))
end
