module Malyuzhinets

using FastGaussQuadrature, LinearAlgebra

export malyuzhinets_modifiedosipov, malyuzhinets_laguerre

include("laguerre.jl")
include("osipov.jl")
include("aidi.jl")


end
