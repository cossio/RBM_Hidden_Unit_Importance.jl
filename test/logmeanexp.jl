using Test: @test
using Test: @testset
using Test: @inferred
using Statistics: mean
using Statistics: var
using Statistics: std
using RBM_Hidden_Unit_Importance: logmeanexp

@testset "logmeanexp" begin
    A = randn(5,3,2)
    for dims = (2, (1,2), :)
        @test logmeanexp(A; dims) ≈ log.(mean(exp.(A); dims))
        @inferred logmeanexp(A; dims)
    end
    @test logmeanexp(A) ≈ log.(mean(exp.(A)))
    @inferred logmeanexp(A)
end

@testset "logmeanexp properties" begin
    X = randn(1000, 1000)
    @test only(logmeanexp(logmeanexp(X; dims=1); dims=2)) ≈ logmeanexp(X)
    @test only(logmeanexp(-logmeanexp(-X; dims=1); dims=2)) ≤ only(-logmeanexp(-logmeanexp(X; dims=1); dims=2))
    x = randn()
    @test logmeanexp([x]) ≈ x
    X = randn(1000, 1000, 1)
    @test logmeanexp(X; dims=3) ≈ X
    @test -logmeanexp(-X) ≤ logmeanexp(X)
end
