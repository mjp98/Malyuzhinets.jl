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

    alpha = 1//2
    z = 1+0.1im
    @test malyuzhinets1_2(z) ≈ malyuzhinets_aidi(z,alpha) rtol = 1e-12
    z = 1+10.0im
    @test malyuzhinets1_2(z) ≈  malyuzhinets_aidi(z,alpha) rtol = 1e-12

    alpha = 1//4
    z = 1+0.1im
    @test malyuzhinets1_4(z) ≈ malyuzhinets_aidi(z,alpha) rtol = 1e-12
    z = 1+10.0im
    @test malyuzhinets1_4(z) ≈  malyuzhinets_aidi(z,alpha) rtol = 1e-12
end
