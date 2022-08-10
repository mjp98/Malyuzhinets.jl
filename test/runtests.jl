using Malyuzhinets
using Test

@testset "Malyuzhinets.jl" begin
    z = 0.5+2im
    alpha = 1/2
    @test malyuzhinets_modifiedosipov(z,alpha) ≈ malyuzhinets_laguerre(z,alpha,128)

    # Need to go further from the real axis for power series to converge
    z = 0.5+8im
    alpha = 1/4
    @test malyuzhinets_modifiedosipov(z,alpha;jmax =200,kmax=200) ≈  malyuzhinets_laguerre(z,alpha,128)

    @test malyuzhinets_modifiedosipov(z,alpha) ≈ malyuzhinets1_4(z) atol = 1e-12
    z = 0.5+0.2im
    @test malyuzhinets_laguerre(z,alpha) ≈ malyuzhinets1_4(z) atol = 1e-12

    z = 0.5+8im
    alpha = 1/8
    @test malyuzhinets_modifiedosipov(z,alpha) ≈ malyuzhinets_laguerre(z,alpha,128)

    alpha = 2
    @test_broken malyuzhinets_modifiedosipov(z,alpha) ≈ malyuzhinets_laguerre(z,alpha,256) atol = tol
end
