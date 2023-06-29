!   
!    Outputting ExaTensor-based Fortran code generated with :
!      Codegen, a toolset to process tensor contraction DSLs (SIAL etc)
!      Andre Gomes (CNRS UMR8523, Lille) and Dmitry Lyakh (OLCF/Oak Ridge, NVIDIA)
!   
subroutine generic_exatensor_codegen_call(nocc_id,nvir_id,nocc_root,nvir_root, &
    H24, &
    S43, &
    H15, &
    S44, &
    H2, &
    H1, &
    H17, &
    H18, &
    H25, &
    H16, &
    S45, &
    H5, &
    H3, &
    H19, &
    H4, &
    H26, &
    Z52, &
    Z53, &
    Z54, &
    Z55)


    use exatensor
    use, intrinsic:: ISO_C_BINDING


    implicit none


    complex(8), parameter :: ZERO=(0.D0,0.D0),ONE_HALF=(0.5D0,0.D0), &
                             MINUS_ONE=(-1.D0,0.D0),ONE=(1.0D0,0.D0), MINUS_ONE_HALF=(-0.5D0,0.D0), &
                             MINUS_ONE_QUARTER=(-0.25D0,0.D0), ONE_QUARTER=(0.25D0,0.D0), &
                             MINUS_ONE_EIGHT=(-0.125D0,0.D0)


    integer :: ierr
    type(tens_rcrsv_t) :: one_tensor
    integer(INTD), intent(in) :: nocc_id
    integer(INTD), intent(in) :: nvir_id
    integer(INTL), intent(in) :: nocc_root
    integer(INTL), intent(in) :: nvir_root
    integer(INTD), allocatable :: tens_id(:)
    integer(INTL), allocatable :: tens_root(:)
    type(tens_rcrsv_t), intent(inout) :: H24    !       OOVV
    type(tens_rcrsv_t), intent(inout) :: S43    !       VO
    type(tens_rcrsv_t), intent(inout) :: H15    !       OV
    type(tens_rcrsv_t), intent(inout) :: S44    !       VVOO
    type(tens_rcrsv_t), intent(inout) :: H2    !       VO
    type(tens_rcrsv_t), intent(inout) :: H1    !       VV
    type(tens_rcrsv_t), intent(inout) :: H17    !       VOVV
    type(tens_rcrsv_t), intent(inout) :: H18    !       VOOV
    type(tens_rcrsv_t), intent(inout) :: H25    !       OOOV
    type(tens_rcrsv_t), intent(inout) :: H16    !       OO
    type(tens_rcrsv_t), intent(inout) :: S45    !       VVVOOO
    type(tens_rcrsv_t), intent(inout) :: H5    !       VVOO
    type(tens_rcrsv_t), intent(inout) :: H3    !       VVVV
    type(tens_rcrsv_t), intent(inout) :: H19    !       VOOO
    type(tens_rcrsv_t), intent(inout) :: H4    !       VVOV
    type(tens_rcrsv_t), intent(inout) :: H26    !       OOOO
    type(tens_rcrsv_t), intent(inout) :: Z52    !       UnitTensor
    type(tens_rcrsv_t), intent(inout) :: Z53    !       VO
    type(tens_rcrsv_t), intent(inout) :: Z54    !       VVOO
    type(tens_rcrsv_t), intent(inout) :: Z55    !       VVVOOO
    type(tens_rcrsv_t) :: Z65_1    !       OV
    type(tens_rcrsv_t) :: Z64_1    !       OO
    type(tens_rcrsv_t) :: Z65_2    !       OV
    type(tens_rcrsv_t) :: Z62_1    !       VV
    type(tens_rcrsv_t) :: Z93_1    !       OOOV
    type(tens_rcrsv_t) :: Z71_1    !       VOOO
    type(tens_rcrsv_t) :: Z91_2    !       OOOO
    type(tens_rcrsv_t) :: Z110_3    !       OOOV
    type(tens_rcrsv_t) :: Z100_2    !       VOOV
    type(tens_rcrsv_t) :: Z110_2    !       OOOV
    type(tens_rcrsv_t) :: Z78_1    !       VVOV
    type(tens_rcrsv_t) :: Z66_1    !       OOOO
    type(tens_rcrsv_t) :: Z93_2    !       OOOV
    type(tens_rcrsv_t) :: Z100_1    !       VOOV
    type(tens_rcrsv_t) :: Z76_1    !       VVOOOO
    type(tens_rcrsv_t) :: Z98_2    !       VOOOOO
    type(tens_rcrsv_t) :: Z72_1    !       VOOOOO


