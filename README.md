# RBM_Hidden_Unit_Importance

Julia package to estimate contribution of individual hidden units of an RBM to the log-likelihood of data. Based on Shimagaki et al 2019.

## Installation

Registered at https://github.com/cossio/CossioJuliaRegistry.

## Usage

```julia
log_partition_contributions(rbm)
```

This function will compute the contribution of individual hidden units to the log-partition function.

```julia
log_likelihood_contributions(rbm, data)
```

This function will compute the contribution of individual hidden units to the log-likelihood of data.

# References

* 2019 Selection of sequence motifs and generative Hopfield-Potts models for protein families - Shimagaki, Weigt. In particular see Equation (24).