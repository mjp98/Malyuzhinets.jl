module Malyuzhinets

using FastGaussQuadrature
using LinearAlgebra

export malyuzhinets_modifiedosipov
export malyuzhinets_laguerre
export malyuzhinets_aidi
export malyuzhinets1_4
export malyuzhinets1_2

include("laguerre.jl")
include("osipov.jl")
include("aidi.jl")
include("reduce.jl")
include("normalise.jl")

# special values
include("special/1_4.jl")
include("special/1_2.jl")
end
