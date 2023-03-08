# (C) Copyright 1988- ECMWF.
#
# This software is licensed under the terms of the Apache Licence Version 2.0
# which can be obtained at http://www.apache.org/licenses/LICENSE-2.0.
# In applying this licence, ECMWF does not waive the privileges and immunities
# granted to it by virtue of its status as an intergovernmental organisation
# nor does it submit to any jurisdiction.

# Source me to get the correct configure/build/run environment

# Store tracing and disable (module is *way* too verbose)
{ tracing_=${-//[^x]/}; set +x; } 2>/dev/null

module_load() {
  echo "+ module load $1"
  module load $1
}
module_unload() {
  echo "+ module unload $1"
  module unload $1
}

# Unload to be certain
source /opt/cray/pe/cpe/22.06/restore_lmod_system_defaults.sh || true

# Load modules
module_load PDCTEST/22.06
module_unload rocm
module_load PrgEnv-amd/8.3.3
module_load craype-accel-amd-gfx90a
module_load buildtools/22.06
module_load cmake/3.23.0
module_load cray-hdf5/1.12.1.5
module_load cray-python/3.9.12.1

# Specify compilers
# export CC=amdclang CXX=amdclang++ FC=amdflang
export CC=cc CXX=CC FC=ftn

set -x

# Restore tracing to stored setting
{ if [[ -n "$tracing_" ]]; then set -x; else set +x; fi } 2>/dev/null

export ECBUILD_TOOLCHAIN="./toolchain.cmake"
