"""
    logmeanexp(A::AbstractArray; dims=:)

Computes `log.(mean(exp.(A); dims))`, in a numerically stable way.
"""
function logmeanexp(A::AbstractArray; dims=:)
    R = logsumexp(A; dims)
    N = convert(eltype(R), length(A) ÷ length(R))
    return R .- log(N)
end