! always define one_tensor to use in additions via calls to contraction
    ierr=exatns_tensor_create(one_tensor,"autokern_one_tensor",EXA_DATA_KIND_C8)
    ierr=exatns_tensor_init(one_tensor,ONE)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nvir_id/)
    tens_root = (/nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z65_1,"Z65_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z65_1,'ZERO')
!   original expression: Z65_1(l1b|d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|l2b)*0.5
    ierr=exatns_tensor_contract("Z65_1(l1,d1)+=H24(l1,l2,d1,d2)*S43(d2,l2)", &
        Z65_1,H24,S43,prefactor=(0.5d0,0.0d0))
!   original expression: Z52(|)+=S43(d1b|l1b)*Z65_1(l1b|d1b)
    ierr=exatns_tensor_contract("Z52()+=S43(d1,l1)*Z65_1(l1,d1)", &
        Z52,S43,Z65_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z65_1)
!   original expression: Z52(|)+=S43(d1b|l1b)*H15(l1b|d1b)
    ierr=exatns_tensor_contract("Z52()+=S43(d1,l1)*H15(l1,d1)", &
        Z52,S43,H15,prefactor=(1.0d0,0.0d0))
!   original expression: Z52(|)+=S44(d1bd2b|l1bl2b)*H24(l1bl2b|d1bd2b)
    ierr=exatns_tensor_contract("Z52()+=S44(d1,d2,l1,l2)*H24(l1,l2,d1,d2)", &
        Z52,S44,H24,prefactor=(0.25d0,0.0d0))
!   original expression: Z53(e1b|m1b)+=H2(e1b|m1b)
    ierr=exatns_tensor_contract("Z53(e1,m1)+=H2(e1,m1)*K()", &
        Z53,H2,one_tensor,prefactor=(1.0d0,0.0d0))
!   original expression: Z53(e1b|m1b)+=H1(e1b|d1b)*S43(d1b|m1b)
    ierr=exatns_tensor_contract("Z53(e1,m1)+=H1(e1,d1)*S43(d1,m1)", &
        Z53,H1,S43,prefactor=(1.0d0,0.0d0))
!   original expression: Z53(e1b|m1b)+=H17(e1b,l1b|d1bd2b)*S44(d1bd2b|m1b,l1b)
    ierr=exatns_tensor_contract("Z53(e1,m1)+=H17(e1,l1,d1,d2)*S44(d1,d2,m1,l1)", &
        Z53,H17,S44,prefactor=(0.5d0,0.0d0))
!   original expression: Z53(e1b|m1b)+=H18(e1b,l1b|m1b,d1b)*S43(d1b|l1b)
    ierr=exatns_tensor_contract("Z53(e1,m1)+=H18(e1,l1,m1,d1)*S43(d1,l1)", &
        Z53,H18,S43,prefactor=(1.0d0,0.0d0))
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z64_1,"Z64_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z64_1,'ZERO')
!   original expression: Z64_1(l1b|m1b)+=H25(l1b,l2b|m1b,d1b)*S43(d1b|l2b)*-1.
    ierr=exatns_tensor_contract("Z64_1(l1,m1)+=H25(l1,l2,m1,d1)*S43(d1,l2)", &
        Z64_1,H25,S43,prefactor=(-1.0d0,0.0d0))
!   original expression: Z53(e1b|m1b)+=S43(e1b|l1b)*Z64_1(l1b|m1b)
    ierr=exatns_tensor_contract("Z53(e1,m1)+=S43(e1,l1)*Z64_1(l1,m1)", &
        Z53,S43,Z64_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z64_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z64_1,"Z64_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z64_1,'ZERO')
!   original expression: Z53(e1b|m1b)+=S43(e1b|l1b)*Z64_1(l1b|m1b)
    ierr=exatns_tensor_contract("Z53(e1,m1)+=S43(e1,l1)*Z64_1(l1,m1)", &
        Z53,S43,Z64_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z64_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nvir_id/)
    tens_root = (/nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z65_2,"Z65_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z65_2,'ZERO')
!   original expression: Z65_2(l1b|d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|l2b)*-1.
    ierr=exatns_tensor_contract("Z65_2(l1,d1)+=H24(l1,l2,d1,d2)*S43(d2,l2)", &
        Z65_2,H24,S43,prefactor=(-1.0d0,0.0d0))
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z64_1,"Z64_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z64_1,'ZERO')
!   original expression: Z64_1(l1b|m1b)+=S43(d1b|m1b)*Z65_2(l1b|d1b)
    ierr=exatns_tensor_contract("Z64_1(l1,m1)+=S43(d1,m1)*Z65_2(l1,d1)", &
        Z64_1,S43,Z65_2,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z65_2)
!   original expression: Z53(e1b|m1b)+=S43(e1b|l1b)*Z64_1(l1b|m1b)
    ierr=exatns_tensor_contract("Z53(e1,m1)+=S43(e1,l1)*Z64_1(l1,m1)", &
        Z53,S43,Z64_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z64_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nvir_id/)
    tens_root = (/nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z65_2,"Z65_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z65_2,'ZERO')
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z64_1,"Z64_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z64_1,'ZERO')
!   original expression: Z64_1(l1b|m1b)+=S43(d1b|m1b)*Z65_2(l1b|d1b)
    ierr=exatns_tensor_contract("Z64_1(l1,m1)+=S43(d1,m1)*Z65_2(l1,d1)", &
        Z64_1,S43,Z65_2,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z65_2)
!   original expression: Z53(e1b|m1b)+=S43(e1b|l1b)*Z64_1(l1b|m1b)
    ierr=exatns_tensor_contract("Z53(e1,m1)+=S43(e1,l1)*Z64_1(l1,m1)", &
        Z53,S43,Z64_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z64_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z64_1,"Z64_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z64_1,'ZERO')
!   original expression: Z64_1(l1b|m1b)+=S43(d1b|m1b)*H15(l1b|d1b)*-1.
    ierr=exatns_tensor_contract("Z64_1(l1,m1)+=S43(d1,m1)*H15(l1,d1)", &
        Z64_1,S43,H15,prefactor=(-1.0d0,0.0d0))
!   original expression: Z53(e1b|m1b)+=S43(e1b|l1b)*Z64_1(l1b|m1b)
    ierr=exatns_tensor_contract("Z53(e1,m1)+=S43(e1,l1)*Z64_1(l1,m1)", &
        Z53,S43,Z64_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z64_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z64_1,"Z64_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z64_1,'ZERO')
!   original expression: Z64_1(l1b|m1b)+=S44(d1bd2b|m1b,l2b)*H24(l1b,l2b|d1bd2b)*-1.
    ierr=exatns_tensor_contract("Z64_1(l1,m1)+=S44(d1,d2,m1,l2)*H24(l1,l2,d1,d2)", &
        Z64_1,S44,H24,prefactor=(-0.5d0,0.0d0))
!   original expression: Z53(e1b|m1b)+=S43(e1b|l1b)*Z64_1(l1b|m1b)
    ierr=exatns_tensor_contract("Z53(e1,m1)+=S43(e1,l1)*Z64_1(l1,m1)", &
        Z53,S43,Z64_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z64_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z64_1,"Z64_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z64_1,'ZERO')
!   original expression: Z53(e1b|m1b)+=S43(e1b|l1b)*Z64_1(l1b|m1b)
    ierr=exatns_tensor_contract("Z53(e1,m1)+=S43(e1,l1)*Z64_1(l1,m1)", &
        Z53,S43,Z64_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z64_1)
!   original expression: Z53(e1b|m1b)+=S43(e1b|l1b)*H16(l1b|m1b)*-1.
    ierr=exatns_tensor_contract("Z53(e1,m1)+=S43(e1,l1)*H16(l1,m1)", &
        Z53,S43,H16,prefactor=(-1.0d0,0.0d0))
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nvir_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root/)
    ierr=exatns_tensor_create(Z62_1,"Z62_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z62_1,'ZERO')
!   original expression: Z62_1(e1b|d1b)+=H17(e1b,l1b|d1b,d2b)*S43(d2b|l1b)
    ierr=exatns_tensor_contract("Z62_1(e1,d1)+=H17(e1,l1,d1,d2)*S43(d2,l1)", &
        Z62_1,H17,S43,prefactor=(1.0d0,0.0d0))
!   original expression: Z53(e1b|m1b)+=S43(d1b|m1b)*Z62_1(e1b|d1b)
    ierr=exatns_tensor_contract("Z53(e1,m1)+=S43(d1,m1)*Z62_1(e1,d1)", &
        Z53,S43,Z62_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z62_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nvir_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root/)
    ierr=exatns_tensor_create(Z62_1,"Z62_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z62_1,'ZERO')
!   original expression: Z53(e1b|m1b)+=S43(d1b|m1b)*Z62_1(e1b|d1b)
    ierr=exatns_tensor_contract("Z53(e1,m1)+=S43(d1,m1)*Z62_1(e1,d1)", &
        Z53,S43,Z62_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z62_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z93_1,"Z93_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z93_1,'ZERO')
!   original expression: Z93_1(l1bl2b|m1b,d1b)+=H24(l1bl2b|d1b,d2b)*S43(d2b|m1b)
    ierr=exatns_tensor_contract("Z93_1(l1,l2,m1,d1)+=H24(l1,l2,d1,d2)*S43(d2,m1)", &
        Z93_1,H24,S43,prefactor=(1.0d0,0.0d0))
!   original expression: Z53(e1b|m1b)+=S44(e1b,d1b|l1bl2b)*Z93_1(l1bl2b|m1b,d1b)
    ierr=exatns_tensor_contract("Z53(e1,m1)+=S44(e1,d1,l1,l2)*Z93_1(l1,l2,m1,d1)", &
        Z53,S44,Z93_1,prefactor=(0.5d0,0.0d0))
    ierr=exatns_tensor_destroy(Z93_1)
!   original expression: Z53(e1b|m1b)+=S44(e1b,d1b|l1bl2b)*H25(l1bl2b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z53(e1,m1)+=S44(e1,d1,l1,l2)*H25(l1,l2,m1,d1)", &
        Z53,S44,H25,prefactor=(-0.5d0,0.0d0))
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nvir_id/)
    tens_root = (/nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z65_1,"Z65_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z65_1,'ZERO')
!   original expression: Z65_1(l1b|d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|l2b)
    ierr=exatns_tensor_contract("Z65_1(l1,d1)+=H24(l1,l2,d1,d2)*S43(d2,l2)", &
        Z65_1,H24,S43,prefactor=(1.0d0,0.0d0))
!   original expression: Z53(e1b|m1b)+=S44(e1b,d1b|m1b,l1b)*Z65_1(l1b|d1b)
    ierr=exatns_tensor_contract("Z53(e1,m1)+=S44(e1,d1,m1,l1)*Z65_1(l1,d1)", &
        Z53,S44,Z65_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z65_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nvir_id/)
    tens_root = (/nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z65_1,"Z65_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z65_1,'ZERO')
!   original expression: Z53(e1b|m1b)+=S44(e1b,d1b|m1b,l1b)*Z65_1(l1b|d1b)
    ierr=exatns_tensor_contract("Z53(e1,m1)+=S44(e1,d1,m1,l1)*Z65_1(l1,d1)", &
        Z53,S44,Z65_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z65_1)
!   original expression: Z53(e1b|m1b)+=S44(e1b,d1b|m1b,l1b)*H15(l1b|d1b)
    ierr=exatns_tensor_contract("Z53(e1,m1)+=S44(e1,d1,m1,l1)*H15(l1,d1)", &
        Z53,S44,H15,prefactor=(1.0d0,0.0d0))
!   original expression: Z53(e1b|m1b)+=S45(e1b,d1bd2b|m1b,l1bl2b)*H24(l1bl2b|d1bd2b)
    ierr=exatns_tensor_contract("Z53(e1,m1)+=S45(e1,d1,d2,m1,l1,l2)*H24(l1,l2,d1,d2)", &
        Z53,S45,H24,prefactor=(0.25d0,0.0d0))
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nvir_id/)
    tens_root = (/nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z65_1,"Z65_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z65_1,'ZERO')
!   original expression: Z65_1(l1b|d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|l2b)
    ierr=exatns_tensor_contract("Z65_1(l1,d1)+=H24(l1,l2,d1,d2)*S43(d2,l2)", &
        Z65_1,H24,S43,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z65_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nvir_id/)
    tens_root = (/nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z65_1,"Z65_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z65_1,'ZERO')
    ierr=exatns_tensor_destroy(Z65_1)
!   original expression: Z54(e1be2b|m1bm2b)+=H5(e1be2b|m1bm2b)
    ierr=exatns_tensor_contract("Z54(e1,e2,m1,m2)+=H5(e1,e2,m1,m2)*K()", &
        Z54,H5,one_tensor,prefactor=(1.0d0,0.0d0))
!   original expression: Z54(e1be2b|m1bm2b)+=H3(e1be2b|d1bd2b)*S44(d1bd2b|m1bm2b)
    ierr=exatns_tensor_contract("Z54(e1,e2,m1,m2)+=H3(e1,e2,d1,d2)*S44(d1,d2,m1,m2)", &
        Z54,H3,S44,prefactor=(0.5d0,0.0d0))
!   original expression: Z54(e1be2b|m1bm2b)+=H19(e1b,l1b|m1bm2b)*S43(e2b|l1b)*-1.
    ierr=exatns_tensor_contract("Z54(e1,e2,m1,m2)+=H19(e1,l1,m1,m2)*S43(e2,l1)", &
        Z54,H19,S43,prefactor=(-1.0d0,0.0d0))
!   original expression: Z54(e1be2b|m1bm2b)+=H19(e2b,l1b|m1bm2b)*S43(e1b|l1b)
    ierr=exatns_tensor_contract("Z54(e1,e2,m1,m2)+=H19(e2,l1,m1,m2)*S43(e1,l1)", &
        Z54,H19,S43,prefactor=(1.0d0,0.0d0))
!   original expression: Z54(e1be2b|m1bm2b)+=H4(e1be2b|m1b,d1b)*S43(d1b|m2b)
    ierr=exatns_tensor_contract("Z54(e1,e2,m1,m2)+=H4(e1,e2,m1,d1)*S43(d1,m2)", &
        Z54,H4,S43,prefactor=(1.0d0,0.0d0))
!   original expression: Z54(e1be2b|m1bm2b)+=H4(e1be2b|m2b,d1b)*S43(d1b|m1b)*-1.
    ierr=exatns_tensor_contract("Z54(e1,e2,m1,m2)+=H4(e1,e2,m2,d1)*S43(d1,m1)", &
        Z54,H4,S43,prefactor=(-1.0d0,0.0d0))
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z71_1,"Z71_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z71_1,'ZERO')
!   original expression: Z71_1(e1b,l1b|m1bm2b)+=H17(e1b,l1b|d1bd2b)*S44(d1bd2b|m1bm2b)
    ierr=exatns_tensor_contract("Z71_1(e1,l1,m1,m2)+=H17(e1,l1,d1,d2)*S44(d1,d2,m1,m2)", &
        Z71_1,H17,S44,prefactor=(0.5d0,0.0d0))
!   original expression: Z54(e1be2b|m1bm2b)+=S43(e1b|l1b)*Z71_1(e2b,l1b|m1bm2b)
    ierr=exatns_tensor_contract("Z54(e1,e2,m1,m2)+=S43(e1,l1)*Z71_1(e2,l1,m1,m2)", &
        Z54,S43,Z71_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z54(e1be2b|m1bm2b)+=S43(e2b|l1b)*Z71_1(e1b,l1b|m1bm2b)*-1.
    ierr=exatns_tensor_contract("Z54(e1,e2,m1,m2)+=S43(e2,l1)*Z71_1(e1,l1,m1,m2)", &
        Z54,S43,Z71_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z71_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z71_1,"Z71_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z71_1,'ZERO')
!   original expression: Z71_1(e1b,l1b|m1bm2b)+=H26(l1b,l2b|m1bm2b)*S43(e1b|l2b)*0.5
    ierr=exatns_tensor_contract("Z71_1(e1,l1,m1,m2)+=H26(l1,l2,m1,m2)*S43(e1,l2)", &
        Z71_1,H26,S43,prefactor=(0.5d0,0.0d0))
!   original expression: Z54(e1be2b|m1bm2b)+=S43(e1b|l1b)*Z71_1(e2b,l1b|m1bm2b)
    ierr=exatns_tensor_contract("Z54(e1,e2,m1,m2)+=S43(e1,l1)*Z71_1(e2,l1,m1,m2)", &
        Z54,S43,Z71_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z54(e1be2b|m1bm2b)+=S43(e2b|l1b)*Z71_1(e1b,l1b|m1bm2b)*-1.
    ierr=exatns_tensor_contract("Z54(e1,e2,m1,m2)+=S43(e2,l1)*Z71_1(e1,l1,m1,m2)", &
        Z54,S43,Z71_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z71_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z71_1,"Z71_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z71_1,'ZERO')
!   original expression: Z71_1(e1b,l1b|m1bm2b)+=H18(e1b,l1b|m1b,d1b)*S43(d1b|m2b)
    ierr=exatns_tensor_contract("Z71_1(e1,l1,m1,m2)+=H18(e1,l1,m1,d1)*S43(d1,m2)", &
        Z71_1,H18,S43,prefactor=(1.0d0,0.0d0))
!   original expression: Z71_1(e1b,l1b|m1bm2b)+=H18(e1b,l1b|m2b,d1b)*S43(d1b|m1b)*-1.
    ierr=exatns_tensor_contract("Z71_1(e1,l1,m1,m2)+=H18(e1,l1,m2,d1)*S43(d1,m1)", &
        Z71_1,H18,S43,prefactor=(-1.0d0,0.0d0))
!   original expression: Z54(e1be2b|m1bm2b)+=S43(e1b|l1b)*Z71_1(e2b,l1b|m1bm2b)
    ierr=exatns_tensor_contract("Z54(e1,e2,m1,m2)+=S43(e1,l1)*Z71_1(e2,l1,m1,m2)", &
        Z54,S43,Z71_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z54(e1be2b|m1bm2b)+=S43(e2b|l1b)*Z71_1(e1b,l1b|m1bm2b)*-1.
    ierr=exatns_tensor_contract("Z54(e1,e2,m1,m2)+=S43(e2,l1)*Z71_1(e1,l1,m1,m2)", &
        Z54,S43,Z71_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z71_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z91_2,"Z91_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z91_2,'ZERO')
!   original expression: Z91_2(l1b,l2b|m1bm2b)+=H24(l1b,l2b|d1bd2b)*S44(d1bd2b|m1bm2b)*0.5
    ierr=exatns_tensor_contract("Z91_2(l1,l2,m1,m2)+=H24(l1,l2,d1,d2)*S44(d1,d2,m1,m2)", &
        Z91_2,H24,S44,prefactor=(0.25d0,0.0d0))
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z71_1,"Z71_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z71_1,'ZERO')
!   original expression: Z71_1(e1b,l1b|m1bm2b)+=S43(e1b|l2b)*Z91_2(l1b,l2b|m1bm2b)
    ierr=exatns_tensor_contract("Z71_1(e1,l1,m1,m2)+=S43(e1,l2)*Z91_2(l1,l2,m1,m2)", &
        Z71_1,S43,Z91_2,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z91_2)
!   original expression: Z54(e1be2b|m1bm2b)+=S43(e1b|l1b)*Z71_1(e2b,l1b|m1bm2b)
    ierr=exatns_tensor_contract("Z54(e1,e2,m1,m2)+=S43(e1,l1)*Z71_1(e2,l1,m1,m2)", &
        Z54,S43,Z71_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z54(e1be2b|m1bm2b)+=S43(e2b|l1b)*Z71_1(e1b,l1b|m1bm2b)*-1.
    ierr=exatns_tensor_contract("Z54(e1,e2,m1,m2)+=S43(e2,l1)*Z71_1(e1,l1,m1,m2)", &
        Z54,S43,Z71_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z71_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z91_2,"Z91_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z91_2,'ZERO')
!   original expression: Z91_2(l1b,l2b|m1bm2b)+=H25(l1b,l2b|m1b,d1b)*S43(d1b|m2b)*0.5
    ierr=exatns_tensor_contract("Z91_2(l1,l2,m1,m2)+=H25(l1,l2,m1,d1)*S43(d1,m2)", &
        Z91_2,H25,S43,prefactor=(0.5d0,0.0d0))
!   original expression: Z91_2(l1b,l2b|m1bm2b)+=H25(l1b,l2b|m2b,d1b)*S43(d1b|m1b)*-0.5
    ierr=exatns_tensor_contract("Z91_2(l1,l2,m1,m2)+=H25(l1,l2,m2,d1)*S43(d1,m1)", &
        Z91_2,H25,S43,prefactor=(-0.5d0,0.0d0))
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z71_1,"Z71_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z71_1,'ZERO')
!   original expression: Z71_1(e1b,l1b|m1bm2b)+=S43(e1b|l2b)*Z91_2(l1b,l2b|m1bm2b)
    ierr=exatns_tensor_contract("Z71_1(e1,l1,m1,m2)+=S43(e1,l2)*Z91_2(l1,l2,m1,m2)", &
        Z71_1,S43,Z91_2,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z91_2)
!   original expression: Z54(e1be2b|m1bm2b)+=S43(e1b|l1b)*Z71_1(e2b,l1b|m1bm2b)
    ierr=exatns_tensor_contract("Z54(e1,e2,m1,m2)+=S43(e1,l1)*Z71_1(e2,l1,m1,m2)", &
        Z54,S43,Z71_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z54(e1be2b|m1bm2b)+=S43(e2b|l1b)*Z71_1(e1b,l1b|m1bm2b)*-1.
    ierr=exatns_tensor_contract("Z54(e1,e2,m1,m2)+=S43(e2,l1)*Z71_1(e1,l1,m1,m2)", &
        Z54,S43,Z71_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z71_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z110_3,"Z110_3",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z110_3,'ZERO')
!   original expression: Z110_3(l1b,l2b|m1b,d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|m1b)*0.25
    ierr=exatns_tensor_contract("Z110_3(l1,l2,m1,d1)+=H24(l1,l2,d1,d2)*S43(d2,m1)", &
        Z110_3,H24,S43,prefactor=(0.25d0,0.0d0))
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z91_2,"Z91_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z91_2,'ZERO')
!   original expression: Z91_2(l1b,l2b|m1bm2b)+=S43(d1b|m1b)*Z110_3(l1b,l2b|m2b,d1b)
    ierr=exatns_tensor_contract("Z91_2(l1,l2,m1,m2)+=S43(d1,m1)*Z110_3(l1,l2,m2,d1)", &
        Z91_2,S43,Z110_3,prefactor=(1.0d0,0.0d0))
!   original expression: Z91_2(l1b,l2b|m1bm2b)+=S43(d1b|m2b)*Z110_3(l1b,l2b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z91_2(l1,l2,m1,m2)+=S43(d1,m2)*Z110_3(l1,l2,m1,d1)", &
        Z91_2,S43,Z110_3,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z110_3)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z71_1,"Z71_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z71_1,'ZERO')
!   original expression: Z71_1(e1b,l1b|m1bm2b)+=S43(e1b|l2b)*Z91_2(l1b,l2b|m1bm2b)
    ierr=exatns_tensor_contract("Z71_1(e1,l1,m1,m2)+=S43(e1,l2)*Z91_2(l1,l2,m1,m2)", &
        Z71_1,S43,Z91_2,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z91_2)
!   original expression: Z54(e1be2b|m1bm2b)+=S43(e1b|l1b)*Z71_1(e2b,l1b|m1bm2b)
    ierr=exatns_tensor_contract("Z54(e1,e2,m1,m2)+=S43(e1,l1)*Z71_1(e2,l1,m1,m2)", &
        Z54,S43,Z71_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z54(e1be2b|m1bm2b)+=S43(e2b|l1b)*Z71_1(e1b,l1b|m1bm2b)*-1.
    ierr=exatns_tensor_contract("Z54(e1,e2,m1,m2)+=S43(e2,l1)*Z71_1(e1,l1,m1,m2)", &
        Z54,S43,Z71_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z71_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z100_2,"Z100_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z100_2,'ZERO')
!   original expression: Z100_2(e1b,l1b|m1b,d1b)+=H17(e1b,l1b|d1b,d2b)*S43(d2b|m1b)*0.5
    ierr=exatns_tensor_contract("Z100_2(e1,l1,m1,d1)+=H17(e1,l1,d1,d2)*S43(d2,m1)", &
        Z100_2,H17,S43,prefactor=(0.5d0,0.0d0))
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z71_1,"Z71_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z71_1,'ZERO')
!   original expression: Z71_1(e1b,l1b|m1bm2b)+=S43(d1b|m1b)*Z100_2(e1b,l1b|m2b,d1b)
    ierr=exatns_tensor_contract("Z71_1(e1,l1,m1,m2)+=S43(d1,m1)*Z100_2(e1,l1,m2,d1)", &
        Z71_1,S43,Z100_2,prefactor=(1.0d0,0.0d0))
!   original expression: Z71_1(e1b,l1b|m1bm2b)+=S43(d1b|m2b)*Z100_2(e1b,l1b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z71_1(e1,l1,m1,m2)+=S43(d1,m2)*Z100_2(e1,l1,m1,d1)", &
        Z71_1,S43,Z100_2,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z100_2)
!   original expression: Z54(e1be2b|m1bm2b)+=S43(e1b|l1b)*Z71_1(e2b,l1b|m1bm2b)
    ierr=exatns_tensor_contract("Z54(e1,e2,m1,m2)+=S43(e1,l1)*Z71_1(e2,l1,m1,m2)", &
        Z54,S43,Z71_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z54(e1be2b|m1bm2b)+=S43(e2b|l1b)*Z71_1(e1b,l1b|m1bm2b)*-1.
    ierr=exatns_tensor_contract("Z54(e1,e2,m1,m2)+=S43(e2,l1)*Z71_1(e1,l1,m1,m2)", &
        Z54,S43,Z71_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z71_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nvir_id/)
    tens_root = (/nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z65_2,"Z65_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z65_2,'ZERO')
!   original expression: Z65_2(l1b|d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|l2b)
    ierr=exatns_tensor_contract("Z65_2(l1,d1)+=H24(l1,l2,d1,d2)*S43(d2,l2)", &
        Z65_2,H24,S43,prefactor=(1.0d0,0.0d0))
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z71_1,"Z71_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z71_1,'ZERO')
!   original expression: Z71_1(e1b,l1b|m1bm2b)+=S44(e1b,d1b|m1bm2b)*Z65_2(l1b|d1b)
    ierr=exatns_tensor_contract("Z71_1(e1,l1,m1,m2)+=S44(e1,d1,m1,m2)*Z65_2(l1,d1)", &
        Z71_1,S44,Z65_2,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z65_2)
!   original expression: Z54(e1be2b|m1bm2b)+=S43(e1b|l1b)*Z71_1(e2b,l1b|m1bm2b)
    ierr=exatns_tensor_contract("Z54(e1,e2,m1,m2)+=S43(e1,l1)*Z71_1(e2,l1,m1,m2)", &
        Z54,S43,Z71_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z54(e1be2b|m1bm2b)+=S43(e2b|l1b)*Z71_1(e1b,l1b|m1bm2b)*-1.
    ierr=exatns_tensor_contract("Z54(e1,e2,m1,m2)+=S43(e2,l1)*Z71_1(e1,l1,m1,m2)", &
        Z54,S43,Z71_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z71_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nvir_id/)
    tens_root = (/nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z65_2,"Z65_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z65_2,'ZERO')
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z71_1,"Z71_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z71_1,'ZERO')
!   original expression: Z71_1(e1b,l1b|m1bm2b)+=S44(e1b,d1b|m1bm2b)*Z65_2(l1b|d1b)
    ierr=exatns_tensor_contract("Z71_1(e1,l1,m1,m2)+=S44(e1,d1,m1,m2)*Z65_2(l1,d1)", &
        Z71_1,S44,Z65_2,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z65_2)
!   original expression: Z54(e1be2b|m1bm2b)+=S43(e1b|l1b)*Z71_1(e2b,l1b|m1bm2b)
    ierr=exatns_tensor_contract("Z54(e1,e2,m1,m2)+=S43(e1,l1)*Z71_1(e2,l1,m1,m2)", &
        Z54,S43,Z71_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z54(e1be2b|m1bm2b)+=S43(e2b|l1b)*Z71_1(e1b,l1b|m1bm2b)*-1.
    ierr=exatns_tensor_contract("Z54(e1,e2,m1,m2)+=S43(e2,l1)*Z71_1(e1,l1,m1,m2)", &
        Z54,S43,Z71_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z71_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z71_1,"Z71_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z71_1,'ZERO')
!   original expression: Z71_1(e1b,l1b|m1bm2b)+=S44(e1b,d1b|m1bm2b)*H15(l1b|d1b)
    ierr=exatns_tensor_contract("Z71_1(e1,l1,m1,m2)+=S44(e1,d1,m1,m2)*H15(l1,d1)", &
        Z71_1,S44,H15,prefactor=(1.0d0,0.0d0))
!   original expression: Z54(e1be2b|m1bm2b)+=S43(e1b|l1b)*Z71_1(e2b,l1b|m1bm2b)
    ierr=exatns_tensor_contract("Z54(e1,e2,m1,m2)+=S43(e1,l1)*Z71_1(e2,l1,m1,m2)", &
        Z54,S43,Z71_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z54(e1be2b|m1bm2b)+=S43(e2b|l1b)*Z71_1(e1b,l1b|m1bm2b)*-1.
    ierr=exatns_tensor_contract("Z54(e1,e2,m1,m2)+=S43(e2,l1)*Z71_1(e1,l1,m1,m2)", &
        Z54,S43,Z71_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z71_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z110_2,"Z110_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z110_2,'ZERO')
!   original expression: Z110_2(l1b,l2b|m1b,d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|m1b)*-1.
    ierr=exatns_tensor_contract("Z110_2(l1,l2,m1,d1)+=H24(l1,l2,d1,d2)*S43(d2,m1)", &
        Z110_2,H24,S43,prefactor=(-1.0d0,0.0d0))
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z71_1,"Z71_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z71_1,'ZERO')
!   original expression: Z71_1(e1b,l1b|m1bm2b)+=S44(e1b,d1b|m1b,l2b)*Z110_2(l1b,l2b|m2b,d1b)
    ierr=exatns_tensor_contract("Z71_1(e1,l1,m1,m2)+=S44(e1,d1,m1,l2)*Z110_2(l1,l2,m2,d1)", &
        Z71_1,S44,Z110_2,prefactor=(1.0d0,0.0d0))
!   original expression: Z71_1(e1b,l1b|m1bm2b)+=S44(e1b,d1b|m2b,l2b)*Z110_2(l1b,l2b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z71_1(e1,l1,m1,m2)+=S44(e1,d1,m2,l2)*Z110_2(l1,l2,m1,d1)", &
        Z71_1,S44,Z110_2,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z110_2)
!   original expression: Z54(e1be2b|m1bm2b)+=S43(e1b|l1b)*Z71_1(e2b,l1b|m1bm2b)
    ierr=exatns_tensor_contract("Z54(e1,e2,m1,m2)+=S43(e1,l1)*Z71_1(e2,l1,m1,m2)", &
        Z54,S43,Z71_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z54(e1be2b|m1bm2b)+=S43(e2b|l1b)*Z71_1(e1b,l1b|m1bm2b)*-1.
    ierr=exatns_tensor_contract("Z54(e1,e2,m1,m2)+=S43(e2,l1)*Z71_1(e1,l1,m1,m2)", &
        Z54,S43,Z71_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z71_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z71_1,"Z71_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z71_1,'ZERO')
!   original expression: Z71_1(e1b,l1b|m1bm2b)+=S44(e1b,d1b|m1b,l2b)*H25(l1b,l2b|m2b,d1b)
    ierr=exatns_tensor_contract("Z71_1(e1,l1,m1,m2)+=S44(e1,d1,m1,l2)*H25(l1,l2,m2,d1)", &
        Z71_1,S44,H25,prefactor=(1.0d0,0.0d0))
!   original expression: Z71_1(e1b,l1b|m1bm2b)+=S44(e1b,d1b|m2b,l2b)*H25(l1b,l2b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z71_1(e1,l1,m1,m2)+=S44(e1,d1,m2,l2)*H25(l1,l2,m1,d1)", &
        Z71_1,S44,H25,prefactor=(-1.0d0,0.0d0))
!   original expression: Z54(e1be2b|m1bm2b)+=S43(e1b|l1b)*Z71_1(e2b,l1b|m1bm2b)
    ierr=exatns_tensor_contract("Z54(e1,e2,m1,m2)+=S43(e1,l1)*Z71_1(e2,l1,m1,m2)", &
        Z54,S43,Z71_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z54(e1be2b|m1bm2b)+=S43(e2b|l1b)*Z71_1(e1b,l1b|m1bm2b)*-1.
    ierr=exatns_tensor_contract("Z54(e1,e2,m1,m2)+=S43(e2,l1)*Z71_1(e1,l1,m1,m2)", &
        Z54,S43,Z71_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z71_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z71_1,"Z71_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z71_1,'ZERO')
!   original expression: Z54(e1be2b|m1bm2b)+=S43(e1b|l1b)*Z71_1(e2b,l1b|m1bm2b)
    ierr=exatns_tensor_contract("Z54(e1,e2,m1,m2)+=S43(e1,l1)*Z71_1(e2,l1,m1,m2)", &
        Z54,S43,Z71_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z54(e1be2b|m1bm2b)+=S43(e2b|l1b)*Z71_1(e1b,l1b|m1bm2b)*-1.
    ierr=exatns_tensor_contract("Z54(e1,e2,m1,m2)+=S43(e2,l1)*Z71_1(e1,l1,m1,m2)", &
        Z54,S43,Z71_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z71_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z71_1,"Z71_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z71_1,'ZERO')
!   original expression: Z54(e1be2b|m1bm2b)+=S43(e1b|l1b)*Z71_1(e2b,l1b|m1bm2b)
    ierr=exatns_tensor_contract("Z54(e1,e2,m1,m2)+=S43(e1,l1)*Z71_1(e2,l1,m1,m2)", &
        Z54,S43,Z71_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z54(e1be2b|m1bm2b)+=S43(e2b|l1b)*Z71_1(e1b,l1b|m1bm2b)*-1.
    ierr=exatns_tensor_contract("Z54(e1,e2,m1,m2)+=S43(e2,l1)*Z71_1(e1,l1,m1,m2)", &
        Z54,S43,Z71_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z71_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z71_1,"Z71_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z71_1,'ZERO')
!   original expression: Z71_1(e1b,l1b|m1bm2b)+=S45(e1b,d1bd2b|m1bm2b,l2b)*H24(l1b,l2b|d1bd2b)
    ierr=exatns_tensor_contract("Z71_1(e1,l1,m1,m2)+=S45(e1,d1,d2,m1,m2,l2)*H24(l1,l2,d1,d2)", &
        Z71_1,S45,H24,prefactor=(0.5d0,0.0d0))
!   original expression: Z54(e1be2b|m1bm2b)+=S43(e1b|l1b)*Z71_1(e2b,l1b|m1bm2b)
    ierr=exatns_tensor_contract("Z54(e1,e2,m1,m2)+=S43(e1,l1)*Z71_1(e2,l1,m1,m2)", &
        Z54,S43,Z71_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z54(e1be2b|m1bm2b)+=S43(e2b|l1b)*Z71_1(e1b,l1b|m1bm2b)*-1.
    ierr=exatns_tensor_contract("Z54(e1,e2,m1,m2)+=S43(e2,l1)*Z71_1(e1,l1,m1,m2)", &
        Z54,S43,Z71_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z71_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z71_1,"Z71_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z71_1,'ZERO')
!   original expression: Z54(e1be2b|m1bm2b)+=S43(e1b|l1b)*Z71_1(e2b,l1b|m1bm2b)
    ierr=exatns_tensor_contract("Z54(e1,e2,m1,m2)+=S43(e1,l1)*Z71_1(e2,l1,m1,m2)", &
        Z54,S43,Z71_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z54(e1be2b|m1bm2b)+=S43(e2b|l1b)*Z71_1(e1b,l1b|m1bm2b)*-1.
    ierr=exatns_tensor_contract("Z54(e1,e2,m1,m2)+=S43(e2,l1)*Z71_1(e1,l1,m1,m2)", &
        Z54,S43,Z71_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z71_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nvir_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z78_1,"Z78_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z78_1,'ZERO')
!   original expression: Z78_1(e1be2b|m1b,d1b)+=H3(e1be2b|d1b,d2b)*S43(d2b|m1b)*0.5
    ierr=exatns_tensor_contract("Z78_1(e1,e2,m1,d1)+=H3(e1,e2,d1,d2)*S43(d2,m1)", &
        Z78_1,H3,S43,prefactor=(0.5d0,0.0d0))
!   original expression: Z54(e1be2b|m1bm2b)+=S43(d1b|m1b)*Z78_1(e1be2b|m2b,d1b)
    ierr=exatns_tensor_contract("Z54(e1,e2,m1,m2)+=S43(d1,m1)*Z78_1(e1,e2,m2,d1)", &
        Z54,S43,Z78_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z54(e1be2b|m1bm2b)+=S43(d1b|m2b)*Z78_1(e1be2b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z54(e1,e2,m1,m2)+=S43(d1,m2)*Z78_1(e1,e2,m1,d1)", &
        Z54,S43,Z78_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z78_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z66_1,"Z66_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z66_1,'ZERO')
!   original expression: Z66_1(l1bl2b|m1bm2b)+=H25(l1bl2b|m1b,d1b)*S43(d1b|m2b)
    ierr=exatns_tensor_contract("Z66_1(l1,l2,m1,m2)+=H25(l1,l2,m1,d1)*S43(d1,m2)", &
        Z66_1,H25,S43,prefactor=(1.0d0,0.0d0))
!   original expression: Z66_1(l1bl2b|m1bm2b)+=H25(l1bl2b|m2b,d1b)*S43(d1b|m1b)*-1.
    ierr=exatns_tensor_contract("Z66_1(l1,l2,m1,m2)+=H25(l1,l2,m2,d1)*S43(d1,m1)", &
        Z66_1,H25,S43,prefactor=(-1.0d0,0.0d0))
!   original expression: Z54(e1be2b|m1bm2b)+=S44(e1be2b|l1bl2b)*Z66_1(l1bl2b|m1bm2b)
    ierr=exatns_tensor_contract("Z54(e1,e2,m1,m2)+=S44(e1,e2,l1,l2)*Z66_1(l1,l2,m1,m2)", &
        Z54,S44,Z66_1,prefactor=(0.5d0,0.0d0))
    ierr=exatns_tensor_destroy(Z66_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z93_2,"Z93_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z93_2,'ZERO')
!   original expression: Z93_2(l1bl2b|m1b,d1b)+=H24(l1bl2b|d1b,d2b)*S43(d2b|m1b)*0.5
    ierr=exatns_tensor_contract("Z93_2(l1,l2,m1,d1)+=H24(l1,l2,d1,d2)*S43(d2,m1)", &
        Z93_2,H24,S43,prefactor=(0.5d0,0.0d0))
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z66_1,"Z66_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z66_1,'ZERO')
!   original expression: Z66_1(l1bl2b|m1bm2b)+=S43(d1b|m1b)*Z93_2(l1bl2b|m2b,d1b)
    ierr=exatns_tensor_contract("Z66_1(l1,l2,m1,m2)+=S43(d1,m1)*Z93_2(l1,l2,m2,d1)", &
        Z66_1,S43,Z93_2,prefactor=(1.0d0,0.0d0))
!   original expression: Z66_1(l1bl2b|m1bm2b)+=S43(d1b|m2b)*Z93_2(l1bl2b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z66_1(l1,l2,m1,m2)+=S43(d1,m2)*Z93_2(l1,l2,m1,d1)", &
        Z66_1,S43,Z93_2,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z93_2)
!   original expression: Z54(e1be2b|m1bm2b)+=S44(e1be2b|l1bl2b)*Z66_1(l1bl2b|m1bm2b)
    ierr=exatns_tensor_contract("Z54(e1,e2,m1,m2)+=S44(e1,e2,l1,l2)*Z66_1(l1,l2,m1,m2)", &
        Z54,S44,Z66_1,prefactor=(0.5d0,0.0d0))
    ierr=exatns_tensor_destroy(Z66_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z66_1,"Z66_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z66_1,'ZERO')
!   original expression: Z66_1(l1bl2b|m1bm2b)+=S44(d1bd2b|m1bm2b)*H24(l1bl2b|d1bd2b)
    ierr=exatns_tensor_contract("Z66_1(l1,l2,m1,m2)+=S44(d1,d2,m1,m2)*H24(l1,l2,d1,d2)", &
        Z66_1,S44,H24,prefactor=(0.5d0,0.0d0))
!   original expression: Z54(e1be2b|m1bm2b)+=S44(e1be2b|l1bl2b)*Z66_1(l1bl2b|m1bm2b)
    ierr=exatns_tensor_contract("Z54(e1,e2,m1,m2)+=S44(e1,e2,l1,l2)*Z66_1(l1,l2,m1,m2)", &
        Z54,S44,Z66_1,prefactor=(0.5d0,0.0d0))
    ierr=exatns_tensor_destroy(Z66_1)
!   original expression: Z54(e1be2b|m1bm2b)+=S44(e1be2b|l1bl2b)*H26(l1bl2b|m1bm2b)
    ierr=exatns_tensor_contract("Z54(e1,e2,m1,m2)+=S44(e1,e2,l1,l2)*H26(l1,l2,m1,m2)", &
        Z54,S44,H26,prefactor=(0.5d0,0.0d0))
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nvir_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root/)
    ierr=exatns_tensor_create(Z62_1,"Z62_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z62_1,'ZERO')
!   original expression: Z62_1(e1b|d1b)+=H17(e1b,l1b|d1b,d2b)*S43(d2b|l1b)
    ierr=exatns_tensor_contract("Z62_1(e1,d1)+=H17(e1,l1,d1,d2)*S43(d2,l1)", &
        Z62_1,H17,S43,prefactor=(1.0d0,0.0d0))
!   original expression: Z54(e1be2b|m1bm2b)+=S44(e1b,d1b|m1bm2b)*Z62_1(e2b|d1b)
    ierr=exatns_tensor_contract("Z54(e1,e2,m1,m2)+=S44(e1,d1,m1,m2)*Z62_1(e2,d1)", &
        Z54,S44,Z62_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z54(e1be2b|m1bm2b)+=S44(e2b,d1b|m1bm2b)*Z62_1(e1b|d1b)*-1.
    ierr=exatns_tensor_contract("Z54(e1,e2,m1,m2)+=S44(e2,d1,m1,m2)*Z62_1(e1,d1)", &
        Z54,S44,Z62_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z62_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nvir_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root/)
    ierr=exatns_tensor_create(Z62_1,"Z62_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z62_1,'ZERO')
!   original expression: Z54(e1be2b|m1bm2b)+=S44(e1b,d1b|m1bm2b)*Z62_1(e2b|d1b)
    ierr=exatns_tensor_contract("Z54(e1,e2,m1,m2)+=S44(e1,d1,m1,m2)*Z62_1(e2,d1)", &
        Z54,S44,Z62_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z54(e1be2b|m1bm2b)+=S44(e2b,d1b|m1bm2b)*Z62_1(e1b|d1b)*-1.
    ierr=exatns_tensor_contract("Z54(e1,e2,m1,m2)+=S44(e2,d1,m1,m2)*Z62_1(e1,d1)", &
        Z54,S44,Z62_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z62_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nvir_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root/)
    ierr=exatns_tensor_create(Z62_1,"Z62_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z62_1,'ZERO')
!   original expression: Z62_1(e1b|d1b)+=S44(e1b,d2b|l1bl2b)*H24(l1bl2b|d1b,d2b)*-1.
    ierr=exatns_tensor_contract("Z62_1(e1,d1)+=S44(e1,d2,l1,l2)*H24(l1,l2,d1,d2)", &
        Z62_1,S44,H24,prefactor=(-0.5d0,0.0d0))
!   original expression: Z54(e1be2b|m1bm2b)+=S44(e1b,d1b|m1bm2b)*Z62_1(e2b|d1b)
    ierr=exatns_tensor_contract("Z54(e1,e2,m1,m2)+=S44(e1,d1,m1,m2)*Z62_1(e2,d1)", &
        Z54,S44,Z62_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z54(e1be2b|m1bm2b)+=S44(e2b,d1b|m1bm2b)*Z62_1(e1b|d1b)*-1.
    ierr=exatns_tensor_contract("Z54(e1,e2,m1,m2)+=S44(e2,d1,m1,m2)*Z62_1(e1,d1)", &
        Z54,S44,Z62_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z62_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nvir_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root/)
    ierr=exatns_tensor_create(Z62_1,"Z62_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z62_1,'ZERO')
!   original expression: Z54(e1be2b|m1bm2b)+=S44(e1b,d1b|m1bm2b)*Z62_1(e2b|d1b)
    ierr=exatns_tensor_contract("Z54(e1,e2,m1,m2)+=S44(e1,d1,m1,m2)*Z62_1(e2,d1)", &
        Z54,S44,Z62_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z54(e1be2b|m1bm2b)+=S44(e2b,d1b|m1bm2b)*Z62_1(e1b|d1b)*-1.
    ierr=exatns_tensor_contract("Z54(e1,e2,m1,m2)+=S44(e2,d1,m1,m2)*Z62_1(e1,d1)", &
        Z54,S44,Z62_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z62_1)
!   original expression: Z54(e1be2b|m1bm2b)+=S44(e1b,d1b|m1bm2b)*H1(e2b|d1b)
    ierr=exatns_tensor_contract("Z54(e1,e2,m1,m2)+=S44(e1,d1,m1,m2)*H1(e2,d1)", &
        Z54,S44,H1,prefactor=(1.0d0,0.0d0))
!   original expression: Z54(e1be2b|m1bm2b)+=S44(e2b,d1b|m1bm2b)*H1(e1b|d1b)*-1.
    ierr=exatns_tensor_contract("Z54(e1,e2,m1,m2)+=S44(e2,d1,m1,m2)*H1(e1,d1)", &
        Z54,S44,H1,prefactor=(-1.0d0,0.0d0))
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z64_1,"Z64_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z64_1,'ZERO')
!   original expression: Z64_1(l1b|m1b)+=H25(l1b,l2b|m1b,d1b)*S43(d1b|l2b)*-1.
    ierr=exatns_tensor_contract("Z64_1(l1,m1)+=H25(l1,l2,m1,d1)*S43(d1,l2)", &
        Z64_1,H25,S43,prefactor=(-1.0d0,0.0d0))
!   original expression: Z54(e1be2b|m1bm2b)+=S44(e1be2b|m1b,l1b)*Z64_1(l1b|m2b)
    ierr=exatns_tensor_contract("Z54(e1,e2,m1,m2)+=S44(e1,e2,m1,l1)*Z64_1(l1,m2)", &
        Z54,S44,Z64_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z54(e1be2b|m1bm2b)+=S44(e1be2b|m2b,l1b)*Z64_1(l1b|m1b)*-1.
    ierr=exatns_tensor_contract("Z54(e1,e2,m1,m2)+=S44(e1,e2,m2,l1)*Z64_1(l1,m1)", &
        Z54,S44,Z64_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z64_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z64_1,"Z64_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z64_1,'ZERO')
!   original expression: Z54(e1be2b|m1bm2b)+=S44(e1be2b|m1b,l1b)*Z64_1(l1b|m2b)
    ierr=exatns_tensor_contract("Z54(e1,e2,m1,m2)+=S44(e1,e2,m1,l1)*Z64_1(l1,m2)", &
        Z54,S44,Z64_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z54(e1be2b|m1bm2b)+=S44(e1be2b|m2b,l1b)*Z64_1(l1b|m1b)*-1.
    ierr=exatns_tensor_contract("Z54(e1,e2,m1,m2)+=S44(e1,e2,m2,l1)*Z64_1(l1,m1)", &
        Z54,S44,Z64_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z64_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nvir_id/)
    tens_root = (/nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z65_2,"Z65_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z65_2,'ZERO')
!   original expression: Z65_2(l1b|d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|l2b)*-1.
    ierr=exatns_tensor_contract("Z65_2(l1,d1)+=H24(l1,l2,d1,d2)*S43(d2,l2)", &
        Z65_2,H24,S43,prefactor=(-1.0d0,0.0d0))
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z64_1,"Z64_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z64_1,'ZERO')
!   original expression: Z64_1(l1b|m1b)+=S43(d1b|m1b)*Z65_2(l1b|d1b)
    ierr=exatns_tensor_contract("Z64_1(l1,m1)+=S43(d1,m1)*Z65_2(l1,d1)", &
        Z64_1,S43,Z65_2,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z65_2)
!   original expression: Z54(e1be2b|m1bm2b)+=S44(e1be2b|m1b,l1b)*Z64_1(l1b|m2b)
    ierr=exatns_tensor_contract("Z54(e1,e2,m1,m2)+=S44(e1,e2,m1,l1)*Z64_1(l1,m2)", &
        Z54,S44,Z64_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z54(e1be2b|m1bm2b)+=S44(e1be2b|m2b,l1b)*Z64_1(l1b|m1b)*-1.
    ierr=exatns_tensor_contract("Z54(e1,e2,m1,m2)+=S44(e1,e2,m2,l1)*Z64_1(l1,m1)", &
        Z54,S44,Z64_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z64_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nvir_id/)
    tens_root = (/nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z65_2,"Z65_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z65_2,'ZERO')
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z64_1,"Z64_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z64_1,'ZERO')
!   original expression: Z64_1(l1b|m1b)+=S43(d1b|m1b)*Z65_2(l1b|d1b)
    ierr=exatns_tensor_contract("Z64_1(l1,m1)+=S43(d1,m1)*Z65_2(l1,d1)", &
        Z64_1,S43,Z65_2,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z65_2)
!   original expression: Z54(e1be2b|m1bm2b)+=S44(e1be2b|m1b,l1b)*Z64_1(l1b|m2b)
    ierr=exatns_tensor_contract("Z54(e1,e2,m1,m2)+=S44(e1,e2,m1,l1)*Z64_1(l1,m2)", &
        Z54,S44,Z64_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z54(e1be2b|m1bm2b)+=S44(e1be2b|m2b,l1b)*Z64_1(l1b|m1b)*-1.
    ierr=exatns_tensor_contract("Z54(e1,e2,m1,m2)+=S44(e1,e2,m2,l1)*Z64_1(l1,m1)", &
        Z54,S44,Z64_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z64_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z64_1,"Z64_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z64_1,'ZERO')
!   original expression: Z64_1(l1b|m1b)+=S43(d1b|m1b)*H15(l1b|d1b)*-1.
    ierr=exatns_tensor_contract("Z64_1(l1,m1)+=S43(d1,m1)*H15(l1,d1)", &
        Z64_1,S43,H15,prefactor=(-1.0d0,0.0d0))
!   original expression: Z54(e1be2b|m1bm2b)+=S44(e1be2b|m1b,l1b)*Z64_1(l1b|m2b)
    ierr=exatns_tensor_contract("Z54(e1,e2,m1,m2)+=S44(e1,e2,m1,l1)*Z64_1(l1,m2)", &
        Z54,S44,Z64_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z54(e1be2b|m1bm2b)+=S44(e1be2b|m2b,l1b)*Z64_1(l1b|m1b)*-1.
    ierr=exatns_tensor_contract("Z54(e1,e2,m1,m2)+=S44(e1,e2,m2,l1)*Z64_1(l1,m1)", &
        Z54,S44,Z64_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z64_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z64_1,"Z64_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z64_1,'ZERO')
!   original expression: Z64_1(l1b|m1b)+=S44(d1bd2b|m1b,l2b)*H24(l1b,l2b|d1bd2b)*-1.
    ierr=exatns_tensor_contract("Z64_1(l1,m1)+=S44(d1,d2,m1,l2)*H24(l1,l2,d1,d2)", &
        Z64_1,S44,H24,prefactor=(-0.5d0,0.0d0))
!   original expression: Z54(e1be2b|m1bm2b)+=S44(e1be2b|m1b,l1b)*Z64_1(l1b|m2b)
    ierr=exatns_tensor_contract("Z54(e1,e2,m1,m2)+=S44(e1,e2,m1,l1)*Z64_1(l1,m2)", &
        Z54,S44,Z64_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z54(e1be2b|m1bm2b)+=S44(e1be2b|m2b,l1b)*Z64_1(l1b|m1b)*-1.
    ierr=exatns_tensor_contract("Z54(e1,e2,m1,m2)+=S44(e1,e2,m2,l1)*Z64_1(l1,m1)", &
        Z54,S44,Z64_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z64_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z64_1,"Z64_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z64_1,'ZERO')
!   original expression: Z54(e1be2b|m1bm2b)+=S44(e1be2b|m1b,l1b)*Z64_1(l1b|m2b)
    ierr=exatns_tensor_contract("Z54(e1,e2,m1,m2)+=S44(e1,e2,m1,l1)*Z64_1(l1,m2)", &
        Z54,S44,Z64_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z54(e1be2b|m1bm2b)+=S44(e1be2b|m2b,l1b)*Z64_1(l1b|m1b)*-1.
    ierr=exatns_tensor_contract("Z54(e1,e2,m1,m2)+=S44(e1,e2,m2,l1)*Z64_1(l1,m1)", &
        Z54,S44,Z64_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z64_1)
!   original expression: Z54(e1be2b|m1bm2b)+=S44(e1be2b|m1b,l1b)*H16(l1b|m2b)*-1.
    ierr=exatns_tensor_contract("Z54(e1,e2,m1,m2)+=S44(e1,e2,m1,l1)*H16(l1,m2)", &
        Z54,S44,H16,prefactor=(-1.0d0,0.0d0))
!   original expression: Z54(e1be2b|m1bm2b)+=S44(e1be2b|m2b,l1b)*H16(l1b|m1b)
    ierr=exatns_tensor_contract("Z54(e1,e2,m1,m2)+=S44(e1,e2,m2,l1)*H16(l1,m1)", &
        Z54,S44,H16,prefactor=(1.0d0,0.0d0))
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z100_1,"Z100_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z100_1,'ZERO')
!   original expression: Z100_1(e1b,l1b|m1b,d1b)+=H17(e1b,l1b|d1b,d2b)*S43(d2b|m1b)*-1.
    ierr=exatns_tensor_contract("Z100_1(e1,l1,m1,d1)+=H17(e1,l1,d1,d2)*S43(d2,m1)", &
        Z100_1,H17,S43,prefactor=(-1.0d0,0.0d0))
!   original expression: Z54(e1be2b|m1bm2b)+=S44(e1b,d1b|m1b,l1b)*Z100_1(e2b,l1b|m2b,d1b)
    ierr=exatns_tensor_contract("Z54(e1,e2,m1,m2)+=S44(e1,d1,m1,l1)*Z100_1(e2,l1,m2,d1)", &
        Z54,S44,Z100_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z54(e1be2b|m1bm2b)+=S44(e2b,d1b|m1b,l1b)*Z100_1(e1b,l1b|m2b,d1b)*-1.
    ierr=exatns_tensor_contract("Z54(e1,e2,m1,m2)+=S44(e2,d1,m1,l1)*Z100_1(e1,l1,m2,d1)", &
        Z54,S44,Z100_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z54(e1be2b|m1bm2b)+=S44(e1b,d1b|m2b,l1b)*Z100_1(e2b,l1b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z54(e1,e2,m1,m2)+=S44(e1,d1,m2,l1)*Z100_1(e2,l1,m1,d1)", &
        Z54,S44,Z100_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z54(e1be2b|m1bm2b)+=S44(e2b,d1b|m2b,l1b)*Z100_1(e1b,l1b|m1b,d1b)
    ierr=exatns_tensor_contract("Z54(e1,e2,m1,m2)+=S44(e2,d1,m2,l1)*Z100_1(e1,l1,m1,d1)", &
        Z54,S44,Z100_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z100_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z100_1,"Z100_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z100_1,'ZERO')
!   original expression: Z100_1(e1b,l1b|m1b,d1b)+=S44(e1b,d2b|m1b,l2b)*H24(l1b,l2b|d1b,d2b)*0.5
    ierr=exatns_tensor_contract("Z100_1(e1,l1,m1,d1)+=S44(e1,d2,m1,l2)*H24(l1,l2,d1,d2)", &
        Z100_1,S44,H24,prefactor=(0.5d0,0.0d0))
!   original expression: Z54(e1be2b|m1bm2b)+=S44(e1b,d1b|m1b,l1b)*Z100_1(e2b,l1b|m2b,d1b)
    ierr=exatns_tensor_contract("Z54(e1,e2,m1,m2)+=S44(e1,d1,m1,l1)*Z100_1(e2,l1,m2,d1)", &
        Z54,S44,Z100_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z54(e1be2b|m1bm2b)+=S44(e2b,d1b|m1b,l1b)*Z100_1(e1b,l1b|m2b,d1b)*-1.
    ierr=exatns_tensor_contract("Z54(e1,e2,m1,m2)+=S44(e2,d1,m1,l1)*Z100_1(e1,l1,m2,d1)", &
        Z54,S44,Z100_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z54(e1be2b|m1bm2b)+=S44(e1b,d1b|m2b,l1b)*Z100_1(e2b,l1b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z54(e1,e2,m1,m2)+=S44(e1,d1,m2,l1)*Z100_1(e2,l1,m1,d1)", &
        Z54,S44,Z100_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z54(e1be2b|m1bm2b)+=S44(e2b,d1b|m2b,l1b)*Z100_1(e1b,l1b|m1b,d1b)
    ierr=exatns_tensor_contract("Z54(e1,e2,m1,m2)+=S44(e2,d1,m2,l1)*Z100_1(e1,l1,m1,d1)", &
        Z54,S44,Z100_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z100_1)
!   original expression: Z54(e1be2b|m1bm2b)+=S44(e1b,d1b|m1b,l1b)*H18(e2b,l1b|m2b,d1b)
    ierr=exatns_tensor_contract("Z54(e1,e2,m1,m2)+=S44(e1,d1,m1,l1)*H18(e2,l1,m2,d1)", &
        Z54,S44,H18,prefactor=(1.0d0,0.0d0))
!   original expression: Z54(e1be2b|m1bm2b)+=S44(e2b,d1b|m1b,l1b)*H18(e1b,l1b|m2b,d1b)*-1.
    ierr=exatns_tensor_contract("Z54(e1,e2,m1,m2)+=S44(e2,d1,m1,l1)*H18(e1,l1,m2,d1)", &
        Z54,S44,H18,prefactor=(-1.0d0,0.0d0))
!   original expression: Z54(e1be2b|m1bm2b)+=S44(e1b,d1b|m2b,l1b)*H18(e2b,l1b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z54(e1,e2,m1,m2)+=S44(e1,d1,m2,l1)*H18(e2,l1,m1,d1)", &
        Z54,S44,H18,prefactor=(-1.0d0,0.0d0))
!   original expression: Z54(e1be2b|m1bm2b)+=S44(e2b,d1b|m2b,l1b)*H18(e1b,l1b|m1b,d1b)
    ierr=exatns_tensor_contract("Z54(e1,e2,m1,m2)+=S44(e2,d1,m2,l1)*H18(e1,l1,m1,d1)", &
        Z54,S44,H18,prefactor=(1.0d0,0.0d0))
!   original expression: Z54(e1be2b|m1bm2b)+=S45(e1b,d1bd2b|m1bm2b,l1b)*H17(e2b,l1b|d1bd2b)
    ierr=exatns_tensor_contract("Z54(e1,e2,m1,m2)+=S45(e1,d1,d2,m1,m2,l1)*H17(e2,l1,d1,d2)", &
        Z54,S45,H17,prefactor=(0.5d0,0.0d0))
!   original expression: Z54(e1be2b|m1bm2b)+=S45(e2b,d1bd2b|m1bm2b,l1b)*H17(e1b,l1b|d1bd2b)*-1.
    ierr=exatns_tensor_contract("Z54(e1,e2,m1,m2)+=S45(e2,d1,d2,m1,m2,l1)*H17(e1,l1,d1,d2)", &
        Z54,S45,H17,prefactor=(-0.5d0,0.0d0))
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z93_1,"Z93_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z93_1,'ZERO')
!   original expression: Z93_1(l1bl2b|m1b,d1b)+=H24(l1bl2b|d1b,d2b)*S43(d2b|m1b)
    ierr=exatns_tensor_contract("Z93_1(l1,l2,m1,d1)+=H24(l1,l2,d1,d2)*S43(d2,m1)", &
        Z93_1,H24,S43,prefactor=(1.0d0,0.0d0))
!   original expression: Z54(e1be2b|m1bm2b)+=S45(e1be2b,d1b|m1b,l1bl2b)*Z93_1(l1bl2b|m2b,d1b)
    ierr=exatns_tensor_contract("Z54(e1,e2,m1,m2)+=S45(e1,e2,d1,m1,l1,l2)*Z93_1(l1,l2,m2,d1)", &
        Z54,S45,Z93_1,prefactor=(0.5d0,0.0d0))
!   original expression: Z54(e1be2b|m1bm2b)+=S45(e1be2b,d1b|m2b,l1bl2b)*Z93_1(l1bl2b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z54(e1,e2,m1,m2)+=S45(e1,e2,d1,m2,l1,l2)*Z93_1(l1,l2,m1,d1)", &
        Z54,S45,Z93_1,prefactor=(-0.5d0,0.0d0))
    ierr=exatns_tensor_destroy(Z93_1)
!   original expression: Z54(e1be2b|m1bm2b)+=S45(e1be2b,d1b|m1b,l1bl2b)*H25(l1bl2b|m2b,d1b)*-1.
    ierr=exatns_tensor_contract("Z54(e1,e2,m1,m2)+=S45(e1,e2,d1,m1,l1,l2)*H25(l1,l2,m2,d1)", &
        Z54,S45,H25,prefactor=(-0.5d0,0.0d0))
!   original expression: Z54(e1be2b|m1bm2b)+=S45(e1be2b,d1b|m2b,l1bl2b)*H25(l1bl2b|m1b,d1b)
    ierr=exatns_tensor_contract("Z54(e1,e2,m1,m2)+=S45(e1,e2,d1,m2,l1,l2)*H25(l1,l2,m1,d1)", &
        Z54,S45,H25,prefactor=(0.5d0,0.0d0))
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nvir_id/)
    tens_root = (/nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z65_1,"Z65_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z65_1,'ZERO')
!   original expression: Z65_1(l1b|d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|l2b)
    ierr=exatns_tensor_contract("Z65_1(l1,d1)+=H24(l1,l2,d1,d2)*S43(d2,l2)", &
        Z65_1,H24,S43,prefactor=(1.0d0,0.0d0))
!   original expression: Z54(e1be2b|m1bm2b)+=S45(e1be2b,d1b|m1bm2b,l1b)*Z65_1(l1b|d1b)
    ierr=exatns_tensor_contract("Z54(e1,e2,m1,m2)+=S45(e1,e2,d1,m1,m2,l1)*Z65_1(l1,d1)", &
        Z54,S45,Z65_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z65_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nvir_id/)
    tens_root = (/nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z65_1,"Z65_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z65_1,'ZERO')
!   original expression: Z54(e1be2b|m1bm2b)+=S45(e1be2b,d1b|m1bm2b,l1b)*Z65_1(l1b|d1b)
    ierr=exatns_tensor_contract("Z54(e1,e2,m1,m2)+=S45(e1,e2,d1,m1,m2,l1)*Z65_1(l1,d1)", &
        Z54,S45,Z65_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z65_1)
!   original expression: Z54(e1be2b|m1bm2b)+=S45(e1be2b,d1b|m1bm2b,l1b)*H15(l1b|d1b)
    ierr=exatns_tensor_contract("Z54(e1,e2,m1,m2)+=S45(e1,e2,d1,m1,m2,l1)*H15(l1,d1)", &
        Z54,S45,H15,prefactor=(1.0d0,0.0d0))
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nvir_id/)
    tens_root = (/nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z65_2,"Z65_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z65_2,'ZERO')
!   original expression: Z65_2(l1b|d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|l2b)*-1.
    ierr=exatns_tensor_contract("Z65_2(l1,d1)+=H24(l1,l2,d1,d2)*S43(d2,l2)", &
        Z65_2,H24,S43,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z65_2)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nvir_id/)
    tens_root = (/nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z65_2,"Z65_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z65_2,'ZERO')
    ierr=exatns_tensor_destroy(Z65_2)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z110_2,"Z110_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z110_2,'ZERO')
!   original expression: Z110_2(l1b,l2b|m1b,d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|m1b)
    ierr=exatns_tensor_contract("Z110_2(l1,l2,m1,d1)+=H24(l1,l2,d1,d2)*S43(d2,m1)", &
        Z110_2,H24,S43,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z110_2)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nvir_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root/)
    ierr=exatns_tensor_create(Z62_1,"Z62_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z62_1,'ZERO')
!   original expression: Z62_1(e1b|d1b)+=H17(e1b,l1b|d1b,d2b)*S43(d2b|l1b)
    ierr=exatns_tensor_contract("Z62_1(e1,d1)+=H17(e1,l1,d1,d2)*S43(d2,l1)", &
        Z62_1,H17,S43,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z62_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nvir_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root/)
    ierr=exatns_tensor_create(Z62_1,"Z62_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z62_1,'ZERO')
    ierr=exatns_tensor_destroy(Z62_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nvir_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root/)
    ierr=exatns_tensor_create(Z62_1,"Z62_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z62_1,'ZERO')
!   original expression: Z62_1(e1b|d1b)+=S44(e1b,d2b|l1bl2b)*H24(l1bl2b|d1b,d2b)*-1.
    ierr=exatns_tensor_contract("Z62_1(e1,d1)+=S44(e1,d2,l1,l2)*H24(l1,l2,d1,d2)", &
        Z62_1,S44,H24,prefactor=(-0.5d0,0.0d0))
    ierr=exatns_tensor_destroy(Z62_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nvir_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root/)
    ierr=exatns_tensor_create(Z62_1,"Z62_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z62_1,'ZERO')
    ierr=exatns_tensor_destroy(Z62_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z64_1,"Z64_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z64_1,'ZERO')
!   original expression: Z64_1(l1b|m1b)+=H25(l1b,l2b|m1b,d1b)*S43(d1b|l2b)*-1.
    ierr=exatns_tensor_contract("Z64_1(l1,m1)+=H25(l1,l2,m1,d1)*S43(d1,l2)", &
        Z64_1,H25,S43,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z64_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z64_1,"Z64_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z64_1,'ZERO')
    ierr=exatns_tensor_destroy(Z64_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nvir_id/)
    tens_root = (/nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z65_2,"Z65_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z65_2,'ZERO')
!   original expression: Z65_2(l1b|d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|l2b)*-1.
    ierr=exatns_tensor_contract("Z65_2(l1,d1)+=H24(l1,l2,d1,d2)*S43(d2,l2)", &
        Z65_2,H24,S43,prefactor=(-1.0d0,0.0d0))
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z64_1,"Z64_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z64_1,'ZERO')
!   original expression: Z64_1(l1b|m1b)+=S43(d1b|m1b)*Z65_2(l1b|d1b)
    ierr=exatns_tensor_contract("Z64_1(l1,m1)+=S43(d1,m1)*Z65_2(l1,d1)", &
        Z64_1,S43,Z65_2,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z65_2)
    ierr=exatns_tensor_destroy(Z64_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nvir_id/)
    tens_root = (/nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z65_2,"Z65_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z65_2,'ZERO')
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z64_1,"Z64_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z64_1,'ZERO')
!   original expression: Z64_1(l1b|m1b)+=S43(d1b|m1b)*Z65_2(l1b|d1b)
    ierr=exatns_tensor_contract("Z64_1(l1,m1)+=S43(d1,m1)*Z65_2(l1,d1)", &
        Z64_1,S43,Z65_2,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z65_2)
    ierr=exatns_tensor_destroy(Z64_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z64_1,"Z64_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z64_1,'ZERO')
!   original expression: Z64_1(l1b|m1b)+=S43(d1b|m1b)*H15(l1b|d1b)*-1.
    ierr=exatns_tensor_contract("Z64_1(l1,m1)+=S43(d1,m1)*H15(l1,d1)", &
        Z64_1,S43,H15,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z64_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z64_1,"Z64_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z64_1,'ZERO')
!   original expression: Z64_1(l1b|m1b)+=S44(d1bd2b|m1b,l2b)*H24(l1b,l2b|d1bd2b)*-1.
    ierr=exatns_tensor_contract("Z64_1(l1,m1)+=S44(d1,d2,m1,l2)*H24(l1,l2,d1,d2)", &
        Z64_1,S44,H24,prefactor=(-0.5d0,0.0d0))
    ierr=exatns_tensor_destroy(Z64_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z64_1,"Z64_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z64_1,'ZERO')
    ierr=exatns_tensor_destroy(Z64_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z100_1,"Z100_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z100_1,'ZERO')
!   original expression: Z100_1(e1b,l1b|m1b,d1b)+=H17(e1b,l1b|d1b,d2b)*S43(d2b|m1b)*-1.
    ierr=exatns_tensor_contract("Z100_1(e1,l1,m1,d1)+=H17(e1,l1,d1,d2)*S43(d2,m1)", &
        Z100_1,H17,S43,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z100_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z100_1,"Z100_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z100_1,'ZERO')
!   original expression: Z100_1(e1b,l1b|m1b,d1b)+=S44(e1b,d2b|m1b,l2b)*H24(l1b,l2b|d1b,d2b)
    ierr=exatns_tensor_contract("Z100_1(e1,l1,m1,d1)+=S44(e1,d2,m1,l2)*H24(l1,l2,d1,d2)", &
        Z100_1,S44,H24,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z100_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z93_1,"Z93_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z93_1,'ZERO')
!   original expression: Z93_1(l1bl2b|m1b,d1b)+=H24(l1bl2b|d1b,d2b)*S43(d2b|m1b)
    ierr=exatns_tensor_contract("Z93_1(l1,l2,m1,d1)+=H24(l1,l2,d1,d2)*S43(d2,m1)", &
        Z93_1,H24,S43,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z93_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nvir_id/)
    tens_root = (/nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z65_1,"Z65_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z65_1,'ZERO')
!   original expression: Z65_1(l1b|d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|l2b)
    ierr=exatns_tensor_contract("Z65_1(l1,d1)+=H24(l1,l2,d1,d2)*S43(d2,l2)", &
        Z65_1,H24,S43,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z65_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nvir_id/)
    tens_root = (/nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z65_1,"Z65_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z65_1,'ZERO')
    ierr=exatns_tensor_destroy(Z65_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nvir_id/)
    tens_root = (/nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z65_1,"Z65_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z65_1,'ZERO')
!   original expression: Z65_1(l1b|d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|l2b)
    ierr=exatns_tensor_contract("Z65_1(l1,d1)+=H24(l1,l2,d1,d2)*S43(d2,l2)", &
        Z65_1,H24,S43,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z65_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nvir_id/)
    tens_root = (/nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z65_1,"Z65_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z65_1,'ZERO')
    ierr=exatns_tensor_destroy(Z65_1)
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=H4(e1be2b|m1b,d1b)*S44(e3b,d1b|m2bm3b)*-1.
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=H4(e1,e2,m1,d1)*S44(e3,d1,m2,m3)", &
        Z55,H4,S44,prefactor=(-1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=H4(e1be3b|m1b,d1b)*S44(e2b,d1b|m2bm3b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=H4(e1,e3,m1,d1)*S44(e2,d1,m2,m3)", &
        Z55,H4,S44,prefactor=(1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=H4(e2be3b|m1b,d1b)*S44(e1b,d1b|m2bm3b)*-1.
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=H4(e2,e3,m1,d1)*S44(e1,d1,m2,m3)", &
        Z55,H4,S44,prefactor=(-1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=H4(e1be2b|m2b,d1b)*S44(e3b,d1b|m1bm3b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=H4(e1,e2,m2,d1)*S44(e3,d1,m1,m3)", &
        Z55,H4,S44,prefactor=(1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=H4(e1be3b|m2b,d1b)*S44(e2b,d1b|m1bm3b)*-1.
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=H4(e1,e3,m2,d1)*S44(e2,d1,m1,m3)", &
        Z55,H4,S44,prefactor=(-1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=H4(e2be3b|m2b,d1b)*S44(e1b,d1b|m1bm3b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=H4(e2,e3,m2,d1)*S44(e1,d1,m1,m3)", &
        Z55,H4,S44,prefactor=(1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=H4(e1be2b|m3b,d1b)*S44(e3b,d1b|m1bm2b)*-1.
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=H4(e1,e2,m3,d1)*S44(e3,d1,m1,m2)", &
        Z55,H4,S44,prefactor=(-1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=H4(e1be3b|m3b,d1b)*S44(e2b,d1b|m1bm2b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=H4(e1,e3,m3,d1)*S44(e2,d1,m1,m2)", &
        Z55,H4,S44,prefactor=(1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=H4(e2be3b|m3b,d1b)*S44(e1b,d1b|m1bm2b)*-1.
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=H4(e2,e3,m3,d1)*S44(e1,d1,m1,m2)", &
        Z55,H4,S44,prefactor=(-1.0d0,0.0d0))
    
    allocate(tens_id(6), tens_root(6))
    tens_id   = (/nvir_id,nvir_id,nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nvir_root,nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z76_1,"Z76_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z76_1,'ZERO')
!   original expression: Z76_1(e1be2b,l1b|m1bm2bm3b)+=H18(e1b,l1b|m1b,d1b)*S44(e2b,d1b|m2bm3b)*-1.
    ierr=exatns_tensor_contract("Z76_1(e1,e2,l1,m1,m2,m3)+=H18(e1,l1,m1,d1)*S44(e2,d1,m2,m3)", &
        Z76_1,H18,S44,prefactor=(-1.0d0,0.0d0))
!   original expression: Z76_1(e1be2b,l1b|m1bm2bm3b)+=H18(e2b,l1b|m1b,d1b)*S44(e1b,d1b|m2bm3b)
    ierr=exatns_tensor_contract("Z76_1(e1,e2,l1,m1,m2,m3)+=H18(e2,l1,m1,d1)*S44(e1,d1,m2,m3)", &
        Z76_1,H18,S44,prefactor=(1.0d0,0.0d0))
!   original expression: Z76_1(e1be2b,l1b|m1bm2bm3b)+=H18(e1b,l1b|m2b,d1b)*S44(e2b,d1b|m1bm3b)
    ierr=exatns_tensor_contract("Z76_1(e1,e2,l1,m1,m2,m3)+=H18(e1,l1,m2,d1)*S44(e2,d1,m1,m3)", &
        Z76_1,H18,S44,prefactor=(1.0d0,0.0d0))
!   original expression: Z76_1(e1be2b,l1b|m1bm2bm3b)+=H18(e2b,l1b|m2b,d1b)*S44(e1b,d1b|m1bm3b)*-1.
    ierr=exatns_tensor_contract("Z76_1(e1,e2,l1,m1,m2,m3)+=H18(e2,l1,m2,d1)*S44(e1,d1,m1,m3)", &
        Z76_1,H18,S44,prefactor=(-1.0d0,0.0d0))
!   original expression: Z76_1(e1be2b,l1b|m1bm2bm3b)+=H18(e1b,l1b|m3b,d1b)*S44(e2b,d1b|m1bm2b)*-1.
    ierr=exatns_tensor_contract("Z76_1(e1,e2,l1,m1,m2,m3)+=H18(e1,l1,m3,d1)*S44(e2,d1,m1,m2)", &
        Z76_1,H18,S44,prefactor=(-1.0d0,0.0d0))
!   original expression: Z76_1(e1be2b,l1b|m1bm2bm3b)+=H18(e2b,l1b|m3b,d1b)*S44(e1b,d1b|m1bm2b)
    ierr=exatns_tensor_contract("Z76_1(e1,e2,l1,m1,m2,m3)+=H18(e2,l1,m3,d1)*S44(e1,d1,m1,m2)", &
        Z76_1,H18,S44,prefactor=(1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S43(e1b|l1b)*Z76_1(e2be3b,l1b|m1bm2bm3b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S43(e1,l1)*Z76_1(e2,e3,l1,m1,m2,m3)", &
        Z55,S43,Z76_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S43(e2b|l1b)*Z76_1(e1be3b,l1b|m1bm2bm3b)*-1.
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S43(e2,l1)*Z76_1(e1,e3,l1,m1,m2,m3)", &
        Z55,S43,Z76_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S43(e3b|l1b)*Z76_1(e1be2b,l1b|m1bm2bm3b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S43(e3,l1)*Z76_1(e1,e2,l1,m1,m2,m3)", &
        Z55,S43,Z76_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z76_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z110_3,"Z110_3",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z110_3,'ZERO')
!   original expression: Z110_3(l1b,l2b|m1b,d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|m1b)*0.5
    ierr=exatns_tensor_contract("Z110_3(l1,l2,m1,d1)+=H24(l1,l2,d1,d2)*S43(d2,m1)", &
        Z110_3,H24,S43,prefactor=(0.5d0,0.0d0))
    
    allocate(tens_id(6), tens_root(6))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z98_2,"Z98_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z98_2,'ZERO')
!   original expression: Z98_2(e1b,l1b,l2b|m1bm2bm3b)+=S44(e1b,d1b|m1bm2b)*Z110_3(l1b,l2b|m3b,d1b)
    ierr=exatns_tensor_contract("Z98_2(e1,l1,l2,m1,m2,m3)+=S44(e1,d1,m1,m2)*Z110_3(l1,l2,m3,d1)", &
        Z98_2,S44,Z110_3,prefactor=(1.0d0,0.0d0))
!   original expression: Z98_2(e1b,l1b,l2b|m1bm2bm3b)+=S44(e1b,d1b|m1bm3b)*Z110_3(l1b,l2b|m2b,d1b)*-1.
    ierr=exatns_tensor_contract("Z98_2(e1,l1,l2,m1,m2,m3)+=S44(e1,d1,m1,m3)*Z110_3(l1,l2,m2,d1)", &
        Z98_2,S44,Z110_3,prefactor=(-1.0d0,0.0d0))
!   original expression: Z98_2(e1b,l1b,l2b|m1bm2bm3b)+=S44(e1b,d1b|m2bm3b)*Z110_3(l1b,l2b|m1b,d1b)
    ierr=exatns_tensor_contract("Z98_2(e1,l1,l2,m1,m2,m3)+=S44(e1,d1,m2,m3)*Z110_3(l1,l2,m1,d1)", &
        Z98_2,S44,Z110_3,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z110_3)
    
    allocate(tens_id(6), tens_root(6))
    tens_id   = (/nvir_id,nvir_id,nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nvir_root,nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z76_1,"Z76_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z76_1,'ZERO')
!   original expression: Z76_1(e1be2b,l1b|m1bm2bm3b)+=S43(e1b|l2b)*Z98_2(e2b,l1b,l2b|m1bm2bm3b)
    ierr=exatns_tensor_contract("Z76_1(e1,e2,l1,m1,m2,m3)+=S43(e1,l2)*Z98_2(e2,l1,l2,m1,m2,m3)", &
        Z76_1,S43,Z98_2,prefactor=(1.0d0,0.0d0))
!   original expression: Z76_1(e1be2b,l1b|m1bm2bm3b)+=S43(e2b|l2b)*Z98_2(e1b,l1b,l2b|m1bm2bm3b)*-1.
    ierr=exatns_tensor_contract("Z76_1(e1,e2,l1,m1,m2,m3)+=S43(e2,l2)*Z98_2(e1,l1,l2,m1,m2,m3)", &
        Z76_1,S43,Z98_2,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z98_2)
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S43(e1b|l1b)*Z76_1(e2be3b,l1b|m1bm2bm3b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S43(e1,l1)*Z76_1(e2,e3,l1,m1,m2,m3)", &
        Z55,S43,Z76_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S43(e2b|l1b)*Z76_1(e1be3b,l1b|m1bm2bm3b)*-1.
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S43(e2,l1)*Z76_1(e1,e3,l1,m1,m2,m3)", &
        Z55,S43,Z76_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S43(e3b|l1b)*Z76_1(e1be2b,l1b|m1bm2bm3b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S43(e3,l1)*Z76_1(e1,e2,l1,m1,m2,m3)", &
        Z55,S43,Z76_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z76_1)
    
    allocate(tens_id(6), tens_root(6))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z98_2,"Z98_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z98_2,'ZERO')
!   original expression: Z98_2(e1b,l1b,l2b|m1bm2bm3b)+=S44(e1b,d1b|m1bm2b)*H25(l1b,l2b|m3b,d1b)*-0.5
    ierr=exatns_tensor_contract("Z98_2(e1,l1,l2,m1,m2,m3)+=S44(e1,d1,m1,m2)*H25(l1,l2,m3,d1)", &
        Z98_2,S44,H25,prefactor=(-0.5d0,0.0d0))
!   original expression: Z98_2(e1b,l1b,l2b|m1bm2bm3b)+=S44(e1b,d1b|m1bm3b)*H25(l1b,l2b|m2b,d1b)*+0.5
    ierr=exatns_tensor_contract("Z98_2(e1,l1,l2,m1,m2,m3)+=S44(e1,d1,m1,m3)*H25(l1,l2,m2,d1)", &
        Z98_2,S44,H25,prefactor=(0.5d0,0.0d0))
!   original expression: Z98_2(e1b,l1b,l2b|m1bm2bm3b)+=S44(e1b,d1b|m2bm3b)*H25(l1b,l2b|m1b,d1b)*+0.5
    ierr=exatns_tensor_contract("Z98_2(e1,l1,l2,m1,m2,m3)+=S44(e1,d1,m2,m3)*H25(l1,l2,m1,d1)", &
        Z98_2,S44,H25,prefactor=(0.5d0,0.0d0))
    
    allocate(tens_id(6), tens_root(6))
    tens_id   = (/nvir_id,nvir_id,nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nvir_root,nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z76_1,"Z76_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z76_1,'ZERO')
!   original expression: Z76_1(e1be2b,l1b|m1bm2bm3b)+=S43(e1b|l2b)*Z98_2(e2b,l1b,l2b|m1bm2bm3b)
    ierr=exatns_tensor_contract("Z76_1(e1,e2,l1,m1,m2,m3)+=S43(e1,l2)*Z98_2(e2,l1,l2,m1,m2,m3)", &
        Z76_1,S43,Z98_2,prefactor=(1.0d0,0.0d0))
!   original expression: Z76_1(e1be2b,l1b|m1bm2bm3b)+=S43(e2b|l2b)*Z98_2(e1b,l1b,l2b|m1bm2bm3b)*-1.
    ierr=exatns_tensor_contract("Z76_1(e1,e2,l1,m1,m2,m3)+=S43(e2,l2)*Z98_2(e1,l1,l2,m1,m2,m3)", &
        Z76_1,S43,Z98_2,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z98_2)
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S43(e1b|l1b)*Z76_1(e2be3b,l1b|m1bm2bm3b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S43(e1,l1)*Z76_1(e2,e3,l1,m1,m2,m3)", &
        Z55,S43,Z76_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S43(e2b|l1b)*Z76_1(e1be3b,l1b|m1bm2bm3b)*-1.
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S43(e2,l1)*Z76_1(e1,e3,l1,m1,m2,m3)", &
        Z55,S43,Z76_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S43(e3b|l1b)*Z76_1(e1be2b,l1b|m1bm2bm3b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S43(e3,l1)*Z76_1(e1,e2,l1,m1,m2,m3)", &
        Z55,S43,Z76_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z76_1)
    
    allocate(tens_id(6), tens_root(6))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z98_2,"Z98_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z98_2,'ZERO')
!   original expression: Z98_2(e1b,l1b,l2b|m1bm2bm3b)+=S45(e1b,d1bd2b|m1bm2bm3b)*H24(l1b,l2b|d1bd2b)*0.5
    ierr=exatns_tensor_contract("Z98_2(e1,l1,l2,m1,m2,m3)+=S45(e1,d1,d2,m1,m2,m3)*H24(l1,l2,d1,d2)", &
        Z98_2,S45,H24,prefactor=(0.25d0,0.0d0))
    
    allocate(tens_id(6), tens_root(6))
    tens_id   = (/nvir_id,nvir_id,nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nvir_root,nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z76_1,"Z76_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z76_1,'ZERO')
!   original expression: Z76_1(e1be2b,l1b|m1bm2bm3b)+=S43(e1b|l2b)*Z98_2(e2b,l1b,l2b|m1bm2bm3b)
    ierr=exatns_tensor_contract("Z76_1(e1,e2,l1,m1,m2,m3)+=S43(e1,l2)*Z98_2(e2,l1,l2,m1,m2,m3)", &
        Z76_1,S43,Z98_2,prefactor=(1.0d0,0.0d0))
!   original expression: Z76_1(e1be2b,l1b|m1bm2bm3b)+=S43(e2b|l2b)*Z98_2(e1b,l1b,l2b|m1bm2bm3b)*-1.
    ierr=exatns_tensor_contract("Z76_1(e1,e2,l1,m1,m2,m3)+=S43(e2,l2)*Z98_2(e1,l1,l2,m1,m2,m3)", &
        Z76_1,S43,Z98_2,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z98_2)
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S43(e1b|l1b)*Z76_1(e2be3b,l1b|m1bm2bm3b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S43(e1,l1)*Z76_1(e2,e3,l1,m1,m2,m3)", &
        Z55,S43,Z76_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S43(e2b|l1b)*Z76_1(e1be3b,l1b|m1bm2bm3b)*-1.
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S43(e2,l1)*Z76_1(e1,e3,l1,m1,m2,m3)", &
        Z55,S43,Z76_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S43(e3b|l1b)*Z76_1(e1be2b,l1b|m1bm2bm3b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S43(e3,l1)*Z76_1(e1,e2,l1,m1,m2,m3)", &
        Z55,S43,Z76_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z76_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z100_2,"Z100_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z100_2,'ZERO')
!   original expression: Z100_2(e1b,l1b|m1b,d1b)+=H17(e1b,l1b|d1b,d2b)*S43(d2b|m1b)*-1.
    ierr=exatns_tensor_contract("Z100_2(e1,l1,m1,d1)+=H17(e1,l1,d1,d2)*S43(d2,m1)", &
        Z100_2,H17,S43,prefactor=(-1.0d0,0.0d0))
    
    allocate(tens_id(6), tens_root(6))
    tens_id   = (/nvir_id,nvir_id,nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nvir_root,nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z76_1,"Z76_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z76_1,'ZERO')
!   original expression: Z76_1(e1be2b,l1b|m1bm2bm3b)+=S44(e1b,d1b|m1bm2b)*Z100_2(e2b,l1b|m3b,d1b)
    ierr=exatns_tensor_contract("Z76_1(e1,e2,l1,m1,m2,m3)+=S44(e1,d1,m1,m2)*Z100_2(e2,l1,m3,d1)", &
        Z76_1,S44,Z100_2,prefactor=(1.0d0,0.0d0))
!   original expression: Z76_1(e1be2b,l1b|m1bm2bm3b)+=S44(e2b,d1b|m1bm2b)*Z100_2(e1b,l1b|m3b,d1b)*-1.
    ierr=exatns_tensor_contract("Z76_1(e1,e2,l1,m1,m2,m3)+=S44(e2,d1,m1,m2)*Z100_2(e1,l1,m3,d1)", &
        Z76_1,S44,Z100_2,prefactor=(-1.0d0,0.0d0))
!   original expression: Z76_1(e1be2b,l1b|m1bm2bm3b)+=S44(e1b,d1b|m1bm3b)*Z100_2(e2b,l1b|m2b,d1b)*-1.
    ierr=exatns_tensor_contract("Z76_1(e1,e2,l1,m1,m2,m3)+=S44(e1,d1,m1,m3)*Z100_2(e2,l1,m2,d1)", &
        Z76_1,S44,Z100_2,prefactor=(-1.0d0,0.0d0))
!   original expression: Z76_1(e1be2b,l1b|m1bm2bm3b)+=S44(e2b,d1b|m1bm3b)*Z100_2(e1b,l1b|m2b,d1b)
    ierr=exatns_tensor_contract("Z76_1(e1,e2,l1,m1,m2,m3)+=S44(e2,d1,m1,m3)*Z100_2(e1,l1,m2,d1)", &
        Z76_1,S44,Z100_2,prefactor=(1.0d0,0.0d0))
!   original expression: Z76_1(e1be2b,l1b|m1bm2bm3b)+=S44(e1b,d1b|m2bm3b)*Z100_2(e2b,l1b|m1b,d1b)
    ierr=exatns_tensor_contract("Z76_1(e1,e2,l1,m1,m2,m3)+=S44(e1,d1,m2,m3)*Z100_2(e2,l1,m1,d1)", &
        Z76_1,S44,Z100_2,prefactor=(1.0d0,0.0d0))
!   original expression: Z76_1(e1be2b,l1b|m1bm2bm3b)+=S44(e2b,d1b|m2bm3b)*Z100_2(e1b,l1b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z76_1(e1,e2,l1,m1,m2,m3)+=S44(e2,d1,m2,m3)*Z100_2(e1,l1,m1,d1)", &
        Z76_1,S44,Z100_2,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z100_2)
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S43(e1b|l1b)*Z76_1(e2be3b,l1b|m1bm2bm3b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S43(e1,l1)*Z76_1(e2,e3,l1,m1,m2,m3)", &
        Z55,S43,Z76_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S43(e2b|l1b)*Z76_1(e1be3b,l1b|m1bm2bm3b)*-1.
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S43(e2,l1)*Z76_1(e1,e3,l1,m1,m2,m3)", &
        Z55,S43,Z76_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S43(e3b|l1b)*Z76_1(e1be2b,l1b|m1bm2bm3b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S43(e3,l1)*Z76_1(e1,e2,l1,m1,m2,m3)", &
        Z55,S43,Z76_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z76_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z100_2,"Z100_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z100_2,'ZERO')
!   original expression: Z100_2(e1b,l1b|m1b,d1b)+=S44(e1b,d2b|m1b,l2b)*H24(l1b,l2b|d1b,d2b)
    ierr=exatns_tensor_contract("Z100_2(e1,l1,m1,d1)+=S44(e1,d2,m1,l2)*H24(l1,l2,d1,d2)", &
        Z100_2,S44,H24,prefactor=(1.0d0,0.0d0))
    
    allocate(tens_id(6), tens_root(6))
    tens_id   = (/nvir_id,nvir_id,nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nvir_root,nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z76_1,"Z76_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z76_1,'ZERO')
!   original expression: Z76_1(e1be2b,l1b|m1bm2bm3b)+=S44(e1b,d1b|m1bm2b)*Z100_2(e2b,l1b|m3b,d1b)
    ierr=exatns_tensor_contract("Z76_1(e1,e2,l1,m1,m2,m3)+=S44(e1,d1,m1,m2)*Z100_2(e2,l1,m3,d1)", &
        Z76_1,S44,Z100_2,prefactor=(1.0d0,0.0d0))
!   original expression: Z76_1(e1be2b,l1b|m1bm2bm3b)+=S44(e2b,d1b|m1bm2b)*Z100_2(e1b,l1b|m3b,d1b)*-1.
    ierr=exatns_tensor_contract("Z76_1(e1,e2,l1,m1,m2,m3)+=S44(e2,d1,m1,m2)*Z100_2(e1,l1,m3,d1)", &
        Z76_1,S44,Z100_2,prefactor=(-1.0d0,0.0d0))
!   original expression: Z76_1(e1be2b,l1b|m1bm2bm3b)+=S44(e1b,d1b|m1bm3b)*Z100_2(e2b,l1b|m2b,d1b)*-1.
    ierr=exatns_tensor_contract("Z76_1(e1,e2,l1,m1,m2,m3)+=S44(e1,d1,m1,m3)*Z100_2(e2,l1,m2,d1)", &
        Z76_1,S44,Z100_2,prefactor=(-1.0d0,0.0d0))
!   original expression: Z76_1(e1be2b,l1b|m1bm2bm3b)+=S44(e2b,d1b|m1bm3b)*Z100_2(e1b,l1b|m2b,d1b)
    ierr=exatns_tensor_contract("Z76_1(e1,e2,l1,m1,m2,m3)+=S44(e2,d1,m1,m3)*Z100_2(e1,l1,m2,d1)", &
        Z76_1,S44,Z100_2,prefactor=(1.0d0,0.0d0))
!   original expression: Z76_1(e1be2b,l1b|m1bm2bm3b)+=S44(e1b,d1b|m2bm3b)*Z100_2(e2b,l1b|m1b,d1b)
    ierr=exatns_tensor_contract("Z76_1(e1,e2,l1,m1,m2,m3)+=S44(e1,d1,m2,m3)*Z100_2(e2,l1,m1,d1)", &
        Z76_1,S44,Z100_2,prefactor=(1.0d0,0.0d0))
!   original expression: Z76_1(e1be2b,l1b|m1bm2bm3b)+=S44(e2b,d1b|m2bm3b)*Z100_2(e1b,l1b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z76_1(e1,e2,l1,m1,m2,m3)+=S44(e2,d1,m2,m3)*Z100_2(e1,l1,m1,d1)", &
        Z76_1,S44,Z100_2,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z100_2)
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S43(e1b|l1b)*Z76_1(e2be3b,l1b|m1bm2bm3b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S43(e1,l1)*Z76_1(e2,e3,l1,m1,m2,m3)", &
        Z55,S43,Z76_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S43(e2b|l1b)*Z76_1(e1be3b,l1b|m1bm2bm3b)*-1.
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S43(e2,l1)*Z76_1(e1,e3,l1,m1,m2,m3)", &
        Z55,S43,Z76_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S43(e3b|l1b)*Z76_1(e1be2b,l1b|m1bm2bm3b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S43(e3,l1)*Z76_1(e1,e2,l1,m1,m2,m3)", &
        Z55,S43,Z76_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z76_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z100_2,"Z100_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z100_2,'ZERO')
    
    allocate(tens_id(6), tens_root(6))
    tens_id   = (/nvir_id,nvir_id,nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nvir_root,nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z76_1,"Z76_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z76_1,'ZERO')
!   original expression: Z76_1(e1be2b,l1b|m1bm2bm3b)+=S44(e1b,d1b|m1bm2b)*Z100_2(e2b,l1b|m3b,d1b)
    ierr=exatns_tensor_contract("Z76_1(e1,e2,l1,m1,m2,m3)+=S44(e1,d1,m1,m2)*Z100_2(e2,l1,m3,d1)", &
        Z76_1,S44,Z100_2,prefactor=(1.0d0,0.0d0))
!   original expression: Z76_1(e1be2b,l1b|m1bm2bm3b)+=S44(e2b,d1b|m1bm2b)*Z100_2(e1b,l1b|m3b,d1b)*-1.
    ierr=exatns_tensor_contract("Z76_1(e1,e2,l1,m1,m2,m3)+=S44(e2,d1,m1,m2)*Z100_2(e1,l1,m3,d1)", &
        Z76_1,S44,Z100_2,prefactor=(-1.0d0,0.0d0))
!   original expression: Z76_1(e1be2b,l1b|m1bm2bm3b)+=S44(e1b,d1b|m1bm3b)*Z100_2(e2b,l1b|m2b,d1b)*-1.
    ierr=exatns_tensor_contract("Z76_1(e1,e2,l1,m1,m2,m3)+=S44(e1,d1,m1,m3)*Z100_2(e2,l1,m2,d1)", &
        Z76_1,S44,Z100_2,prefactor=(-1.0d0,0.0d0))
!   original expression: Z76_1(e1be2b,l1b|m1bm2bm3b)+=S44(e2b,d1b|m1bm3b)*Z100_2(e1b,l1b|m2b,d1b)
    ierr=exatns_tensor_contract("Z76_1(e1,e2,l1,m1,m2,m3)+=S44(e2,d1,m1,m3)*Z100_2(e1,l1,m2,d1)", &
        Z76_1,S44,Z100_2,prefactor=(1.0d0,0.0d0))
!   original expression: Z76_1(e1be2b,l1b|m1bm2bm3b)+=S44(e1b,d1b|m2bm3b)*Z100_2(e2b,l1b|m1b,d1b)
    ierr=exatns_tensor_contract("Z76_1(e1,e2,l1,m1,m2,m3)+=S44(e1,d1,m2,m3)*Z100_2(e2,l1,m1,d1)", &
        Z76_1,S44,Z100_2,prefactor=(1.0d0,0.0d0))
!   original expression: Z76_1(e1be2b,l1b|m1bm2bm3b)+=S44(e2b,d1b|m2bm3b)*Z100_2(e1b,l1b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z76_1(e1,e2,l1,m1,m2,m3)+=S44(e2,d1,m2,m3)*Z100_2(e1,l1,m1,d1)", &
        Z76_1,S44,Z100_2,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z100_2)
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S43(e1b|l1b)*Z76_1(e2be3b,l1b|m1bm2bm3b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S43(e1,l1)*Z76_1(e2,e3,l1,m1,m2,m3)", &
        Z55,S43,Z76_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S43(e2b|l1b)*Z76_1(e1be3b,l1b|m1bm2bm3b)*-1.
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S43(e2,l1)*Z76_1(e1,e3,l1,m1,m2,m3)", &
        Z55,S43,Z76_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S43(e3b|l1b)*Z76_1(e1be2b,l1b|m1bm2bm3b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S43(e3,l1)*Z76_1(e1,e2,l1,m1,m2,m3)", &
        Z55,S43,Z76_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z76_1)
    
    allocate(tens_id(6), tens_root(6))
    tens_id   = (/nvir_id,nvir_id,nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nvir_root,nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z76_1,"Z76_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z76_1,'ZERO')
!   original expression: Z76_1(e1be2b,l1b|m1bm2bm3b)+=S45(e1b,d1bd2b|m1bm2bm3b)*H17(e2b,l1b|d1bd2b)*-1.
    ierr=exatns_tensor_contract("Z76_1(e1,e2,l1,m1,m2,m3)+=S45(e1,d1,d2,m1,m2,m3)*H17(e2,l1,d1,d2)", &
        Z76_1,S45,H17,prefactor=(-0.5d0,0.0d0))
!   original expression: Z76_1(e1be2b,l1b|m1bm2bm3b)+=S45(e2b,d1bd2b|m1bm2bm3b)*H17(e1b,l1b|d1bd2b)
    ierr=exatns_tensor_contract("Z76_1(e1,e2,l1,m1,m2,m3)+=S45(e2,d1,d2,m1,m2,m3)*H17(e1,l1,d1,d2)", &
        Z76_1,S45,H17,prefactor=(0.5d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S43(e1b|l1b)*Z76_1(e2be3b,l1b|m1bm2bm3b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S43(e1,l1)*Z76_1(e2,e3,l1,m1,m2,m3)", &
        Z55,S43,Z76_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S43(e2b|l1b)*Z76_1(e1be3b,l1b|m1bm2bm3b)*-1.
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S43(e2,l1)*Z76_1(e1,e3,l1,m1,m2,m3)", &
        Z55,S43,Z76_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S43(e3b|l1b)*Z76_1(e1be2b,l1b|m1bm2bm3b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S43(e3,l1)*Z76_1(e1,e2,l1,m1,m2,m3)", &
        Z55,S43,Z76_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z76_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nvir_id/)
    tens_root = (/nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z65_2,"Z65_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z65_2,'ZERO')
!   original expression: Z65_2(l1b|d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|l2b)*-1.
    ierr=exatns_tensor_contract("Z65_2(l1,d1)+=H24(l1,l2,d1,d2)*S43(d2,l2)", &
        Z65_2,H24,S43,prefactor=(-1.0d0,0.0d0))
    
    allocate(tens_id(6), tens_root(6))
    tens_id   = (/nvir_id,nvir_id,nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nvir_root,nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z76_1,"Z76_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z76_1,'ZERO')
!   original expression: Z76_1(e1be2b,l1b|m1bm2bm3b)+=S45(e1be2b,d1b|m1bm2bm3b)*Z65_2(l1b|d1b)
    ierr=exatns_tensor_contract("Z76_1(e1,e2,l1,m1,m2,m3)+=S45(e1,e2,d1,m1,m2,m3)*Z65_2(l1,d1)", &
        Z76_1,S45,Z65_2,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z65_2)
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S43(e1b|l1b)*Z76_1(e2be3b,l1b|m1bm2bm3b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S43(e1,l1)*Z76_1(e2,e3,l1,m1,m2,m3)", &
        Z55,S43,Z76_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S43(e2b|l1b)*Z76_1(e1be3b,l1b|m1bm2bm3b)*-1.
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S43(e2,l1)*Z76_1(e1,e3,l1,m1,m2,m3)", &
        Z55,S43,Z76_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S43(e3b|l1b)*Z76_1(e1be2b,l1b|m1bm2bm3b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S43(e3,l1)*Z76_1(e1,e2,l1,m1,m2,m3)", &
        Z55,S43,Z76_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z76_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nvir_id/)
    tens_root = (/nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z65_2,"Z65_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z65_2,'ZERO')
    
    allocate(tens_id(6), tens_root(6))
    tens_id   = (/nvir_id,nvir_id,nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nvir_root,nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z76_1,"Z76_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z76_1,'ZERO')
!   original expression: Z76_1(e1be2b,l1b|m1bm2bm3b)+=S45(e1be2b,d1b|m1bm2bm3b)*Z65_2(l1b|d1b)
    ierr=exatns_tensor_contract("Z76_1(e1,e2,l1,m1,m2,m3)+=S45(e1,e2,d1,m1,m2,m3)*Z65_2(l1,d1)", &
        Z76_1,S45,Z65_2,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z65_2)
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S43(e1b|l1b)*Z76_1(e2be3b,l1b|m1bm2bm3b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S43(e1,l1)*Z76_1(e2,e3,l1,m1,m2,m3)", &
        Z55,S43,Z76_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S43(e2b|l1b)*Z76_1(e1be3b,l1b|m1bm2bm3b)*-1.
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S43(e2,l1)*Z76_1(e1,e3,l1,m1,m2,m3)", &
        Z55,S43,Z76_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S43(e3b|l1b)*Z76_1(e1be2b,l1b|m1bm2bm3b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S43(e3,l1)*Z76_1(e1,e2,l1,m1,m2,m3)", &
        Z55,S43,Z76_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z76_1)
    
    allocate(tens_id(6), tens_root(6))
    tens_id   = (/nvir_id,nvir_id,nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nvir_root,nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z76_1,"Z76_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z76_1,'ZERO')
!   original expression: Z76_1(e1be2b,l1b|m1bm2bm3b)+=S45(e1be2b,d1b|m1bm2bm3b)*H15(l1b|d1b)*-1.
    ierr=exatns_tensor_contract("Z76_1(e1,e2,l1,m1,m2,m3)+=S45(e1,e2,d1,m1,m2,m3)*H15(l1,d1)", &
        Z76_1,S45,H15,prefactor=(-1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S43(e1b|l1b)*Z76_1(e2be3b,l1b|m1bm2bm3b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S43(e1,l1)*Z76_1(e2,e3,l1,m1,m2,m3)", &
        Z55,S43,Z76_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S43(e2b|l1b)*Z76_1(e1be3b,l1b|m1bm2bm3b)*-1.
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S43(e2,l1)*Z76_1(e1,e3,l1,m1,m2,m3)", &
        Z55,S43,Z76_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S43(e3b|l1b)*Z76_1(e1be2b,l1b|m1bm2bm3b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S43(e3,l1)*Z76_1(e1,e2,l1,m1,m2,m3)", &
        Z55,S43,Z76_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z76_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z110_2,"Z110_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z110_2,'ZERO')
!   original expression: Z110_2(l1b,l2b|m1b,d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|m1b)
    ierr=exatns_tensor_contract("Z110_2(l1,l2,m1,d1)+=H24(l1,l2,d1,d2)*S43(d2,m1)", &
        Z110_2,H24,S43,prefactor=(1.0d0,0.0d0))
    
    allocate(tens_id(6), tens_root(6))
    tens_id   = (/nvir_id,nvir_id,nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nvir_root,nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z76_1,"Z76_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z76_1,'ZERO')
!   original expression: Z76_1(e1be2b,l1b|m1bm2bm3b)+=S45(e1be2b,d1b|m1bm2b,l2b)*Z110_2(l1b,l2b|m3b,d1b)
    ierr=exatns_tensor_contract("Z76_1(e1,e2,l1,m1,m2,m3)+=S45(e1,e2,d1,m1,m2,l2)*Z110_2(l1,l2,m3,d1)", &
        Z76_1,S45,Z110_2,prefactor=(1.0d0,0.0d0))
!   original expression: Z76_1(e1be2b,l1b|m1bm2bm3b)+=S45(e1be2b,d1b|m1bm3b,l2b)*Z110_2(l1b,l2b|m2b,d1b)*-1.
    ierr=exatns_tensor_contract("Z76_1(e1,e2,l1,m1,m2,m3)+=S45(e1,e2,d1,m1,m3,l2)*Z110_2(l1,l2,m2,d1)", &
        Z76_1,S45,Z110_2,prefactor=(-1.0d0,0.0d0))
!   original expression: Z76_1(e1be2b,l1b|m1bm2bm3b)+=S45(e1be2b,d1b|m2bm3b,l2b)*Z110_2(l1b,l2b|m1b,d1b)
    ierr=exatns_tensor_contract("Z76_1(e1,e2,l1,m1,m2,m3)+=S45(e1,e2,d1,m2,m3,l2)*Z110_2(l1,l2,m1,d1)", &
        Z76_1,S45,Z110_2,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z110_2)
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S43(e1b|l1b)*Z76_1(e2be3b,l1b|m1bm2bm3b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S43(e1,l1)*Z76_1(e2,e3,l1,m1,m2,m3)", &
        Z55,S43,Z76_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S43(e2b|l1b)*Z76_1(e1be3b,l1b|m1bm2bm3b)*-1.
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S43(e2,l1)*Z76_1(e1,e3,l1,m1,m2,m3)", &
        Z55,S43,Z76_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S43(e3b|l1b)*Z76_1(e1be2b,l1b|m1bm2bm3b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S43(e3,l1)*Z76_1(e1,e2,l1,m1,m2,m3)", &
        Z55,S43,Z76_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z76_1)
    
    allocate(tens_id(6), tens_root(6))
    tens_id   = (/nvir_id,nvir_id,nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nvir_root,nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z76_1,"Z76_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z76_1,'ZERO')
!   original expression: Z76_1(e1be2b,l1b|m1bm2bm3b)+=S45(e1be2b,d1b|m1bm2b,l2b)*H25(l1b,l2b|m3b,d1b)*-1.
    ierr=exatns_tensor_contract("Z76_1(e1,e2,l1,m1,m2,m3)+=S45(e1,e2,d1,m1,m2,l2)*H25(l1,l2,m3,d1)", &
        Z76_1,S45,H25,prefactor=(-1.0d0,0.0d0))
!   original expression: Z76_1(e1be2b,l1b|m1bm2bm3b)+=S45(e1be2b,d1b|m1bm3b,l2b)*H25(l1b,l2b|m2b,d1b)
    ierr=exatns_tensor_contract("Z76_1(e1,e2,l1,m1,m2,m3)+=S45(e1,e2,d1,m1,m3,l2)*H25(l1,l2,m2,d1)", &
        Z76_1,S45,H25,prefactor=(1.0d0,0.0d0))
!   original expression: Z76_1(e1be2b,l1b|m1bm2bm3b)+=S45(e1be2b,d1b|m2bm3b,l2b)*H25(l1b,l2b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z76_1(e1,e2,l1,m1,m2,m3)+=S45(e1,e2,d1,m2,m3,l2)*H25(l1,l2,m1,d1)", &
        Z76_1,S45,H25,prefactor=(-1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S43(e1b|l1b)*Z76_1(e2be3b,l1b|m1bm2bm3b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S43(e1,l1)*Z76_1(e2,e3,l1,m1,m2,m3)", &
        Z55,S43,Z76_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S43(e2b|l1b)*Z76_1(e1be3b,l1b|m1bm2bm3b)*-1.
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S43(e2,l1)*Z76_1(e1,e3,l1,m1,m2,m3)", &
        Z55,S43,Z76_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S43(e3b|l1b)*Z76_1(e1be2b,l1b|m1bm2bm3b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S43(e3,l1)*Z76_1(e1,e2,l1,m1,m2,m3)", &
        Z55,S43,Z76_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z76_1)
    
    allocate(tens_id(6), tens_root(6))
    tens_id   = (/nvir_id,nvir_id,nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nvir_root,nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z76_1,"Z76_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z76_1,'ZERO')
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S43(e1b|l1b)*Z76_1(e2be3b,l1b|m1bm2bm3b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S43(e1,l1)*Z76_1(e2,e3,l1,m1,m2,m3)", &
        Z55,S43,Z76_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S43(e2b|l1b)*Z76_1(e1be3b,l1b|m1bm2bm3b)*-1.
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S43(e2,l1)*Z76_1(e1,e3,l1,m1,m2,m3)", &
        Z55,S43,Z76_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S43(e3b|l1b)*Z76_1(e1be2b,l1b|m1bm2bm3b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S43(e3,l1)*Z76_1(e1,e2,l1,m1,m2,m3)", &
        Z55,S43,Z76_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z76_1)
    
    allocate(tens_id(6), tens_root(6))
    tens_id   = (/nvir_id,nvir_id,nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nvir_root,nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z76_1,"Z76_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z76_1,'ZERO')
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S43(e1b|l1b)*Z76_1(e2be3b,l1b|m1bm2bm3b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S43(e1,l1)*Z76_1(e2,e3,l1,m1,m2,m3)", &
        Z55,S43,Z76_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S43(e2b|l1b)*Z76_1(e1be3b,l1b|m1bm2bm3b)*-1.
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S43(e2,l1)*Z76_1(e1,e3,l1,m1,m2,m3)", &
        Z55,S43,Z76_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S43(e3b|l1b)*Z76_1(e1be2b,l1b|m1bm2bm3b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S43(e3,l1)*Z76_1(e1,e2,l1,m1,m2,m3)", &
        Z55,S43,Z76_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z76_1)
    
    allocate(tens_id(6), tens_root(6))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z72_1,"Z72_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z72_1,'ZERO')
!   original expression: Z72_1(e1b,l1bl2b|m1bm2bm3b)+=S45(e1b,d1bd2b|m1bm2bm3b)*H24(l1bl2b|d1bd2b)
    ierr=exatns_tensor_contract("Z72_1(e1,l1,l2,m1,m2,m3)+=S45(e1,d1,d2,m1,m2,m3)*H24(l1,l2,d1,d2)", &
        Z72_1,S45,H24,prefactor=(0.5d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e1be2b|l1bl2b)*Z72_1(e3b,l1bl2b|m1bm2bm3b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e1,e2,l1,l2)*Z72_1(e3,l1,l2,m1,m2,m3)", &
        Z55,S44,Z72_1,prefactor=(0.5d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e1be3b|l1bl2b)*Z72_1(e2b,l1bl2b|m1bm2bm3b)*-1.
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e1,e3,l1,l2)*Z72_1(e2,l1,l2,m1,m2,m3)", &
        Z55,S44,Z72_1,prefactor=(-0.5d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e2be3b|l1bl2b)*Z72_1(e1b,l1bl2b|m1bm2bm3b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e2,e3,l1,l2)*Z72_1(e1,l1,l2,m1,m2,m3)", &
        Z55,S44,Z72_1,prefactor=(0.5d0,0.0d0))
    ierr=exatns_tensor_destroy(Z72_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nvir_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z78_1,"Z78_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z78_1,'ZERO')
!   original expression: Z78_1(e1be2b|m1b,d1b)+=H3(e1be2b|d1b,d2b)*S43(d2b|m1b)
    ierr=exatns_tensor_contract("Z78_1(e1,e2,m1,d1)+=H3(e1,e2,d1,d2)*S43(d2,m1)", &
        Z78_1,H3,S43,prefactor=(1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e1b,d1b|m1bm2b)*Z78_1(e2be3b|m3b,d1b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e1,d1,m1,m2)*Z78_1(e2,e3,m3,d1)", &
        Z55,S44,Z78_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e2b,d1b|m1bm2b)*Z78_1(e1be3b|m3b,d1b)*-1.
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e2,d1,m1,m2)*Z78_1(e1,e3,m3,d1)", &
        Z55,S44,Z78_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e3b,d1b|m1bm2b)*Z78_1(e1be2b|m3b,d1b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e3,d1,m1,m2)*Z78_1(e1,e2,m3,d1)", &
        Z55,S44,Z78_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e1b,d1b|m1bm3b)*Z78_1(e2be3b|m2b,d1b)*-1.
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e1,d1,m1,m3)*Z78_1(e2,e3,m2,d1)", &
        Z55,S44,Z78_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e2b,d1b|m1bm3b)*Z78_1(e1be3b|m2b,d1b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e2,d1,m1,m3)*Z78_1(e1,e3,m2,d1)", &
        Z55,S44,Z78_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e3b,d1b|m1bm3b)*Z78_1(e1be2b|m2b,d1b)*-1.
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e3,d1,m1,m3)*Z78_1(e1,e2,m2,d1)", &
        Z55,S44,Z78_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e1b,d1b|m2bm3b)*Z78_1(e2be3b|m1b,d1b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e1,d1,m2,m3)*Z78_1(e2,e3,m1,d1)", &
        Z55,S44,Z78_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e2b,d1b|m2bm3b)*Z78_1(e1be3b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e2,d1,m2,m3)*Z78_1(e1,e3,m1,d1)", &
        Z55,S44,Z78_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e3b,d1b|m2bm3b)*Z78_1(e1be2b|m1b,d1b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e3,d1,m2,m3)*Z78_1(e1,e2,m1,d1)", &
        Z55,S44,Z78_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z78_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nvir_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z78_1,"Z78_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z78_1,'ZERO')
!   original expression: Z78_1(e1be2b|m1b,d1b)+=H17(e1b,l1b|d1b,d2b)*S44(e2b,d2b|m1b,l1b)
    ierr=exatns_tensor_contract("Z78_1(e1,e2,m1,d1)+=H17(e1,l1,d1,d2)*S44(e2,d2,m1,l1)", &
        Z78_1,H17,S44,prefactor=(1.0d0,0.0d0))
!   original expression: Z78_1(e1be2b|m1b,d1b)+=H17(e2b,l1b|d1b,d2b)*S44(e1b,d2b|m1b,l1b)*-1.
    ierr=exatns_tensor_contract("Z78_1(e1,e2,m1,d1)+=H17(e2,l1,d1,d2)*S44(e1,d2,m1,l1)", &
        Z78_1,H17,S44,prefactor=(-1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e1b,d1b|m1bm2b)*Z78_1(e2be3b|m3b,d1b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e1,d1,m1,m2)*Z78_1(e2,e3,m3,d1)", &
        Z55,S44,Z78_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e2b,d1b|m1bm2b)*Z78_1(e1be3b|m3b,d1b)*-1.
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e2,d1,m1,m2)*Z78_1(e1,e3,m3,d1)", &
        Z55,S44,Z78_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e3b,d1b|m1bm2b)*Z78_1(e1be2b|m3b,d1b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e3,d1,m1,m2)*Z78_1(e1,e2,m3,d1)", &
        Z55,S44,Z78_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e1b,d1b|m1bm3b)*Z78_1(e2be3b|m2b,d1b)*-1.
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e1,d1,m1,m3)*Z78_1(e2,e3,m2,d1)", &
        Z55,S44,Z78_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e2b,d1b|m1bm3b)*Z78_1(e1be3b|m2b,d1b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e2,d1,m1,m3)*Z78_1(e1,e3,m2,d1)", &
        Z55,S44,Z78_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e3b,d1b|m1bm3b)*Z78_1(e1be2b|m2b,d1b)*-1.
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e3,d1,m1,m3)*Z78_1(e1,e2,m2,d1)", &
        Z55,S44,Z78_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e1b,d1b|m2bm3b)*Z78_1(e2be3b|m1b,d1b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e1,d1,m2,m3)*Z78_1(e2,e3,m1,d1)", &
        Z55,S44,Z78_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e2b,d1b|m2bm3b)*Z78_1(e1be3b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e2,d1,m2,m3)*Z78_1(e1,e3,m1,d1)", &
        Z55,S44,Z78_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e3b,d1b|m2bm3b)*Z78_1(e1be2b|m1b,d1b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e3,d1,m2,m3)*Z78_1(e1,e2,m1,d1)", &
        Z55,S44,Z78_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z78_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nvir_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z78_1,"Z78_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z78_1,'ZERO')
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e1b,d1b|m1bm2b)*Z78_1(e2be3b|m3b,d1b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e1,d1,m1,m2)*Z78_1(e2,e3,m3,d1)", &
        Z55,S44,Z78_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e2b,d1b|m1bm2b)*Z78_1(e1be3b|m3b,d1b)*-1.
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e2,d1,m1,m2)*Z78_1(e1,e3,m3,d1)", &
        Z55,S44,Z78_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e3b,d1b|m1bm2b)*Z78_1(e1be2b|m3b,d1b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e3,d1,m1,m2)*Z78_1(e1,e2,m3,d1)", &
        Z55,S44,Z78_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e1b,d1b|m1bm3b)*Z78_1(e2be3b|m2b,d1b)*-1.
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e1,d1,m1,m3)*Z78_1(e2,e3,m2,d1)", &
        Z55,S44,Z78_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e2b,d1b|m1bm3b)*Z78_1(e1be3b|m2b,d1b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e2,d1,m1,m3)*Z78_1(e1,e3,m2,d1)", &
        Z55,S44,Z78_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e3b,d1b|m1bm3b)*Z78_1(e1be2b|m2b,d1b)*-1.
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e3,d1,m1,m3)*Z78_1(e1,e2,m2,d1)", &
        Z55,S44,Z78_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e1b,d1b|m2bm3b)*Z78_1(e2be3b|m1b,d1b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e1,d1,m2,m3)*Z78_1(e2,e3,m1,d1)", &
        Z55,S44,Z78_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e2b,d1b|m2bm3b)*Z78_1(e1be3b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e2,d1,m2,m3)*Z78_1(e1,e3,m1,d1)", &
        Z55,S44,Z78_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e3b,d1b|m2bm3b)*Z78_1(e1be2b|m1b,d1b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e3,d1,m2,m3)*Z78_1(e1,e2,m1,d1)", &
        Z55,S44,Z78_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z78_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z93_2,"Z93_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z93_2,'ZERO')
!   original expression: Z93_2(l1bl2b|m1b,d1b)+=H24(l1bl2b|d1b,d2b)*S43(d2b|m1b)
    ierr=exatns_tensor_contract("Z93_2(l1,l2,m1,d1)+=H24(l1,l2,d1,d2)*S43(d2,m1)", &
        Z93_2,H24,S43,prefactor=(1.0d0,0.0d0))
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nvir_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z78_1,"Z78_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z78_1,'ZERO')
!   original expression: Z78_1(e1be2b|m1b,d1b)+=S44(e1be2b|l1bl2b)*Z93_2(l1bl2b|m1b,d1b)
    ierr=exatns_tensor_contract("Z78_1(e1,e2,m1,d1)+=S44(e1,e2,l1,l2)*Z93_2(l1,l2,m1,d1)", &
        Z78_1,S44,Z93_2,prefactor=(0.5d0,0.0d0))
    ierr=exatns_tensor_destroy(Z93_2)
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e1b,d1b|m1bm2b)*Z78_1(e2be3b|m3b,d1b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e1,d1,m1,m2)*Z78_1(e2,e3,m3,d1)", &
        Z55,S44,Z78_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e2b,d1b|m1bm2b)*Z78_1(e1be3b|m3b,d1b)*-1.
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e2,d1,m1,m2)*Z78_1(e1,e3,m3,d1)", &
        Z55,S44,Z78_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e3b,d1b|m1bm2b)*Z78_1(e1be2b|m3b,d1b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e3,d1,m1,m2)*Z78_1(e1,e2,m3,d1)", &
        Z55,S44,Z78_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e1b,d1b|m1bm3b)*Z78_1(e2be3b|m2b,d1b)*-1.
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e1,d1,m1,m3)*Z78_1(e2,e3,m2,d1)", &
        Z55,S44,Z78_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e2b,d1b|m1bm3b)*Z78_1(e1be3b|m2b,d1b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e2,d1,m1,m3)*Z78_1(e1,e3,m2,d1)", &
        Z55,S44,Z78_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e3b,d1b|m1bm3b)*Z78_1(e1be2b|m2b,d1b)*-1.
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e3,d1,m1,m3)*Z78_1(e1,e2,m2,d1)", &
        Z55,S44,Z78_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e1b,d1b|m2bm3b)*Z78_1(e2be3b|m1b,d1b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e1,d1,m2,m3)*Z78_1(e2,e3,m1,d1)", &
        Z55,S44,Z78_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e2b,d1b|m2bm3b)*Z78_1(e1be3b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e2,d1,m2,m3)*Z78_1(e1,e3,m1,d1)", &
        Z55,S44,Z78_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e3b,d1b|m2bm3b)*Z78_1(e1be2b|m1b,d1b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e3,d1,m2,m3)*Z78_1(e1,e2,m1,d1)", &
        Z55,S44,Z78_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z78_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nvir_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z78_1,"Z78_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z78_1,'ZERO')
!   original expression: Z78_1(e1be2b|m1b,d1b)+=S44(e1be2b|l1bl2b)*H25(l1bl2b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z78_1(e1,e2,m1,d1)+=S44(e1,e2,l1,l2)*H25(l1,l2,m1,d1)", &
        Z78_1,S44,H25,prefactor=(-0.5d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e1b,d1b|m1bm2b)*Z78_1(e2be3b|m3b,d1b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e1,d1,m1,m2)*Z78_1(e2,e3,m3,d1)", &
        Z55,S44,Z78_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e2b,d1b|m1bm2b)*Z78_1(e1be3b|m3b,d1b)*-1.
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e2,d1,m1,m2)*Z78_1(e1,e3,m3,d1)", &
        Z55,S44,Z78_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e3b,d1b|m1bm2b)*Z78_1(e1be2b|m3b,d1b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e3,d1,m1,m2)*Z78_1(e1,e2,m3,d1)", &
        Z55,S44,Z78_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e1b,d1b|m1bm3b)*Z78_1(e2be3b|m2b,d1b)*-1.
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e1,d1,m1,m3)*Z78_1(e2,e3,m2,d1)", &
        Z55,S44,Z78_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e2b,d1b|m1bm3b)*Z78_1(e1be3b|m2b,d1b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e2,d1,m1,m3)*Z78_1(e1,e3,m2,d1)", &
        Z55,S44,Z78_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e3b,d1b|m1bm3b)*Z78_1(e1be2b|m2b,d1b)*-1.
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e3,d1,m1,m3)*Z78_1(e1,e2,m2,d1)", &
        Z55,S44,Z78_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e1b,d1b|m2bm3b)*Z78_1(e2be3b|m1b,d1b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e1,d1,m2,m3)*Z78_1(e2,e3,m1,d1)", &
        Z55,S44,Z78_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e2b,d1b|m2bm3b)*Z78_1(e1be3b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e2,d1,m2,m3)*Z78_1(e1,e3,m1,d1)", &
        Z55,S44,Z78_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e3b,d1b|m2bm3b)*Z78_1(e1be2b|m1b,d1b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e3,d1,m2,m3)*Z78_1(e1,e2,m1,d1)", &
        Z55,S44,Z78_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z78_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nvir_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z78_1,"Z78_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z78_1,'ZERO')
!   original expression: Z78_1(e1be2b|m1b,d1b)+=S45(e1be2b,d2b|m1b,l1bl2b)*H24(l1bl2b|d1b,d2b)
    ierr=exatns_tensor_contract("Z78_1(e1,e2,m1,d1)+=S45(e1,e2,d2,m1,l1,l2)*H24(l1,l2,d1,d2)", &
        Z78_1,S45,H24,prefactor=(0.5d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e1b,d1b|m1bm2b)*Z78_1(e2be3b|m3b,d1b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e1,d1,m1,m2)*Z78_1(e2,e3,m3,d1)", &
        Z55,S44,Z78_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e2b,d1b|m1bm2b)*Z78_1(e1be3b|m3b,d1b)*-1.
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e2,d1,m1,m2)*Z78_1(e1,e3,m3,d1)", &
        Z55,S44,Z78_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e3b,d1b|m1bm2b)*Z78_1(e1be2b|m3b,d1b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e3,d1,m1,m2)*Z78_1(e1,e2,m3,d1)", &
        Z55,S44,Z78_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e1b,d1b|m1bm3b)*Z78_1(e2be3b|m2b,d1b)*-1.
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e1,d1,m1,m3)*Z78_1(e2,e3,m2,d1)", &
        Z55,S44,Z78_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e2b,d1b|m1bm3b)*Z78_1(e1be3b|m2b,d1b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e2,d1,m1,m3)*Z78_1(e1,e3,m2,d1)", &
        Z55,S44,Z78_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e3b,d1b|m1bm3b)*Z78_1(e1be2b|m2b,d1b)*-1.
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e3,d1,m1,m3)*Z78_1(e1,e2,m2,d1)", &
        Z55,S44,Z78_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e1b,d1b|m2bm3b)*Z78_1(e2be3b|m1b,d1b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e1,d1,m2,m3)*Z78_1(e2,e3,m1,d1)", &
        Z55,S44,Z78_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e2b,d1b|m2bm3b)*Z78_1(e1be3b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e2,d1,m2,m3)*Z78_1(e1,e3,m1,d1)", &
        Z55,S44,Z78_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e3b,d1b|m2bm3b)*Z78_1(e1be2b|m1b,d1b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e3,d1,m2,m3)*Z78_1(e1,e2,m1,d1)", &
        Z55,S44,Z78_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z78_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nvir_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z78_1,"Z78_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z78_1,'ZERO')
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e1b,d1b|m1bm2b)*Z78_1(e2be3b|m3b,d1b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e1,d1,m1,m2)*Z78_1(e2,e3,m3,d1)", &
        Z55,S44,Z78_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e2b,d1b|m1bm2b)*Z78_1(e1be3b|m3b,d1b)*-1.
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e2,d1,m1,m2)*Z78_1(e1,e3,m3,d1)", &
        Z55,S44,Z78_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e3b,d1b|m1bm2b)*Z78_1(e1be2b|m3b,d1b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e3,d1,m1,m2)*Z78_1(e1,e2,m3,d1)", &
        Z55,S44,Z78_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e1b,d1b|m1bm3b)*Z78_1(e2be3b|m2b,d1b)*-1.
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e1,d1,m1,m3)*Z78_1(e2,e3,m2,d1)", &
        Z55,S44,Z78_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e2b,d1b|m1bm3b)*Z78_1(e1be3b|m2b,d1b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e2,d1,m1,m3)*Z78_1(e1,e3,m2,d1)", &
        Z55,S44,Z78_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e3b,d1b|m1bm3b)*Z78_1(e1be2b|m2b,d1b)*-1.
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e3,d1,m1,m3)*Z78_1(e1,e2,m2,d1)", &
        Z55,S44,Z78_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e1b,d1b|m2bm3b)*Z78_1(e2be3b|m1b,d1b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e1,d1,m2,m3)*Z78_1(e2,e3,m1,d1)", &
        Z55,S44,Z78_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e2b,d1b|m2bm3b)*Z78_1(e1be3b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e2,d1,m2,m3)*Z78_1(e1,e3,m1,d1)", &
        Z55,S44,Z78_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e3b,d1b|m2bm3b)*Z78_1(e1be2b|m1b,d1b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e3,d1,m2,m3)*Z78_1(e1,e2,m1,d1)", &
        Z55,S44,Z78_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z78_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z71_1,"Z71_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z71_1,'ZERO')
!   original expression: Z71_1(e1b,l1b|m1bm2b)+=H17(e1b,l1b|d1bd2b)*S44(d1bd2b|m1bm2b)
    ierr=exatns_tensor_contract("Z71_1(e1,l1,m1,m2)+=H17(e1,l1,d1,d2)*S44(d1,d2,m1,m2)", &
        Z71_1,H17,S44,prefactor=(0.5d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e1be2b|m1b,l1b)*Z71_1(e3b,l1b|m2bm3b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e1,e2,m1,l1)*Z71_1(e3,l1,m2,m3)", &
        Z55,S44,Z71_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e1be3b|m1b,l1b)*Z71_1(e2b,l1b|m2bm3b)*-1.
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e1,e3,m1,l1)*Z71_1(e2,l1,m2,m3)", &
        Z55,S44,Z71_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e2be3b|m1b,l1b)*Z71_1(e1b,l1b|m2bm3b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e2,e3,m1,l1)*Z71_1(e1,l1,m2,m3)", &
        Z55,S44,Z71_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e1be2b|m2b,l1b)*Z71_1(e3b,l1b|m1bm3b)*-1.
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e1,e2,m2,l1)*Z71_1(e3,l1,m1,m3)", &
        Z55,S44,Z71_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e1be3b|m2b,l1b)*Z71_1(e2b,l1b|m1bm3b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e1,e3,m2,l1)*Z71_1(e2,l1,m1,m3)", &
        Z55,S44,Z71_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e2be3b|m2b,l1b)*Z71_1(e1b,l1b|m1bm3b)*-1.
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e2,e3,m2,l1)*Z71_1(e1,l1,m1,m3)", &
        Z55,S44,Z71_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e1be2b|m3b,l1b)*Z71_1(e3b,l1b|m1bm2b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e1,e2,m3,l1)*Z71_1(e3,l1,m1,m2)", &
        Z55,S44,Z71_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e1be3b|m3b,l1b)*Z71_1(e2b,l1b|m1bm2b)*-1.
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e1,e3,m3,l1)*Z71_1(e2,l1,m1,m2)", &
        Z55,S44,Z71_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e2be3b|m3b,l1b)*Z71_1(e1b,l1b|m1bm2b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e2,e3,m3,l1)*Z71_1(e1,l1,m1,m2)", &
        Z55,S44,Z71_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z71_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z71_1,"Z71_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z71_1,'ZERO')
!   original expression: Z71_1(e1b,l1b|m1bm2b)+=H26(l1b,l2b|m1bm2b)*S43(e1b|l2b)
    ierr=exatns_tensor_contract("Z71_1(e1,l1,m1,m2)+=H26(l1,l2,m1,m2)*S43(e1,l2)", &
        Z71_1,H26,S43,prefactor=(1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e1be2b|m1b,l1b)*Z71_1(e3b,l1b|m2bm3b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e1,e2,m1,l1)*Z71_1(e3,l1,m2,m3)", &
        Z55,S44,Z71_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e1be3b|m1b,l1b)*Z71_1(e2b,l1b|m2bm3b)*-1.
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e1,e3,m1,l1)*Z71_1(e2,l1,m2,m3)", &
        Z55,S44,Z71_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e2be3b|m1b,l1b)*Z71_1(e1b,l1b|m2bm3b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e2,e3,m1,l1)*Z71_1(e1,l1,m2,m3)", &
        Z55,S44,Z71_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e1be2b|m2b,l1b)*Z71_1(e3b,l1b|m1bm3b)*-1.
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e1,e2,m2,l1)*Z71_1(e3,l1,m1,m3)", &
        Z55,S44,Z71_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e1be3b|m2b,l1b)*Z71_1(e2b,l1b|m1bm3b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e1,e3,m2,l1)*Z71_1(e2,l1,m1,m3)", &
        Z55,S44,Z71_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e2be3b|m2b,l1b)*Z71_1(e1b,l1b|m1bm3b)*-1.
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e2,e3,m2,l1)*Z71_1(e1,l1,m1,m3)", &
        Z55,S44,Z71_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e1be2b|m3b,l1b)*Z71_1(e3b,l1b|m1bm2b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e1,e2,m3,l1)*Z71_1(e3,l1,m1,m2)", &
        Z55,S44,Z71_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e1be3b|m3b,l1b)*Z71_1(e2b,l1b|m1bm2b)*-1.
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e1,e3,m3,l1)*Z71_1(e2,l1,m1,m2)", &
        Z55,S44,Z71_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e2be3b|m3b,l1b)*Z71_1(e1b,l1b|m1bm2b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e2,e3,m3,l1)*Z71_1(e1,l1,m1,m2)", &
        Z55,S44,Z71_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z71_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z71_1,"Z71_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z71_1,'ZERO')
!   original expression: Z71_1(e1b,l1b|m1bm2b)+=H18(e1b,l1b|m1b,d1b)*S43(d1b|m2b)
    ierr=exatns_tensor_contract("Z71_1(e1,l1,m1,m2)+=H18(e1,l1,m1,d1)*S43(d1,m2)", &
        Z71_1,H18,S43,prefactor=(1.0d0,0.0d0))
!   original expression: Z71_1(e1b,l1b|m1bm2b)+=H18(e1b,l1b|m2b,d1b)*S43(d1b|m1b)*-1.
    ierr=exatns_tensor_contract("Z71_1(e1,l1,m1,m2)+=H18(e1,l1,m2,d1)*S43(d1,m1)", &
        Z71_1,H18,S43,prefactor=(-1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e1be2b|m1b,l1b)*Z71_1(e3b,l1b|m2bm3b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e1,e2,m1,l1)*Z71_1(e3,l1,m2,m3)", &
        Z55,S44,Z71_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e1be3b|m1b,l1b)*Z71_1(e2b,l1b|m2bm3b)*-1.
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e1,e3,m1,l1)*Z71_1(e2,l1,m2,m3)", &
        Z55,S44,Z71_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e2be3b|m1b,l1b)*Z71_1(e1b,l1b|m2bm3b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e2,e3,m1,l1)*Z71_1(e1,l1,m2,m3)", &
        Z55,S44,Z71_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e1be2b|m2b,l1b)*Z71_1(e3b,l1b|m1bm3b)*-1.
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e1,e2,m2,l1)*Z71_1(e3,l1,m1,m3)", &
        Z55,S44,Z71_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e1be3b|m2b,l1b)*Z71_1(e2b,l1b|m1bm3b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e1,e3,m2,l1)*Z71_1(e2,l1,m1,m3)", &
        Z55,S44,Z71_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e2be3b|m2b,l1b)*Z71_1(e1b,l1b|m1bm3b)*-1.
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e2,e3,m2,l1)*Z71_1(e1,l1,m1,m3)", &
        Z55,S44,Z71_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e1be2b|m3b,l1b)*Z71_1(e3b,l1b|m1bm2b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e1,e2,m3,l1)*Z71_1(e3,l1,m1,m2)", &
        Z55,S44,Z71_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e1be3b|m3b,l1b)*Z71_1(e2b,l1b|m1bm2b)*-1.
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e1,e3,m3,l1)*Z71_1(e2,l1,m1,m2)", &
        Z55,S44,Z71_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e2be3b|m3b,l1b)*Z71_1(e1b,l1b|m1bm2b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e2,e3,m3,l1)*Z71_1(e1,l1,m1,m2)", &
        Z55,S44,Z71_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z71_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z91_2,"Z91_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z91_2,'ZERO')
!   original expression: Z91_2(l1b,l2b|m1bm2b)+=H24(l1b,l2b|d1bd2b)*S44(d1bd2b|m1bm2b)
    ierr=exatns_tensor_contract("Z91_2(l1,l2,m1,m2)+=H24(l1,l2,d1,d2)*S44(d1,d2,m1,m2)", &
        Z91_2,H24,S44,prefactor=(0.5d0,0.0d0))
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z71_1,"Z71_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z71_1,'ZERO')
!   original expression: Z71_1(e1b,l1b|m1bm2b)+=S43(e1b|l2b)*Z91_2(l1b,l2b|m1bm2b)
    ierr=exatns_tensor_contract("Z71_1(e1,l1,m1,m2)+=S43(e1,l2)*Z91_2(l1,l2,m1,m2)", &
        Z71_1,S43,Z91_2,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z91_2)
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e1be2b|m1b,l1b)*Z71_1(e3b,l1b|m2bm3b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e1,e2,m1,l1)*Z71_1(e3,l1,m2,m3)", &
        Z55,S44,Z71_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e1be3b|m1b,l1b)*Z71_1(e2b,l1b|m2bm3b)*-1.
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e1,e3,m1,l1)*Z71_1(e2,l1,m2,m3)", &
        Z55,S44,Z71_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e2be3b|m1b,l1b)*Z71_1(e1b,l1b|m2bm3b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e2,e3,m1,l1)*Z71_1(e1,l1,m2,m3)", &
        Z55,S44,Z71_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e1be2b|m2b,l1b)*Z71_1(e3b,l1b|m1bm3b)*-1.
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e1,e2,m2,l1)*Z71_1(e3,l1,m1,m3)", &
        Z55,S44,Z71_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e1be3b|m2b,l1b)*Z71_1(e2b,l1b|m1bm3b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e1,e3,m2,l1)*Z71_1(e2,l1,m1,m3)", &
        Z55,S44,Z71_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e2be3b|m2b,l1b)*Z71_1(e1b,l1b|m1bm3b)*-1.
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e2,e3,m2,l1)*Z71_1(e1,l1,m1,m3)", &
        Z55,S44,Z71_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e1be2b|m3b,l1b)*Z71_1(e3b,l1b|m1bm2b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e1,e2,m3,l1)*Z71_1(e3,l1,m1,m2)", &
        Z55,S44,Z71_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e1be3b|m3b,l1b)*Z71_1(e2b,l1b|m1bm2b)*-1.
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e1,e3,m3,l1)*Z71_1(e2,l1,m1,m2)", &
        Z55,S44,Z71_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e2be3b|m3b,l1b)*Z71_1(e1b,l1b|m1bm2b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e2,e3,m3,l1)*Z71_1(e1,l1,m1,m2)", &
        Z55,S44,Z71_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z71_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z91_2,"Z91_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z91_2,'ZERO')
!   original expression: Z91_2(l1b,l2b|m1bm2b)+=H25(l1b,l2b|m1b,d1b)*S43(d1b|m2b)
    ierr=exatns_tensor_contract("Z91_2(l1,l2,m1,m2)+=H25(l1,l2,m1,d1)*S43(d1,m2)", &
        Z91_2,H25,S43,prefactor=(1.0d0,0.0d0))
!   original expression: Z91_2(l1b,l2b|m1bm2b)+=H25(l1b,l2b|m2b,d1b)*S43(d1b|m1b)*-1.
    ierr=exatns_tensor_contract("Z91_2(l1,l2,m1,m2)+=H25(l1,l2,m2,d1)*S43(d1,m1)", &
        Z91_2,H25,S43,prefactor=(-1.0d0,0.0d0))
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z71_1,"Z71_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z71_1,'ZERO')
!   original expression: Z71_1(e1b,l1b|m1bm2b)+=S43(e1b|l2b)*Z91_2(l1b,l2b|m1bm2b)
    ierr=exatns_tensor_contract("Z71_1(e1,l1,m1,m2)+=S43(e1,l2)*Z91_2(l1,l2,m1,m2)", &
        Z71_1,S43,Z91_2,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z91_2)
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e1be2b|m1b,l1b)*Z71_1(e3b,l1b|m2bm3b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e1,e2,m1,l1)*Z71_1(e3,l1,m2,m3)", &
        Z55,S44,Z71_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e1be3b|m1b,l1b)*Z71_1(e2b,l1b|m2bm3b)*-1.
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e1,e3,m1,l1)*Z71_1(e2,l1,m2,m3)", &
        Z55,S44,Z71_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e2be3b|m1b,l1b)*Z71_1(e1b,l1b|m2bm3b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e2,e3,m1,l1)*Z71_1(e1,l1,m2,m3)", &
        Z55,S44,Z71_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e1be2b|m2b,l1b)*Z71_1(e3b,l1b|m1bm3b)*-1.
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e1,e2,m2,l1)*Z71_1(e3,l1,m1,m3)", &
        Z55,S44,Z71_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e1be3b|m2b,l1b)*Z71_1(e2b,l1b|m1bm3b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e1,e3,m2,l1)*Z71_1(e2,l1,m1,m3)", &
        Z55,S44,Z71_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e2be3b|m2b,l1b)*Z71_1(e1b,l1b|m1bm3b)*-1.
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e2,e3,m2,l1)*Z71_1(e1,l1,m1,m3)", &
        Z55,S44,Z71_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e1be2b|m3b,l1b)*Z71_1(e3b,l1b|m1bm2b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e1,e2,m3,l1)*Z71_1(e3,l1,m1,m2)", &
        Z55,S44,Z71_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e1be3b|m3b,l1b)*Z71_1(e2b,l1b|m1bm2b)*-1.
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e1,e3,m3,l1)*Z71_1(e2,l1,m1,m2)", &
        Z55,S44,Z71_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e2be3b|m3b,l1b)*Z71_1(e1b,l1b|m1bm2b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e2,e3,m3,l1)*Z71_1(e1,l1,m1,m2)", &
        Z55,S44,Z71_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z71_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z110_3,"Z110_3",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z110_3,'ZERO')
!   original expression: Z110_3(l1b,l2b|m1b,d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|m1b)*0.5
    ierr=exatns_tensor_contract("Z110_3(l1,l2,m1,d1)+=H24(l1,l2,d1,d2)*S43(d2,m1)", &
        Z110_3,H24,S43,prefactor=(0.5d0,0.0d0))
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z91_2,"Z91_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z91_2,'ZERO')
!   original expression: Z91_2(l1b,l2b|m1bm2b)+=S43(d1b|m1b)*Z110_3(l1b,l2b|m2b,d1b)
    ierr=exatns_tensor_contract("Z91_2(l1,l2,m1,m2)+=S43(d1,m1)*Z110_3(l1,l2,m2,d1)", &
        Z91_2,S43,Z110_3,prefactor=(1.0d0,0.0d0))
!   original expression: Z91_2(l1b,l2b|m1bm2b)+=S43(d1b|m2b)*Z110_3(l1b,l2b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z91_2(l1,l2,m1,m2)+=S43(d1,m2)*Z110_3(l1,l2,m1,d1)", &
        Z91_2,S43,Z110_3,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z110_3)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z71_1,"Z71_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z71_1,'ZERO')
!   original expression: Z71_1(e1b,l1b|m1bm2b)+=S43(e1b|l2b)*Z91_2(l1b,l2b|m1bm2b)
    ierr=exatns_tensor_contract("Z71_1(e1,l1,m1,m2)+=S43(e1,l2)*Z91_2(l1,l2,m1,m2)", &
        Z71_1,S43,Z91_2,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z91_2)
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e1be2b|m1b,l1b)*Z71_1(e3b,l1b|m2bm3b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e1,e2,m1,l1)*Z71_1(e3,l1,m2,m3)", &
        Z55,S44,Z71_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e1be3b|m1b,l1b)*Z71_1(e2b,l1b|m2bm3b)*-1.
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e1,e3,m1,l1)*Z71_1(e2,l1,m2,m3)", &
        Z55,S44,Z71_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e2be3b|m1b,l1b)*Z71_1(e1b,l1b|m2bm3b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e2,e3,m1,l1)*Z71_1(e1,l1,m2,m3)", &
        Z55,S44,Z71_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e1be2b|m2b,l1b)*Z71_1(e3b,l1b|m1bm3b)*-1.
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e1,e2,m2,l1)*Z71_1(e3,l1,m1,m3)", &
        Z55,S44,Z71_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e1be3b|m2b,l1b)*Z71_1(e2b,l1b|m1bm3b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e1,e3,m2,l1)*Z71_1(e2,l1,m1,m3)", &
        Z55,S44,Z71_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e2be3b|m2b,l1b)*Z71_1(e1b,l1b|m1bm3b)*-1.
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e2,e3,m2,l1)*Z71_1(e1,l1,m1,m3)", &
        Z55,S44,Z71_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e1be2b|m3b,l1b)*Z71_1(e3b,l1b|m1bm2b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e1,e2,m3,l1)*Z71_1(e3,l1,m1,m2)", &
        Z55,S44,Z71_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e1be3b|m3b,l1b)*Z71_1(e2b,l1b|m1bm2b)*-1.
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e1,e3,m3,l1)*Z71_1(e2,l1,m1,m2)", &
        Z55,S44,Z71_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e2be3b|m3b,l1b)*Z71_1(e1b,l1b|m1bm2b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e2,e3,m3,l1)*Z71_1(e1,l1,m1,m2)", &
        Z55,S44,Z71_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z71_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z100_2,"Z100_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z100_2,'ZERO')
