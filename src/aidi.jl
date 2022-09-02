
function malyuzhinets_aidi(z,alpha;imagcutoff = 1 + inv(4alpha))
    if imag(z) >= imagcutoff
        return malyuzhinets_modifiedosipov(z,alpha)
    else
        return malyuzhinets_laguerre(z,alpha)
    end
end
