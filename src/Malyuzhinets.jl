module Malyuzhinets

using FastGaussQuadrature
using LinearAlgebra

export malyuzhinets_modifiedosipov
export malyuzhinets_laguerre
export malyuzhinets1_4

include("laguerre.jl")
include("osipov.jl")
include("aidi.jl")
include("reduce.jl")
include("normalise.jl")

# special values
include("1_4.jl")

end