!   original expression: Z100_2(e1b,l1b|m1b,d1b)+=H17(e1b,l1b|d1b,d2b)*S43(d2b|m1b)*0.5
    ierr=exatns_tensor_contract("Z100_2(e1,l1,m1,d1)+=H17(e1,l1,d1,d2)*S43(d2,m1)", &
        Z100_2,H17,S43,prefactor=(0.5d0,0.0d0))
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z71_1,"Z71_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z71_1,'ZERO')
!   original expression: Z71_1(e1b,l1b|m1bm2b)+=S43(d1b|m1b)*Z100_2(e1b,l1b|m2b,d1b)
    ierr=exatns_tensor_contract("Z71_1(e1,l1,m1,m2)+=S43(d1,m1)*Z100_2(e1,l1,m2,d1)", &
        Z71_1,S43,Z100_2,prefactor=(1.0d0,0.0d0))
!   original expression: Z71_1(e1b,l1b|m1bm2b)+=S43(d1b|m2b)*Z100_2(e1b,l1b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z71_1(e1,l1,m1,m2)+=S43(d1,m2)*Z100_2(e1,l1,m1,d1)", &
        Z71_1,S43,Z100_2,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z100_2)
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e1be2b|m1b,l1b)*Z71_1(e3b,l1b|m2bm3b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e1,e2,m1,l1)*Z71_1(e3,l1,m2,m3)", &
        Z55,S44,Z71_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e1be3b|m1b,l1b)*Z71_1(e2b,l1b|m2bm3b)*-1.
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e1,e3,m1,l1)*Z71_1(e2,l1,m2,m3)", &
        Z55,S44,Z71_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e2be3b|m1b,l1b)*Z71_1(e1b,l1b|m2bm3b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e2,e3,m1,l1)*Z71_1(e1,l1,m2,m3)", &
        Z55,S44,Z71_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e1be2b|m2b,l1b)*Z71_1(e3b,l1b|m1bm3b)*-1.
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e1,e2,m2,l1)*Z71_1(e3,l1,m1,m3)", &
        Z55,S44,Z71_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e1be3b|m2b,l1b)*Z71_1(e2b,l1b|m1bm3b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e1,e3,m2,l1)*Z71_1(e2,l1,m1,m3)", &
        Z55,S44,Z71_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e2be3b|m2b,l1b)*Z71_1(e1b,l1b|m1bm3b)*-1.
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e2,e3,m2,l1)*Z71_1(e1,l1,m1,m3)", &
        Z55,S44,Z71_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e1be2b|m3b,l1b)*Z71_1(e3b,l1b|m1bm2b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e1,e2,m3,l1)*Z71_1(e3,l1,m1,m2)", &
        Z55,S44,Z71_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e1be3b|m3b,l1b)*Z71_1(e2b,l1b|m1bm2b)*-1.
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e1,e3,m3,l1)*Z71_1(e2,l1,m1,m2)", &
        Z55,S44,Z71_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e2be3b|m3b,l1b)*Z71_1(e1b,l1b|m1bm2b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e2,e3,m3,l1)*Z71_1(e1,l1,m1,m2)", &
        Z55,S44,Z71_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z71_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nvir_id/)
    tens_root = (/nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z65_2,"Z65_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z65_2,'ZERO')
!   original expression: Z65_2(l1b|d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|l2b)
    ierr=exatns_tensor_contract("Z65_2(l1,d1)+=H24(l1,l2,d1,d2)*S43(d2,l2)", &
        Z65_2,H24,S43,prefactor=(1.0d0,0.0d0))
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z71_1,"Z71_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z71_1,'ZERO')
!   original expression: Z71_1(e1b,l1b|m1bm2b)+=S44(e1b,d1b|m1bm2b)*Z65_2(l1b|d1b)
    ierr=exatns_tensor_contract("Z71_1(e1,l1,m1,m2)+=S44(e1,d1,m1,m2)*Z65_2(l1,d1)", &
        Z71_1,S44,Z65_2,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z65_2)
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e1be2b|m1b,l1b)*Z71_1(e3b,l1b|m2bm3b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e1,e2,m1,l1)*Z71_1(e3,l1,m2,m3)", &
        Z55,S44,Z71_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e1be3b|m1b,l1b)*Z71_1(e2b,l1b|m2bm3b)*-1.
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e1,e3,m1,l1)*Z71_1(e2,l1,m2,m3)", &
        Z55,S44,Z71_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e2be3b|m1b,l1b)*Z71_1(e1b,l1b|m2bm3b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e2,e3,m1,l1)*Z71_1(e1,l1,m2,m3)", &
        Z55,S44,Z71_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e1be2b|m2b,l1b)*Z71_1(e3b,l1b|m1bm3b)*-1.
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e1,e2,m2,l1)*Z71_1(e3,l1,m1,m3)", &
        Z55,S44,Z71_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e1be3b|m2b,l1b)*Z71_1(e2b,l1b|m1bm3b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e1,e3,m2,l1)*Z71_1(e2,l1,m1,m3)", &
        Z55,S44,Z71_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e2be3b|m2b,l1b)*Z71_1(e1b,l1b|m1bm3b)*-1.
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e2,e3,m2,l1)*Z71_1(e1,l1,m1,m3)", &
        Z55,S44,Z71_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e1be2b|m3b,l1b)*Z71_1(e3b,l1b|m1bm2b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e1,e2,m3,l1)*Z71_1(e3,l1,m1,m2)", &
        Z55,S44,Z71_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e1be3b|m3b,l1b)*Z71_1(e2b,l1b|m1bm2b)*-1.
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e1,e3,m3,l1)*Z71_1(e2,l1,m1,m2)", &
        Z55,S44,Z71_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e2be3b|m3b,l1b)*Z71_1(e1b,l1b|m1bm2b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e2,e3,m3,l1)*Z71_1(e1,l1,m1,m2)", &
        Z55,S44,Z71_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z71_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nvir_id/)
    tens_root = (/nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z65_2,"Z65_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z65_2,'ZERO')
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z71_1,"Z71_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z71_1,'ZERO')
!   original expression: Z71_1(e1b,l1b|m1bm2b)+=S44(e1b,d1b|m1bm2b)*Z65_2(l1b|d1b)
    ierr=exatns_tensor_contract("Z71_1(e1,l1,m1,m2)+=S44(e1,d1,m1,m2)*Z65_2(l1,d1)", &
        Z71_1,S44,Z65_2,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z65_2)
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e1be2b|m1b,l1b)*Z71_1(e3b,l1b|m2bm3b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e1,e2,m1,l1)*Z71_1(e3,l1,m2,m3)", &
        Z55,S44,Z71_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e1be3b|m1b,l1b)*Z71_1(e2b,l1b|m2bm3b)*-1.
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e1,e3,m1,l1)*Z71_1(e2,l1,m2,m3)", &
        Z55,S44,Z71_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e2be3b|m1b,l1b)*Z71_1(e1b,l1b|m2bm3b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e2,e3,m1,l1)*Z71_1(e1,l1,m2,m3)", &
        Z55,S44,Z71_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e1be2b|m2b,l1b)*Z71_1(e3b,l1b|m1bm3b)*-1.
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e1,e2,m2,l1)*Z71_1(e3,l1,m1,m3)", &
        Z55,S44,Z71_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e1be3b|m2b,l1b)*Z71_1(e2b,l1b|m1bm3b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e1,e3,m2,l1)*Z71_1(e2,l1,m1,m3)", &
        Z55,S44,Z71_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e2be3b|m2b,l1b)*Z71_1(e1b,l1b|m1bm3b)*-1.
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e2,e3,m2,l1)*Z71_1(e1,l1,m1,m3)", &
        Z55,S44,Z71_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e1be2b|m3b,l1b)*Z71_1(e3b,l1b|m1bm2b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e1,e2,m3,l1)*Z71_1(e3,l1,m1,m2)", &
        Z55,S44,Z71_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e1be3b|m3b,l1b)*Z71_1(e2b,l1b|m1bm2b)*-1.
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e1,e3,m3,l1)*Z71_1(e2,l1,m1,m2)", &
        Z55,S44,Z71_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e2be3b|m3b,l1b)*Z71_1(e1b,l1b|m1bm2b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e2,e3,m3,l1)*Z71_1(e1,l1,m1,m2)", &
        Z55,S44,Z71_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z71_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z71_1,"Z71_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z71_1,'ZERO')
