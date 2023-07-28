import Random

using Test: @test
using RBM_Hidden_Unit_Importance: log_partition_contributions
using RestrictedBoltzmannMachines: RBM, Binary, sample_v_from_v, log_partition

Random.seed!(1234)

rbm = RBM(Binary((3,)), Binary((2,)), randn(3,2))
rbm1 = RBM(rbm.visible, Binary(; θ = rbm.hidden.θ[2:2]), rbm.w[:, 2:2])
rbm2 = RBM(rbm.visible, Binary(; θ = rbm.hidden.θ[1:1]), rbm.w[:, 1:1])

log_ΔZ = log_partition_contributions(rbm; nsamples=10000, nsteps=1000)

lZ = log_partition(rbm)
lZ1 = log_partition(rbm1)
lZ2 = log_partition(rbm2)

@test lZ1 - lZ ≈ log_ΔZ[1] rtol=1e-2
@test lZ2 - lZ ≈ log_ΔZ[2] rtol=1e-2
