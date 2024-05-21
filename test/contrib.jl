import Random
using Random: bitrand
using RBM_Hidden_Unit_Importance: log_likelihood_contributions
using RBM_Hidden_Unit_Importance: log_partition_contributions
using RestrictedBoltzmannMachines: Binary
using RestrictedBoltzmannMachines: log_likelihood
using RestrictedBoltzmannMachines: log_partition
using RestrictedBoltzmannMachines: RBM
using RestrictedBoltzmannMachines: sample_v_from_v
using Test: @test
using Test: @testset

@testset "unit contributions" begin
    Random.seed!(1234)

    rbm = RBM(Binary((3,)), Binary((2,)), randn(3,2)) # full RBM
    rbm1 = RBM(rbm.visible, Binary(; θ = rbm.hidden.θ[2:2]), rbm.w[:, 2:2]) # RBM without hidden unit 1
    rbm2 = RBM(rbm.visible, Binary(; θ = rbm.hidden.θ[1:1]), rbm.w[:, 1:1]) # RBM without hidden unit 2

    ΔlogZ = log_partition_contributions(rbm; nsamples=10000, nsteps=1000)

    lZ = log_partition(rbm)
    lZ1 = log_partition(rbm1)
    lZ2 = log_partition(rbm2)

    @test lZ1 - lZ ≈ ΔlogZ[1] rtol=1e-2
    @test lZ2 - lZ ≈ ΔlogZ[2] rtol=1e-2

    data = bitrand(3, 100)
    Δll = log_likelihood_contributions(rbm, data; nsamples=50000, nsteps=1000)

    ll = log_likelihood(rbm, data)
    ll1 = log_likelihood(rbm1, data)
    ll2 = log_likelihood(rbm2, data)

    @test ll - ll1 ≈ Δll[1,:] rtol=1e-2
    @test ll - ll2 ≈ Δll[2,:] rtol=1e-2
end