!   original expression: Z71_1(e1b,l1b|m1bm2b)+=S44(e1b,d1b|m1bm2b)*H15(l1b|d1b)
    ierr=exatns_tensor_contract("Z71_1(e1,l1,m1,m2)+=S44(e1,d1,m1,m2)*H15(l1,d1)", &
        Z71_1,S44,H15,prefactor=(1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e1be2b|m1b,l1b)*Z71_1(e3b,l1b|m2bm3b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e1,e2,m1,l1)*Z71_1(e3,l1,m2,m3)", &
        Z55,S44,Z71_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e1be3b|m1b,l1b)*Z71_1(e2b,l1b|m2bm3b)*-1.
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e1,e3,m1,l1)*Z71_1(e2,l1,m2,m3)", &
        Z55,S44,Z71_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e2be3b|m1b,l1b)*Z71_1(e1b,l1b|m2bm3b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e2,e3,m1,l1)*Z71_1(e1,l1,m2,m3)", &
        Z55,S44,Z71_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e1be2b|m2b,l1b)*Z71_1(e3b,l1b|m1bm3b)*-1.
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e1,e2,m2,l1)*Z71_1(e3,l1,m1,m3)", &
        Z55,S44,Z71_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e1be3b|m2b,l1b)*Z71_1(e2b,l1b|m1bm3b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e1,e3,m2,l1)*Z71_1(e2,l1,m1,m3)", &
        Z55,S44,Z71_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e2be3b|m2b,l1b)*Z71_1(e1b,l1b|m1bm3b)*-1.
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e2,e3,m2,l1)*Z71_1(e1,l1,m1,m3)", &
        Z55,S44,Z71_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e1be2b|m3b,l1b)*Z71_1(e3b,l1b|m1bm2b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e1,e2,m3,l1)*Z71_1(e3,l1,m1,m2)", &
        Z55,S44,Z71_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e1be3b|m3b,l1b)*Z71_1(e2b,l1b|m1bm2b)*-1.
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e1,e3,m3,l1)*Z71_1(e2,l1,m1,m2)", &
        Z55,S44,Z71_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e2be3b|m3b,l1b)*Z71_1(e1b,l1b|m1bm2b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e2,e3,m3,l1)*Z71_1(e1,l1,m1,m2)", &
        Z55,S44,Z71_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z71_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z110_2,"Z110_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z110_2,'ZERO')
