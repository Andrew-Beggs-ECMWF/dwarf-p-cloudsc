####################################################################
# COMPILER
####################################################################

include(CMakeForceCompiler)

set( ECBUILD_FIND_MPI OFF )

####################################################################
# OpenMP FLAGS
####################################################################

set( OMP_C_FLAGS             "-mp -mp=bind,allcores,numa" )
set( OMP_CXX_FLAGS           "-mp -mp=bind,allcores,numa" )
set( OMP_Fortran_FLAGS       "-mp -mp=bind,allcores,numa" )

####################################################################
# OpenAcc FLAGS
####################################################################

set( OACC_Fortran_FLAGS "-acc -ta=tesla:lineinfo,deepcopy,maxregcount:100,fastmath" )
set( OACC_Fortran_FLAGS "${OACC_Fortran_FLAGS} -Mvect=levels:6" )
set( OACC_Fortran_FLAGS "${OACC_Fortran_FLAGS} -Mconcur=levels:6" )
set( OACC_Fortran_FLAGS "${OACC_Fortran_FLAGS} -Minfo=accel" )

####################################################################
# COMMON FLAGS
####################################################################

set(ECBUILD_Fortran_FLAGS "${OACC_Fortran_FLAGS} -fpic")
set(ECBUILD_Fortran_FLAGS "${ECBUILD_Fortran_FLAGS} -Mframe")
set(ECBUILD_Fortran_FLAGS "${ECBUILD_Fortran_FLAGS} -Mbyteswapio")
set(ECBUILD_Fortran_FLAGS "${ECBUILD_Fortran_FLAGS} -Mstack_arrays")
set(ECBUILD_Fortran_FLAGS "${ECBUILD_Fortran_FLAGS} -Mrecursive")
set(ECBUILD_Fortran_FLAGS "${ECBUILD_Fortran_FLAGS} -Ktrap=fp")
set(ECBUILD_Fortran_FLAGS "${ECBUILD_Fortran_FLAGS} -Kieee")
set(ECBUILD_Fortran_FLAGS "${ECBUILD_Fortran_FLAGS} -Mdaz")

set( ECBUILD_Fortran_FLAGS_BIT "-O2 -gopt" )

set( ECBUILD_C_FLAGS "-O2 -gopt ${OMP_C_FLAGS} -traceback" )

set( ECBUILD_CXX_FLAGS "-O2 -gopt ${OMP_CXX_FLAGS}" )

# Fix for C++ template headers needed for Serialbox
set( GNU_HEADER_INCLUDE "-I/usr/local/apps/gcc/7.3.0/lib/gcc/x86_64-linux-gnu/7.3.0/include-fixed" )
set( ECBUILD_CXX_FLAGS "${ECBUILD_CXX_FLAGS} ${GNU_HEADER_INCLUDE}" )

####################################################################
# LINK FLAGS
####################################################################

set( ECBUILD_SHARED_LINKER_FLAGS "-Wl,--as-needed" )
set( ECBUILD_EXE_LINKER_FLAGS    "-Wl,--as-needed" )