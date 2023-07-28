"""
    log_partition_contributions(rbm; nsamples=1000, nsteps=1000)

Estimates contribution of each hidden unit to the partition function
in the `rbm` by importance sampling. The parameters `nsamples` and `nsteps`
control the sampling protocol. Returns `log(Zλ) - log(Z)` for each hidden unit `λ`,
where `Zλ` is the partition function with hidden unit λ removed.
"""
function log_partition_contributions(rbm::RBM; nsamples::Int=1000, nsteps::Int=1000)
    v = sample_from_inputs(rbm.visible, zeros(size(rbm.visible)..., nsamples))
    v = sample_v_from_v(rbm, v; steps=nsteps)

    inputs = inputs_h_from_v(rbm, v)
    Γ = cgfs(rbm.hidden, inputs)

    return reshape(logmeanexp(-Γ; dims=ndims(Γ)), size(rbm.hidden))
end
