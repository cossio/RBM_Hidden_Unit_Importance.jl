"""
    log_likelihood_contributions(rbm; nsamples=1000, nsteps=1000, ΔlogZ=nothing)

Estimates contribution of each hidden unit to the log-likelihood of `data`
in the `rbm`.
"""
function log_likelihood_contributions(rbm::RBM, data::AbstractArray; nsamples::Int=1000, nsteps::Int=1000, ΔlogZ=nothing)
    if isnothing(ΔlogZ)
        _ΔZ = log_partition_contributions(rbm; nsamples, nsteps)
    else
        _ΔZ = ΔlogZ
    end

    inputs = inputs_h_from_v(rbm, data)
    return _ΔZ .+ cgfs(rbm.hidden, inputs)
end
