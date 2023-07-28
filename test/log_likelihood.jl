import Random

using Test: @test
using Random: bitrand
using RBM_Hidden_Unit_Importance: log_likelihood_contributions
using RestrictedBoltzmannMachines: RBM, Binary, sample_v_from_v, log_likelihood

Random.seed!(1234)

rbm = RBM(Binary((3,)), Binary((2,)), randn(3,2))
rbm1 = RBM(rbm.visible, Binary(; θ = rbm.hidden.θ[2:2]), rbm.w[:, 2:2])
rbm2 = RBM(rbm.visible, Binary(; θ = rbm.hidden.θ[1:1]), rbm.w[:, 1:1])

data = bitrand(3, 100)
Δll = log_likelihood_contributions(rbm, data; nsamples=50000, nsteps=1000)

ll = log_likelihood(rbm, data)
ll1 = log_likelihood(rbm1, data)
ll2 = log_likelihood(rbm2, data)

@test ll - ll1 ≈ Δll[1,:] rtol=1e-2
@test ll - ll2 ≈ Δll[2,:] rtol=1e-2
