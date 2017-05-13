/*
  D bindings for CUDA.
  Authors:    Prasun Anand
  Copyright:  Copyright (c) 2017, Prasun Anand. All rights reserved.
  License:    BSD 3-Clause License
*/

module cuda_d.cuda_profiler_api;

import cuda_d.cuda;

extern (C):

/* __cplusplus */

/**
 * \ingroup CUDART
 * \defgroup CUDART_PROFILER Profiler Control
 *
 * ___MANBRIEF___ profiler control functions of the CUDA runtime API
 * (___CURRENT_FILE___) ___ENDMANBRIEF___
 *
 * This section describes the profiler control functions of the CUDA runtime
 * application programming interface.
 *
 * @{
 */

/**
 * \brief Initialize the CUDA profiler.
 *
 * Using this API user can initialize the CUDA profiler by specifying
 * the configuration file, output file and output file format. This
 * API is generally used to profile different set of counters by
 * looping the kernel launch. The \p configFile parameter can be used
 * to select profiling options including profiler counters. Refer to
 * the "Compute Command Line Profiler User Guide" for supported
 * profiler options and counters.
 *
 * Limitation: The CUDA profiler cannot be initialized with this API
 * if another profiling tool is already active, as indicated by the
 * ::cudaErrorProfilerDisabled return code.
 *
 * Typical usage of the profiling APIs is as follows:
 *
 * for each set of counters/options\n
 * {\n
 *      cudaProfilerInitialize(); //Initialize profiling,set the counters/options in
 * the config file \n
 *      ...\n
 *      cudaProfilerStart(); \n
 *      // code to be profiled \n
 *      cudaProfilerStop();\n
 *      ...\n
 *      cudaProfilerStart(); \n
 *      // code to be profiled \n
 *      cudaProfilerStop();\n
 *      ...\n
 * }\n
 *
 *
 * \param configFile - Name of the config file that lists the counters/options
 * for profiling.
 * \param outputFile - Name of the outputFile where the profiling results will
 * be stored.
 * \param outputMode - outputMode, can be ::cudaKeyValuePair OR ::cudaCSV.
 *
 * \return
 * ::cudaSuccess,
 * ::cudaErrorInvalidValue,
 * ::cudaErrorProfilerDisabled
 * \notefnerr
 *
 * \sa ::cudaProfilerStart, ::cudaProfilerStop
 */
cudaError_t cudaProfilerInitialize (
    const(char)* configFile,
    const(char)* outputFile,
    cudaOutputMode_t outputMode);

/**
 * \brief Enable profiling.
 *
 * Enables profile collection by the active profiling tool for the
 * current context. If profiling is already enabled, then
 * cudaProfilerStart() has no effect.
 *
 * cudaProfilerStart and cudaProfilerStop APIs are used to
 * programmatically control the profiling granularity by allowing
 * profiling to be done only on selective pieces of code.
 *
 *
 * \return
 * ::cudaSuccess
 * \notefnerr
 *
 * \sa ::cudaProfilerInitialize, ::cudaProfilerStop
 */
cudaError_t cudaProfilerStart ();

/**
 * \brief Disable profiling.
 *
 * Disables profile collection by the active profiling tool for the
 * current context. If profiling is already disabled, then
 * cudaProfilerStop() has no effect.
 *
 * cudaProfilerStart and cudaProfilerStop APIs are used to
 * programmatically control the profiling granularity by allowing
 * profiling to be done only on selective pieces of code.
 *
 * \return
 * ::cudaSuccess
 * \notefnerr
 *
 * \sa ::cudaProfilerInitialize, ::cudaProfilerStart
 */
cudaError_t cudaProfilerStop ();

/** @} */ /* END CUDART_PROFILER */

/* __cplusplus */

/* !__CUDA_PROFILER_API_H__ */