!   original expression: Z110_2(l1b,l2b|m1b,d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|m1b)*-1.
    ierr=exatns_tensor_contract("Z110_2(l1,l2,m1,d1)+=H24(l1,l2,d1,d2)*S43(d2,m1)", &
        Z110_2,H24,S43,prefactor=(-1.0d0,0.0d0))
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z71_1,"Z71_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z71_1,'ZERO')
!   original expression: Z71_1(e1b,l1b|m1bm2b)+=S44(e1b,d1b|m1b,l2b)*Z110_2(l1b,l2b|m2b,d1b)
    ierr=exatns_tensor_contract("Z71_1(e1,l1,m1,m2)+=S44(e1,d1,m1,l2)*Z110_2(l1,l2,m2,d1)", &
        Z71_1,S44,Z110_2,prefactor=(1.0d0,0.0d0))
!   original expression: Z71_1(e1b,l1b|m1bm2b)+=S44(e1b,d1b|m2b,l2b)*Z110_2(l1b,l2b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z71_1(e1,l1,m1,m2)+=S44(e1,d1,m2,l2)*Z110_2(l1,l2,m1,d1)", &
        Z71_1,S44,Z110_2,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z110_2)
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e1be2b|m1b,l1b)*Z71_1(e3b,l1b|m2bm3b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e1,e2,m1,l1)*Z71_1(e3,l1,m2,m3)", &
        Z55,S44,Z71_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e1be3b|m1b,l1b)*Z71_1(e2b,l1b|m2bm3b)*-1.
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e1,e3,m1,l1)*Z71_1(e2,l1,m2,m3)", &
        Z55,S44,Z71_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e2be3b|m1b,l1b)*Z71_1(e1b,l1b|m2bm3b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e2,e3,m1,l1)*Z71_1(e1,l1,m2,m3)", &
        Z55,S44,Z71_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e1be2b|m2b,l1b)*Z71_1(e3b,l1b|m1bm3b)*-1.
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e1,e2,m2,l1)*Z71_1(e3,l1,m1,m3)", &
        Z55,S44,Z71_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e1be3b|m2b,l1b)*Z71_1(e2b,l1b|m1bm3b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e1,e3,m2,l1)*Z71_1(e2,l1,m1,m3)", &
        Z55,S44,Z71_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e2be3b|m2b,l1b)*Z71_1(e1b,l1b|m1bm3b)*-1.
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e2,e3,m2,l1)*Z71_1(e1,l1,m1,m3)", &
        Z55,S44,Z71_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e1be2b|m3b,l1b)*Z71_1(e3b,l1b|m1bm2b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e1,e2,m3,l1)*Z71_1(e3,l1,m1,m2)", &
        Z55,S44,Z71_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e1be3b|m3b,l1b)*Z71_1(e2b,l1b|m1bm2b)*-1.
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e1,e3,m3,l1)*Z71_1(e2,l1,m1,m2)", &
        Z55,S44,Z71_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e2be3b|m3b,l1b)*Z71_1(e1b,l1b|m1bm2b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e2,e3,m3,l1)*Z71_1(e1,l1,m1,m2)", &
        Z55,S44,Z71_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z71_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z71_1,"Z71_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z71_1,'ZERO')
