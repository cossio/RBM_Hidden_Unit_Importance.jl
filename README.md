# RBM_Hidden_Unit_Importance

[![Build Status](https://github.com/cossio/RBM_Hidden_Unit_Importance.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/cossio/RBM_Hidden_Unit_Importance.jl/actions/workflows/CI.yml?query=branch%3Amain)
[![Coverage](https://codecov.io/gh/cossio/RBM_Hidden_Unit_Importance.jl/branch/main/graph/badge.svg)](https://codecov.io/gh/cossio/RBM_Hidden_Unit_Importance.jl)

## Background

Based on Shimagaki et al 2019.

RBM defined by:

$$
E(\mathbf{v},\mathbf{h}) = \sum_{i}\mathcal{V}_{i}(v_{i}) + \sum_{\mu}\mathcal{U}_{\mu}(h_{\mu}) - \sum_{i}\sum_{\mu}w_{i\mu}v_{i}h_{\mu}
$$

Likelihood

$$
P(\mathbf{v}) = \frac{1}{Z} \sum_{\mathbf{h}} e^{ -E(\mathbf{v},\mathbf{h}) } = \frac{1}{Z} e^{ -E^{\text{eff}}(\mathbf{v}) }
$$

We consider a modified RBM where hidden unit $\lambda$ has been removed:

$$
E_{\backslash\lambda}(\mathbf{v},\mathbf{h}_{\backslash\lambda}) = \sum_{i}\mathcal{V}_{i}(v_{i}) + \sum_{\mu \neq \lambda}\mathcal{U}_{\mu}(h_{\mu}) - \sum_{i}\sum_{\mu \neq \lambda} w_{i\mu}v_{i}h_{\mu}
$$

$$
P_{\backslash\lambda}(\mathbf{v}) = \frac{1}{Z_{\backslash\lambda}} \sum_{\mathbf{h}_{\backslash\lambda}} e^{ -E_{_{\backslash\lambda}}(\mathbf{v},\mathbf{h}_{\backslash\lambda}) } = e^{ -E^{\text{eff}}_{\backslash\lambda}(\mathbf{v}) }
$$

We define the likelihood contribution of hidden unit $\lambda$ in the context of a data-point $\mathbf{v}$ as:

$$
\frac{P(\mathbf{v})}{P_{\backslash\lambda}(\mathbf{v})} = \frac{Z_{\backslash\lambda}}{Z} e^{ E^{\text{eff}}_{\backslash\lambda}(\mathbf{v}) - E^{\text{eff}}(\mathbf{v}) }
$$

The partition function ratio can be computed as:

$$
\begin{align}
\frac{Z_{\backslash\lambda}}{Z} &= \frac{1}{Z} \sum_{\mathbf{v}} e^{ -E^{\text{eff}}_{\backslash\lambda}(\mathbf{v}) } \\
&= \frac{1}{Z} \sum_{\mathbf{v}} e^{ -E^{\text{eff}}(\mathbf{v}) - \ln \sum_{h_{\lambda}} e^{ -\mathcal{U}_{\lambda}(h_{\lambda}) + \sum_{i} w_{i\lambda}v_{i}h_{\lambda} } } \\
&= \sum_{\mathbf{v}} P(\mathbf{v}) e^{ -\ln \sum_{h_{\lambda}} e^{ -\mathcal{U}_{\lambda}(h_{\lambda}) + \sum_{i} w_{i\lambda}v_{i}h_{\lambda} } }
\end{align}
$$

where we employed

$$
E(\mathbf{v},\mathbf{h}) = E_{\backslash\lambda}(\mathbf{v},\mathbf{h}_{\backslash\lambda}) + \mathcal{U}_{\lambda}(h_{\lambda}) - \sum_{i} w_{i\lambda}v_{i}h_{\lambda}
$$

$$
e^{ -E^{\text{eff}}(\mathbf{v}) } = e^{ -E^{\text{eff}}_{\backslash\lambda}(\mathbf{v}) } \sum_{h_{\lambda}} e^{ -\mathcal{U}_{\lambda}(h_{\lambda}) + \sum_{i} w_{i\lambda}v_{i}h_{\lambda} }
$$

$$
-E^{\text{eff}}(\mathbf{v}) = -E^{\text{eff}}_{\backslash\lambda}(\mathbf{v}) + \ln \sum_{h_{\lambda}} e^{ -\mathcal{U}_{\lambda}(h_{\lambda}) + \sum_{i} w_{i\lambda}v_{i}h_{\lambda} }
$$

## Usage

```julia
log_partition_contributions(rbm)
```

This function will compute the log-ratios $\ln \frac{Z_{\backslash\lambda}}{Z}$ for all hidden units $\lambda$ by importance sampling.


# References
* 2019 Selection of sequence motifs and generative Hopfield-Potts models for protein families - Shimagaki, Weigt. In particular see Equation (24).