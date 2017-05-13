/*
  D bindings for CUDA.
  Authors:    Prasun Anand
  Copyright:  Copyright (c) 2017, Prasun Anand. All rights reserved.
  License:    BSD 3-Clause License
*/

module cuda_d.cuComplex;

import cuda_d.vector_types;

extern (C):

/* __cplusplus */

/* import fabs, sqrt */

/* versions for hosts without native support for 'complex' */

/* wrapper functions around C99 native complex support. NOTE: Untested! */

/* -- Single Precision -- */

/* -- Double Precision -- */

/* versions for target or hosts without native support for 'complex' */

/* (defined(__CUDACC__) || (!(defined(CU_USE_NATIVE_COMPLEX)))) */

alias cuFloatComplex = float2_;

float cuCrealf (cuFloatComplex x);

float cuCimagf (cuFloatComplex x);

cuFloatComplex make_cuFloatComplex (float r, float i);

cuFloatComplex cuConjf (cuFloatComplex x);
cuFloatComplex cuCaddf (cuFloatComplex x, cuFloatComplex y);

cuFloatComplex cuCsubf (cuFloatComplex x, cuFloatComplex y);

/* This implementation could suffer from intermediate overflow even though
 * the final result would be in range. However, various implementations do
 * not guard against this (presumably to avoid losing performance), so we
 * don't do it either to stay competitive.
 */
cuFloatComplex cuCmulf (cuFloatComplex x, cuFloatComplex y);

/* This implementation guards against intermediate underflow and overflow
 * by scaling. Such guarded implementations are usually the default for
 * complex library implementations, with some also offering an unguarded,
 * faster version.
 */
cuFloatComplex cuCdivf (cuFloatComplex x, cuFloatComplex y);

/*
 * We would like to call hypotf(), but it's not available on all platforms.
 * This discrete implementation guards against intermediate underflow and
 * overflow by scaling. Otherwise we would lose half the exponent range.
 * There are various ways of doing guarded computation. For now chose the
 * simplest and fastest solution, however this may suffer from inaccuracies
 * if sqrt and division are not IEEE compliant.
 */
float cuCabsf (cuFloatComplex x);

/* Double precision */
alias cuDoubleComplex = double2_;

double cuCreal (cuDoubleComplex x);

double cuCimag (cuDoubleComplex x);

cuDoubleComplex make_cuDoubleComplex (double r, double i);

cuDoubleComplex cuConj (cuDoubleComplex x);

cuDoubleComplex cuCadd (cuDoubleComplex x, cuDoubleComplex y);

cuDoubleComplex cuCsub (cuDoubleComplex x, cuDoubleComplex y);

/* This implementation could suffer from intermediate overflow even though
 * the final result would be in range. However, various implementations do
 * not guard against this (presumably to avoid losing performance), so we
 * don't do it either to stay competitive.
 */
cuDoubleComplex cuCmul (cuDoubleComplex x, cuDoubleComplex y);

/* This implementation guards against intermediate underflow and overflow
 * by scaling. Such guarded implementations are usually the default for
 * complex library implementations, with some also offering an unguarded,
 * faster version.
 */
cuDoubleComplex cuCdiv (cuDoubleComplex x, cuDoubleComplex y);

/* This implementation guards against intermediate underflow and overflow
 * by scaling. Otherwise we would lose half the exponent range. There are
 * various ways of doing guarded computation. For now chose the simplest
 * and fastest solution, however this may suffer from inaccuracies if sqrt
 * and division are not IEEE compliant.
 */
double cuCabs (cuDoubleComplex x);

/* (!defined(__CUDACC__) && defined(CU_USE_NATIVE_COMPLEX))) */

/* __cplusplus */

/* aliases */
alias cuComplex = float2_;
cuComplex make_cuComplex (float x, float y);

/* float-to-double promotion */
cuDoubleComplex cuComplexFloatToDouble (cuFloatComplex c);

cuFloatComplex cuComplexDoubleToFloat (cuDoubleComplex c);

/* !defined(CU_COMPLEX_H_) */
