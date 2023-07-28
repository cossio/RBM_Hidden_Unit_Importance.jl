# RBM_Hidden_Unit_Importance

[![Build Status](https://github.com/cossio/RBM_Hidden_Unit_Importance.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/cossio/RBM_Hidden_Unit_Importance.jl/actions/workflows/CI.yml?query=branch%3Amain)
[![Coverage](https://codecov.io/gh/cossio/RBM_Hidden_Unit_Importance.jl/branch/main/graph/badge.svg)](https://codecov.io/gh/cossio/RBM_Hidden_Unit_Importance.jl)

## Background

Estimate contribution of individual hidden units of an RBM to the log-likelihood of data. Based on Shimagaki et al 2019.

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