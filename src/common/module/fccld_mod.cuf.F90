! (C) Copyright 1988- ECMWF.
!
! This software is licensed under the terms of the Apache Licence Version 2.0
! which can be obtained at http://www.apache.org/licenses/LICENSE-2.0.
!
! In applying this licence, ECMWF does not waive the privileges and immunities
! granted to it by virtue of its status as an intergovernmental organisation
! nor does it submit to any jurisdiction.


MODULE FCCLD_CUF_MOD
  !*
  !     ------------------------------------------------------------------
  !     This COMDECK defines functions to be used in the cloud scheme
  !       other than the standard saturation vapour pressure
  !
  !       FKOOP modifies the ice saturation mixing ratio for homogeneous 
  !       nucleation
  !
  !     note: PTARE is temperature and is definited in frttre.h 
  !           which MUST be included before this function block
  !
  !     **********************************************
  !     KOOP formula for homogeneous nucleation of ice 
  !     **********************************************
  !
  !               INPUT : PTARE = TEMPERATURE 
  USE PARKIND1,       ONLY : JPIM, JPRB
  USE YOETHF_CUF,     RKOOP1=>RKOOP1_D, RKOOP2=>RKOOP2_D
  USE FCTTRE_CUF_MOD, ONLY : FOEELIQ, FOEEICE

  IMPLICIT NONE
  CONTAINS

  ATTRIBUTES(DEVICE)  PURE ELEMENTAL FUNCTION FOKOOP(PTARE)
    REAL(KIND=JPRB) :: FOKOOP
    REAL(KIND=JPRB), VALUE :: PTARE

    FOKOOP = MIN(RKOOP1-RKOOP2*PTARE,FOEELIQ(PTARE)/FOEEICE(PTARE))
  END FUNCTION FOKOOP

END MODULE FCCLD_CUF_MOD