!   original expression: Z71_1(e1b,l1b|m1bm2b)+=S44(e1b,d1b|m1b,l2b)*H25(l1b,l2b|m2b,d1b)
    ierr=exatns_tensor_contract("Z71_1(e1,l1,m1,m2)+=S44(e1,d1,m1,l2)*H25(l1,l2,m2,d1)", &
        Z71_1,S44,H25,prefactor=(1.0d0,0.0d0))
!   original expression: Z71_1(e1b,l1b|m1bm2b)+=S44(e1b,d1b|m2b,l2b)*H25(l1b,l2b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z71_1(e1,l1,m1,m2)+=S44(e1,d1,m2,l2)*H25(l1,l2,m1,d1)", &
        Z71_1,S44,H25,prefactor=(-1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e1be2b|m1b,l1b)*Z71_1(e3b,l1b|m2bm3b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e1,e2,m1,l1)*Z71_1(e3,l1,m2,m3)", &
        Z55,S44,Z71_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e1be3b|m1b,l1b)*Z71_1(e2b,l1b|m2bm3b)*-1.
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e1,e3,m1,l1)*Z71_1(e2,l1,m2,m3)", &
        Z55,S44,Z71_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e2be3b|m1b,l1b)*Z71_1(e1b,l1b|m2bm3b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e2,e3,m1,l1)*Z71_1(e1,l1,m2,m3)", &
        Z55,S44,Z71_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e1be2b|m2b,l1b)*Z71_1(e3b,l1b|m1bm3b)*-1.
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e1,e2,m2,l1)*Z71_1(e3,l1,m1,m3)", &
        Z55,S44,Z71_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e1be3b|m2b,l1b)*Z71_1(e2b,l1b|m1bm3b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e1,e3,m2,l1)*Z71_1(e2,l1,m1,m3)", &
        Z55,S44,Z71_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e2be3b|m2b,l1b)*Z71_1(e1b,l1b|m1bm3b)*-1.
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e2,e3,m2,l1)*Z71_1(e1,l1,m1,m3)", &
        Z55,S44,Z71_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e1be2b|m3b,l1b)*Z71_1(e3b,l1b|m1bm2b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e1,e2,m3,l1)*Z71_1(e3,l1,m1,m2)", &
        Z55,S44,Z71_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e1be3b|m3b,l1b)*Z71_1(e2b,l1b|m1bm2b)*-1.
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e1,e3,m3,l1)*Z71_1(e2,l1,m1,m2)", &
        Z55,S44,Z71_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e2be3b|m3b,l1b)*Z71_1(e1b,l1b|m1bm2b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e2,e3,m3,l1)*Z71_1(e1,l1,m1,m2)", &
        Z55,S44,Z71_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z71_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z71_1,"Z71_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z71_1,'ZERO')
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e1be2b|m1b,l1b)*Z71_1(e3b,l1b|m2bm3b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e1,e2,m1,l1)*Z71_1(e3,l1,m2,m3)", &
        Z55,S44,Z71_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e1be3b|m1b,l1b)*Z71_1(e2b,l1b|m2bm3b)*-1.
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e1,e3,m1,l1)*Z71_1(e2,l1,m2,m3)", &
        Z55,S44,Z71_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e2be3b|m1b,l1b)*Z71_1(e1b,l1b|m2bm3b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e2,e3,m1,l1)*Z71_1(e1,l1,m2,m3)", &
        Z55,S44,Z71_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e1be2b|m2b,l1b)*Z71_1(e3b,l1b|m1bm3b)*-1.
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e1,e2,m2,l1)*Z71_1(e3,l1,m1,m3)", &
        Z55,S44,Z71_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e1be3b|m2b,l1b)*Z71_1(e2b,l1b|m1bm3b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e1,e3,m2,l1)*Z71_1(e2,l1,m1,m3)", &
        Z55,S44,Z71_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e2be3b|m2b,l1b)*Z71_1(e1b,l1b|m1bm3b)*-1.
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e2,e3,m2,l1)*Z71_1(e1,l1,m1,m3)", &
        Z55,S44,Z71_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e1be2b|m3b,l1b)*Z71_1(e3b,l1b|m1bm2b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e1,e2,m3,l1)*Z71_1(e3,l1,m1,m2)", &
        Z55,S44,Z71_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e1be3b|m3b,l1b)*Z71_1(e2b,l1b|m1bm2b)*-1.
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e1,e3,m3,l1)*Z71_1(e2,l1,m1,m2)", &
        Z55,S44,Z71_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e2be3b|m3b,l1b)*Z71_1(e1b,l1b|m1bm2b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e2,e3,m3,l1)*Z71_1(e1,l1,m1,m2)", &
        Z55,S44,Z71_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z71_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z71_1,"Z71_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z71_1,'ZERO')
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e1be2b|m1b,l1b)*Z71_1(e3b,l1b|m2bm3b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e1,e2,m1,l1)*Z71_1(e3,l1,m2,m3)", &
        Z55,S44,Z71_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e1be3b|m1b,l1b)*Z71_1(e2b,l1b|m2bm3b)*-1.
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e1,e3,m1,l1)*Z71_1(e2,l1,m2,m3)", &
        Z55,S44,Z71_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e2be3b|m1b,l1b)*Z71_1(e1b,l1b|m2bm3b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e2,e3,m1,l1)*Z71_1(e1,l1,m2,m3)", &
        Z55,S44,Z71_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e1be2b|m2b,l1b)*Z71_1(e3b,l1b|m1bm3b)*-1.
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e1,e2,m2,l1)*Z71_1(e3,l1,m1,m3)", &
        Z55,S44,Z71_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e1be3b|m2b,l1b)*Z71_1(e2b,l1b|m1bm3b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e1,e3,m2,l1)*Z71_1(e2,l1,m1,m3)", &
        Z55,S44,Z71_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e2be3b|m2b,l1b)*Z71_1(e1b,l1b|m1bm3b)*-1.
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e2,e3,m2,l1)*Z71_1(e1,l1,m1,m3)", &
        Z55,S44,Z71_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e1be2b|m3b,l1b)*Z71_1(e3b,l1b|m1bm2b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e1,e2,m3,l1)*Z71_1(e3,l1,m1,m2)", &
        Z55,S44,Z71_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e1be3b|m3b,l1b)*Z71_1(e2b,l1b|m1bm2b)*-1.
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e1,e3,m3,l1)*Z71_1(e2,l1,m1,m2)", &
        Z55,S44,Z71_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e2be3b|m3b,l1b)*Z71_1(e1b,l1b|m1bm2b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e2,e3,m3,l1)*Z71_1(e1,l1,m1,m2)", &
        Z55,S44,Z71_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z71_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z71_1,"Z71_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z71_1,'ZERO')
