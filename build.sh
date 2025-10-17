#Double Precision
./cloudsc-bundle build  --build-dir build_hdf5_noomp3_dp --arch bsc/arriesgado --threads 4 --with-hdf5 ON --with-prototype1 ON --with-openmp OFF --verbose --cmake="CMAKE_Fortran_FLAGS=-I/apps/riscv/ubuntu/openmpi/4.1.6_llvm1.0/lib CMAKE_EXE_LINKER_FLAGS=-fopenmp ECBUILD_Fortran_COMPILE_OPTIONS_REAL8=ON ECBUILD_Fortran_COMPILE_OPTIONS_REAL4=OFF"

#Single Precision
./cloudsc-bundle build --build-dir build_hdf5_noomp3_sp --arch bsc/arriesgado --threads 4 --with-hdf5 ON --with-prototype1 ON --with-openmp OFF --verbose --cmake="CMAKE_Fortran_FLAGS=-I/apps/riscv/ubuntu/openmpi/4.1.6_llvm1.0/lib CMAKE_EXE_LINKER_FLAGS=-fopenmp ECBUILD_Fortran_COMPILE_OPTIONS_REAL8=OFF ECBUILD_Fortran_COMPILE_OPTIONS_REAL4=ON"
