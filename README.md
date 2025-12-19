# MATLAB Codes for  
## Robust Mean Estimation under Quantization

**Authors:** Pedro Abdalla, Junren Chen  
**Shared by:** Junren Chen (Dec 18, 2025)  
**Contact:** jchen58@umd.edu  

---

## Overview

This repository contains MATLAB codes used to generate the figures in the paper  
**“Robust Mean Estimation under Quantization.”**

The codes are organized by experimental setting:
- univariate vs. multivariate
- with or without corruption

Each folder contains figure-generation scripts together with the core functions used in the simulations.

---

## Folder 1: `univariate_nocorruption`

**Purpose:** Univariate mean estimation without corruption.

### Figure scripts
- `fig1_1bmean_sammean.m`  
  Generate **Figure 1**.

### Core functions
- `uni_nocorruption.m`  
  Univariate 1-bit mean estimation (single trial).
- `uni_nocorruption_repe.m`  
  Univariate 1-bit mean and sample mean, averaged over independent trials.

---

## Folder 2: `mulvariate_nocorruption`

**Purpose:** Multivariate mean estimation without corruption.

### Figure scripts
- `fig2_mul_isotropic_1bmean_sammean.m`  
  Generate **Figure 2** (isotropic covariance).
- `fig3_mul_lowd_1bmean_sammean.m`  
  Generate **Figure 3** (low-dimensional / low-trace covariance).

### Core functions
- `mul_nocorruption.m`  
  Multivariate 1-bit mean estimation (single trial).
- `mul_nocorruption_repe.m`  
  Multivariate 1-bit mean and sample mean, averaged over independent trials.
- `lowtracecovariance.m`  
  Generate the low-trace covariance matrices used in Figure 3.

---

## Folder 3: `univariate_robust`

**Purpose:** Robust univariate mean estimation under corruption.

### Figure scripts
- `fig4_univariatecorru.m`  
  Generate **Figure 4**.

### Core functions
- `corruni_corruption.m`  
  Errors of 1-bit mean and trimmed mean (single trial).
- `uni_corruption_repe.m`  
  Errors of 1-bit mean and trimmed mean, averaged over independent trials.

---

## Folder 4: `mulvariate_robust`

**Purpose:** Robust multivariate mean estimation under corruption.

### Figure scripts
- `demomulti_corr.m`  
  Generate **Figure 5**.

### Core functions
- `mul_corruption.m`  
  Errors of multivariate 1-bit mean under randomly chosen corruption (single trial).
- `mul_corruption_repe.m`  
  Errors of multivariate 1-bit mean under randomly chosen corruption, averaged over independent trials.

---

## Notes

- All scripts are written in MATLAB.
- Figure scripts are self-contained entry points and call the corresponding core functions.
- Results may vary slightly due to randomness unless a fixed random seed is used.

---