!   original expression: Z71_1(e1b,l1b|m1bm2b)+=S45(e1b,d1bd2b|m1bm2b,l2b)*H24(l1b,l2b|d1bd2b)
    ierr=exatns_tensor_contract("Z71_1(e1,l1,m1,m2)+=S45(e1,d1,d2,m1,m2,l2)*H24(l1,l2,d1,d2)", &
        Z71_1,S45,H24,prefactor=(0.5d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e1be2b|m1b,l1b)*Z71_1(e3b,l1b|m2bm3b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e1,e2,m1,l1)*Z71_1(e3,l1,m2,m3)", &
        Z55,S44,Z71_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e1be3b|m1b,l1b)*Z71_1(e2b,l1b|m2bm3b)*-1.
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e1,e3,m1,l1)*Z71_1(e2,l1,m2,m3)", &
        Z55,S44,Z71_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e2be3b|m1b,l1b)*Z71_1(e1b,l1b|m2bm3b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e2,e3,m1,l1)*Z71_1(e1,l1,m2,m3)", &
        Z55,S44,Z71_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e1be2b|m2b,l1b)*Z71_1(e3b,l1b|m1bm3b)*-1.
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e1,e2,m2,l1)*Z71_1(e3,l1,m1,m3)", &
        Z55,S44,Z71_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e1be3b|m2b,l1b)*Z71_1(e2b,l1b|m1bm3b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e1,e3,m2,l1)*Z71_1(e2,l1,m1,m3)", &
        Z55,S44,Z71_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e2be3b|m2b,l1b)*Z71_1(e1b,l1b|m1bm3b)*-1.
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e2,e3,m2,l1)*Z71_1(e1,l1,m1,m3)", &
        Z55,S44,Z71_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e1be2b|m3b,l1b)*Z71_1(e3b,l1b|m1bm2b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e1,e2,m3,l1)*Z71_1(e3,l1,m1,m2)", &
        Z55,S44,Z71_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e1be3b|m3b,l1b)*Z71_1(e2b,l1b|m1bm2b)*-1.
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e1,e3,m3,l1)*Z71_1(e2,l1,m1,m2)", &
        Z55,S44,Z71_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e2be3b|m3b,l1b)*Z71_1(e1b,l1b|m1bm2b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e2,e3,m3,l1)*Z71_1(e1,l1,m1,m2)", &
        Z55,S44,Z71_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z71_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z71_1,"Z71_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z71_1,'ZERO')
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e1be2b|m1b,l1b)*Z71_1(e3b,l1b|m2bm3b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e1,e2,m1,l1)*Z71_1(e3,l1,m2,m3)", &
        Z55,S44,Z71_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e1be3b|m1b,l1b)*Z71_1(e2b,l1b|m2bm3b)*-1.
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e1,e3,m1,l1)*Z71_1(e2,l1,m2,m3)", &
        Z55,S44,Z71_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e2be3b|m1b,l1b)*Z71_1(e1b,l1b|m2bm3b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e2,e3,m1,l1)*Z71_1(e1,l1,m2,m3)", &
        Z55,S44,Z71_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e1be2b|m2b,l1b)*Z71_1(e3b,l1b|m1bm3b)*-1.
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e1,e2,m2,l1)*Z71_1(e3,l1,m1,m3)", &
        Z55,S44,Z71_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e1be3b|m2b,l1b)*Z71_1(e2b,l1b|m1bm3b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e1,e3,m2,l1)*Z71_1(e2,l1,m1,m3)", &
        Z55,S44,Z71_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e2be3b|m2b,l1b)*Z71_1(e1b,l1b|m1bm3b)*-1.
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e2,e3,m2,l1)*Z71_1(e1,l1,m1,m3)", &
        Z55,S44,Z71_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e1be2b|m3b,l1b)*Z71_1(e3b,l1b|m1bm2b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e1,e2,m3,l1)*Z71_1(e3,l1,m1,m2)", &
        Z55,S44,Z71_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e1be3b|m3b,l1b)*Z71_1(e2b,l1b|m1bm2b)*-1.
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e1,e3,m3,l1)*Z71_1(e2,l1,m1,m2)", &
        Z55,S44,Z71_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e2be3b|m3b,l1b)*Z71_1(e1b,l1b|m1bm2b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e2,e3,m3,l1)*Z71_1(e1,l1,m1,m2)", &
        Z55,S44,Z71_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z71_1)
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e1be2b|m1b,l1b)*H19(e3b,l1b|m2bm3b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e1,e2,m1,l1)*H19(e3,l1,m2,m3)", &
        Z55,S44,H19,prefactor=(1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e1be3b|m1b,l1b)*H19(e2b,l1b|m2bm3b)*-1.
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e1,e3,m1,l1)*H19(e2,l1,m2,m3)", &
        Z55,S44,H19,prefactor=(-1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e2be3b|m1b,l1b)*H19(e1b,l1b|m2bm3b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e2,e3,m1,l1)*H19(e1,l1,m2,m3)", &
        Z55,S44,H19,prefactor=(1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e1be2b|m2b,l1b)*H19(e3b,l1b|m1bm3b)*-1.
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e1,e2,m2,l1)*H19(e3,l1,m1,m3)", &
        Z55,S44,H19,prefactor=(-1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e1be3b|m2b,l1b)*H19(e2b,l1b|m1bm3b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e1,e3,m2,l1)*H19(e2,l1,m1,m3)", &
        Z55,S44,H19,prefactor=(1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e2be3b|m2b,l1b)*H19(e1b,l1b|m1bm3b)*-1.
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e2,e3,m2,l1)*H19(e1,l1,m1,m3)", &
        Z55,S44,H19,prefactor=(-1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e1be2b|m3b,l1b)*H19(e3b,l1b|m1bm2b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e1,e2,m3,l1)*H19(e3,l1,m1,m2)", &
        Z55,S44,H19,prefactor=(1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e1be3b|m3b,l1b)*H19(e2b,l1b|m1bm2b)*-1.
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e1,e3,m3,l1)*H19(e2,l1,m1,m2)", &
        Z55,S44,H19,prefactor=(-1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S44(e2be3b|m3b,l1b)*H19(e1b,l1b|m1bm2b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S44(e2,e3,m3,l1)*H19(e1,l1,m1,m2)", &
        Z55,S44,H19,prefactor=(1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S45(e1b,d1bd2b|m1bm2bm3b)*H3(e2be3b|d1bd2b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S45(e1,d1,d2,m1,m2,m3)*H3(e2,e3,d1,d2)", &
        Z55,S45,H3,prefactor=(0.5d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S45(e2b,d1bd2b|m1bm2bm3b)*H3(e1be3b|d1bd2b)*-1.
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S45(e2,d1,d2,m1,m2,m3)*H3(e1,e3,d1,d2)", &
        Z55,S45,H3,prefactor=(-0.5d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S45(e3b,d1bd2b|m1bm2bm3b)*H3(e1be2b|d1bd2b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S45(e3,d1,d2,m1,m2,m3)*H3(e1,e2,d1,d2)", &
        Z55,S45,H3,prefactor=(0.5d0,0.0d0))
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nvir_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root/)
    ierr=exatns_tensor_create(Z62_1,"Z62_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z62_1,'ZERO')
!   original expression: Z62_1(e1b|d1b)+=H17(e1b,l1b|d1b,d2b)*S43(d2b|l1b)
    ierr=exatns_tensor_contract("Z62_1(e1,d1)+=H17(e1,l1,d1,d2)*S43(d2,l1)", &
        Z62_1,H17,S43,prefactor=(1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S45(e1be2b,d1b|m1bm2bm3b)*Z62_1(e3b|d1b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S45(e1,e2,d1,m1,m2,m3)*Z62_1(e3,d1)", &
        Z55,S45,Z62_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S45(e1be3b,d1b|m1bm2bm3b)*Z62_1(e2b|d1b)*-1.
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S45(e1,e3,d1,m1,m2,m3)*Z62_1(e2,d1)", &
        Z55,S45,Z62_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S45(e2be3b,d1b|m1bm2bm3b)*Z62_1(e1b|d1b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S45(e2,e3,d1,m1,m2,m3)*Z62_1(e1,d1)", &
        Z55,S45,Z62_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z62_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nvir_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root/)
    ierr=exatns_tensor_create(Z62_1,"Z62_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z62_1,'ZERO')
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S45(e1be2b,d1b|m1bm2bm3b)*Z62_1(e3b|d1b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S45(e1,e2,d1,m1,m2,m3)*Z62_1(e3,d1)", &
        Z55,S45,Z62_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S45(e1be3b,d1b|m1bm2bm3b)*Z62_1(e2b|d1b)*-1.
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S45(e1,e3,d1,m1,m2,m3)*Z62_1(e2,d1)", &
        Z55,S45,Z62_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S45(e2be3b,d1b|m1bm2bm3b)*Z62_1(e1b|d1b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S45(e2,e3,d1,m1,m2,m3)*Z62_1(e1,d1)", &
        Z55,S45,Z62_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z62_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nvir_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root/)
    ierr=exatns_tensor_create(Z62_1,"Z62_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z62_1,'ZERO')
!   original expression: Z62_1(e1b|d1b)+=S44(e1b,d2b|l1bl2b)*H24(l1bl2b|d1b,d2b)*-1.
    ierr=exatns_tensor_contract("Z62_1(e1,d1)+=S44(e1,d2,l1,l2)*H24(l1,l2,d1,d2)", &
        Z62_1,S44,H24,prefactor=(-0.5d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S45(e1be2b,d1b|m1bm2bm3b)*Z62_1(e3b|d1b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S45(e1,e2,d1,m1,m2,m3)*Z62_1(e3,d1)", &
        Z55,S45,Z62_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S45(e1be3b,d1b|m1bm2bm3b)*Z62_1(e2b|d1b)*-1.
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S45(e1,e3,d1,m1,m2,m3)*Z62_1(e2,d1)", &
        Z55,S45,Z62_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S45(e2be3b,d1b|m1bm2bm3b)*Z62_1(e1b|d1b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S45(e2,e3,d1,m1,m2,m3)*Z62_1(e1,d1)", &
        Z55,S45,Z62_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z62_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nvir_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root/)
    ierr=exatns_tensor_create(Z62_1,"Z62_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z62_1,'ZERO')
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S45(e1be2b,d1b|m1bm2bm3b)*Z62_1(e3b|d1b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S45(e1,e2,d1,m1,m2,m3)*Z62_1(e3,d1)", &
        Z55,S45,Z62_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S45(e1be3b,d1b|m1bm2bm3b)*Z62_1(e2b|d1b)*-1.
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S45(e1,e3,d1,m1,m2,m3)*Z62_1(e2,d1)", &
        Z55,S45,Z62_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S45(e2be3b,d1b|m1bm2bm3b)*Z62_1(e1b|d1b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S45(e2,e3,d1,m1,m2,m3)*Z62_1(e1,d1)", &
        Z55,S45,Z62_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z62_1)
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S45(e1be2b,d1b|m1bm2bm3b)*H1(e3b|d1b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S45(e1,e2,d1,m1,m2,m3)*H1(e3,d1)", &
        Z55,S45,H1,prefactor=(1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S45(e1be3b,d1b|m1bm2bm3b)*H1(e2b|d1b)*-1.
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S45(e1,e3,d1,m1,m2,m3)*H1(e2,d1)", &
        Z55,S45,H1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S45(e2be3b,d1b|m1bm2bm3b)*H1(e1b|d1b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S45(e2,e3,d1,m1,m2,m3)*H1(e1,d1)", &
        Z55,S45,H1,prefactor=(1.0d0,0.0d0))
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z66_1,"Z66_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z66_1,'ZERO')
!   original expression: Z66_1(l1bl2b|m1bm2b)+=H25(l1bl2b|m1b,d1b)*S43(d1b|m2b)
    ierr=exatns_tensor_contract("Z66_1(l1,l2,m1,m2)+=H25(l1,l2,m1,d1)*S43(d1,m2)", &
        Z66_1,H25,S43,prefactor=(1.0d0,0.0d0))
!   original expression: Z66_1(l1bl2b|m1bm2b)+=H25(l1bl2b|m2b,d1b)*S43(d1b|m1b)*-1.
    ierr=exatns_tensor_contract("Z66_1(l1,l2,m1,m2)+=H25(l1,l2,m2,d1)*S43(d1,m1)", &
        Z66_1,H25,S43,prefactor=(-1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S45(e1be2be3b|m1b,l1bl2b)*Z66_1(l1bl2b|m2bm3b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S45(e1,e2,e3,m1,l1,l2)*Z66_1(l1,l2,m2,m3)", &
        Z55,S45,Z66_1,prefactor=(0.5d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S45(e1be2be3b|m2b,l1bl2b)*Z66_1(l1bl2b|m1bm3b)*-1.
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S45(e1,e2,e3,m2,l1,l2)*Z66_1(l1,l2,m1,m3)", &
        Z55,S45,Z66_1,prefactor=(-0.5d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S45(e1be2be3b|m3b,l1bl2b)*Z66_1(l1bl2b|m1bm2b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S45(e1,e2,e3,m3,l1,l2)*Z66_1(l1,l2,m1,m2)", &
        Z55,S45,Z66_1,prefactor=(0.5d0,0.0d0))
    ierr=exatns_tensor_destroy(Z66_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z93_2,"Z93_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z93_2,'ZERO')
!   original expression: Z93_2(l1bl2b|m1b,d1b)+=H24(l1bl2b|d1b,d2b)*S43(d2b|m1b)*0.5
    ierr=exatns_tensor_contract("Z93_2(l1,l2,m1,d1)+=H24(l1,l2,d1,d2)*S43(d2,m1)", &
        Z93_2,H24,S43,prefactor=(0.5d0,0.0d0))
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z66_1,"Z66_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z66_1,'ZERO')
!   original expression: Z66_1(l1bl2b|m1bm2b)+=S43(d1b|m1b)*Z93_2(l1bl2b|m2b,d1b)
    ierr=exatns_tensor_contract("Z66_1(l1,l2,m1,m2)+=S43(d1,m1)*Z93_2(l1,l2,m2,d1)", &
        Z66_1,S43,Z93_2,prefactor=(1.0d0,0.0d0))
!   original expression: Z66_1(l1bl2b|m1bm2b)+=S43(d1b|m2b)*Z93_2(l1bl2b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z66_1(l1,l2,m1,m2)+=S43(d1,m2)*Z93_2(l1,l2,m1,d1)", &
        Z66_1,S43,Z93_2,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z93_2)
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S45(e1be2be3b|m1b,l1bl2b)*Z66_1(l1bl2b|m2bm3b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S45(e1,e2,e3,m1,l1,l2)*Z66_1(l1,l2,m2,m3)", &
        Z55,S45,Z66_1,prefactor=(0.5d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S45(e1be2be3b|m2b,l1bl2b)*Z66_1(l1bl2b|m1bm3b)*-1.
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S45(e1,e2,e3,m2,l1,l2)*Z66_1(l1,l2,m1,m3)", &
        Z55,S45,Z66_1,prefactor=(-0.5d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S45(e1be2be3b|m3b,l1bl2b)*Z66_1(l1bl2b|m1bm2b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S45(e1,e2,e3,m3,l1,l2)*Z66_1(l1,l2,m1,m2)", &
        Z55,S45,Z66_1,prefactor=(0.5d0,0.0d0))
    ierr=exatns_tensor_destroy(Z66_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z66_1,"Z66_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z66_1,'ZERO')
!   original expression: Z66_1(l1bl2b|m1bm2b)+=S44(d1bd2b|m1bm2b)*H24(l1bl2b|d1bd2b)
    ierr=exatns_tensor_contract("Z66_1(l1,l2,m1,m2)+=S44(d1,d2,m1,m2)*H24(l1,l2,d1,d2)", &
        Z66_1,S44,H24,prefactor=(0.5d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S45(e1be2be3b|m1b,l1bl2b)*Z66_1(l1bl2b|m2bm3b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S45(e1,e2,e3,m1,l1,l2)*Z66_1(l1,l2,m2,m3)", &
        Z55,S45,Z66_1,prefactor=(0.5d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S45(e1be2be3b|m2b,l1bl2b)*Z66_1(l1bl2b|m1bm3b)*-1.
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S45(e1,e2,e3,m2,l1,l2)*Z66_1(l1,l2,m1,m3)", &
        Z55,S45,Z66_1,prefactor=(-0.5d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S45(e1be2be3b|m3b,l1bl2b)*Z66_1(l1bl2b|m1bm2b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S45(e1,e2,e3,m3,l1,l2)*Z66_1(l1,l2,m1,m2)", &
        Z55,S45,Z66_1,prefactor=(0.5d0,0.0d0))
    ierr=exatns_tensor_destroy(Z66_1)
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S45(e1be2be3b|m1b,l1bl2b)*H26(l1bl2b|m2bm3b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S45(e1,e2,e3,m1,l1,l2)*H26(l1,l2,m2,m3)", &
        Z55,S45,H26,prefactor=(0.5d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S45(e1be2be3b|m2b,l1bl2b)*H26(l1bl2b|m1bm3b)*-1.
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S45(e1,e2,e3,m2,l1,l2)*H26(l1,l2,m1,m3)", &
        Z55,S45,H26,prefactor=(-0.5d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S45(e1be2be3b|m3b,l1bl2b)*H26(l1bl2b|m1bm2b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S45(e1,e2,e3,m3,l1,l2)*H26(l1,l2,m1,m2)", &
        Z55,S45,H26,prefactor=(0.5d0,0.0d0))
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z64_1,"Z64_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z64_1,'ZERO')
!   original expression: Z64_1(l1b|m1b)+=H25(l1b,l2b|m1b,d1b)*S43(d1b|l2b)*-1.
    ierr=exatns_tensor_contract("Z64_1(l1,m1)+=H25(l1,l2,m1,d1)*S43(d1,l2)", &
        Z64_1,H25,S43,prefactor=(-1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S45(e1be2be3b|m1bm2b,l1b)*Z64_1(l1b|m3b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S45(e1,e2,e3,m1,m2,l1)*Z64_1(l1,m3)", &
        Z55,S45,Z64_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S45(e1be2be3b|m1bm3b,l1b)*Z64_1(l1b|m2b)*-1.
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S45(e1,e2,e3,m1,m3,l1)*Z64_1(l1,m2)", &
        Z55,S45,Z64_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S45(e1be2be3b|m2bm3b,l1b)*Z64_1(l1b|m1b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S45(e1,e2,e3,m2,m3,l1)*Z64_1(l1,m1)", &
        Z55,S45,Z64_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z64_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z64_1,"Z64_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z64_1,'ZERO')
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S45(e1be2be3b|m1bm2b,l1b)*Z64_1(l1b|m3b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S45(e1,e2,e3,m1,m2,l1)*Z64_1(l1,m3)", &
        Z55,S45,Z64_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S45(e1be2be3b|m1bm3b,l1b)*Z64_1(l1b|m2b)*-1.
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S45(e1,e2,e3,m1,m3,l1)*Z64_1(l1,m2)", &
        Z55,S45,Z64_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S45(e1be2be3b|m2bm3b,l1b)*Z64_1(l1b|m1b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S45(e1,e2,e3,m2,m3,l1)*Z64_1(l1,m1)", &
        Z55,S45,Z64_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z64_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nvir_id/)
    tens_root = (/nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z65_2,"Z65_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z65_2,'ZERO')
!   original expression: Z65_2(l1b|d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|l2b)*-1.
    ierr=exatns_tensor_contract("Z65_2(l1,d1)+=H24(l1,l2,d1,d2)*S43(d2,l2)", &
        Z65_2,H24,S43,prefactor=(-1.0d0,0.0d0))
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z64_1,"Z64_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z64_1,'ZERO')
!   original expression: Z64_1(l1b|m1b)+=S43(d1b|m1b)*Z65_2(l1b|d1b)
    ierr=exatns_tensor_contract("Z64_1(l1,m1)+=S43(d1,m1)*Z65_2(l1,d1)", &
        Z64_1,S43,Z65_2,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z65_2)
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S45(e1be2be3b|m1bm2b,l1b)*Z64_1(l1b|m3b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S45(e1,e2,e3,m1,m2,l1)*Z64_1(l1,m3)", &
        Z55,S45,Z64_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S45(e1be2be3b|m1bm3b,l1b)*Z64_1(l1b|m2b)*-1.
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S45(e1,e2,e3,m1,m3,l1)*Z64_1(l1,m2)", &
        Z55,S45,Z64_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S45(e1be2be3b|m2bm3b,l1b)*Z64_1(l1b|m1b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S45(e1,e2,e3,m2,m3,l1)*Z64_1(l1,m1)", &
        Z55,S45,Z64_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z64_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nvir_id/)
    tens_root = (/nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z65_2,"Z65_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z65_2,'ZERO')
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z64_1,"Z64_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z64_1,'ZERO')
!   original expression: Z64_1(l1b|m1b)+=S43(d1b|m1b)*Z65_2(l1b|d1b)
    ierr=exatns_tensor_contract("Z64_1(l1,m1)+=S43(d1,m1)*Z65_2(l1,d1)", &
        Z64_1,S43,Z65_2,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z65_2)
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S45(e1be2be3b|m1bm2b,l1b)*Z64_1(l1b|m3b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S45(e1,e2,e3,m1,m2,l1)*Z64_1(l1,m3)", &
        Z55,S45,Z64_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S45(e1be2be3b|m1bm3b,l1b)*Z64_1(l1b|m2b)*-1.
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S45(e1,e2,e3,m1,m3,l1)*Z64_1(l1,m2)", &
        Z55,S45,Z64_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S45(e1be2be3b|m2bm3b,l1b)*Z64_1(l1b|m1b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S45(e1,e2,e3,m2,m3,l1)*Z64_1(l1,m1)", &
        Z55,S45,Z64_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z64_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z64_1,"Z64_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z64_1,'ZERO')
!   original expression: Z64_1(l1b|m1b)+=S43(d1b|m1b)*H15(l1b|d1b)*-1.
    ierr=exatns_tensor_contract("Z64_1(l1,m1)+=S43(d1,m1)*H15(l1,d1)", &
        Z64_1,S43,H15,prefactor=(-1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S45(e1be2be3b|m1bm2b,l1b)*Z64_1(l1b|m3b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S45(e1,e2,e3,m1,m2,l1)*Z64_1(l1,m3)", &
        Z55,S45,Z64_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S45(e1be2be3b|m1bm3b,l1b)*Z64_1(l1b|m2b)*-1.
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S45(e1,e2,e3,m1,m3,l1)*Z64_1(l1,m2)", &
        Z55,S45,Z64_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S45(e1be2be3b|m2bm3b,l1b)*Z64_1(l1b|m1b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S45(e1,e2,e3,m2,m3,l1)*Z64_1(l1,m1)", &
        Z55,S45,Z64_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z64_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z64_1,"Z64_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z64_1,'ZERO')
!   original expression: Z64_1(l1b|m1b)+=S44(d1bd2b|m1b,l2b)*H24(l1b,l2b|d1bd2b)*-1.
    ierr=exatns_tensor_contract("Z64_1(l1,m1)+=S44(d1,d2,m1,l2)*H24(l1,l2,d1,d2)", &
        Z64_1,S44,H24,prefactor=(-0.5d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S45(e1be2be3b|m1bm2b,l1b)*Z64_1(l1b|m3b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S45(e1,e2,e3,m1,m2,l1)*Z64_1(l1,m3)", &
        Z55,S45,Z64_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S45(e1be2be3b|m1bm3b,l1b)*Z64_1(l1b|m2b)*-1.
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S45(e1,e2,e3,m1,m3,l1)*Z64_1(l1,m2)", &
        Z55,S45,Z64_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S45(e1be2be3b|m2bm3b,l1b)*Z64_1(l1b|m1b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S45(e1,e2,e3,m2,m3,l1)*Z64_1(l1,m1)", &
        Z55,S45,Z64_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z64_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z64_1,"Z64_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z64_1,'ZERO')
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S45(e1be2be3b|m1bm2b,l1b)*Z64_1(l1b|m3b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S45(e1,e2,e3,m1,m2,l1)*Z64_1(l1,m3)", &
        Z55,S45,Z64_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S45(e1be2be3b|m1bm3b,l1b)*Z64_1(l1b|m2b)*-1.
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S45(e1,e2,e3,m1,m3,l1)*Z64_1(l1,m2)", &
        Z55,S45,Z64_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S45(e1be2be3b|m2bm3b,l1b)*Z64_1(l1b|m1b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S45(e1,e2,e3,m2,m3,l1)*Z64_1(l1,m1)", &
        Z55,S45,Z64_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z64_1)
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S45(e1be2be3b|m1bm2b,l1b)*H16(l1b|m3b)*-1.
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S45(e1,e2,e3,m1,m2,l1)*H16(l1,m3)", &
        Z55,S45,H16,prefactor=(-1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S45(e1be2be3b|m1bm3b,l1b)*H16(l1b|m2b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S45(e1,e2,e3,m1,m3,l1)*H16(l1,m2)", &
        Z55,S45,H16,prefactor=(1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S45(e1be2be3b|m2bm3b,l1b)*H16(l1b|m1b)*-1.
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S45(e1,e2,e3,m2,m3,l1)*H16(l1,m1)", &
        Z55,S45,H16,prefactor=(-1.0d0,0.0d0))
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z100_1,"Z100_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z100_1,'ZERO')
!   original expression: Z100_1(e1b,l1b|m1b,d1b)+=H17(e1b,l1b|d1b,d2b)*S43(d2b|m1b)*-1.
    ierr=exatns_tensor_contract("Z100_1(e1,l1,m1,d1)+=H17(e1,l1,d1,d2)*S43(d2,m1)", &
        Z100_1,H17,S43,prefactor=(-1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S45(e1be2b,d1b|m1bm2b,l1b)*Z100_1(e3b,l1b|m3b,d1b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S45(e1,e2,d1,m1,m2,l1)*Z100_1(e3,l1,m3,d1)", &
        Z55,S45,Z100_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S45(e1be3b,d1b|m1bm2b,l1b)*Z100_1(e2b,l1b|m3b,d1b)*-1.
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S45(e1,e3,d1,m1,m2,l1)*Z100_1(e2,l1,m3,d1)", &
        Z55,S45,Z100_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S45(e2be3b,d1b|m1bm2b,l1b)*Z100_1(e1b,l1b|m3b,d1b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S45(e2,e3,d1,m1,m2,l1)*Z100_1(e1,l1,m3,d1)", &
        Z55,S45,Z100_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S45(e1be2b,d1b|m1bm3b,l1b)*Z100_1(e3b,l1b|m2b,d1b)*-1.
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S45(e1,e2,d1,m1,m3,l1)*Z100_1(e3,l1,m2,d1)", &
        Z55,S45,Z100_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S45(e1be3b,d1b|m1bm3b,l1b)*Z100_1(e2b,l1b|m2b,d1b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S45(e1,e3,d1,m1,m3,l1)*Z100_1(e2,l1,m2,d1)", &
        Z55,S45,Z100_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S45(e2be3b,d1b|m1bm3b,l1b)*Z100_1(e1b,l1b|m2b,d1b)*-1.
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S45(e2,e3,d1,m1,m3,l1)*Z100_1(e1,l1,m2,d1)", &
        Z55,S45,Z100_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S45(e1be2b,d1b|m2bm3b,l1b)*Z100_1(e3b,l1b|m1b,d1b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S45(e1,e2,d1,m2,m3,l1)*Z100_1(e3,l1,m1,d1)", &
        Z55,S45,Z100_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S45(e1be3b,d1b|m2bm3b,l1b)*Z100_1(e2b,l1b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S45(e1,e3,d1,m2,m3,l1)*Z100_1(e2,l1,m1,d1)", &
        Z55,S45,Z100_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S45(e2be3b,d1b|m2bm3b,l1b)*Z100_1(e1b,l1b|m1b,d1b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S45(e2,e3,d1,m2,m3,l1)*Z100_1(e1,l1,m1,d1)", &
        Z55,S45,Z100_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z100_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z100_1,"Z100_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z100_1,'ZERO')
!   original expression: Z100_1(e1b,l1b|m1b,d1b)+=S44(e1b,d2b|m1b,l2b)*H24(l1b,l2b|d1b,d2b)
    ierr=exatns_tensor_contract("Z100_1(e1,l1,m1,d1)+=S44(e1,d2,m1,l2)*H24(l1,l2,d1,d2)", &
        Z100_1,S44,H24,prefactor=(1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S45(e1be2b,d1b|m1bm2b,l1b)*Z100_1(e3b,l1b|m3b,d1b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S45(e1,e2,d1,m1,m2,l1)*Z100_1(e3,l1,m3,d1)", &
        Z55,S45,Z100_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S45(e1be3b,d1b|m1bm2b,l1b)*Z100_1(e2b,l1b|m3b,d1b)*-1.
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S45(e1,e3,d1,m1,m2,l1)*Z100_1(e2,l1,m3,d1)", &
        Z55,S45,Z100_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S45(e2be3b,d1b|m1bm2b,l1b)*Z100_1(e1b,l1b|m3b,d1b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S45(e2,e3,d1,m1,m2,l1)*Z100_1(e1,l1,m3,d1)", &
        Z55,S45,Z100_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S45(e1be2b,d1b|m1bm3b,l1b)*Z100_1(e3b,l1b|m2b,d1b)*-1.
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S45(e1,e2,d1,m1,m3,l1)*Z100_1(e3,l1,m2,d1)", &
        Z55,S45,Z100_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S45(e1be3b,d1b|m1bm3b,l1b)*Z100_1(e2b,l1b|m2b,d1b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S45(e1,e3,d1,m1,m3,l1)*Z100_1(e2,l1,m2,d1)", &
        Z55,S45,Z100_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S45(e2be3b,d1b|m1bm3b,l1b)*Z100_1(e1b,l1b|m2b,d1b)*-1.
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S45(e2,e3,d1,m1,m3,l1)*Z100_1(e1,l1,m2,d1)", &
        Z55,S45,Z100_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S45(e1be2b,d1b|m2bm3b,l1b)*Z100_1(e3b,l1b|m1b,d1b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S45(e1,e2,d1,m2,m3,l1)*Z100_1(e3,l1,m1,d1)", &
        Z55,S45,Z100_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S45(e1be3b,d1b|m2bm3b,l1b)*Z100_1(e2b,l1b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S45(e1,e3,d1,m2,m3,l1)*Z100_1(e2,l1,m1,d1)", &
        Z55,S45,Z100_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S45(e2be3b,d1b|m2bm3b,l1b)*Z100_1(e1b,l1b|m1b,d1b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S45(e2,e3,d1,m2,m3,l1)*Z100_1(e1,l1,m1,d1)", &
        Z55,S45,Z100_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z100_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z100_1,"Z100_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z100_1,'ZERO')
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S45(e1be2b,d1b|m1bm2b,l1b)*Z100_1(e3b,l1b|m3b,d1b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S45(e1,e2,d1,m1,m2,l1)*Z100_1(e3,l1,m3,d1)", &
        Z55,S45,Z100_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S45(e1be3b,d1b|m1bm2b,l1b)*Z100_1(e2b,l1b|m3b,d1b)*-1.
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S45(e1,e3,d1,m1,m2,l1)*Z100_1(e2,l1,m3,d1)", &
        Z55,S45,Z100_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S45(e2be3b,d1b|m1bm2b,l1b)*Z100_1(e1b,l1b|m3b,d1b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S45(e2,e3,d1,m1,m2,l1)*Z100_1(e1,l1,m3,d1)", &
        Z55,S45,Z100_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S45(e1be2b,d1b|m1bm3b,l1b)*Z100_1(e3b,l1b|m2b,d1b)*-1.
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S45(e1,e2,d1,m1,m3,l1)*Z100_1(e3,l1,m2,d1)", &
        Z55,S45,Z100_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S45(e1be3b,d1b|m1bm3b,l1b)*Z100_1(e2b,l1b|m2b,d1b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S45(e1,e3,d1,m1,m3,l1)*Z100_1(e2,l1,m2,d1)", &
        Z55,S45,Z100_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S45(e2be3b,d1b|m1bm3b,l1b)*Z100_1(e1b,l1b|m2b,d1b)*-1.
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S45(e2,e3,d1,m1,m3,l1)*Z100_1(e1,l1,m2,d1)", &
        Z55,S45,Z100_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S45(e1be2b,d1b|m2bm3b,l1b)*Z100_1(e3b,l1b|m1b,d1b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S45(e1,e2,d1,m2,m3,l1)*Z100_1(e3,l1,m1,d1)", &
        Z55,S45,Z100_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S45(e1be3b,d1b|m2bm3b,l1b)*Z100_1(e2b,l1b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S45(e1,e3,d1,m2,m3,l1)*Z100_1(e2,l1,m1,d1)", &
        Z55,S45,Z100_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S45(e2be3b,d1b|m2bm3b,l1b)*Z100_1(e1b,l1b|m1b,d1b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S45(e2,e3,d1,m2,m3,l1)*Z100_1(e1,l1,m1,d1)", &
        Z55,S45,Z100_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z100_1)
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S45(e1be2b,d1b|m1bm2b,l1b)*H18(e3b,l1b|m3b,d1b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S45(e1,e2,d1,m1,m2,l1)*H18(e3,l1,m3,d1)", &
        Z55,S45,H18,prefactor=(1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S45(e1be3b,d1b|m1bm2b,l1b)*H18(e2b,l1b|m3b,d1b)*-1.
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S45(e1,e3,d1,m1,m2,l1)*H18(e2,l1,m3,d1)", &
        Z55,S45,H18,prefactor=(-1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S45(e2be3b,d1b|m1bm2b,l1b)*H18(e1b,l1b|m3b,d1b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S45(e2,e3,d1,m1,m2,l1)*H18(e1,l1,m3,d1)", &
        Z55,S45,H18,prefactor=(1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S45(e1be2b,d1b|m1bm3b,l1b)*H18(e3b,l1b|m2b,d1b)*-1.
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S45(e1,e2,d1,m1,m3,l1)*H18(e3,l1,m2,d1)", &
        Z55,S45,H18,prefactor=(-1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S45(e1be3b,d1b|m1bm3b,l1b)*H18(e2b,l1b|m2b,d1b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S45(e1,e3,d1,m1,m3,l1)*H18(e2,l1,m2,d1)", &
        Z55,S45,H18,prefactor=(1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S45(e2be3b,d1b|m1bm3b,l1b)*H18(e1b,l1b|m2b,d1b)*-1.
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S45(e2,e3,d1,m1,m3,l1)*H18(e1,l1,m2,d1)", &
        Z55,S45,H18,prefactor=(-1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S45(e1be2b,d1b|m2bm3b,l1b)*H18(e3b,l1b|m1b,d1b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S45(e1,e2,d1,m2,m3,l1)*H18(e3,l1,m1,d1)", &
        Z55,S45,H18,prefactor=(1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S45(e1be3b,d1b|m2bm3b,l1b)*H18(e2b,l1b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S45(e1,e3,d1,m2,m3,l1)*H18(e2,l1,m1,d1)", &
        Z55,S45,H18,prefactor=(-1.0d0,0.0d0))
!   original expression: Z55(e1be2be3b|m1bm2bm3b)+=S45(e2be3b,d1b|m2bm3b,l1b)*H18(e1b,l1b|m1b,d1b)
    ierr=exatns_tensor_contract("Z55(e1,e2,e3,m1,m2,m3)+=S45(e2,e3,d1,m2,m3,l1)*H18(e1,l1,m1,d1)", &
        Z55,S45,H18,prefactor=(1.0d0,0.0d0))
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z110_3,"Z110_3",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z110_3,'ZERO')
!   original expression: Z110_3(l1b,l2b|m1b,d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|m1b)*0.5
    ierr=exatns_tensor_contract("Z110_3(l1,l2,m1,d1)+=H24(l1,l2,d1,d2)*S43(d2,m1)", &
        Z110_3,H24,S43,prefactor=(0.5d0,0.0d0))
    ierr=exatns_tensor_destroy(Z110_3)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z100_2,"Z100_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z100_2,'ZERO')
!   original expression: Z100_2(e1b,l1b|m1b,d1b)+=H17(e1b,l1b|d1b,d2b)*S43(d2b|m1b)
    ierr=exatns_tensor_contract("Z100_2(e1,l1,m1,d1)+=H17(e1,l1,d1,d2)*S43(d2,m1)", &
        Z100_2,H17,S43,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z100_2)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z100_2,"Z100_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z100_2,'ZERO')
!   original expression: Z100_2(e1b,l1b|m1b,d1b)+=S44(e1b,d2b|m1b,l2b)*H24(l1b,l2b|d1b,d2b)*-1.
    ierr=exatns_tensor_contract("Z100_2(e1,l1,m1,d1)+=S44(e1,d2,m1,l2)*H24(l1,l2,d1,d2)", &
        Z100_2,S44,H24,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z100_2)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z100_2,"Z100_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z100_2,'ZERO')
    ierr=exatns_tensor_destroy(Z100_2)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nvir_id/)
    tens_root = (/nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z65_2,"Z65_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z65_2,'ZERO')
!   original expression: Z65_2(l1b|d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|l2b)
    ierr=exatns_tensor_contract("Z65_2(l1,d1)+=H24(l1,l2,d1,d2)*S43(d2,l2)", &
        Z65_2,H24,S43,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z65_2)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nvir_id/)
    tens_root = (/nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z65_2,"Z65_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z65_2,'ZERO')
    ierr=exatns_tensor_destroy(Z65_2)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z110_2,"Z110_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z110_2,'ZERO')
!   original expression: Z110_2(l1b,l2b|m1b,d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|m1b)*-1.
    ierr=exatns_tensor_contract("Z110_2(l1,l2,m1,d1)+=H24(l1,l2,d1,d2)*S43(d2,m1)", &
        Z110_2,H24,S43,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z110_2)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nvir_id/)
    tens_root = (/nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z65_2,"Z65_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z65_2,'ZERO')
!   original expression: Z65_2(l1b|d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|l2b)*-1.
    ierr=exatns_tensor_contract("Z65_2(l1,d1)+=H24(l1,l2,d1,d2)*S43(d2,l2)", &
        Z65_2,H24,S43,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z65_2)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nvir_id/)
    tens_root = (/nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z65_2,"Z65_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z65_2,'ZERO')
    ierr=exatns_tensor_destroy(Z65_2)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z110_2,"Z110_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z110_2,'ZERO')
!   original expression: Z110_2(l1b,l2b|m1b,d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|m1b)
    ierr=exatns_tensor_contract("Z110_2(l1,l2,m1,d1)+=H24(l1,l2,d1,d2)*S43(d2,m1)", &
        Z110_2,H24,S43,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z110_2)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nvir_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z78_1,"Z78_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z78_1,'ZERO')
!   original expression: Z78_1(e1be2b|m1b,d1b)+=H3(e1be2b|d1b,d2b)*S43(d2b|m1b)
    ierr=exatns_tensor_contract("Z78_1(e1,e2,m1,d1)+=H3(e1,e2,d1,d2)*S43(d2,m1)", &
        Z78_1,H3,S43,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z78_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nvir_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z78_1,"Z78_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z78_1,'ZERO')
!   original expression: Z78_1(e1be2b|m1b,d1b)+=H17(e1b,l1b|d1b,d2b)*S44(e2b,d2b|m1b,l1b)
    ierr=exatns_tensor_contract("Z78_1(e1,e2,m1,d1)+=H17(e1,l1,d1,d2)*S44(e2,d2,m1,l1)", &
        Z78_1,H17,S44,prefactor=(1.0d0,0.0d0))
!   original expression: Z78_1(e1be2b|m1b,d1b)+=H17(e2b,l1b|d1b,d2b)*S44(e1b,d2b|m1b,l1b)*-1.
    ierr=exatns_tensor_contract("Z78_1(e1,e2,m1,d1)+=H17(e2,l1,d1,d2)*S44(e1,d2,m1,l1)", &
        Z78_1,H17,S44,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z78_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nvir_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z78_1,"Z78_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z78_1,'ZERO')
    ierr=exatns_tensor_destroy(Z78_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z93_2,"Z93_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z93_2,'ZERO')
!   original expression: Z93_2(l1bl2b|m1b,d1b)+=H24(l1bl2b|d1b,d2b)*S43(d2b|m1b)
    ierr=exatns_tensor_contract("Z93_2(l1,l2,m1,d1)+=H24(l1,l2,d1,d2)*S43(d2,m1)", &
        Z93_2,H24,S43,prefactor=(1.0d0,0.0d0))
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nvir_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z78_1,"Z78_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z78_1,'ZERO')
!   original expression: Z78_1(e1be2b|m1b,d1b)+=S44(e1be2b|l1bl2b)*Z93_2(l1bl2b|m1b,d1b)
    ierr=exatns_tensor_contract("Z78_1(e1,e2,m1,d1)+=S44(e1,e2,l1,l2)*Z93_2(l1,l2,m1,d1)", &
        Z78_1,S44,Z93_2,prefactor=(0.5d0,0.0d0))
    ierr=exatns_tensor_destroy(Z93_2)
    ierr=exatns_tensor_destroy(Z78_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nvir_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z78_1,"Z78_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z78_1,'ZERO')
!   original expression: Z78_1(e1be2b|m1b,d1b)+=S44(e1be2b|l1bl2b)*H25(l1bl2b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z78_1(e1,e2,m1,d1)+=S44(e1,e2,l1,l2)*H25(l1,l2,m1,d1)", &
        Z78_1,S44,H25,prefactor=(-0.5d0,0.0d0))
    ierr=exatns_tensor_destroy(Z78_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nvir_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z78_1,"Z78_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z78_1,'ZERO')
!   original expression: Z78_1(e1be2b|m1b,d1b)+=S45(e1be2b,d2b|m1b,l1bl2b)*H24(l1bl2b|d1b,d2b)
    ierr=exatns_tensor_contract("Z78_1(e1,e2,m1,d1)+=S45(e1,e2,d2,m1,l1,l2)*H24(l1,l2,d1,d2)", &
        Z78_1,S45,H24,prefactor=(0.5d0,0.0d0))
    ierr=exatns_tensor_destroy(Z78_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nvir_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z78_1,"Z78_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z78_1,'ZERO')
    ierr=exatns_tensor_destroy(Z78_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z71_1,"Z71_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z71_1,'ZERO')
!   original expression: Z71_1(e1b,l1b|m1bm2b)+=H17(e1b,l1b|d1bd2b)*S44(d1bd2b|m1bm2b)
    ierr=exatns_tensor_contract("Z71_1(e1,l1,m1,m2)+=H17(e1,l1,d1,d2)*S44(d1,d2,m1,m2)", &
        Z71_1,H17,S44,prefactor=(0.5d0,0.0d0))
    ierr=exatns_tensor_destroy(Z71_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z71_1,"Z71_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z71_1,'ZERO')
!   original expression: Z71_1(e1b,l1b|m1bm2b)+=H26(l1b,l2b|m1bm2b)*S43(e1b|l2b)
    ierr=exatns_tensor_contract("Z71_1(e1,l1,m1,m2)+=H26(l1,l2,m1,m2)*S43(e1,l2)", &
        Z71_1,H26,S43,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z71_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z71_1,"Z71_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z71_1,'ZERO')
!   original expression: Z71_1(e1b,l1b|m1bm2b)+=H18(e1b,l1b|m1b,d1b)*S43(d1b|m2b)
    ierr=exatns_tensor_contract("Z71_1(e1,l1,m1,m2)+=H18(e1,l1,m1,d1)*S43(d1,m2)", &
        Z71_1,H18,S43,prefactor=(1.0d0,0.0d0))
!   original expression: Z71_1(e1b,l1b|m1bm2b)+=H18(e1b,l1b|m2b,d1b)*S43(d1b|m1b)*-1.
    ierr=exatns_tensor_contract("Z71_1(e1,l1,m1,m2)+=H18(e1,l1,m2,d1)*S43(d1,m1)", &
        Z71_1,H18,S43,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z71_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z91_2,"Z91_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z91_2,'ZERO')
!   original expression: Z91_2(l1b,l2b|m1bm2b)+=H24(l1b,l2b|d1bd2b)*S44(d1bd2b|m1bm2b)
    ierr=exatns_tensor_contract("Z91_2(l1,l2,m1,m2)+=H24(l1,l2,d1,d2)*S44(d1,d2,m1,m2)", &
        Z91_2,H24,S44,prefactor=(0.5d0,0.0d0))
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z71_1,"Z71_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z71_1,'ZERO')
!   original expression: Z71_1(e1b,l1b|m1bm2b)+=S43(e1b|l2b)*Z91_2(l1b,l2b|m1bm2b)
    ierr=exatns_tensor_contract("Z71_1(e1,l1,m1,m2)+=S43(e1,l2)*Z91_2(l1,l2,m1,m2)", &
        Z71_1,S43,Z91_2,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z91_2)
    ierr=exatns_tensor_destroy(Z71_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z91_2,"Z91_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z91_2,'ZERO')
!   original expression: Z91_2(l1b,l2b|m1bm2b)+=H25(l1b,l2b|m1b,d1b)*S43(d1b|m2b)
    ierr=exatns_tensor_contract("Z91_2(l1,l2,m1,m2)+=H25(l1,l2,m1,d1)*S43(d1,m2)", &
        Z91_2,H25,S43,prefactor=(1.0d0,0.0d0))
!   original expression: Z91_2(l1b,l2b|m1bm2b)+=H25(l1b,l2b|m2b,d1b)*S43(d1b|m1b)*-1.
    ierr=exatns_tensor_contract("Z91_2(l1,l2,m1,m2)+=H25(l1,l2,m2,d1)*S43(d1,m1)", &
        Z91_2,H25,S43,prefactor=(-1.0d0,0.0d0))
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z71_1,"Z71_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z71_1,'ZERO')
!   original expression: Z71_1(e1b,l1b|m1bm2b)+=S43(e1b|l2b)*Z91_2(l1b,l2b|m1bm2b)
    ierr=exatns_tensor_contract("Z71_1(e1,l1,m1,m2)+=S43(e1,l2)*Z91_2(l1,l2,m1,m2)", &
        Z71_1,S43,Z91_2,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z91_2)
    ierr=exatns_tensor_destroy(Z71_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z110_3,"Z110_3",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z110_3,'ZERO')
!   original expression: Z110_3(l1b,l2b|m1b,d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|m1b)*0.5
    ierr=exatns_tensor_contract("Z110_3(l1,l2,m1,d1)+=H24(l1,l2,d1,d2)*S43(d2,m1)", &
        Z110_3,H24,S43,prefactor=(0.5d0,0.0d0))
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z91_2,"Z91_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z91_2,'ZERO')
!   original expression: Z91_2(l1b,l2b|m1bm2b)+=S43(d1b|m1b)*Z110_3(l1b,l2b|m2b,d1b)
    ierr=exatns_tensor_contract("Z91_2(l1,l2,m1,m2)+=S43(d1,m1)*Z110_3(l1,l2,m2,d1)", &
        Z91_2,S43,Z110_3,prefactor=(1.0d0,0.0d0))
!   original expression: Z91_2(l1b,l2b|m1bm2b)+=S43(d1b|m2b)*Z110_3(l1b,l2b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z91_2(l1,l2,m1,m2)+=S43(d1,m2)*Z110_3(l1,l2,m1,d1)", &
        Z91_2,S43,Z110_3,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z110_3)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z71_1,"Z71_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z71_1,'ZERO')
!   original expression: Z71_1(e1b,l1b|m1bm2b)+=S43(e1b|l2b)*Z91_2(l1b,l2b|m1bm2b)
    ierr=exatns_tensor_contract("Z71_1(e1,l1,m1,m2)+=S43(e1,l2)*Z91_2(l1,l2,m1,m2)", &
        Z71_1,S43,Z91_2,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z91_2)
    ierr=exatns_tensor_destroy(Z71_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z100_2,"Z100_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z100_2,'ZERO')
!   original expression: Z100_2(e1b,l1b|m1b,d1b)+=H17(e1b,l1b|d1b,d2b)*S43(d2b|m1b)*0.5
    ierr=exatns_tensor_contract("Z100_2(e1,l1,m1,d1)+=H17(e1,l1,d1,d2)*S43(d2,m1)", &
        Z100_2,H17,S43,prefactor=(0.5d0,0.0d0))
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z71_1,"Z71_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z71_1,'ZERO')
!   original expression: Z71_1(e1b,l1b|m1bm2b)+=S43(d1b|m1b)*Z100_2(e1b,l1b|m2b,d1b)
    ierr=exatns_tensor_contract("Z71_1(e1,l1,m1,m2)+=S43(d1,m1)*Z100_2(e1,l1,m2,d1)", &
        Z71_1,S43,Z100_2,prefactor=(1.0d0,0.0d0))
!   original expression: Z71_1(e1b,l1b|m1bm2b)+=S43(d1b|m2b)*Z100_2(e1b,l1b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z71_1(e1,l1,m1,m2)+=S43(d1,m2)*Z100_2(e1,l1,m1,d1)", &
        Z71_1,S43,Z100_2,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z100_2)
    ierr=exatns_tensor_destroy(Z71_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nvir_id/)
    tens_root = (/nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z65_2,"Z65_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z65_2,'ZERO')
!   original expression: Z65_2(l1b|d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|l2b)
    ierr=exatns_tensor_contract("Z65_2(l1,d1)+=H24(l1,l2,d1,d2)*S43(d2,l2)", &
        Z65_2,H24,S43,prefactor=(1.0d0,0.0d0))
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z71_1,"Z71_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z71_1,'ZERO')
!   original expression: Z71_1(e1b,l1b|m1bm2b)+=S44(e1b,d1b|m1bm2b)*Z65_2(l1b|d1b)
    ierr=exatns_tensor_contract("Z71_1(e1,l1,m1,m2)+=S44(e1,d1,m1,m2)*Z65_2(l1,d1)", &
        Z71_1,S44,Z65_2,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z65_2)
    ierr=exatns_tensor_destroy(Z71_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nvir_id/)
    tens_root = (/nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z65_2,"Z65_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z65_2,'ZERO')
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z71_1,"Z71_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z71_1,'ZERO')
!   original expression: Z71_1(e1b,l1b|m1bm2b)+=S44(e1b,d1b|m1bm2b)*Z65_2(l1b|d1b)
    ierr=exatns_tensor_contract("Z71_1(e1,l1,m1,m2)+=S44(e1,d1,m1,m2)*Z65_2(l1,d1)", &
        Z71_1,S44,Z65_2,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z65_2)
    ierr=exatns_tensor_destroy(Z71_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z71_1,"Z71_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z71_1,'ZERO')
!   original expression: Z71_1(e1b,l1b|m1bm2b)+=S44(e1b,d1b|m1bm2b)*H15(l1b|d1b)
    ierr=exatns_tensor_contract("Z71_1(e1,l1,m1,m2)+=S44(e1,d1,m1,m2)*H15(l1,d1)", &
        Z71_1,S44,H15,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z71_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z110_2,"Z110_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z110_2,'ZERO')
!   original expression: Z110_2(l1b,l2b|m1b,d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|m1b)*-1.
    ierr=exatns_tensor_contract("Z110_2(l1,l2,m1,d1)+=H24(l1,l2,d1,d2)*S43(d2,m1)", &
        Z110_2,H24,S43,prefactor=(-1.0d0,0.0d0))
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z71_1,"Z71_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z71_1,'ZERO')
!   original expression: Z71_1(e1b,l1b|m1bm2b)+=S44(e1b,d1b|m1b,l2b)*Z110_2(l1b,l2b|m2b,d1b)
    ierr=exatns_tensor_contract("Z71_1(e1,l1,m1,m2)+=S44(e1,d1,m1,l2)*Z110_2(l1,l2,m2,d1)", &
        Z71_1,S44,Z110_2,prefactor=(1.0d0,0.0d0))
!   original expression: Z71_1(e1b,l1b|m1bm2b)+=S44(e1b,d1b|m2b,l2b)*Z110_2(l1b,l2b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z71_1(e1,l1,m1,m2)+=S44(e1,d1,m2,l2)*Z110_2(l1,l2,m1,d1)", &
        Z71_1,S44,Z110_2,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z110_2)
    ierr=exatns_tensor_destroy(Z71_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z71_1,"Z71_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z71_1,'ZERO')
!   original expression: Z71_1(e1b,l1b|m1bm2b)+=S44(e1b,d1b|m1b,l2b)*H25(l1b,l2b|m2b,d1b)
    ierr=exatns_tensor_contract("Z71_1(e1,l1,m1,m2)+=S44(e1,d1,m1,l2)*H25(l1,l2,m2,d1)", &
        Z71_1,S44,H25,prefactor=(1.0d0,0.0d0))
!   original expression: Z71_1(e1b,l1b|m1bm2b)+=S44(e1b,d1b|m2b,l2b)*H25(l1b,l2b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z71_1(e1,l1,m1,m2)+=S44(e1,d1,m2,l2)*H25(l1,l2,m1,d1)", &
        Z71_1,S44,H25,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z71_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z71_1,"Z71_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z71_1,'ZERO')
    ierr=exatns_tensor_destroy(Z71_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z71_1,"Z71_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z71_1,'ZERO')
    ierr=exatns_tensor_destroy(Z71_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z71_1,"Z71_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z71_1,'ZERO')
!   original expression: Z71_1(e1b,l1b|m1bm2b)+=S45(e1b,d1bd2b|m1bm2b,l2b)*H24(l1b,l2b|d1bd2b)
    ierr=exatns_tensor_contract("Z71_1(e1,l1,m1,m2)+=S45(e1,d1,d2,m1,m2,l2)*H24(l1,l2,d1,d2)", &
        Z71_1,S45,H24,prefactor=(0.5d0,0.0d0))
    ierr=exatns_tensor_destroy(Z71_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z71_1,"Z71_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z71_1,'ZERO')
    ierr=exatns_tensor_destroy(Z71_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nvir_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root/)
    ierr=exatns_tensor_create(Z62_1,"Z62_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z62_1,'ZERO')
!   original expression: Z62_1(e1b|d1b)+=H17(e1b,l1b|d1b,d2b)*S43(d2b|l1b)
    ierr=exatns_tensor_contract("Z62_1(e1,d1)+=H17(e1,l1,d1,d2)*S43(d2,l1)", &
        Z62_1,H17,S43,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z62_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nvir_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root/)
    ierr=exatns_tensor_create(Z62_1,"Z62_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z62_1,'ZERO')
    ierr=exatns_tensor_destroy(Z62_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nvir_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root/)
    ierr=exatns_tensor_create(Z62_1,"Z62_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z62_1,'ZERO')
!   original expression: Z62_1(e1b|d1b)+=S44(e1b,d2b|l1bl2b)*H24(l1bl2b|d1b,d2b)*-1.
    ierr=exatns_tensor_contract("Z62_1(e1,d1)+=S44(e1,d2,l1,l2)*H24(l1,l2,d1,d2)", &
        Z62_1,S44,H24,prefactor=(-0.5d0,0.0d0))
    ierr=exatns_tensor_destroy(Z62_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nvir_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root/)
    ierr=exatns_tensor_create(Z62_1,"Z62_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z62_1,'ZERO')
    ierr=exatns_tensor_destroy(Z62_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z66_1,"Z66_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z66_1,'ZERO')
!   original expression: Z66_1(l1bl2b|m1bm2b)+=H25(l1bl2b|m1b,d1b)*S43(d1b|m2b)
    ierr=exatns_tensor_contract("Z66_1(l1,l2,m1,m2)+=H25(l1,l2,m1,d1)*S43(d1,m2)", &
        Z66_1,H25,S43,prefactor=(1.0d0,0.0d0))
!   original expression: Z66_1(l1bl2b|m1bm2b)+=H25(l1bl2b|m2b,d1b)*S43(d1b|m1b)*-1.
    ierr=exatns_tensor_contract("Z66_1(l1,l2,m1,m2)+=H25(l1,l2,m2,d1)*S43(d1,m1)", &
        Z66_1,H25,S43,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z66_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z93_2,"Z93_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z93_2,'ZERO')
!   original expression: Z93_2(l1bl2b|m1b,d1b)+=H24(l1bl2b|d1b,d2b)*S43(d2b|m1b)*0.5
    ierr=exatns_tensor_contract("Z93_2(l1,l2,m1,d1)+=H24(l1,l2,d1,d2)*S43(d2,m1)", &
        Z93_2,H24,S43,prefactor=(0.5d0,0.0d0))
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z66_1,"Z66_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z66_1,'ZERO')
!   original expression: Z66_1(l1bl2b|m1bm2b)+=S43(d1b|m1b)*Z93_2(l1bl2b|m2b,d1b)
    ierr=exatns_tensor_contract("Z66_1(l1,l2,m1,m2)+=S43(d1,m1)*Z93_2(l1,l2,m2,d1)", &
        Z66_1,S43,Z93_2,prefactor=(1.0d0,0.0d0))
!   original expression: Z66_1(l1bl2b|m1bm2b)+=S43(d1b|m2b)*Z93_2(l1bl2b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z66_1(l1,l2,m1,m2)+=S43(d1,m2)*Z93_2(l1,l2,m1,d1)", &
        Z66_1,S43,Z93_2,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z93_2)
    ierr=exatns_tensor_destroy(Z66_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z66_1,"Z66_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z66_1,'ZERO')
!   original expression: Z66_1(l1bl2b|m1bm2b)+=S44(d1bd2b|m1bm2b)*H24(l1bl2b|d1bd2b)
    ierr=exatns_tensor_contract("Z66_1(l1,l2,m1,m2)+=S44(d1,d2,m1,m2)*H24(l1,l2,d1,d2)", &
        Z66_1,S44,H24,prefactor=(0.5d0,0.0d0))
    ierr=exatns_tensor_destroy(Z66_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z64_1,"Z64_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z64_1,'ZERO')
!   original expression: Z64_1(l1b|m1b)+=H25(l1b,l2b|m1b,d1b)*S43(d1b|l2b)*-1.
    ierr=exatns_tensor_contract("Z64_1(l1,m1)+=H25(l1,l2,m1,d1)*S43(d1,l2)", &
        Z64_1,H25,S43,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z64_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z64_1,"Z64_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z64_1,'ZERO')
    ierr=exatns_tensor_destroy(Z64_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nvir_id/)
    tens_root = (/nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z65_2,"Z65_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z65_2,'ZERO')
!   original expression: Z65_2(l1b|d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|l2b)*-1.
    ierr=exatns_tensor_contract("Z65_2(l1,d1)+=H24(l1,l2,d1,d2)*S43(d2,l2)", &
        Z65_2,H24,S43,prefactor=(-1.0d0,0.0d0))
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z64_1,"Z64_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z64_1,'ZERO')
!   original expression: Z64_1(l1b|m1b)+=S43(d1b|m1b)*Z65_2(l1b|d1b)
    ierr=exatns_tensor_contract("Z64_1(l1,m1)+=S43(d1,m1)*Z65_2(l1,d1)", &
        Z64_1,S43,Z65_2,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z65_2)
    ierr=exatns_tensor_destroy(Z64_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nvir_id/)
    tens_root = (/nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z65_2,"Z65_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z65_2,'ZERO')
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z64_1,"Z64_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z64_1,'ZERO')
!   original expression: Z64_1(l1b|m1b)+=S43(d1b|m1b)*Z65_2(l1b|d1b)
    ierr=exatns_tensor_contract("Z64_1(l1,m1)+=S43(d1,m1)*Z65_2(l1,d1)", &
        Z64_1,S43,Z65_2,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z65_2)
    ierr=exatns_tensor_destroy(Z64_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z64_1,"Z64_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z64_1,'ZERO')
!   original expression: Z64_1(l1b|m1b)+=S43(d1b|m1b)*H15(l1b|d1b)*-1.
    ierr=exatns_tensor_contract("Z64_1(l1,m1)+=S43(d1,m1)*H15(l1,d1)", &
        Z64_1,S43,H15,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z64_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z64_1,"Z64_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z64_1,'ZERO')
!   original expression: Z64_1(l1b|m1b)+=S44(d1bd2b|m1b,l2b)*H24(l1b,l2b|d1bd2b)*-1.
    ierr=exatns_tensor_contract("Z64_1(l1,m1)+=S44(d1,d2,m1,l2)*H24(l1,l2,d1,d2)", &
        Z64_1,S44,H24,prefactor=(-0.5d0,0.0d0))
    ierr=exatns_tensor_destroy(Z64_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z64_1,"Z64_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z64_1,'ZERO')
    ierr=exatns_tensor_destroy(Z64_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z100_1,"Z100_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z100_1,'ZERO')
!   original expression: Z100_1(e1b,l1b|m1b,d1b)+=H17(e1b,l1b|d1b,d2b)*S43(d2b|m1b)*-1.
    ierr=exatns_tensor_contract("Z100_1(e1,l1,m1,d1)+=H17(e1,l1,d1,d2)*S43(d2,m1)", &
        Z100_1,H17,S43,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z100_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z100_1,"Z100_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z100_1,'ZERO')
!   original expression: Z100_1(e1b,l1b|m1b,d1b)+=S44(e1b,d2b|m1b,l2b)*H24(l1b,l2b|d1b,d2b)
    ierr=exatns_tensor_contract("Z100_1(e1,l1,m1,d1)+=S44(e1,d2,m1,l2)*H24(l1,l2,d1,d2)", &
        Z100_1,S44,H24,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z100_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z100_1,"Z100_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z100_1,'ZERO')
    ierr=exatns_tensor_destroy(Z100_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nvir_id/)
    tens_root = (/nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z65_2,"Z65_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z65_2,'ZERO')
!   original expression: Z65_2(l1b|d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|l2b)*-1.
    ierr=exatns_tensor_contract("Z65_2(l1,d1)+=H24(l1,l2,d1,d2)*S43(d2,l2)", &
        Z65_2,H24,S43,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z65_2)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nvir_id/)
    tens_root = (/nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z65_2,"Z65_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z65_2,'ZERO')
    ierr=exatns_tensor_destroy(Z65_2)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z110_2,"Z110_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z110_2,'ZERO')
!   original expression: Z110_2(l1b,l2b|m1b,d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|m1b)
    ierr=exatns_tensor_contract("Z110_2(l1,l2,m1,d1)+=H24(l1,l2,d1,d2)*S43(d2,m1)", &
        Z110_2,H24,S43,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z110_2)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nvir_id/)
    tens_root = (/nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z65_2,"Z65_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z65_2,'ZERO')
!   original expression: Z65_2(l1b|d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|l2b)*-1.
    ierr=exatns_tensor_contract("Z65_2(l1,d1)+=H24(l1,l2,d1,d2)*S43(d2,l2)", &
        Z65_2,H24,S43,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z65_2)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nvir_id/)
    tens_root = (/nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z65_2,"Z65_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z65_2,'ZERO')
    ierr=exatns_tensor_destroy(Z65_2)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z110_2,"Z110_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z110_2,'ZERO')
!   original expression: Z110_2(l1b,l2b|m1b,d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|m1b)
    ierr=exatns_tensor_contract("Z110_2(l1,l2,m1,d1)+=H24(l1,l2,d1,d2)*S43(d2,m1)", &
        Z110_2,H24,S43,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z110_2)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nvir_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root/)
    ierr=exatns_tensor_create(Z62_1,"Z62_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z62_1,'ZERO')
!   original expression: Z62_1(e1b|d1b)+=H17(e1b,l1b|d1b,d2b)*S43(d2b|l1b)
    ierr=exatns_tensor_contract("Z62_1(e1,d1)+=H17(e1,l1,d1,d2)*S43(d2,l1)", &
        Z62_1,H17,S43,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z62_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nvir_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root/)
    ierr=exatns_tensor_create(Z62_1,"Z62_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z62_1,'ZERO')
    ierr=exatns_tensor_destroy(Z62_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nvir_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root/)
    ierr=exatns_tensor_create(Z62_1,"Z62_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z62_1,'ZERO')
!   original expression: Z62_1(e1b|d1b)+=S44(e1b,d2b|l1bl2b)*H24(l1bl2b|d1b,d2b)*-1.
    ierr=exatns_tensor_contract("Z62_1(e1,d1)+=S44(e1,d2,l1,l2)*H24(l1,l2,d1,d2)", &
        Z62_1,S44,H24,prefactor=(-0.5d0,0.0d0))
    ierr=exatns_tensor_destroy(Z62_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nvir_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root/)
    ierr=exatns_tensor_create(Z62_1,"Z62_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z62_1,'ZERO')
    ierr=exatns_tensor_destroy(Z62_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z64_1,"Z64_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z64_1,'ZERO')
!   original expression: Z64_1(l1b|m1b)+=H25(l1b,l2b|m1b,d1b)*S43(d1b|l2b)*-1.
    ierr=exatns_tensor_contract("Z64_1(l1,m1)+=H25(l1,l2,m1,d1)*S43(d1,l2)", &
        Z64_1,H25,S43,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z64_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z64_1,"Z64_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z64_1,'ZERO')
    ierr=exatns_tensor_destroy(Z64_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nvir_id/)
    tens_root = (/nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z65_2,"Z65_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z65_2,'ZERO')
!   original expression: Z65_2(l1b|d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|l2b)*-1.
    ierr=exatns_tensor_contract("Z65_2(l1,d1)+=H24(l1,l2,d1,d2)*S43(d2,l2)", &
        Z65_2,H24,S43,prefactor=(-1.0d0,0.0d0))
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z64_1,"Z64_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z64_1,'ZERO')
!   original expression: Z64_1(l1b|m1b)+=S43(d1b|m1b)*Z65_2(l1b|d1b)
    ierr=exatns_tensor_contract("Z64_1(l1,m1)+=S43(d1,m1)*Z65_2(l1,d1)", &
        Z64_1,S43,Z65_2,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z65_2)
    ierr=exatns_tensor_destroy(Z64_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nvir_id/)
    tens_root = (/nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z65_2,"Z65_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z65_2,'ZERO')
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z64_1,"Z64_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z64_1,'ZERO')
!   original expression: Z64_1(l1b|m1b)+=S43(d1b|m1b)*Z65_2(l1b|d1b)
    ierr=exatns_tensor_contract("Z64_1(l1,m1)+=S43(d1,m1)*Z65_2(l1,d1)", &
        Z64_1,S43,Z65_2,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z65_2)
    ierr=exatns_tensor_destroy(Z64_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z64_1,"Z64_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z64_1,'ZERO')
!   original expression: Z64_1(l1b|m1b)+=S43(d1b|m1b)*H15(l1b|d1b)*-1.
    ierr=exatns_tensor_contract("Z64_1(l1,m1)+=S43(d1,m1)*H15(l1,d1)", &
        Z64_1,S43,H15,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z64_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z64_1,"Z64_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z64_1,'ZERO')
!   original expression: Z64_1(l1b|m1b)+=S44(d1bd2b|m1b,l2b)*H24(l1b,l2b|d1bd2b)*-1.
    ierr=exatns_tensor_contract("Z64_1(l1,m1)+=S44(d1,d2,m1,l2)*H24(l1,l2,d1,d2)", &
        Z64_1,S44,H24,prefactor=(-0.5d0,0.0d0))
    ierr=exatns_tensor_destroy(Z64_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z64_1,"Z64_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z64_1,'ZERO')
    ierr=exatns_tensor_destroy(Z64_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z100_1,"Z100_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z100_1,'ZERO')
!   original expression: Z100_1(e1b,l1b|m1b,d1b)+=H17(e1b,l1b|d1b,d2b)*S43(d2b|m1b)*-1.
    ierr=exatns_tensor_contract("Z100_1(e1,l1,m1,d1)+=H17(e1,l1,d1,d2)*S43(d2,m1)", &
        Z100_1,H17,S43,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z100_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z100_1,"Z100_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z100_1,'ZERO')
!   original expression: Z100_1(e1b,l1b|m1b,d1b)+=S44(e1b,d2b|m1b,l2b)*H24(l1b,l2b|d1b,d2b)
    ierr=exatns_tensor_contract("Z100_1(e1,l1,m1,d1)+=S44(e1,d2,m1,l2)*H24(l1,l2,d1,d2)", &
        Z100_1,S44,H24,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z100_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z100_1,"Z100_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z100_1,'ZERO')
    ierr=exatns_tensor_destroy(Z100_1)



    ierr=exatns_tensor_destroy(one_tensor)
end subroutine generic_exatensor_codegen_call
