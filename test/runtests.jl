using Malyuzhinets
using Test

@testset "Malyuzhinets.jl" begin
    tol = 1e-5
    z = 0.5+2im
    alpha = 1/2
    @test malyuzhinets_modifiedosipov(z,alpha) ≈ malyuzhinets_laguerre(z,alpha,128) atol = tol

    alpha = 1/4
    @test malyuzhinets_modifiedosipov(z,alpha) ≈ malyuzhinets_laguerre(z,alpha,128) atol = tol

    alpha = 1/8
    @test malyuzhinets_modifiedosipov(z,alpha) ≈ malyuzhinets_laguerre(z,alpha,128) atol = tol

    alpha = 2
    @test_broken malyuzhinets_modifiedosipov(z,alpha) ≈ malyuzhinets_laguerre(z,alpha,128) atol = tol
end
