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
    S46, &
    Z57, &
    Z58, &
    Z59, &
    Z60, &
    Z61)


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
    type(tens_rcrsv_t), intent(inout) :: S46    !       VVVVOOOO
    type(tens_rcrsv_t), intent(inout) :: Z57    !       UnitTensor
    type(tens_rcrsv_t), intent(inout) :: Z58    !       VO
    type(tens_rcrsv_t), intent(inout) :: Z59    !       VVOO
    type(tens_rcrsv_t), intent(inout) :: Z60    !       VVVOOO
    type(tens_rcrsv_t), intent(inout) :: Z61    !       VVVVOOOO
    type(tens_rcrsv_t) :: Z75_1    !       OV
    type(tens_rcrsv_t) :: Z74_1    !       OO
    type(tens_rcrsv_t) :: Z75_2    !       OV
    type(tens_rcrsv_t) :: Z72_1    !       VV
    type(tens_rcrsv_t) :: Z129_1    !       OOOV
    type(tens_rcrsv_t) :: Z81_1    !       VOOO
    type(tens_rcrsv_t) :: Z127_2    !       OOOO
    type(tens_rcrsv_t) :: Z165_3    !       OOOV
    type(tens_rcrsv_t) :: Z136_2    !       VOOV
    type(tens_rcrsv_t) :: Z165_2    !       OOOV
    type(tens_rcrsv_t) :: Z91_1    !       VVOV
    type(tens_rcrsv_t) :: Z76_1    !       OOOO
    type(tens_rcrsv_t) :: Z129_2    !       OOOV
    type(tens_rcrsv_t) :: Z136_1    !       VOOV
    type(tens_rcrsv_t) :: Z86_1    !       VVOOOO
    type(tens_rcrsv_t) :: Z134_2    !       VOOOOO
    type(tens_rcrsv_t) :: Z82_1    !       VOOOOO
    type(tens_rcrsv_t) :: Z169_3    !       VOOOOV
    type(tens_rcrsv_t) :: Z140_2    !       VVOOOOOO
    type(tens_rcrsv_t) :: Z93_1    !       VVVOOOOO
    type(tens_rcrsv_t) :: Z142_2    !       VVOOOV
    type(tens_rcrsv_t) :: Z87_1    !       VVOOOOOO
    type(tens_rcrsv_t) :: Z95_1    !       VVVOOV
    type(tens_rcrsv_t) :: Z92_2    !       VVVV
    type(tens_rcrsv_t) :: Z142_1    !       VVOOOV


! always define one_tensor to use in additions via calls to contraction
    ierr=exatns_tensor_create(one_tensor,"autokern_one_tensor",EXA_DATA_KIND_C8)
    ierr=exatns_tensor_init(one_tensor,ONE)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nvir_id/)
    tens_root = (/nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z75_1,"Z75_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z75_1,'ZERO')
!   original expression: Z75_1(l1b|d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|l2b)*0.5
    ierr=exatns_tensor_contract("Z75_1(l1,d1)+=H24(l1,l2,d1,d2)*S43(d2,l2)", &
        Z75_1,H24,S43,prefactor=(0.5d0,0.0d0))
!   original expression: Z57(|)+=S43(d1b|l1b)*Z75_1(l1b|d1b)
    ierr=exatns_tensor_contract("Z57()+=S43(d1,l1)*Z75_1(l1,d1)", &
        Z57,S43,Z75_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z75_1)
!   original expression: Z57(|)+=S43(d1b|l1b)*H15(l1b|d1b)
    ierr=exatns_tensor_contract("Z57()+=S43(d1,l1)*H15(l1,d1)", &
        Z57,S43,H15,prefactor=(1.0d0,0.0d0))
!   original expression: Z57(|)+=S44(d1bd2b|l1bl2b)*H24(l1bl2b|d1bd2b)
    ierr=exatns_tensor_contract("Z57()+=S44(d1,d2,l1,l2)*H24(l1,l2,d1,d2)", &
        Z57,S44,H24,prefactor=(0.25d0,0.0d0))
!   original expression: Z58(e1b|m1b)+=H2(e1b|m1b)
    ierr=exatns_tensor_contract("Z58(e1,m1)+=H2(e1,m1)*K()", &
        Z58,H2,one_tensor,prefactor=(1.0d0,0.0d0))
!   original expression: Z58(e1b|m1b)+=H1(e1b|d1b)*S43(d1b|m1b)
    ierr=exatns_tensor_contract("Z58(e1,m1)+=H1(e1,d1)*S43(d1,m1)", &
        Z58,H1,S43,prefactor=(1.0d0,0.0d0))
!   original expression: Z58(e1b|m1b)+=H17(e1b,l1b|d1bd2b)*S44(d1bd2b|m1b,l1b)
    ierr=exatns_tensor_contract("Z58(e1,m1)+=H17(e1,l1,d1,d2)*S44(d1,d2,m1,l1)", &
        Z58,H17,S44,prefactor=(0.5d0,0.0d0))
!   original expression: Z58(e1b|m1b)+=H18(e1b,l1b|m1b,d1b)*S43(d1b|l1b)
    ierr=exatns_tensor_contract("Z58(e1,m1)+=H18(e1,l1,m1,d1)*S43(d1,l1)", &
        Z58,H18,S43,prefactor=(1.0d0,0.0d0))
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z74_1,"Z74_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z74_1,'ZERO')
!   original expression: Z74_1(l1b|m1b)+=H25(l1b,l2b|m1b,d1b)*S43(d1b|l2b)*-1.
    ierr=exatns_tensor_contract("Z74_1(l1,m1)+=H25(l1,l2,m1,d1)*S43(d1,l2)", &
        Z74_1,H25,S43,prefactor=(-1.0d0,0.0d0))
!   original expression: Z58(e1b|m1b)+=S43(e1b|l1b)*Z74_1(l1b|m1b)
    ierr=exatns_tensor_contract("Z58(e1,m1)+=S43(e1,l1)*Z74_1(l1,m1)", &
        Z58,S43,Z74_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z74_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z74_1,"Z74_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z74_1,'ZERO')
!   original expression: Z58(e1b|m1b)+=S43(e1b|l1b)*Z74_1(l1b|m1b)
    ierr=exatns_tensor_contract("Z58(e1,m1)+=S43(e1,l1)*Z74_1(l1,m1)", &
        Z58,S43,Z74_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z74_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nvir_id/)
    tens_root = (/nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z75_2,"Z75_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z75_2,'ZERO')
!   original expression: Z75_2(l1b|d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|l2b)*-1.
    ierr=exatns_tensor_contract("Z75_2(l1,d1)+=H24(l1,l2,d1,d2)*S43(d2,l2)", &
        Z75_2,H24,S43,prefactor=(-1.0d0,0.0d0))
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z74_1,"Z74_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z74_1,'ZERO')
!   original expression: Z74_1(l1b|m1b)+=S43(d1b|m1b)*Z75_2(l1b|d1b)
    ierr=exatns_tensor_contract("Z74_1(l1,m1)+=S43(d1,m1)*Z75_2(l1,d1)", &
        Z74_1,S43,Z75_2,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z75_2)
!   original expression: Z58(e1b|m1b)+=S43(e1b|l1b)*Z74_1(l1b|m1b)
    ierr=exatns_tensor_contract("Z58(e1,m1)+=S43(e1,l1)*Z74_1(l1,m1)", &
        Z58,S43,Z74_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z74_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nvir_id/)
    tens_root = (/nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z75_2,"Z75_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z75_2,'ZERO')
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z74_1,"Z74_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z74_1,'ZERO')
!   original expression: Z74_1(l1b|m1b)+=S43(d1b|m1b)*Z75_2(l1b|d1b)
    ierr=exatns_tensor_contract("Z74_1(l1,m1)+=S43(d1,m1)*Z75_2(l1,d1)", &
        Z74_1,S43,Z75_2,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z75_2)
!   original expression: Z58(e1b|m1b)+=S43(e1b|l1b)*Z74_1(l1b|m1b)
    ierr=exatns_tensor_contract("Z58(e1,m1)+=S43(e1,l1)*Z74_1(l1,m1)", &
        Z58,S43,Z74_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z74_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z74_1,"Z74_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z74_1,'ZERO')
!   original expression: Z74_1(l1b|m1b)+=S43(d1b|m1b)*H15(l1b|d1b)*-1.
    ierr=exatns_tensor_contract("Z74_1(l1,m1)+=S43(d1,m1)*H15(l1,d1)", &
        Z74_1,S43,H15,prefactor=(-1.0d0,0.0d0))
!   original expression: Z58(e1b|m1b)+=S43(e1b|l1b)*Z74_1(l1b|m1b)
    ierr=exatns_tensor_contract("Z58(e1,m1)+=S43(e1,l1)*Z74_1(l1,m1)", &
        Z58,S43,Z74_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z74_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z74_1,"Z74_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z74_1,'ZERO')
!   original expression: Z74_1(l1b|m1b)+=S44(d1bd2b|m1b,l2b)*H24(l1b,l2b|d1bd2b)*-1.
    ierr=exatns_tensor_contract("Z74_1(l1,m1)+=S44(d1,d2,m1,l2)*H24(l1,l2,d1,d2)", &
        Z74_1,S44,H24,prefactor=(-0.5d0,0.0d0))
!   original expression: Z58(e1b|m1b)+=S43(e1b|l1b)*Z74_1(l1b|m1b)
    ierr=exatns_tensor_contract("Z58(e1,m1)+=S43(e1,l1)*Z74_1(l1,m1)", &
        Z58,S43,Z74_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z74_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z74_1,"Z74_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z74_1,'ZERO')
!   original expression: Z58(e1b|m1b)+=S43(e1b|l1b)*Z74_1(l1b|m1b)
    ierr=exatns_tensor_contract("Z58(e1,m1)+=S43(e1,l1)*Z74_1(l1,m1)", &
        Z58,S43,Z74_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z74_1)
!   original expression: Z58(e1b|m1b)+=S43(e1b|l1b)*H16(l1b|m1b)*-1.
    ierr=exatns_tensor_contract("Z58(e1,m1)+=S43(e1,l1)*H16(l1,m1)", &
        Z58,S43,H16,prefactor=(-1.0d0,0.0d0))
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nvir_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root/)
    ierr=exatns_tensor_create(Z72_1,"Z72_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z72_1,'ZERO')
!   original expression: Z72_1(e1b|d1b)+=H17(e1b,l1b|d1b,d2b)*S43(d2b|l1b)
    ierr=exatns_tensor_contract("Z72_1(e1,d1)+=H17(e1,l1,d1,d2)*S43(d2,l1)", &
        Z72_1,H17,S43,prefactor=(1.0d0,0.0d0))
!   original expression: Z58(e1b|m1b)+=S43(d1b|m1b)*Z72_1(e1b|d1b)
    ierr=exatns_tensor_contract("Z58(e1,m1)+=S43(d1,m1)*Z72_1(e1,d1)", &
        Z58,S43,Z72_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z72_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nvir_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root/)
    ierr=exatns_tensor_create(Z72_1,"Z72_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z72_1,'ZERO')
!   original expression: Z58(e1b|m1b)+=S43(d1b|m1b)*Z72_1(e1b|d1b)
    ierr=exatns_tensor_contract("Z58(e1,m1)+=S43(d1,m1)*Z72_1(e1,d1)", &
        Z58,S43,Z72_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z72_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z129_1,"Z129_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z129_1,'ZERO')
!   original expression: Z129_1(l1bl2b|m1b,d1b)+=H24(l1bl2b|d1b,d2b)*S43(d2b|m1b)
    ierr=exatns_tensor_contract("Z129_1(l1,l2,m1,d1)+=H24(l1,l2,d1,d2)*S43(d2,m1)", &
        Z129_1,H24,S43,prefactor=(1.0d0,0.0d0))
!   original expression: Z58(e1b|m1b)+=S44(e1b,d1b|l1bl2b)*Z129_1(l1bl2b|m1b,d1b)
    ierr=exatns_tensor_contract("Z58(e1,m1)+=S44(e1,d1,l1,l2)*Z129_1(l1,l2,m1,d1)", &
        Z58,S44,Z129_1,prefactor=(0.5d0,0.0d0))
    ierr=exatns_tensor_destroy(Z129_1)
!   original expression: Z58(e1b|m1b)+=S44(e1b,d1b|l1bl2b)*H25(l1bl2b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z58(e1,m1)+=S44(e1,d1,l1,l2)*H25(l1,l2,m1,d1)", &
        Z58,S44,H25,prefactor=(-0.5d0,0.0d0))
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nvir_id/)
    tens_root = (/nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z75_1,"Z75_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z75_1,'ZERO')
!   original expression: Z75_1(l1b|d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|l2b)
    ierr=exatns_tensor_contract("Z75_1(l1,d1)+=H24(l1,l2,d1,d2)*S43(d2,l2)", &
        Z75_1,H24,S43,prefactor=(1.0d0,0.0d0))
!   original expression: Z58(e1b|m1b)+=S44(e1b,d1b|m1b,l1b)*Z75_1(l1b|d1b)
    ierr=exatns_tensor_contract("Z58(e1,m1)+=S44(e1,d1,m1,l1)*Z75_1(l1,d1)", &
        Z58,S44,Z75_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z75_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nvir_id/)
    tens_root = (/nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z75_1,"Z75_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z75_1,'ZERO')
!   original expression: Z58(e1b|m1b)+=S44(e1b,d1b|m1b,l1b)*Z75_1(l1b|d1b)
    ierr=exatns_tensor_contract("Z58(e1,m1)+=S44(e1,d1,m1,l1)*Z75_1(l1,d1)", &
        Z58,S44,Z75_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z75_1)
!   original expression: Z58(e1b|m1b)+=S44(e1b,d1b|m1b,l1b)*H15(l1b|d1b)
    ierr=exatns_tensor_contract("Z58(e1,m1)+=S44(e1,d1,m1,l1)*H15(l1,d1)", &
        Z58,S44,H15,prefactor=(1.0d0,0.0d0))
!   original expression: Z58(e1b|m1b)+=S45(e1b,d1bd2b|m1b,l1bl2b)*H24(l1bl2b|d1bd2b)
    ierr=exatns_tensor_contract("Z58(e1,m1)+=S45(e1,d1,d2,m1,l1,l2)*H24(l1,l2,d1,d2)", &
        Z58,S45,H24,prefactor=(0.25d0,0.0d0))
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nvir_id/)
    tens_root = (/nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z75_1,"Z75_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z75_1,'ZERO')
!   original expression: Z75_1(l1b|d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|l2b)
    ierr=exatns_tensor_contract("Z75_1(l1,d1)+=H24(l1,l2,d1,d2)*S43(d2,l2)", &
        Z75_1,H24,S43,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z75_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nvir_id/)
    tens_root = (/nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z75_1,"Z75_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z75_1,'ZERO')
    ierr=exatns_tensor_destroy(Z75_1)
!   original expression: Z59(e1be2b|m1bm2b)+=H5(e1be2b|m1bm2b)
    ierr=exatns_tensor_contract("Z59(e1,e2,m1,m2)+=H5(e1,e2,m1,m2)*K()", &
        Z59,H5,one_tensor,prefactor=(1.0d0,0.0d0))
!   original expression: Z59(e1be2b|m1bm2b)+=H3(e1be2b|d1bd2b)*S44(d1bd2b|m1bm2b)
    ierr=exatns_tensor_contract("Z59(e1,e2,m1,m2)+=H3(e1,e2,d1,d2)*S44(d1,d2,m1,m2)", &
        Z59,H3,S44,prefactor=(0.5d0,0.0d0))
!   original expression: Z59(e1be2b|m1bm2b)+=H19(e1b,l1b|m1bm2b)*S43(e2b|l1b)*-1.
    ierr=exatns_tensor_contract("Z59(e1,e2,m1,m2)+=H19(e1,l1,m1,m2)*S43(e2,l1)", &
        Z59,H19,S43,prefactor=(-1.0d0,0.0d0))
!   original expression: Z59(e1be2b|m1bm2b)+=H19(e2b,l1b|m1bm2b)*S43(e1b|l1b)
    ierr=exatns_tensor_contract("Z59(e1,e2,m1,m2)+=H19(e2,l1,m1,m2)*S43(e1,l1)", &
        Z59,H19,S43,prefactor=(1.0d0,0.0d0))
!   original expression: Z59(e1be2b|m1bm2b)+=H4(e1be2b|m1b,d1b)*S43(d1b|m2b)
    ierr=exatns_tensor_contract("Z59(e1,e2,m1,m2)+=H4(e1,e2,m1,d1)*S43(d1,m2)", &
        Z59,H4,S43,prefactor=(1.0d0,0.0d0))
!   original expression: Z59(e1be2b|m1bm2b)+=H4(e1be2b|m2b,d1b)*S43(d1b|m1b)*-1.
    ierr=exatns_tensor_contract("Z59(e1,e2,m1,m2)+=H4(e1,e2,m2,d1)*S43(d1,m1)", &
        Z59,H4,S43,prefactor=(-1.0d0,0.0d0))
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z81_1,"Z81_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z81_1,'ZERO')
!   original expression: Z81_1(e1b,l1b|m1bm2b)+=H17(e1b,l1b|d1bd2b)*S44(d1bd2b|m1bm2b)
    ierr=exatns_tensor_contract("Z81_1(e1,l1,m1,m2)+=H17(e1,l1,d1,d2)*S44(d1,d2,m1,m2)", &
        Z81_1,H17,S44,prefactor=(0.5d0,0.0d0))
!   original expression: Z59(e1be2b|m1bm2b)+=S43(e1b|l1b)*Z81_1(e2b,l1b|m1bm2b)
    ierr=exatns_tensor_contract("Z59(e1,e2,m1,m2)+=S43(e1,l1)*Z81_1(e2,l1,m1,m2)", &
        Z59,S43,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z59(e1be2b|m1bm2b)+=S43(e2b|l1b)*Z81_1(e1b,l1b|m1bm2b)*-1.
    ierr=exatns_tensor_contract("Z59(e1,e2,m1,m2)+=S43(e2,l1)*Z81_1(e1,l1,m1,m2)", &
        Z59,S43,Z81_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z81_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z81_1,"Z81_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z81_1,'ZERO')
!   original expression: Z81_1(e1b,l1b|m1bm2b)+=H26(l1b,l2b|m1bm2b)*S43(e1b|l2b)*0.5
    ierr=exatns_tensor_contract("Z81_1(e1,l1,m1,m2)+=H26(l1,l2,m1,m2)*S43(e1,l2)", &
        Z81_1,H26,S43,prefactor=(0.5d0,0.0d0))
!   original expression: Z59(e1be2b|m1bm2b)+=S43(e1b|l1b)*Z81_1(e2b,l1b|m1bm2b)
    ierr=exatns_tensor_contract("Z59(e1,e2,m1,m2)+=S43(e1,l1)*Z81_1(e2,l1,m1,m2)", &
        Z59,S43,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z59(e1be2b|m1bm2b)+=S43(e2b|l1b)*Z81_1(e1b,l1b|m1bm2b)*-1.
    ierr=exatns_tensor_contract("Z59(e1,e2,m1,m2)+=S43(e2,l1)*Z81_1(e1,l1,m1,m2)", &
        Z59,S43,Z81_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z81_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z81_1,"Z81_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z81_1,'ZERO')
!   original expression: Z81_1(e1b,l1b|m1bm2b)+=H18(e1b,l1b|m1b,d1b)*S43(d1b|m2b)
    ierr=exatns_tensor_contract("Z81_1(e1,l1,m1,m2)+=H18(e1,l1,m1,d1)*S43(d1,m2)", &
        Z81_1,H18,S43,prefactor=(1.0d0,0.0d0))
!   original expression: Z81_1(e1b,l1b|m1bm2b)+=H18(e1b,l1b|m2b,d1b)*S43(d1b|m1b)*-1.
    ierr=exatns_tensor_contract("Z81_1(e1,l1,m1,m2)+=H18(e1,l1,m2,d1)*S43(d1,m1)", &
        Z81_1,H18,S43,prefactor=(-1.0d0,0.0d0))
!   original expression: Z59(e1be2b|m1bm2b)+=S43(e1b|l1b)*Z81_1(e2b,l1b|m1bm2b)
    ierr=exatns_tensor_contract("Z59(e1,e2,m1,m2)+=S43(e1,l1)*Z81_1(e2,l1,m1,m2)", &
        Z59,S43,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z59(e1be2b|m1bm2b)+=S43(e2b|l1b)*Z81_1(e1b,l1b|m1bm2b)*-1.
    ierr=exatns_tensor_contract("Z59(e1,e2,m1,m2)+=S43(e2,l1)*Z81_1(e1,l1,m1,m2)", &
        Z59,S43,Z81_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z81_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z127_2,"Z127_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z127_2,'ZERO')
!   original expression: Z127_2(l1b,l2b|m1bm2b)+=H24(l1b,l2b|d1bd2b)*S44(d1bd2b|m1bm2b)*0.5
    ierr=exatns_tensor_contract("Z127_2(l1,l2,m1,m2)+=H24(l1,l2,d1,d2)*S44(d1,d2,m1,m2)", &
        Z127_2,H24,S44,prefactor=(0.25d0,0.0d0))
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z81_1,"Z81_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z81_1,'ZERO')
!   original expression: Z81_1(e1b,l1b|m1bm2b)+=S43(e1b|l2b)*Z127_2(l1b,l2b|m1bm2b)
    ierr=exatns_tensor_contract("Z81_1(e1,l1,m1,m2)+=S43(e1,l2)*Z127_2(l1,l2,m1,m2)", &
        Z81_1,S43,Z127_2,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z127_2)
!   original expression: Z59(e1be2b|m1bm2b)+=S43(e1b|l1b)*Z81_1(e2b,l1b|m1bm2b)
    ierr=exatns_tensor_contract("Z59(e1,e2,m1,m2)+=S43(e1,l1)*Z81_1(e2,l1,m1,m2)", &
        Z59,S43,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z59(e1be2b|m1bm2b)+=S43(e2b|l1b)*Z81_1(e1b,l1b|m1bm2b)*-1.
    ierr=exatns_tensor_contract("Z59(e1,e2,m1,m2)+=S43(e2,l1)*Z81_1(e1,l1,m1,m2)", &
        Z59,S43,Z81_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z81_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z127_2,"Z127_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z127_2,'ZERO')
!   original expression: Z127_2(l1b,l2b|m1bm2b)+=H25(l1b,l2b|m1b,d1b)*S43(d1b|m2b)*0.5
    ierr=exatns_tensor_contract("Z127_2(l1,l2,m1,m2)+=H25(l1,l2,m1,d1)*S43(d1,m2)", &
        Z127_2,H25,S43,prefactor=(0.5d0,0.0d0))
!   original expression: Z127_2(l1b,l2b|m1bm2b)+=H25(l1b,l2b|m2b,d1b)*S43(d1b|m1b)*-0.5
    ierr=exatns_tensor_contract("Z127_2(l1,l2,m1,m2)+=H25(l1,l2,m2,d1)*S43(d1,m1)", &
        Z127_2,H25,S43,prefactor=(-0.5d0,0.0d0))
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z81_1,"Z81_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z81_1,'ZERO')
!   original expression: Z81_1(e1b,l1b|m1bm2b)+=S43(e1b|l2b)*Z127_2(l1b,l2b|m1bm2b)
    ierr=exatns_tensor_contract("Z81_1(e1,l1,m1,m2)+=S43(e1,l2)*Z127_2(l1,l2,m1,m2)", &
        Z81_1,S43,Z127_2,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z127_2)
!   original expression: Z59(e1be2b|m1bm2b)+=S43(e1b|l1b)*Z81_1(e2b,l1b|m1bm2b)
    ierr=exatns_tensor_contract("Z59(e1,e2,m1,m2)+=S43(e1,l1)*Z81_1(e2,l1,m1,m2)", &
        Z59,S43,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z59(e1be2b|m1bm2b)+=S43(e2b|l1b)*Z81_1(e1b,l1b|m1bm2b)*-1.
    ierr=exatns_tensor_contract("Z59(e1,e2,m1,m2)+=S43(e2,l1)*Z81_1(e1,l1,m1,m2)", &
        Z59,S43,Z81_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z81_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z165_3,"Z165_3",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z165_3,'ZERO')
!   original expression: Z165_3(l1b,l2b|m1b,d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|m1b)*0.25
    ierr=exatns_tensor_contract("Z165_3(l1,l2,m1,d1)+=H24(l1,l2,d1,d2)*S43(d2,m1)", &
        Z165_3,H24,S43,prefactor=(0.25d0,0.0d0))
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z127_2,"Z127_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z127_2,'ZERO')
!   original expression: Z127_2(l1b,l2b|m1bm2b)+=S43(d1b|m1b)*Z165_3(l1b,l2b|m2b,d1b)
    ierr=exatns_tensor_contract("Z127_2(l1,l2,m1,m2)+=S43(d1,m1)*Z165_3(l1,l2,m2,d1)", &
        Z127_2,S43,Z165_3,prefactor=(1.0d0,0.0d0))
!   original expression: Z127_2(l1b,l2b|m1bm2b)+=S43(d1b|m2b)*Z165_3(l1b,l2b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z127_2(l1,l2,m1,m2)+=S43(d1,m2)*Z165_3(l1,l2,m1,d1)", &
        Z127_2,S43,Z165_3,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z165_3)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z81_1,"Z81_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z81_1,'ZERO')
!   original expression: Z81_1(e1b,l1b|m1bm2b)+=S43(e1b|l2b)*Z127_2(l1b,l2b|m1bm2b)
    ierr=exatns_tensor_contract("Z81_1(e1,l1,m1,m2)+=S43(e1,l2)*Z127_2(l1,l2,m1,m2)", &
        Z81_1,S43,Z127_2,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z127_2)
!   original expression: Z59(e1be2b|m1bm2b)+=S43(e1b|l1b)*Z81_1(e2b,l1b|m1bm2b)
    ierr=exatns_tensor_contract("Z59(e1,e2,m1,m2)+=S43(e1,l1)*Z81_1(e2,l1,m1,m2)", &
        Z59,S43,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z59(e1be2b|m1bm2b)+=S43(e2b|l1b)*Z81_1(e1b,l1b|m1bm2b)*-1.
    ierr=exatns_tensor_contract("Z59(e1,e2,m1,m2)+=S43(e2,l1)*Z81_1(e1,l1,m1,m2)", &
        Z59,S43,Z81_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z81_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z136_2,"Z136_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z136_2,'ZERO')
!   original expression: Z136_2(e1b,l1b|m1b,d1b)+=H17(e1b,l1b|d1b,d2b)*S43(d2b|m1b)*0.5
    ierr=exatns_tensor_contract("Z136_2(e1,l1,m1,d1)+=H17(e1,l1,d1,d2)*S43(d2,m1)", &
        Z136_2,H17,S43,prefactor=(0.5d0,0.0d0))
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z81_1,"Z81_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z81_1,'ZERO')
!   original expression: Z81_1(e1b,l1b|m1bm2b)+=S43(d1b|m1b)*Z136_2(e1b,l1b|m2b,d1b)
    ierr=exatns_tensor_contract("Z81_1(e1,l1,m1,m2)+=S43(d1,m1)*Z136_2(e1,l1,m2,d1)", &
        Z81_1,S43,Z136_2,prefactor=(1.0d0,0.0d0))
!   original expression: Z81_1(e1b,l1b|m1bm2b)+=S43(d1b|m2b)*Z136_2(e1b,l1b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z81_1(e1,l1,m1,m2)+=S43(d1,m2)*Z136_2(e1,l1,m1,d1)", &
        Z81_1,S43,Z136_2,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z136_2)
!   original expression: Z59(e1be2b|m1bm2b)+=S43(e1b|l1b)*Z81_1(e2b,l1b|m1bm2b)
    ierr=exatns_tensor_contract("Z59(e1,e2,m1,m2)+=S43(e1,l1)*Z81_1(e2,l1,m1,m2)", &
        Z59,S43,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z59(e1be2b|m1bm2b)+=S43(e2b|l1b)*Z81_1(e1b,l1b|m1bm2b)*-1.
    ierr=exatns_tensor_contract("Z59(e1,e2,m1,m2)+=S43(e2,l1)*Z81_1(e1,l1,m1,m2)", &
        Z59,S43,Z81_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z81_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nvir_id/)
    tens_root = (/nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z75_2,"Z75_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z75_2,'ZERO')
!   original expression: Z75_2(l1b|d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|l2b)
    ierr=exatns_tensor_contract("Z75_2(l1,d1)+=H24(l1,l2,d1,d2)*S43(d2,l2)", &
        Z75_2,H24,S43,prefactor=(1.0d0,0.0d0))
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z81_1,"Z81_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z81_1,'ZERO')
!   original expression: Z81_1(e1b,l1b|m1bm2b)+=S44(e1b,d1b|m1bm2b)*Z75_2(l1b|d1b)
    ierr=exatns_tensor_contract("Z81_1(e1,l1,m1,m2)+=S44(e1,d1,m1,m2)*Z75_2(l1,d1)", &
        Z81_1,S44,Z75_2,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z75_2)
!   original expression: Z59(e1be2b|m1bm2b)+=S43(e1b|l1b)*Z81_1(e2b,l1b|m1bm2b)
    ierr=exatns_tensor_contract("Z59(e1,e2,m1,m2)+=S43(e1,l1)*Z81_1(e2,l1,m1,m2)", &
        Z59,S43,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z59(e1be2b|m1bm2b)+=S43(e2b|l1b)*Z81_1(e1b,l1b|m1bm2b)*-1.
    ierr=exatns_tensor_contract("Z59(e1,e2,m1,m2)+=S43(e2,l1)*Z81_1(e1,l1,m1,m2)", &
        Z59,S43,Z81_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z81_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nvir_id/)
    tens_root = (/nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z75_2,"Z75_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z75_2,'ZERO')
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z81_1,"Z81_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z81_1,'ZERO')
!   original expression: Z81_1(e1b,l1b|m1bm2b)+=S44(e1b,d1b|m1bm2b)*Z75_2(l1b|d1b)
    ierr=exatns_tensor_contract("Z81_1(e1,l1,m1,m2)+=S44(e1,d1,m1,m2)*Z75_2(l1,d1)", &
        Z81_1,S44,Z75_2,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z75_2)
!   original expression: Z59(e1be2b|m1bm2b)+=S43(e1b|l1b)*Z81_1(e2b,l1b|m1bm2b)
    ierr=exatns_tensor_contract("Z59(e1,e2,m1,m2)+=S43(e1,l1)*Z81_1(e2,l1,m1,m2)", &
        Z59,S43,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z59(e1be2b|m1bm2b)+=S43(e2b|l1b)*Z81_1(e1b,l1b|m1bm2b)*-1.
    ierr=exatns_tensor_contract("Z59(e1,e2,m1,m2)+=S43(e2,l1)*Z81_1(e1,l1,m1,m2)", &
        Z59,S43,Z81_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z81_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z81_1,"Z81_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z81_1,'ZERO')
!   original expression: Z81_1(e1b,l1b|m1bm2b)+=S44(e1b,d1b|m1bm2b)*H15(l1b|d1b)
    ierr=exatns_tensor_contract("Z81_1(e1,l1,m1,m2)+=S44(e1,d1,m1,m2)*H15(l1,d1)", &
        Z81_1,S44,H15,prefactor=(1.0d0,0.0d0))
!   original expression: Z59(e1be2b|m1bm2b)+=S43(e1b|l1b)*Z81_1(e2b,l1b|m1bm2b)
    ierr=exatns_tensor_contract("Z59(e1,e2,m1,m2)+=S43(e1,l1)*Z81_1(e2,l1,m1,m2)", &
        Z59,S43,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z59(e1be2b|m1bm2b)+=S43(e2b|l1b)*Z81_1(e1b,l1b|m1bm2b)*-1.
    ierr=exatns_tensor_contract("Z59(e1,e2,m1,m2)+=S43(e2,l1)*Z81_1(e1,l1,m1,m2)", &
        Z59,S43,Z81_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z81_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z165_2,"Z165_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z165_2,'ZERO')
!   original expression: Z165_2(l1b,l2b|m1b,d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|m1b)*-1.
    ierr=exatns_tensor_contract("Z165_2(l1,l2,m1,d1)+=H24(l1,l2,d1,d2)*S43(d2,m1)", &
        Z165_2,H24,S43,prefactor=(-1.0d0,0.0d0))
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z81_1,"Z81_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z81_1,'ZERO')
!   original expression: Z81_1(e1b,l1b|m1bm2b)+=S44(e1b,d1b|m1b,l2b)*Z165_2(l1b,l2b|m2b,d1b)
    ierr=exatns_tensor_contract("Z81_1(e1,l1,m1,m2)+=S44(e1,d1,m1,l2)*Z165_2(l1,l2,m2,d1)", &
        Z81_1,S44,Z165_2,prefactor=(1.0d0,0.0d0))
!   original expression: Z81_1(e1b,l1b|m1bm2b)+=S44(e1b,d1b|m2b,l2b)*Z165_2(l1b,l2b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z81_1(e1,l1,m1,m2)+=S44(e1,d1,m2,l2)*Z165_2(l1,l2,m1,d1)", &
        Z81_1,S44,Z165_2,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z165_2)
!   original expression: Z59(e1be2b|m1bm2b)+=S43(e1b|l1b)*Z81_1(e2b,l1b|m1bm2b)
    ierr=exatns_tensor_contract("Z59(e1,e2,m1,m2)+=S43(e1,l1)*Z81_1(e2,l1,m1,m2)", &
        Z59,S43,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z59(e1be2b|m1bm2b)+=S43(e2b|l1b)*Z81_1(e1b,l1b|m1bm2b)*-1.
    ierr=exatns_tensor_contract("Z59(e1,e2,m1,m2)+=S43(e2,l1)*Z81_1(e1,l1,m1,m2)", &
        Z59,S43,Z81_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z81_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z81_1,"Z81_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z81_1,'ZERO')
!   original expression: Z81_1(e1b,l1b|m1bm2b)+=S44(e1b,d1b|m1b,l2b)*H25(l1b,l2b|m2b,d1b)
    ierr=exatns_tensor_contract("Z81_1(e1,l1,m1,m2)+=S44(e1,d1,m1,l2)*H25(l1,l2,m2,d1)", &
        Z81_1,S44,H25,prefactor=(1.0d0,0.0d0))
!   original expression: Z81_1(e1b,l1b|m1bm2b)+=S44(e1b,d1b|m2b,l2b)*H25(l1b,l2b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z81_1(e1,l1,m1,m2)+=S44(e1,d1,m2,l2)*H25(l1,l2,m1,d1)", &
        Z81_1,S44,H25,prefactor=(-1.0d0,0.0d0))
!   original expression: Z59(e1be2b|m1bm2b)+=S43(e1b|l1b)*Z81_1(e2b,l1b|m1bm2b)
    ierr=exatns_tensor_contract("Z59(e1,e2,m1,m2)+=S43(e1,l1)*Z81_1(e2,l1,m1,m2)", &
        Z59,S43,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z59(e1be2b|m1bm2b)+=S43(e2b|l1b)*Z81_1(e1b,l1b|m1bm2b)*-1.
    ierr=exatns_tensor_contract("Z59(e1,e2,m1,m2)+=S43(e2,l1)*Z81_1(e1,l1,m1,m2)", &
        Z59,S43,Z81_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z81_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z81_1,"Z81_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z81_1,'ZERO')
!   original expression: Z59(e1be2b|m1bm2b)+=S43(e1b|l1b)*Z81_1(e2b,l1b|m1bm2b)
    ierr=exatns_tensor_contract("Z59(e1,e2,m1,m2)+=S43(e1,l1)*Z81_1(e2,l1,m1,m2)", &
        Z59,S43,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z59(e1be2b|m1bm2b)+=S43(e2b|l1b)*Z81_1(e1b,l1b|m1bm2b)*-1.
    ierr=exatns_tensor_contract("Z59(e1,e2,m1,m2)+=S43(e2,l1)*Z81_1(e1,l1,m1,m2)", &
        Z59,S43,Z81_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z81_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z81_1,"Z81_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z81_1,'ZERO')
!   original expression: Z59(e1be2b|m1bm2b)+=S43(e1b|l1b)*Z81_1(e2b,l1b|m1bm2b)
    ierr=exatns_tensor_contract("Z59(e1,e2,m1,m2)+=S43(e1,l1)*Z81_1(e2,l1,m1,m2)", &
        Z59,S43,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z59(e1be2b|m1bm2b)+=S43(e2b|l1b)*Z81_1(e1b,l1b|m1bm2b)*-1.
    ierr=exatns_tensor_contract("Z59(e1,e2,m1,m2)+=S43(e2,l1)*Z81_1(e1,l1,m1,m2)", &
        Z59,S43,Z81_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z81_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z81_1,"Z81_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z81_1,'ZERO')
!   original expression: Z81_1(e1b,l1b|m1bm2b)+=S45(e1b,d1bd2b|m1bm2b,l2b)*H24(l1b,l2b|d1bd2b)
    ierr=exatns_tensor_contract("Z81_1(e1,l1,m1,m2)+=S45(e1,d1,d2,m1,m2,l2)*H24(l1,l2,d1,d2)", &
        Z81_1,S45,H24,prefactor=(0.5d0,0.0d0))
!   original expression: Z59(e1be2b|m1bm2b)+=S43(e1b|l1b)*Z81_1(e2b,l1b|m1bm2b)
    ierr=exatns_tensor_contract("Z59(e1,e2,m1,m2)+=S43(e1,l1)*Z81_1(e2,l1,m1,m2)", &
        Z59,S43,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z59(e1be2b|m1bm2b)+=S43(e2b|l1b)*Z81_1(e1b,l1b|m1bm2b)*-1.
    ierr=exatns_tensor_contract("Z59(e1,e2,m1,m2)+=S43(e2,l1)*Z81_1(e1,l1,m1,m2)", &
        Z59,S43,Z81_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z81_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z81_1,"Z81_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z81_1,'ZERO')
!   original expression: Z59(e1be2b|m1bm2b)+=S43(e1b|l1b)*Z81_1(e2b,l1b|m1bm2b)
    ierr=exatns_tensor_contract("Z59(e1,e2,m1,m2)+=S43(e1,l1)*Z81_1(e2,l1,m1,m2)", &
        Z59,S43,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z59(e1be2b|m1bm2b)+=S43(e2b|l1b)*Z81_1(e1b,l1b|m1bm2b)*-1.
    ierr=exatns_tensor_contract("Z59(e1,e2,m1,m2)+=S43(e2,l1)*Z81_1(e1,l1,m1,m2)", &
        Z59,S43,Z81_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z81_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nvir_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z91_1,"Z91_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z91_1,'ZERO')
!   original expression: Z91_1(e1be2b|m1b,d1b)+=H3(e1be2b|d1b,d2b)*S43(d2b|m1b)*0.5
    ierr=exatns_tensor_contract("Z91_1(e1,e2,m1,d1)+=H3(e1,e2,d1,d2)*S43(d2,m1)", &
        Z91_1,H3,S43,prefactor=(0.5d0,0.0d0))
!   original expression: Z59(e1be2b|m1bm2b)+=S43(d1b|m1b)*Z91_1(e1be2b|m2b,d1b)
    ierr=exatns_tensor_contract("Z59(e1,e2,m1,m2)+=S43(d1,m1)*Z91_1(e1,e2,m2,d1)", &
        Z59,S43,Z91_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z59(e1be2b|m1bm2b)+=S43(d1b|m2b)*Z91_1(e1be2b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z59(e1,e2,m1,m2)+=S43(d1,m2)*Z91_1(e1,e2,m1,d1)", &
        Z59,S43,Z91_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z91_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z76_1,"Z76_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z76_1,'ZERO')
!   original expression: Z76_1(l1bl2b|m1bm2b)+=H25(l1bl2b|m1b,d1b)*S43(d1b|m2b)
    ierr=exatns_tensor_contract("Z76_1(l1,l2,m1,m2)+=H25(l1,l2,m1,d1)*S43(d1,m2)", &
        Z76_1,H25,S43,prefactor=(1.0d0,0.0d0))
!   original expression: Z76_1(l1bl2b|m1bm2b)+=H25(l1bl2b|m2b,d1b)*S43(d1b|m1b)*-1.
    ierr=exatns_tensor_contract("Z76_1(l1,l2,m1,m2)+=H25(l1,l2,m2,d1)*S43(d1,m1)", &
        Z76_1,H25,S43,prefactor=(-1.0d0,0.0d0))
!   original expression: Z59(e1be2b|m1bm2b)+=S44(e1be2b|l1bl2b)*Z76_1(l1bl2b|m1bm2b)
    ierr=exatns_tensor_contract("Z59(e1,e2,m1,m2)+=S44(e1,e2,l1,l2)*Z76_1(l1,l2,m1,m2)", &
        Z59,S44,Z76_1,prefactor=(0.5d0,0.0d0))
    ierr=exatns_tensor_destroy(Z76_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z129_2,"Z129_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z129_2,'ZERO')
!   original expression: Z129_2(l1bl2b|m1b,d1b)+=H24(l1bl2b|d1b,d2b)*S43(d2b|m1b)*0.5
    ierr=exatns_tensor_contract("Z129_2(l1,l2,m1,d1)+=H24(l1,l2,d1,d2)*S43(d2,m1)", &
        Z129_2,H24,S43,prefactor=(0.5d0,0.0d0))
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z76_1,"Z76_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z76_1,'ZERO')
!   original expression: Z76_1(l1bl2b|m1bm2b)+=S43(d1b|m1b)*Z129_2(l1bl2b|m2b,d1b)
    ierr=exatns_tensor_contract("Z76_1(l1,l2,m1,m2)+=S43(d1,m1)*Z129_2(l1,l2,m2,d1)", &
        Z76_1,S43,Z129_2,prefactor=(1.0d0,0.0d0))
!   original expression: Z76_1(l1bl2b|m1bm2b)+=S43(d1b|m2b)*Z129_2(l1bl2b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z76_1(l1,l2,m1,m2)+=S43(d1,m2)*Z129_2(l1,l2,m1,d1)", &
        Z76_1,S43,Z129_2,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z129_2)
!   original expression: Z59(e1be2b|m1bm2b)+=S44(e1be2b|l1bl2b)*Z76_1(l1bl2b|m1bm2b)
    ierr=exatns_tensor_contract("Z59(e1,e2,m1,m2)+=S44(e1,e2,l1,l2)*Z76_1(l1,l2,m1,m2)", &
        Z59,S44,Z76_1,prefactor=(0.5d0,0.0d0))
    ierr=exatns_tensor_destroy(Z76_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z76_1,"Z76_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z76_1,'ZERO')
!   original expression: Z76_1(l1bl2b|m1bm2b)+=S44(d1bd2b|m1bm2b)*H24(l1bl2b|d1bd2b)
    ierr=exatns_tensor_contract("Z76_1(l1,l2,m1,m2)+=S44(d1,d2,m1,m2)*H24(l1,l2,d1,d2)", &
        Z76_1,S44,H24,prefactor=(0.5d0,0.0d0))
!   original expression: Z59(e1be2b|m1bm2b)+=S44(e1be2b|l1bl2b)*Z76_1(l1bl2b|m1bm2b)
    ierr=exatns_tensor_contract("Z59(e1,e2,m1,m2)+=S44(e1,e2,l1,l2)*Z76_1(l1,l2,m1,m2)", &
        Z59,S44,Z76_1,prefactor=(0.5d0,0.0d0))
    ierr=exatns_tensor_destroy(Z76_1)
!   original expression: Z59(e1be2b|m1bm2b)+=S44(e1be2b|l1bl2b)*H26(l1bl2b|m1bm2b)
    ierr=exatns_tensor_contract("Z59(e1,e2,m1,m2)+=S44(e1,e2,l1,l2)*H26(l1,l2,m1,m2)", &
        Z59,S44,H26,prefactor=(0.5d0,0.0d0))
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nvir_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root/)
    ierr=exatns_tensor_create(Z72_1,"Z72_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z72_1,'ZERO')
!   original expression: Z72_1(e1b|d1b)+=H17(e1b,l1b|d1b,d2b)*S43(d2b|l1b)
    ierr=exatns_tensor_contract("Z72_1(e1,d1)+=H17(e1,l1,d1,d2)*S43(d2,l1)", &
        Z72_1,H17,S43,prefactor=(1.0d0,0.0d0))
!   original expression: Z59(e1be2b|m1bm2b)+=S44(e1b,d1b|m1bm2b)*Z72_1(e2b|d1b)
    ierr=exatns_tensor_contract("Z59(e1,e2,m1,m2)+=S44(e1,d1,m1,m2)*Z72_1(e2,d1)", &
        Z59,S44,Z72_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z59(e1be2b|m1bm2b)+=S44(e2b,d1b|m1bm2b)*Z72_1(e1b|d1b)*-1.
    ierr=exatns_tensor_contract("Z59(e1,e2,m1,m2)+=S44(e2,d1,m1,m2)*Z72_1(e1,d1)", &
        Z59,S44,Z72_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z72_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nvir_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root/)
    ierr=exatns_tensor_create(Z72_1,"Z72_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z72_1,'ZERO')
!   original expression: Z59(e1be2b|m1bm2b)+=S44(e1b,d1b|m1bm2b)*Z72_1(e2b|d1b)
    ierr=exatns_tensor_contract("Z59(e1,e2,m1,m2)+=S44(e1,d1,m1,m2)*Z72_1(e2,d1)", &
        Z59,S44,Z72_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z59(e1be2b|m1bm2b)+=S44(e2b,d1b|m1bm2b)*Z72_1(e1b|d1b)*-1.
    ierr=exatns_tensor_contract("Z59(e1,e2,m1,m2)+=S44(e2,d1,m1,m2)*Z72_1(e1,d1)", &
        Z59,S44,Z72_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z72_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nvir_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root/)
    ierr=exatns_tensor_create(Z72_1,"Z72_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z72_1,'ZERO')
!   original expression: Z72_1(e1b|d1b)+=S44(e1b,d2b|l1bl2b)*H24(l1bl2b|d1b,d2b)*-1.
    ierr=exatns_tensor_contract("Z72_1(e1,d1)+=S44(e1,d2,l1,l2)*H24(l1,l2,d1,d2)", &
        Z72_1,S44,H24,prefactor=(-0.5d0,0.0d0))
!   original expression: Z59(e1be2b|m1bm2b)+=S44(e1b,d1b|m1bm2b)*Z72_1(e2b|d1b)
    ierr=exatns_tensor_contract("Z59(e1,e2,m1,m2)+=S44(e1,d1,m1,m2)*Z72_1(e2,d1)", &
        Z59,S44,Z72_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z59(e1be2b|m1bm2b)+=S44(e2b,d1b|m1bm2b)*Z72_1(e1b|d1b)*-1.
    ierr=exatns_tensor_contract("Z59(e1,e2,m1,m2)+=S44(e2,d1,m1,m2)*Z72_1(e1,d1)", &
        Z59,S44,Z72_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z72_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nvir_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root/)
    ierr=exatns_tensor_create(Z72_1,"Z72_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z72_1,'ZERO')
!   original expression: Z59(e1be2b|m1bm2b)+=S44(e1b,d1b|m1bm2b)*Z72_1(e2b|d1b)
    ierr=exatns_tensor_contract("Z59(e1,e2,m1,m2)+=S44(e1,d1,m1,m2)*Z72_1(e2,d1)", &
        Z59,S44,Z72_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z59(e1be2b|m1bm2b)+=S44(e2b,d1b|m1bm2b)*Z72_1(e1b|d1b)*-1.
    ierr=exatns_tensor_contract("Z59(e1,e2,m1,m2)+=S44(e2,d1,m1,m2)*Z72_1(e1,d1)", &
        Z59,S44,Z72_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z72_1)
!   original expression: Z59(e1be2b|m1bm2b)+=S44(e1b,d1b|m1bm2b)*H1(e2b|d1b)
    ierr=exatns_tensor_contract("Z59(e1,e2,m1,m2)+=S44(e1,d1,m1,m2)*H1(e2,d1)", &
        Z59,S44,H1,prefactor=(1.0d0,0.0d0))
!   original expression: Z59(e1be2b|m1bm2b)+=S44(e2b,d1b|m1bm2b)*H1(e1b|d1b)*-1.
    ierr=exatns_tensor_contract("Z59(e1,e2,m1,m2)+=S44(e2,d1,m1,m2)*H1(e1,d1)", &
        Z59,S44,H1,prefactor=(-1.0d0,0.0d0))
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z74_1,"Z74_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z74_1,'ZERO')
!   original expression: Z74_1(l1b|m1b)+=H25(l1b,l2b|m1b,d1b)*S43(d1b|l2b)*-1.
    ierr=exatns_tensor_contract("Z74_1(l1,m1)+=H25(l1,l2,m1,d1)*S43(d1,l2)", &
        Z74_1,H25,S43,prefactor=(-1.0d0,0.0d0))
!   original expression: Z59(e1be2b|m1bm2b)+=S44(e1be2b|m1b,l1b)*Z74_1(l1b|m2b)
    ierr=exatns_tensor_contract("Z59(e1,e2,m1,m2)+=S44(e1,e2,m1,l1)*Z74_1(l1,m2)", &
        Z59,S44,Z74_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z59(e1be2b|m1bm2b)+=S44(e1be2b|m2b,l1b)*Z74_1(l1b|m1b)*-1.
    ierr=exatns_tensor_contract("Z59(e1,e2,m1,m2)+=S44(e1,e2,m2,l1)*Z74_1(l1,m1)", &
        Z59,S44,Z74_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z74_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z74_1,"Z74_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z74_1,'ZERO')
!   original expression: Z59(e1be2b|m1bm2b)+=S44(e1be2b|m1b,l1b)*Z74_1(l1b|m2b)
    ierr=exatns_tensor_contract("Z59(e1,e2,m1,m2)+=S44(e1,e2,m1,l1)*Z74_1(l1,m2)", &
        Z59,S44,Z74_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z59(e1be2b|m1bm2b)+=S44(e1be2b|m2b,l1b)*Z74_1(l1b|m1b)*-1.
    ierr=exatns_tensor_contract("Z59(e1,e2,m1,m2)+=S44(e1,e2,m2,l1)*Z74_1(l1,m1)", &
        Z59,S44,Z74_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z74_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nvir_id/)
    tens_root = (/nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z75_2,"Z75_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z75_2,'ZERO')
!   original expression: Z75_2(l1b|d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|l2b)*-1.
    ierr=exatns_tensor_contract("Z75_2(l1,d1)+=H24(l1,l2,d1,d2)*S43(d2,l2)", &
        Z75_2,H24,S43,prefactor=(-1.0d0,0.0d0))
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z74_1,"Z74_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z74_1,'ZERO')
!   original expression: Z74_1(l1b|m1b)+=S43(d1b|m1b)*Z75_2(l1b|d1b)
    ierr=exatns_tensor_contract("Z74_1(l1,m1)+=S43(d1,m1)*Z75_2(l1,d1)", &
        Z74_1,S43,Z75_2,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z75_2)
!   original expression: Z59(e1be2b|m1bm2b)+=S44(e1be2b|m1b,l1b)*Z74_1(l1b|m2b)
    ierr=exatns_tensor_contract("Z59(e1,e2,m1,m2)+=S44(e1,e2,m1,l1)*Z74_1(l1,m2)", &
        Z59,S44,Z74_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z59(e1be2b|m1bm2b)+=S44(e1be2b|m2b,l1b)*Z74_1(l1b|m1b)*-1.
    ierr=exatns_tensor_contract("Z59(e1,e2,m1,m2)+=S44(e1,e2,m2,l1)*Z74_1(l1,m1)", &
        Z59,S44,Z74_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z74_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nvir_id/)
    tens_root = (/nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z75_2,"Z75_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z75_2,'ZERO')
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z74_1,"Z74_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z74_1,'ZERO')
!   original expression: Z74_1(l1b|m1b)+=S43(d1b|m1b)*Z75_2(l1b|d1b)
    ierr=exatns_tensor_contract("Z74_1(l1,m1)+=S43(d1,m1)*Z75_2(l1,d1)", &
        Z74_1,S43,Z75_2,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z75_2)
!   original expression: Z59(e1be2b|m1bm2b)+=S44(e1be2b|m1b,l1b)*Z74_1(l1b|m2b)
    ierr=exatns_tensor_contract("Z59(e1,e2,m1,m2)+=S44(e1,e2,m1,l1)*Z74_1(l1,m2)", &
        Z59,S44,Z74_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z59(e1be2b|m1bm2b)+=S44(e1be2b|m2b,l1b)*Z74_1(l1b|m1b)*-1.
    ierr=exatns_tensor_contract("Z59(e1,e2,m1,m2)+=S44(e1,e2,m2,l1)*Z74_1(l1,m1)", &
        Z59,S44,Z74_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z74_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z74_1,"Z74_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z74_1,'ZERO')
!   original expression: Z74_1(l1b|m1b)+=S43(d1b|m1b)*H15(l1b|d1b)*-1.
    ierr=exatns_tensor_contract("Z74_1(l1,m1)+=S43(d1,m1)*H15(l1,d1)", &
        Z74_1,S43,H15,prefactor=(-1.0d0,0.0d0))
!   original expression: Z59(e1be2b|m1bm2b)+=S44(e1be2b|m1b,l1b)*Z74_1(l1b|m2b)
    ierr=exatns_tensor_contract("Z59(e1,e2,m1,m2)+=S44(e1,e2,m1,l1)*Z74_1(l1,m2)", &
        Z59,S44,Z74_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z59(e1be2b|m1bm2b)+=S44(e1be2b|m2b,l1b)*Z74_1(l1b|m1b)*-1.
    ierr=exatns_tensor_contract("Z59(e1,e2,m1,m2)+=S44(e1,e2,m2,l1)*Z74_1(l1,m1)", &
        Z59,S44,Z74_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z74_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z74_1,"Z74_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z74_1,'ZERO')
!   original expression: Z74_1(l1b|m1b)+=S44(d1bd2b|m1b,l2b)*H24(l1b,l2b|d1bd2b)*-1.
    ierr=exatns_tensor_contract("Z74_1(l1,m1)+=S44(d1,d2,m1,l2)*H24(l1,l2,d1,d2)", &
        Z74_1,S44,H24,prefactor=(-0.5d0,0.0d0))
!   original expression: Z59(e1be2b|m1bm2b)+=S44(e1be2b|m1b,l1b)*Z74_1(l1b|m2b)
    ierr=exatns_tensor_contract("Z59(e1,e2,m1,m2)+=S44(e1,e2,m1,l1)*Z74_1(l1,m2)", &
        Z59,S44,Z74_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z59(e1be2b|m1bm2b)+=S44(e1be2b|m2b,l1b)*Z74_1(l1b|m1b)*-1.
    ierr=exatns_tensor_contract("Z59(e1,e2,m1,m2)+=S44(e1,e2,m2,l1)*Z74_1(l1,m1)", &
        Z59,S44,Z74_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z74_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z74_1,"Z74_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z74_1,'ZERO')
!   original expression: Z59(e1be2b|m1bm2b)+=S44(e1be2b|m1b,l1b)*Z74_1(l1b|m2b)
    ierr=exatns_tensor_contract("Z59(e1,e2,m1,m2)+=S44(e1,e2,m1,l1)*Z74_1(l1,m2)", &
        Z59,S44,Z74_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z59(e1be2b|m1bm2b)+=S44(e1be2b|m2b,l1b)*Z74_1(l1b|m1b)*-1.
    ierr=exatns_tensor_contract("Z59(e1,e2,m1,m2)+=S44(e1,e2,m2,l1)*Z74_1(l1,m1)", &
        Z59,S44,Z74_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z74_1)
!   original expression: Z59(e1be2b|m1bm2b)+=S44(e1be2b|m1b,l1b)*H16(l1b|m2b)*-1.
    ierr=exatns_tensor_contract("Z59(e1,e2,m1,m2)+=S44(e1,e2,m1,l1)*H16(l1,m2)", &
        Z59,S44,H16,prefactor=(-1.0d0,0.0d0))
!   original expression: Z59(e1be2b|m1bm2b)+=S44(e1be2b|m2b,l1b)*H16(l1b|m1b)
    ierr=exatns_tensor_contract("Z59(e1,e2,m1,m2)+=S44(e1,e2,m2,l1)*H16(l1,m1)", &
        Z59,S44,H16,prefactor=(1.0d0,0.0d0))
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z136_1,"Z136_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z136_1,'ZERO')
!   original expression: Z136_1(e1b,l1b|m1b,d1b)+=H17(e1b,l1b|d1b,d2b)*S43(d2b|m1b)*-1.
    ierr=exatns_tensor_contract("Z136_1(e1,l1,m1,d1)+=H17(e1,l1,d1,d2)*S43(d2,m1)", &
        Z136_1,H17,S43,prefactor=(-1.0d0,0.0d0))
!   original expression: Z59(e1be2b|m1bm2b)+=S44(e1b,d1b|m1b,l1b)*Z136_1(e2b,l1b|m2b,d1b)
    ierr=exatns_tensor_contract("Z59(e1,e2,m1,m2)+=S44(e1,d1,m1,l1)*Z136_1(e2,l1,m2,d1)", &
        Z59,S44,Z136_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z59(e1be2b|m1bm2b)+=S44(e2b,d1b|m1b,l1b)*Z136_1(e1b,l1b|m2b,d1b)*-1.
    ierr=exatns_tensor_contract("Z59(e1,e2,m1,m2)+=S44(e2,d1,m1,l1)*Z136_1(e1,l1,m2,d1)", &
        Z59,S44,Z136_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z59(e1be2b|m1bm2b)+=S44(e1b,d1b|m2b,l1b)*Z136_1(e2b,l1b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z59(e1,e2,m1,m2)+=S44(e1,d1,m2,l1)*Z136_1(e2,l1,m1,d1)", &
        Z59,S44,Z136_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z59(e1be2b|m1bm2b)+=S44(e2b,d1b|m2b,l1b)*Z136_1(e1b,l1b|m1b,d1b)
    ierr=exatns_tensor_contract("Z59(e1,e2,m1,m2)+=S44(e2,d1,m2,l1)*Z136_1(e1,l1,m1,d1)", &
        Z59,S44,Z136_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z136_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z136_1,"Z136_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z136_1,'ZERO')
!   original expression: Z136_1(e1b,l1b|m1b,d1b)+=S44(e1b,d2b|m1b,l2b)*H24(l1b,l2b|d1b,d2b)*0.5
    ierr=exatns_tensor_contract("Z136_1(e1,l1,m1,d1)+=S44(e1,d2,m1,l2)*H24(l1,l2,d1,d2)", &
        Z136_1,S44,H24,prefactor=(0.5d0,0.0d0))
!   original expression: Z59(e1be2b|m1bm2b)+=S44(e1b,d1b|m1b,l1b)*Z136_1(e2b,l1b|m2b,d1b)
    ierr=exatns_tensor_contract("Z59(e1,e2,m1,m2)+=S44(e1,d1,m1,l1)*Z136_1(e2,l1,m2,d1)", &
        Z59,S44,Z136_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z59(e1be2b|m1bm2b)+=S44(e2b,d1b|m1b,l1b)*Z136_1(e1b,l1b|m2b,d1b)*-1.
    ierr=exatns_tensor_contract("Z59(e1,e2,m1,m2)+=S44(e2,d1,m1,l1)*Z136_1(e1,l1,m2,d1)", &
        Z59,S44,Z136_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z59(e1be2b|m1bm2b)+=S44(e1b,d1b|m2b,l1b)*Z136_1(e2b,l1b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z59(e1,e2,m1,m2)+=S44(e1,d1,m2,l1)*Z136_1(e2,l1,m1,d1)", &
        Z59,S44,Z136_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z59(e1be2b|m1bm2b)+=S44(e2b,d1b|m2b,l1b)*Z136_1(e1b,l1b|m1b,d1b)
    ierr=exatns_tensor_contract("Z59(e1,e2,m1,m2)+=S44(e2,d1,m2,l1)*Z136_1(e1,l1,m1,d1)", &
        Z59,S44,Z136_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z136_1)
!   original expression: Z59(e1be2b|m1bm2b)+=S44(e1b,d1b|m1b,l1b)*H18(e2b,l1b|m2b,d1b)
    ierr=exatns_tensor_contract("Z59(e1,e2,m1,m2)+=S44(e1,d1,m1,l1)*H18(e2,l1,m2,d1)", &
        Z59,S44,H18,prefactor=(1.0d0,0.0d0))
!   original expression: Z59(e1be2b|m1bm2b)+=S44(e2b,d1b|m1b,l1b)*H18(e1b,l1b|m2b,d1b)*-1.
    ierr=exatns_tensor_contract("Z59(e1,e2,m1,m2)+=S44(e2,d1,m1,l1)*H18(e1,l1,m2,d1)", &
        Z59,S44,H18,prefactor=(-1.0d0,0.0d0))
!   original expression: Z59(e1be2b|m1bm2b)+=S44(e1b,d1b|m2b,l1b)*H18(e2b,l1b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z59(e1,e2,m1,m2)+=S44(e1,d1,m2,l1)*H18(e2,l1,m1,d1)", &
        Z59,S44,H18,prefactor=(-1.0d0,0.0d0))
!   original expression: Z59(e1be2b|m1bm2b)+=S44(e2b,d1b|m2b,l1b)*H18(e1b,l1b|m1b,d1b)
    ierr=exatns_tensor_contract("Z59(e1,e2,m1,m2)+=S44(e2,d1,m2,l1)*H18(e1,l1,m1,d1)", &
        Z59,S44,H18,prefactor=(1.0d0,0.0d0))
!   original expression: Z59(e1be2b|m1bm2b)+=S45(e1b,d1bd2b|m1bm2b,l1b)*H17(e2b,l1b|d1bd2b)
    ierr=exatns_tensor_contract("Z59(e1,e2,m1,m2)+=S45(e1,d1,d2,m1,m2,l1)*H17(e2,l1,d1,d2)", &
        Z59,S45,H17,prefactor=(0.5d0,0.0d0))
!   original expression: Z59(e1be2b|m1bm2b)+=S45(e2b,d1bd2b|m1bm2b,l1b)*H17(e1b,l1b|d1bd2b)*-1.
    ierr=exatns_tensor_contract("Z59(e1,e2,m1,m2)+=S45(e2,d1,d2,m1,m2,l1)*H17(e1,l1,d1,d2)", &
        Z59,S45,H17,prefactor=(-0.5d0,0.0d0))
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z129_1,"Z129_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z129_1,'ZERO')
!   original expression: Z129_1(l1bl2b|m1b,d1b)+=H24(l1bl2b|d1b,d2b)*S43(d2b|m1b)
    ierr=exatns_tensor_contract("Z129_1(l1,l2,m1,d1)+=H24(l1,l2,d1,d2)*S43(d2,m1)", &
        Z129_1,H24,S43,prefactor=(1.0d0,0.0d0))
!   original expression: Z59(e1be2b|m1bm2b)+=S45(e1be2b,d1b|m1b,l1bl2b)*Z129_1(l1bl2b|m2b,d1b)
    ierr=exatns_tensor_contract("Z59(e1,e2,m1,m2)+=S45(e1,e2,d1,m1,l1,l2)*Z129_1(l1,l2,m2,d1)", &
        Z59,S45,Z129_1,prefactor=(0.5d0,0.0d0))
!   original expression: Z59(e1be2b|m1bm2b)+=S45(e1be2b,d1b|m2b,l1bl2b)*Z129_1(l1bl2b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z59(e1,e2,m1,m2)+=S45(e1,e2,d1,m2,l1,l2)*Z129_1(l1,l2,m1,d1)", &
        Z59,S45,Z129_1,prefactor=(-0.5d0,0.0d0))
    ierr=exatns_tensor_destroy(Z129_1)
!   original expression: Z59(e1be2b|m1bm2b)+=S45(e1be2b,d1b|m1b,l1bl2b)*H25(l1bl2b|m2b,d1b)*-1.
    ierr=exatns_tensor_contract("Z59(e1,e2,m1,m2)+=S45(e1,e2,d1,m1,l1,l2)*H25(l1,l2,m2,d1)", &
        Z59,S45,H25,prefactor=(-0.5d0,0.0d0))
!   original expression: Z59(e1be2b|m1bm2b)+=S45(e1be2b,d1b|m2b,l1bl2b)*H25(l1bl2b|m1b,d1b)
    ierr=exatns_tensor_contract("Z59(e1,e2,m1,m2)+=S45(e1,e2,d1,m2,l1,l2)*H25(l1,l2,m1,d1)", &
        Z59,S45,H25,prefactor=(0.5d0,0.0d0))
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nvir_id/)
    tens_root = (/nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z75_1,"Z75_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z75_1,'ZERO')
!   original expression: Z75_1(l1b|d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|l2b)
    ierr=exatns_tensor_contract("Z75_1(l1,d1)+=H24(l1,l2,d1,d2)*S43(d2,l2)", &
        Z75_1,H24,S43,prefactor=(1.0d0,0.0d0))
!   original expression: Z59(e1be2b|m1bm2b)+=S45(e1be2b,d1b|m1bm2b,l1b)*Z75_1(l1b|d1b)
    ierr=exatns_tensor_contract("Z59(e1,e2,m1,m2)+=S45(e1,e2,d1,m1,m2,l1)*Z75_1(l1,d1)", &
        Z59,S45,Z75_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z75_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nvir_id/)
    tens_root = (/nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z75_1,"Z75_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z75_1,'ZERO')
!   original expression: Z59(e1be2b|m1bm2b)+=S45(e1be2b,d1b|m1bm2b,l1b)*Z75_1(l1b|d1b)
    ierr=exatns_tensor_contract("Z59(e1,e2,m1,m2)+=S45(e1,e2,d1,m1,m2,l1)*Z75_1(l1,d1)", &
        Z59,S45,Z75_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z75_1)
!   original expression: Z59(e1be2b|m1bm2b)+=S45(e1be2b,d1b|m1bm2b,l1b)*H15(l1b|d1b)
    ierr=exatns_tensor_contract("Z59(e1,e2,m1,m2)+=S45(e1,e2,d1,m1,m2,l1)*H15(l1,d1)", &
        Z59,S45,H15,prefactor=(1.0d0,0.0d0))
!   original expression: Z59(e1be2b|m1bm2b)+=S46(e1be2b,d1bd2b|m1bm2b,l1bl2b)*H24(l1bl2b|d1bd2b)
    ierr=exatns_tensor_contract("Z59(e1,e2,m1,m2)+=S46(e1,e2,d1,d2,m1,m2,l1,l2)*H24(l1,l2,d1,d2)", &
        Z59,S46,H24,prefactor=(0.25d0,0.0d0))
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nvir_id/)
    tens_root = (/nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z75_2,"Z75_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z75_2,'ZERO')
!   original expression: Z75_2(l1b|d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|l2b)*-1.
    ierr=exatns_tensor_contract("Z75_2(l1,d1)+=H24(l1,l2,d1,d2)*S43(d2,l2)", &
        Z75_2,H24,S43,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z75_2)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nvir_id/)
    tens_root = (/nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z75_2,"Z75_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z75_2,'ZERO')
    ierr=exatns_tensor_destroy(Z75_2)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z165_2,"Z165_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z165_2,'ZERO')
!   original expression: Z165_2(l1b,l2b|m1b,d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|m1b)
    ierr=exatns_tensor_contract("Z165_2(l1,l2,m1,d1)+=H24(l1,l2,d1,d2)*S43(d2,m1)", &
        Z165_2,H24,S43,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z165_2)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nvir_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root/)
    ierr=exatns_tensor_create(Z72_1,"Z72_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z72_1,'ZERO')
!   original expression: Z72_1(e1b|d1b)+=H17(e1b,l1b|d1b,d2b)*S43(d2b|l1b)
    ierr=exatns_tensor_contract("Z72_1(e1,d1)+=H17(e1,l1,d1,d2)*S43(d2,l1)", &
        Z72_1,H17,S43,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z72_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nvir_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root/)
    ierr=exatns_tensor_create(Z72_1,"Z72_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z72_1,'ZERO')
    ierr=exatns_tensor_destroy(Z72_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nvir_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root/)
    ierr=exatns_tensor_create(Z72_1,"Z72_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z72_1,'ZERO')
!   original expression: Z72_1(e1b|d1b)+=S44(e1b,d2b|l1bl2b)*H24(l1bl2b|d1b,d2b)*-1.
    ierr=exatns_tensor_contract("Z72_1(e1,d1)+=S44(e1,d2,l1,l2)*H24(l1,l2,d1,d2)", &
        Z72_1,S44,H24,prefactor=(-0.5d0,0.0d0))
    ierr=exatns_tensor_destroy(Z72_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nvir_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root/)
    ierr=exatns_tensor_create(Z72_1,"Z72_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z72_1,'ZERO')
    ierr=exatns_tensor_destroy(Z72_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z74_1,"Z74_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z74_1,'ZERO')
!   original expression: Z74_1(l1b|m1b)+=H25(l1b,l2b|m1b,d1b)*S43(d1b|l2b)*-1.
    ierr=exatns_tensor_contract("Z74_1(l1,m1)+=H25(l1,l2,m1,d1)*S43(d1,l2)", &
        Z74_1,H25,S43,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z74_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z74_1,"Z74_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z74_1,'ZERO')
    ierr=exatns_tensor_destroy(Z74_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nvir_id/)
    tens_root = (/nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z75_2,"Z75_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z75_2,'ZERO')
!   original expression: Z75_2(l1b|d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|l2b)*-1.
    ierr=exatns_tensor_contract("Z75_2(l1,d1)+=H24(l1,l2,d1,d2)*S43(d2,l2)", &
        Z75_2,H24,S43,prefactor=(-1.0d0,0.0d0))
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z74_1,"Z74_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z74_1,'ZERO')
!   original expression: Z74_1(l1b|m1b)+=S43(d1b|m1b)*Z75_2(l1b|d1b)
    ierr=exatns_tensor_contract("Z74_1(l1,m1)+=S43(d1,m1)*Z75_2(l1,d1)", &
        Z74_1,S43,Z75_2,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z75_2)
    ierr=exatns_tensor_destroy(Z74_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nvir_id/)
    tens_root = (/nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z75_2,"Z75_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z75_2,'ZERO')
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z74_1,"Z74_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z74_1,'ZERO')
!   original expression: Z74_1(l1b|m1b)+=S43(d1b|m1b)*Z75_2(l1b|d1b)
    ierr=exatns_tensor_contract("Z74_1(l1,m1)+=S43(d1,m1)*Z75_2(l1,d1)", &
        Z74_1,S43,Z75_2,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z75_2)
    ierr=exatns_tensor_destroy(Z74_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z74_1,"Z74_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z74_1,'ZERO')
!   original expression: Z74_1(l1b|m1b)+=S43(d1b|m1b)*H15(l1b|d1b)*-1.
    ierr=exatns_tensor_contract("Z74_1(l1,m1)+=S43(d1,m1)*H15(l1,d1)", &
        Z74_1,S43,H15,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z74_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z74_1,"Z74_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z74_1,'ZERO')
!   original expression: Z74_1(l1b|m1b)+=S44(d1bd2b|m1b,l2b)*H24(l1b,l2b|d1bd2b)*-1.
    ierr=exatns_tensor_contract("Z74_1(l1,m1)+=S44(d1,d2,m1,l2)*H24(l1,l2,d1,d2)", &
        Z74_1,S44,H24,prefactor=(-0.5d0,0.0d0))
    ierr=exatns_tensor_destroy(Z74_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z74_1,"Z74_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z74_1,'ZERO')
    ierr=exatns_tensor_destroy(Z74_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z136_1,"Z136_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z136_1,'ZERO')
!   original expression: Z136_1(e1b,l1b|m1b,d1b)+=H17(e1b,l1b|d1b,d2b)*S43(d2b|m1b)*-1.
    ierr=exatns_tensor_contract("Z136_1(e1,l1,m1,d1)+=H17(e1,l1,d1,d2)*S43(d2,m1)", &
        Z136_1,H17,S43,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z136_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z136_1,"Z136_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z136_1,'ZERO')
!   original expression: Z136_1(e1b,l1b|m1b,d1b)+=S44(e1b,d2b|m1b,l2b)*H24(l1b,l2b|d1b,d2b)
    ierr=exatns_tensor_contract("Z136_1(e1,l1,m1,d1)+=S44(e1,d2,m1,l2)*H24(l1,l2,d1,d2)", &
        Z136_1,S44,H24,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z136_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z129_1,"Z129_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z129_1,'ZERO')
!   original expression: Z129_1(l1bl2b|m1b,d1b)+=H24(l1bl2b|d1b,d2b)*S43(d2b|m1b)
    ierr=exatns_tensor_contract("Z129_1(l1,l2,m1,d1)+=H24(l1,l2,d1,d2)*S43(d2,m1)", &
        Z129_1,H24,S43,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z129_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nvir_id/)
    tens_root = (/nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z75_1,"Z75_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z75_1,'ZERO')
!   original expression: Z75_1(l1b|d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|l2b)
    ierr=exatns_tensor_contract("Z75_1(l1,d1)+=H24(l1,l2,d1,d2)*S43(d2,l2)", &
        Z75_1,H24,S43,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z75_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nvir_id/)
    tens_root = (/nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z75_1,"Z75_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z75_1,'ZERO')
    ierr=exatns_tensor_destroy(Z75_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nvir_id/)
    tens_root = (/nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z75_1,"Z75_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z75_1,'ZERO')
!   original expression: Z75_1(l1b|d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|l2b)
    ierr=exatns_tensor_contract("Z75_1(l1,d1)+=H24(l1,l2,d1,d2)*S43(d2,l2)", &
        Z75_1,H24,S43,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z75_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nvir_id/)
    tens_root = (/nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z75_1,"Z75_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z75_1,'ZERO')
    ierr=exatns_tensor_destroy(Z75_1)
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=H4(e1be2b|m1b,d1b)*S44(e3b,d1b|m2bm3b)*-1.
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=H4(e1,e2,m1,d1)*S44(e3,d1,m2,m3)", &
        Z60,H4,S44,prefactor=(-1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=H4(e1be3b|m1b,d1b)*S44(e2b,d1b|m2bm3b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=H4(e1,e3,m1,d1)*S44(e2,d1,m2,m3)", &
        Z60,H4,S44,prefactor=(1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=H4(e2be3b|m1b,d1b)*S44(e1b,d1b|m2bm3b)*-1.
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=H4(e2,e3,m1,d1)*S44(e1,d1,m2,m3)", &
        Z60,H4,S44,prefactor=(-1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=H4(e1be2b|m2b,d1b)*S44(e3b,d1b|m1bm3b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=H4(e1,e2,m2,d1)*S44(e3,d1,m1,m3)", &
        Z60,H4,S44,prefactor=(1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=H4(e1be3b|m2b,d1b)*S44(e2b,d1b|m1bm3b)*-1.
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=H4(e1,e3,m2,d1)*S44(e2,d1,m1,m3)", &
        Z60,H4,S44,prefactor=(-1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=H4(e2be3b|m2b,d1b)*S44(e1b,d1b|m1bm3b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=H4(e2,e3,m2,d1)*S44(e1,d1,m1,m3)", &
        Z60,H4,S44,prefactor=(1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=H4(e1be2b|m3b,d1b)*S44(e3b,d1b|m1bm2b)*-1.
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=H4(e1,e2,m3,d1)*S44(e3,d1,m1,m2)", &
        Z60,H4,S44,prefactor=(-1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=H4(e1be3b|m3b,d1b)*S44(e2b,d1b|m1bm2b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=H4(e1,e3,m3,d1)*S44(e2,d1,m1,m2)", &
        Z60,H4,S44,prefactor=(1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=H4(e2be3b|m3b,d1b)*S44(e1b,d1b|m1bm2b)*-1.
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=H4(e2,e3,m3,d1)*S44(e1,d1,m1,m2)", &
        Z60,H4,S44,prefactor=(-1.0d0,0.0d0))
    
    allocate(tens_id(6), tens_root(6))
    tens_id   = (/nvir_id,nvir_id,nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nvir_root,nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z86_1,"Z86_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z86_1,'ZERO')
!   original expression: Z86_1(e1be2b,l1b|m1bm2bm3b)+=H18(e1b,l1b|m1b,d1b)*S44(e2b,d1b|m2bm3b)*-1.
    ierr=exatns_tensor_contract("Z86_1(e1,e2,l1,m1,m2,m3)+=H18(e1,l1,m1,d1)*S44(e2,d1,m2,m3)", &
        Z86_1,H18,S44,prefactor=(-1.0d0,0.0d0))
!   original expression: Z86_1(e1be2b,l1b|m1bm2bm3b)+=H18(e2b,l1b|m1b,d1b)*S44(e1b,d1b|m2bm3b)
    ierr=exatns_tensor_contract("Z86_1(e1,e2,l1,m1,m2,m3)+=H18(e2,l1,m1,d1)*S44(e1,d1,m2,m3)", &
        Z86_1,H18,S44,prefactor=(1.0d0,0.0d0))
!   original expression: Z86_1(e1be2b,l1b|m1bm2bm3b)+=H18(e1b,l1b|m2b,d1b)*S44(e2b,d1b|m1bm3b)
    ierr=exatns_tensor_contract("Z86_1(e1,e2,l1,m1,m2,m3)+=H18(e1,l1,m2,d1)*S44(e2,d1,m1,m3)", &
        Z86_1,H18,S44,prefactor=(1.0d0,0.0d0))
!   original expression: Z86_1(e1be2b,l1b|m1bm2bm3b)+=H18(e2b,l1b|m2b,d1b)*S44(e1b,d1b|m1bm3b)*-1.
    ierr=exatns_tensor_contract("Z86_1(e1,e2,l1,m1,m2,m3)+=H18(e2,l1,m2,d1)*S44(e1,d1,m1,m3)", &
        Z86_1,H18,S44,prefactor=(-1.0d0,0.0d0))
!   original expression: Z86_1(e1be2b,l1b|m1bm2bm3b)+=H18(e1b,l1b|m3b,d1b)*S44(e2b,d1b|m1bm2b)*-1.
    ierr=exatns_tensor_contract("Z86_1(e1,e2,l1,m1,m2,m3)+=H18(e1,l1,m3,d1)*S44(e2,d1,m1,m2)", &
        Z86_1,H18,S44,prefactor=(-1.0d0,0.0d0))
!   original expression: Z86_1(e1be2b,l1b|m1bm2bm3b)+=H18(e2b,l1b|m3b,d1b)*S44(e1b,d1b|m1bm2b)
    ierr=exatns_tensor_contract("Z86_1(e1,e2,l1,m1,m2,m3)+=H18(e2,l1,m3,d1)*S44(e1,d1,m1,m2)", &
        Z86_1,H18,S44,prefactor=(1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S43(e1b|l1b)*Z86_1(e2be3b,l1b|m1bm2bm3b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S43(e1,l1)*Z86_1(e2,e3,l1,m1,m2,m3)", &
        Z60,S43,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S43(e2b|l1b)*Z86_1(e1be3b,l1b|m1bm2bm3b)*-1.
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S43(e2,l1)*Z86_1(e1,e3,l1,m1,m2,m3)", &
        Z60,S43,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S43(e3b|l1b)*Z86_1(e1be2b,l1b|m1bm2bm3b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S43(e3,l1)*Z86_1(e1,e2,l1,m1,m2,m3)", &
        Z60,S43,Z86_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z86_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z165_3,"Z165_3",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z165_3,'ZERO')
!   original expression: Z165_3(l1b,l2b|m1b,d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|m1b)*0.5
    ierr=exatns_tensor_contract("Z165_3(l1,l2,m1,d1)+=H24(l1,l2,d1,d2)*S43(d2,m1)", &
        Z165_3,H24,S43,prefactor=(0.5d0,0.0d0))
    
    allocate(tens_id(6), tens_root(6))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z134_2,"Z134_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z134_2,'ZERO')
!   original expression: Z134_2(e1b,l1b,l2b|m1bm2bm3b)+=S44(e1b,d1b|m1bm2b)*Z165_3(l1b,l2b|m3b,d1b)
    ierr=exatns_tensor_contract("Z134_2(e1,l1,l2,m1,m2,m3)+=S44(e1,d1,m1,m2)*Z165_3(l1,l2,m3,d1)", &
        Z134_2,S44,Z165_3,prefactor=(1.0d0,0.0d0))
!   original expression: Z134_2(e1b,l1b,l2b|m1bm2bm3b)+=S44(e1b,d1b|m1bm3b)*Z165_3(l1b,l2b|m2b,d1b)*-1.
    ierr=exatns_tensor_contract("Z134_2(e1,l1,l2,m1,m2,m3)+=S44(e1,d1,m1,m3)*Z165_3(l1,l2,m2,d1)", &
        Z134_2,S44,Z165_3,prefactor=(-1.0d0,0.0d0))
!   original expression: Z134_2(e1b,l1b,l2b|m1bm2bm3b)+=S44(e1b,d1b|m2bm3b)*Z165_3(l1b,l2b|m1b,d1b)
    ierr=exatns_tensor_contract("Z134_2(e1,l1,l2,m1,m2,m3)+=S44(e1,d1,m2,m3)*Z165_3(l1,l2,m1,d1)", &
        Z134_2,S44,Z165_3,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z165_3)
    
    allocate(tens_id(6), tens_root(6))
    tens_id   = (/nvir_id,nvir_id,nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nvir_root,nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z86_1,"Z86_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z86_1,'ZERO')
!   original expression: Z86_1(e1be2b,l1b|m1bm2bm3b)+=S43(e1b|l2b)*Z134_2(e2b,l1b,l2b|m1bm2bm3b)
    ierr=exatns_tensor_contract("Z86_1(e1,e2,l1,m1,m2,m3)+=S43(e1,l2)*Z134_2(e2,l1,l2,m1,m2,m3)", &
        Z86_1,S43,Z134_2,prefactor=(1.0d0,0.0d0))
!   original expression: Z86_1(e1be2b,l1b|m1bm2bm3b)+=S43(e2b|l2b)*Z134_2(e1b,l1b,l2b|m1bm2bm3b)*-1.
    ierr=exatns_tensor_contract("Z86_1(e1,e2,l1,m1,m2,m3)+=S43(e2,l2)*Z134_2(e1,l1,l2,m1,m2,m3)", &
        Z86_1,S43,Z134_2,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z134_2)
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S43(e1b|l1b)*Z86_1(e2be3b,l1b|m1bm2bm3b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S43(e1,l1)*Z86_1(e2,e3,l1,m1,m2,m3)", &
        Z60,S43,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S43(e2b|l1b)*Z86_1(e1be3b,l1b|m1bm2bm3b)*-1.
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S43(e2,l1)*Z86_1(e1,e3,l1,m1,m2,m3)", &
        Z60,S43,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S43(e3b|l1b)*Z86_1(e1be2b,l1b|m1bm2bm3b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S43(e3,l1)*Z86_1(e1,e2,l1,m1,m2,m3)", &
        Z60,S43,Z86_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z86_1)
    
    allocate(tens_id(6), tens_root(6))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z134_2,"Z134_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z134_2,'ZERO')
!   original expression: Z134_2(e1b,l1b,l2b|m1bm2bm3b)+=S44(e1b,d1b|m1bm2b)*H25(l1b,l2b|m3b,d1b)*-0.5
    ierr=exatns_tensor_contract("Z134_2(e1,l1,l2,m1,m2,m3)+=S44(e1,d1,m1,m2)*H25(l1,l2,m3,d1)", &
        Z134_2,S44,H25,prefactor=(-0.5d0,0.0d0))
!   original expression: Z134_2(e1b,l1b,l2b|m1bm2bm3b)+=S44(e1b,d1b|m1bm3b)*H25(l1b,l2b|m2b,d1b)*+0.5
    ierr=exatns_tensor_contract("Z134_2(e1,l1,l2,m1,m2,m3)+=S44(e1,d1,m1,m3)*H25(l1,l2,m2,d1)", &
        Z134_2,S44,H25,prefactor=(0.5d0,0.0d0))
!   original expression: Z134_2(e1b,l1b,l2b|m1bm2bm3b)+=S44(e1b,d1b|m2bm3b)*H25(l1b,l2b|m1b,d1b)*+0.5
    ierr=exatns_tensor_contract("Z134_2(e1,l1,l2,m1,m2,m3)+=S44(e1,d1,m2,m3)*H25(l1,l2,m1,d1)", &
        Z134_2,S44,H25,prefactor=(0.5d0,0.0d0))
    
    allocate(tens_id(6), tens_root(6))
    tens_id   = (/nvir_id,nvir_id,nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nvir_root,nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z86_1,"Z86_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z86_1,'ZERO')
!   original expression: Z86_1(e1be2b,l1b|m1bm2bm3b)+=S43(e1b|l2b)*Z134_2(e2b,l1b,l2b|m1bm2bm3b)
    ierr=exatns_tensor_contract("Z86_1(e1,e2,l1,m1,m2,m3)+=S43(e1,l2)*Z134_2(e2,l1,l2,m1,m2,m3)", &
        Z86_1,S43,Z134_2,prefactor=(1.0d0,0.0d0))
!   original expression: Z86_1(e1be2b,l1b|m1bm2bm3b)+=S43(e2b|l2b)*Z134_2(e1b,l1b,l2b|m1bm2bm3b)*-1.
    ierr=exatns_tensor_contract("Z86_1(e1,e2,l1,m1,m2,m3)+=S43(e2,l2)*Z134_2(e1,l1,l2,m1,m2,m3)", &
        Z86_1,S43,Z134_2,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z134_2)
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S43(e1b|l1b)*Z86_1(e2be3b,l1b|m1bm2bm3b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S43(e1,l1)*Z86_1(e2,e3,l1,m1,m2,m3)", &
        Z60,S43,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S43(e2b|l1b)*Z86_1(e1be3b,l1b|m1bm2bm3b)*-1.
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S43(e2,l1)*Z86_1(e1,e3,l1,m1,m2,m3)", &
        Z60,S43,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S43(e3b|l1b)*Z86_1(e1be2b,l1b|m1bm2bm3b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S43(e3,l1)*Z86_1(e1,e2,l1,m1,m2,m3)", &
        Z60,S43,Z86_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z86_1)
    
    allocate(tens_id(6), tens_root(6))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z134_2,"Z134_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z134_2,'ZERO')
!   original expression: Z134_2(e1b,l1b,l2b|m1bm2bm3b)+=S45(e1b,d1bd2b|m1bm2bm3b)*H24(l1b,l2b|d1bd2b)*0.5
    ierr=exatns_tensor_contract("Z134_2(e1,l1,l2,m1,m2,m3)+=S45(e1,d1,d2,m1,m2,m3)*H24(l1,l2,d1,d2)", &
        Z134_2,S45,H24,prefactor=(0.25d0,0.0d0))
    
    allocate(tens_id(6), tens_root(6))
    tens_id   = (/nvir_id,nvir_id,nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nvir_root,nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z86_1,"Z86_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z86_1,'ZERO')
!   original expression: Z86_1(e1be2b,l1b|m1bm2bm3b)+=S43(e1b|l2b)*Z134_2(e2b,l1b,l2b|m1bm2bm3b)
    ierr=exatns_tensor_contract("Z86_1(e1,e2,l1,m1,m2,m3)+=S43(e1,l2)*Z134_2(e2,l1,l2,m1,m2,m3)", &
        Z86_1,S43,Z134_2,prefactor=(1.0d0,0.0d0))
!   original expression: Z86_1(e1be2b,l1b|m1bm2bm3b)+=S43(e2b|l2b)*Z134_2(e1b,l1b,l2b|m1bm2bm3b)*-1.
    ierr=exatns_tensor_contract("Z86_1(e1,e2,l1,m1,m2,m3)+=S43(e2,l2)*Z134_2(e1,l1,l2,m1,m2,m3)", &
        Z86_1,S43,Z134_2,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z134_2)
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S43(e1b|l1b)*Z86_1(e2be3b,l1b|m1bm2bm3b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S43(e1,l1)*Z86_1(e2,e3,l1,m1,m2,m3)", &
        Z60,S43,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S43(e2b|l1b)*Z86_1(e1be3b,l1b|m1bm2bm3b)*-1.
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S43(e2,l1)*Z86_1(e1,e3,l1,m1,m2,m3)", &
        Z60,S43,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S43(e3b|l1b)*Z86_1(e1be2b,l1b|m1bm2bm3b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S43(e3,l1)*Z86_1(e1,e2,l1,m1,m2,m3)", &
        Z60,S43,Z86_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z86_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z136_2,"Z136_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z136_2,'ZERO')
!   original expression: Z136_2(e1b,l1b|m1b,d1b)+=H17(e1b,l1b|d1b,d2b)*S43(d2b|m1b)*-1.
    ierr=exatns_tensor_contract("Z136_2(e1,l1,m1,d1)+=H17(e1,l1,d1,d2)*S43(d2,m1)", &
        Z136_2,H17,S43,prefactor=(-1.0d0,0.0d0))
    
    allocate(tens_id(6), tens_root(6))
    tens_id   = (/nvir_id,nvir_id,nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nvir_root,nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z86_1,"Z86_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z86_1,'ZERO')
!   original expression: Z86_1(e1be2b,l1b|m1bm2bm3b)+=S44(e1b,d1b|m1bm2b)*Z136_2(e2b,l1b|m3b,d1b)
    ierr=exatns_tensor_contract("Z86_1(e1,e2,l1,m1,m2,m3)+=S44(e1,d1,m1,m2)*Z136_2(e2,l1,m3,d1)", &
        Z86_1,S44,Z136_2,prefactor=(1.0d0,0.0d0))
!   original expression: Z86_1(e1be2b,l1b|m1bm2bm3b)+=S44(e2b,d1b|m1bm2b)*Z136_2(e1b,l1b|m3b,d1b)*-1.
    ierr=exatns_tensor_contract("Z86_1(e1,e2,l1,m1,m2,m3)+=S44(e2,d1,m1,m2)*Z136_2(e1,l1,m3,d1)", &
        Z86_1,S44,Z136_2,prefactor=(-1.0d0,0.0d0))
!   original expression: Z86_1(e1be2b,l1b|m1bm2bm3b)+=S44(e1b,d1b|m1bm3b)*Z136_2(e2b,l1b|m2b,d1b)*-1.
    ierr=exatns_tensor_contract("Z86_1(e1,e2,l1,m1,m2,m3)+=S44(e1,d1,m1,m3)*Z136_2(e2,l1,m2,d1)", &
        Z86_1,S44,Z136_2,prefactor=(-1.0d0,0.0d0))
!   original expression: Z86_1(e1be2b,l1b|m1bm2bm3b)+=S44(e2b,d1b|m1bm3b)*Z136_2(e1b,l1b|m2b,d1b)
    ierr=exatns_tensor_contract("Z86_1(e1,e2,l1,m1,m2,m3)+=S44(e2,d1,m1,m3)*Z136_2(e1,l1,m2,d1)", &
        Z86_1,S44,Z136_2,prefactor=(1.0d0,0.0d0))
!   original expression: Z86_1(e1be2b,l1b|m1bm2bm3b)+=S44(e1b,d1b|m2bm3b)*Z136_2(e2b,l1b|m1b,d1b)
    ierr=exatns_tensor_contract("Z86_1(e1,e2,l1,m1,m2,m3)+=S44(e1,d1,m2,m3)*Z136_2(e2,l1,m1,d1)", &
        Z86_1,S44,Z136_2,prefactor=(1.0d0,0.0d0))
!   original expression: Z86_1(e1be2b,l1b|m1bm2bm3b)+=S44(e2b,d1b|m2bm3b)*Z136_2(e1b,l1b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z86_1(e1,e2,l1,m1,m2,m3)+=S44(e2,d1,m2,m3)*Z136_2(e1,l1,m1,d1)", &
        Z86_1,S44,Z136_2,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z136_2)
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S43(e1b|l1b)*Z86_1(e2be3b,l1b|m1bm2bm3b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S43(e1,l1)*Z86_1(e2,e3,l1,m1,m2,m3)", &
        Z60,S43,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S43(e2b|l1b)*Z86_1(e1be3b,l1b|m1bm2bm3b)*-1.
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S43(e2,l1)*Z86_1(e1,e3,l1,m1,m2,m3)", &
        Z60,S43,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S43(e3b|l1b)*Z86_1(e1be2b,l1b|m1bm2bm3b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S43(e3,l1)*Z86_1(e1,e2,l1,m1,m2,m3)", &
        Z60,S43,Z86_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z86_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z136_2,"Z136_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z136_2,'ZERO')
!   original expression: Z136_2(e1b,l1b|m1b,d1b)+=S44(e1b,d2b|m1b,l2b)*H24(l1b,l2b|d1b,d2b)
    ierr=exatns_tensor_contract("Z136_2(e1,l1,m1,d1)+=S44(e1,d2,m1,l2)*H24(l1,l2,d1,d2)", &
        Z136_2,S44,H24,prefactor=(1.0d0,0.0d0))
    
    allocate(tens_id(6), tens_root(6))
    tens_id   = (/nvir_id,nvir_id,nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nvir_root,nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z86_1,"Z86_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z86_1,'ZERO')
!   original expression: Z86_1(e1be2b,l1b|m1bm2bm3b)+=S44(e1b,d1b|m1bm2b)*Z136_2(e2b,l1b|m3b,d1b)
    ierr=exatns_tensor_contract("Z86_1(e1,e2,l1,m1,m2,m3)+=S44(e1,d1,m1,m2)*Z136_2(e2,l1,m3,d1)", &
        Z86_1,S44,Z136_2,prefactor=(1.0d0,0.0d0))
!   original expression: Z86_1(e1be2b,l1b|m1bm2bm3b)+=S44(e2b,d1b|m1bm2b)*Z136_2(e1b,l1b|m3b,d1b)*-1.
    ierr=exatns_tensor_contract("Z86_1(e1,e2,l1,m1,m2,m3)+=S44(e2,d1,m1,m2)*Z136_2(e1,l1,m3,d1)", &
        Z86_1,S44,Z136_2,prefactor=(-1.0d0,0.0d0))
!   original expression: Z86_1(e1be2b,l1b|m1bm2bm3b)+=S44(e1b,d1b|m1bm3b)*Z136_2(e2b,l1b|m2b,d1b)*-1.
    ierr=exatns_tensor_contract("Z86_1(e1,e2,l1,m1,m2,m3)+=S44(e1,d1,m1,m3)*Z136_2(e2,l1,m2,d1)", &
        Z86_1,S44,Z136_2,prefactor=(-1.0d0,0.0d0))
!   original expression: Z86_1(e1be2b,l1b|m1bm2bm3b)+=S44(e2b,d1b|m1bm3b)*Z136_2(e1b,l1b|m2b,d1b)
    ierr=exatns_tensor_contract("Z86_1(e1,e2,l1,m1,m2,m3)+=S44(e2,d1,m1,m3)*Z136_2(e1,l1,m2,d1)", &
        Z86_1,S44,Z136_2,prefactor=(1.0d0,0.0d0))
!   original expression: Z86_1(e1be2b,l1b|m1bm2bm3b)+=S44(e1b,d1b|m2bm3b)*Z136_2(e2b,l1b|m1b,d1b)
    ierr=exatns_tensor_contract("Z86_1(e1,e2,l1,m1,m2,m3)+=S44(e1,d1,m2,m3)*Z136_2(e2,l1,m1,d1)", &
        Z86_1,S44,Z136_2,prefactor=(1.0d0,0.0d0))
!   original expression: Z86_1(e1be2b,l1b|m1bm2bm3b)+=S44(e2b,d1b|m2bm3b)*Z136_2(e1b,l1b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z86_1(e1,e2,l1,m1,m2,m3)+=S44(e2,d1,m2,m3)*Z136_2(e1,l1,m1,d1)", &
        Z86_1,S44,Z136_2,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z136_2)
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S43(e1b|l1b)*Z86_1(e2be3b,l1b|m1bm2bm3b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S43(e1,l1)*Z86_1(e2,e3,l1,m1,m2,m3)", &
        Z60,S43,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S43(e2b|l1b)*Z86_1(e1be3b,l1b|m1bm2bm3b)*-1.
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S43(e2,l1)*Z86_1(e1,e3,l1,m1,m2,m3)", &
        Z60,S43,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S43(e3b|l1b)*Z86_1(e1be2b,l1b|m1bm2bm3b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S43(e3,l1)*Z86_1(e1,e2,l1,m1,m2,m3)", &
        Z60,S43,Z86_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z86_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z136_2,"Z136_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z136_2,'ZERO')
    
    allocate(tens_id(6), tens_root(6))
    tens_id   = (/nvir_id,nvir_id,nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nvir_root,nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z86_1,"Z86_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z86_1,'ZERO')
!   original expression: Z86_1(e1be2b,l1b|m1bm2bm3b)+=S44(e1b,d1b|m1bm2b)*Z136_2(e2b,l1b|m3b,d1b)
    ierr=exatns_tensor_contract("Z86_1(e1,e2,l1,m1,m2,m3)+=S44(e1,d1,m1,m2)*Z136_2(e2,l1,m3,d1)", &
        Z86_1,S44,Z136_2,prefactor=(1.0d0,0.0d0))
!   original expression: Z86_1(e1be2b,l1b|m1bm2bm3b)+=S44(e2b,d1b|m1bm2b)*Z136_2(e1b,l1b|m3b,d1b)*-1.
    ierr=exatns_tensor_contract("Z86_1(e1,e2,l1,m1,m2,m3)+=S44(e2,d1,m1,m2)*Z136_2(e1,l1,m3,d1)", &
        Z86_1,S44,Z136_2,prefactor=(-1.0d0,0.0d0))
!   original expression: Z86_1(e1be2b,l1b|m1bm2bm3b)+=S44(e1b,d1b|m1bm3b)*Z136_2(e2b,l1b|m2b,d1b)*-1.
    ierr=exatns_tensor_contract("Z86_1(e1,e2,l1,m1,m2,m3)+=S44(e1,d1,m1,m3)*Z136_2(e2,l1,m2,d1)", &
        Z86_1,S44,Z136_2,prefactor=(-1.0d0,0.0d0))
!   original expression: Z86_1(e1be2b,l1b|m1bm2bm3b)+=S44(e2b,d1b|m1bm3b)*Z136_2(e1b,l1b|m2b,d1b)
    ierr=exatns_tensor_contract("Z86_1(e1,e2,l1,m1,m2,m3)+=S44(e2,d1,m1,m3)*Z136_2(e1,l1,m2,d1)", &
        Z86_1,S44,Z136_2,prefactor=(1.0d0,0.0d0))
!   original expression: Z86_1(e1be2b,l1b|m1bm2bm3b)+=S44(e1b,d1b|m2bm3b)*Z136_2(e2b,l1b|m1b,d1b)
    ierr=exatns_tensor_contract("Z86_1(e1,e2,l1,m1,m2,m3)+=S44(e1,d1,m2,m3)*Z136_2(e2,l1,m1,d1)", &
        Z86_1,S44,Z136_2,prefactor=(1.0d0,0.0d0))
!   original expression: Z86_1(e1be2b,l1b|m1bm2bm3b)+=S44(e2b,d1b|m2bm3b)*Z136_2(e1b,l1b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z86_1(e1,e2,l1,m1,m2,m3)+=S44(e2,d1,m2,m3)*Z136_2(e1,l1,m1,d1)", &
        Z86_1,S44,Z136_2,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z136_2)
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S43(e1b|l1b)*Z86_1(e2be3b,l1b|m1bm2bm3b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S43(e1,l1)*Z86_1(e2,e3,l1,m1,m2,m3)", &
        Z60,S43,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S43(e2b|l1b)*Z86_1(e1be3b,l1b|m1bm2bm3b)*-1.
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S43(e2,l1)*Z86_1(e1,e3,l1,m1,m2,m3)", &
        Z60,S43,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S43(e3b|l1b)*Z86_1(e1be2b,l1b|m1bm2bm3b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S43(e3,l1)*Z86_1(e1,e2,l1,m1,m2,m3)", &
        Z60,S43,Z86_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z86_1)
    
    allocate(tens_id(6), tens_root(6))
    tens_id   = (/nvir_id,nvir_id,nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nvir_root,nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z86_1,"Z86_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z86_1,'ZERO')
!   original expression: Z86_1(e1be2b,l1b|m1bm2bm3b)+=S45(e1b,d1bd2b|m1bm2bm3b)*H17(e2b,l1b|d1bd2b)*-1.
    ierr=exatns_tensor_contract("Z86_1(e1,e2,l1,m1,m2,m3)+=S45(e1,d1,d2,m1,m2,m3)*H17(e2,l1,d1,d2)", &
        Z86_1,S45,H17,prefactor=(-0.5d0,0.0d0))
!   original expression: Z86_1(e1be2b,l1b|m1bm2bm3b)+=S45(e2b,d1bd2b|m1bm2bm3b)*H17(e1b,l1b|d1bd2b)
    ierr=exatns_tensor_contract("Z86_1(e1,e2,l1,m1,m2,m3)+=S45(e2,d1,d2,m1,m2,m3)*H17(e1,l1,d1,d2)", &
        Z86_1,S45,H17,prefactor=(0.5d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S43(e1b|l1b)*Z86_1(e2be3b,l1b|m1bm2bm3b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S43(e1,l1)*Z86_1(e2,e3,l1,m1,m2,m3)", &
        Z60,S43,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S43(e2b|l1b)*Z86_1(e1be3b,l1b|m1bm2bm3b)*-1.
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S43(e2,l1)*Z86_1(e1,e3,l1,m1,m2,m3)", &
        Z60,S43,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S43(e3b|l1b)*Z86_1(e1be2b,l1b|m1bm2bm3b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S43(e3,l1)*Z86_1(e1,e2,l1,m1,m2,m3)", &
        Z60,S43,Z86_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z86_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nvir_id/)
    tens_root = (/nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z75_2,"Z75_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z75_2,'ZERO')
!   original expression: Z75_2(l1b|d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|l2b)*-1.
    ierr=exatns_tensor_contract("Z75_2(l1,d1)+=H24(l1,l2,d1,d2)*S43(d2,l2)", &
        Z75_2,H24,S43,prefactor=(-1.0d0,0.0d0))
    
    allocate(tens_id(6), tens_root(6))
    tens_id   = (/nvir_id,nvir_id,nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nvir_root,nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z86_1,"Z86_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z86_1,'ZERO')
!   original expression: Z86_1(e1be2b,l1b|m1bm2bm3b)+=S45(e1be2b,d1b|m1bm2bm3b)*Z75_2(l1b|d1b)
    ierr=exatns_tensor_contract("Z86_1(e1,e2,l1,m1,m2,m3)+=S45(e1,e2,d1,m1,m2,m3)*Z75_2(l1,d1)", &
        Z86_1,S45,Z75_2,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z75_2)
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S43(e1b|l1b)*Z86_1(e2be3b,l1b|m1bm2bm3b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S43(e1,l1)*Z86_1(e2,e3,l1,m1,m2,m3)", &
        Z60,S43,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S43(e2b|l1b)*Z86_1(e1be3b,l1b|m1bm2bm3b)*-1.
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S43(e2,l1)*Z86_1(e1,e3,l1,m1,m2,m3)", &
        Z60,S43,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S43(e3b|l1b)*Z86_1(e1be2b,l1b|m1bm2bm3b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S43(e3,l1)*Z86_1(e1,e2,l1,m1,m2,m3)", &
        Z60,S43,Z86_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z86_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nvir_id/)
    tens_root = (/nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z75_2,"Z75_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z75_2,'ZERO')
    
    allocate(tens_id(6), tens_root(6))
    tens_id   = (/nvir_id,nvir_id,nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nvir_root,nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z86_1,"Z86_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z86_1,'ZERO')
!   original expression: Z86_1(e1be2b,l1b|m1bm2bm3b)+=S45(e1be2b,d1b|m1bm2bm3b)*Z75_2(l1b|d1b)
    ierr=exatns_tensor_contract("Z86_1(e1,e2,l1,m1,m2,m3)+=S45(e1,e2,d1,m1,m2,m3)*Z75_2(l1,d1)", &
        Z86_1,S45,Z75_2,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z75_2)
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S43(e1b|l1b)*Z86_1(e2be3b,l1b|m1bm2bm3b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S43(e1,l1)*Z86_1(e2,e3,l1,m1,m2,m3)", &
        Z60,S43,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S43(e2b|l1b)*Z86_1(e1be3b,l1b|m1bm2bm3b)*-1.
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S43(e2,l1)*Z86_1(e1,e3,l1,m1,m2,m3)", &
        Z60,S43,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S43(e3b|l1b)*Z86_1(e1be2b,l1b|m1bm2bm3b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S43(e3,l1)*Z86_1(e1,e2,l1,m1,m2,m3)", &
        Z60,S43,Z86_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z86_1)
    
    allocate(tens_id(6), tens_root(6))
    tens_id   = (/nvir_id,nvir_id,nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nvir_root,nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z86_1,"Z86_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z86_1,'ZERO')
!   original expression: Z86_1(e1be2b,l1b|m1bm2bm3b)+=S45(e1be2b,d1b|m1bm2bm3b)*H15(l1b|d1b)*-1.
    ierr=exatns_tensor_contract("Z86_1(e1,e2,l1,m1,m2,m3)+=S45(e1,e2,d1,m1,m2,m3)*H15(l1,d1)", &
        Z86_1,S45,H15,prefactor=(-1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S43(e1b|l1b)*Z86_1(e2be3b,l1b|m1bm2bm3b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S43(e1,l1)*Z86_1(e2,e3,l1,m1,m2,m3)", &
        Z60,S43,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S43(e2b|l1b)*Z86_1(e1be3b,l1b|m1bm2bm3b)*-1.
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S43(e2,l1)*Z86_1(e1,e3,l1,m1,m2,m3)", &
        Z60,S43,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S43(e3b|l1b)*Z86_1(e1be2b,l1b|m1bm2bm3b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S43(e3,l1)*Z86_1(e1,e2,l1,m1,m2,m3)", &
        Z60,S43,Z86_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z86_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z165_2,"Z165_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z165_2,'ZERO')
!   original expression: Z165_2(l1b,l2b|m1b,d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|m1b)
    ierr=exatns_tensor_contract("Z165_2(l1,l2,m1,d1)+=H24(l1,l2,d1,d2)*S43(d2,m1)", &
        Z165_2,H24,S43,prefactor=(1.0d0,0.0d0))
    
    allocate(tens_id(6), tens_root(6))
    tens_id   = (/nvir_id,nvir_id,nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nvir_root,nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z86_1,"Z86_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z86_1,'ZERO')
!   original expression: Z86_1(e1be2b,l1b|m1bm2bm3b)+=S45(e1be2b,d1b|m1bm2b,l2b)*Z165_2(l1b,l2b|m3b,d1b)
    ierr=exatns_tensor_contract("Z86_1(e1,e2,l1,m1,m2,m3)+=S45(e1,e2,d1,m1,m2,l2)*Z165_2(l1,l2,m3,d1)", &
        Z86_1,S45,Z165_2,prefactor=(1.0d0,0.0d0))
!   original expression: Z86_1(e1be2b,l1b|m1bm2bm3b)+=S45(e1be2b,d1b|m1bm3b,l2b)*Z165_2(l1b,l2b|m2b,d1b)*-1.
    ierr=exatns_tensor_contract("Z86_1(e1,e2,l1,m1,m2,m3)+=S45(e1,e2,d1,m1,m3,l2)*Z165_2(l1,l2,m2,d1)", &
        Z86_1,S45,Z165_2,prefactor=(-1.0d0,0.0d0))
!   original expression: Z86_1(e1be2b,l1b|m1bm2bm3b)+=S45(e1be2b,d1b|m2bm3b,l2b)*Z165_2(l1b,l2b|m1b,d1b)
    ierr=exatns_tensor_contract("Z86_1(e1,e2,l1,m1,m2,m3)+=S45(e1,e2,d1,m2,m3,l2)*Z165_2(l1,l2,m1,d1)", &
        Z86_1,S45,Z165_2,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z165_2)
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S43(e1b|l1b)*Z86_1(e2be3b,l1b|m1bm2bm3b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S43(e1,l1)*Z86_1(e2,e3,l1,m1,m2,m3)", &
        Z60,S43,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S43(e2b|l1b)*Z86_1(e1be3b,l1b|m1bm2bm3b)*-1.
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S43(e2,l1)*Z86_1(e1,e3,l1,m1,m2,m3)", &
        Z60,S43,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S43(e3b|l1b)*Z86_1(e1be2b,l1b|m1bm2bm3b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S43(e3,l1)*Z86_1(e1,e2,l1,m1,m2,m3)", &
        Z60,S43,Z86_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z86_1)
    
    allocate(tens_id(6), tens_root(6))
    tens_id   = (/nvir_id,nvir_id,nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nvir_root,nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z86_1,"Z86_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z86_1,'ZERO')
!   original expression: Z86_1(e1be2b,l1b|m1bm2bm3b)+=S45(e1be2b,d1b|m1bm2b,l2b)*H25(l1b,l2b|m3b,d1b)*-1.
    ierr=exatns_tensor_contract("Z86_1(e1,e2,l1,m1,m2,m3)+=S45(e1,e2,d1,m1,m2,l2)*H25(l1,l2,m3,d1)", &
        Z86_1,S45,H25,prefactor=(-1.0d0,0.0d0))
!   original expression: Z86_1(e1be2b,l1b|m1bm2bm3b)+=S45(e1be2b,d1b|m1bm3b,l2b)*H25(l1b,l2b|m2b,d1b)
    ierr=exatns_tensor_contract("Z86_1(e1,e2,l1,m1,m2,m3)+=S45(e1,e2,d1,m1,m3,l2)*H25(l1,l2,m2,d1)", &
        Z86_1,S45,H25,prefactor=(1.0d0,0.0d0))
!   original expression: Z86_1(e1be2b,l1b|m1bm2bm3b)+=S45(e1be2b,d1b|m2bm3b,l2b)*H25(l1b,l2b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z86_1(e1,e2,l1,m1,m2,m3)+=S45(e1,e2,d1,m2,m3,l2)*H25(l1,l2,m1,d1)", &
        Z86_1,S45,H25,prefactor=(-1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S43(e1b|l1b)*Z86_1(e2be3b,l1b|m1bm2bm3b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S43(e1,l1)*Z86_1(e2,e3,l1,m1,m2,m3)", &
        Z60,S43,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S43(e2b|l1b)*Z86_1(e1be3b,l1b|m1bm2bm3b)*-1.
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S43(e2,l1)*Z86_1(e1,e3,l1,m1,m2,m3)", &
        Z60,S43,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S43(e3b|l1b)*Z86_1(e1be2b,l1b|m1bm2bm3b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S43(e3,l1)*Z86_1(e1,e2,l1,m1,m2,m3)", &
        Z60,S43,Z86_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z86_1)
    
    allocate(tens_id(6), tens_root(6))
    tens_id   = (/nvir_id,nvir_id,nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nvir_root,nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z86_1,"Z86_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z86_1,'ZERO')
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S43(e1b|l1b)*Z86_1(e2be3b,l1b|m1bm2bm3b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S43(e1,l1)*Z86_1(e2,e3,l1,m1,m2,m3)", &
        Z60,S43,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S43(e2b|l1b)*Z86_1(e1be3b,l1b|m1bm2bm3b)*-1.
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S43(e2,l1)*Z86_1(e1,e3,l1,m1,m2,m3)", &
        Z60,S43,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S43(e3b|l1b)*Z86_1(e1be2b,l1b|m1bm2bm3b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S43(e3,l1)*Z86_1(e1,e2,l1,m1,m2,m3)", &
        Z60,S43,Z86_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z86_1)
    
    allocate(tens_id(6), tens_root(6))
    tens_id   = (/nvir_id,nvir_id,nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nvir_root,nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z86_1,"Z86_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z86_1,'ZERO')
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S43(e1b|l1b)*Z86_1(e2be3b,l1b|m1bm2bm3b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S43(e1,l1)*Z86_1(e2,e3,l1,m1,m2,m3)", &
        Z60,S43,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S43(e2b|l1b)*Z86_1(e1be3b,l1b|m1bm2bm3b)*-1.
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S43(e2,l1)*Z86_1(e1,e3,l1,m1,m2,m3)", &
        Z60,S43,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S43(e3b|l1b)*Z86_1(e1be2b,l1b|m1bm2bm3b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S43(e3,l1)*Z86_1(e1,e2,l1,m1,m2,m3)", &
        Z60,S43,Z86_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z86_1)
    
    allocate(tens_id(6), tens_root(6))
    tens_id   = (/nvir_id,nvir_id,nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nvir_root,nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z86_1,"Z86_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z86_1,'ZERO')
!   original expression: Z86_1(e1be2b,l1b|m1bm2bm3b)+=S46(e1be2b,d1bd2b|m1bm2bm3b,l2b)*H24(l1b,l2b|d1bd2b)*-1.
    ierr=exatns_tensor_contract("Z86_1(e1,e2,l1,m1,m2,m3)+=S46(e1,e2,d1,d2,m1,m2,m3,l2)*H24(l1,l2,d1,d2)", &
        Z86_1,S46,H24,prefactor=(-0.5d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S43(e1b|l1b)*Z86_1(e2be3b,l1b|m1bm2bm3b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S43(e1,l1)*Z86_1(e2,e3,l1,m1,m2,m3)", &
        Z60,S43,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S43(e2b|l1b)*Z86_1(e1be3b,l1b|m1bm2bm3b)*-1.
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S43(e2,l1)*Z86_1(e1,e3,l1,m1,m2,m3)", &
        Z60,S43,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S43(e3b|l1b)*Z86_1(e1be2b,l1b|m1bm2bm3b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S43(e3,l1)*Z86_1(e1,e2,l1,m1,m2,m3)", &
        Z60,S43,Z86_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z86_1)
    
    allocate(tens_id(6), tens_root(6))
    tens_id   = (/nvir_id,nvir_id,nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nvir_root,nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z86_1,"Z86_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z86_1,'ZERO')
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S43(e1b|l1b)*Z86_1(e2be3b,l1b|m1bm2bm3b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S43(e1,l1)*Z86_1(e2,e3,l1,m1,m2,m3)", &
        Z60,S43,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S43(e2b|l1b)*Z86_1(e1be3b,l1b|m1bm2bm3b)*-1.
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S43(e2,l1)*Z86_1(e1,e3,l1,m1,m2,m3)", &
        Z60,S43,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S43(e3b|l1b)*Z86_1(e1be2b,l1b|m1bm2bm3b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S43(e3,l1)*Z86_1(e1,e2,l1,m1,m2,m3)", &
        Z60,S43,Z86_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z86_1)
    
    allocate(tens_id(6), tens_root(6))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z82_1,"Z82_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z82_1,'ZERO')
!   original expression: Z82_1(e1b,l1bl2b|m1bm2bm3b)+=S45(e1b,d1bd2b|m1bm2bm3b)*H24(l1bl2b|d1bd2b)
    ierr=exatns_tensor_contract("Z82_1(e1,l1,l2,m1,m2,m3)+=S45(e1,d1,d2,m1,m2,m3)*H24(l1,l2,d1,d2)", &
        Z82_1,S45,H24,prefactor=(0.5d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e1be2b|l1bl2b)*Z82_1(e3b,l1bl2b|m1bm2bm3b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e1,e2,l1,l2)*Z82_1(e3,l1,l2,m1,m2,m3)", &
        Z60,S44,Z82_1,prefactor=(0.5d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e1be3b|l1bl2b)*Z82_1(e2b,l1bl2b|m1bm2bm3b)*-1.
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e1,e3,l1,l2)*Z82_1(e2,l1,l2,m1,m2,m3)", &
        Z60,S44,Z82_1,prefactor=(-0.5d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e2be3b|l1bl2b)*Z82_1(e1b,l1bl2b|m1bm2bm3b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e2,e3,l1,l2)*Z82_1(e1,l1,l2,m1,m2,m3)", &
        Z60,S44,Z82_1,prefactor=(0.5d0,0.0d0))
    ierr=exatns_tensor_destroy(Z82_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nvir_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z91_1,"Z91_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z91_1,'ZERO')
!   original expression: Z91_1(e1be2b|m1b,d1b)+=H3(e1be2b|d1b,d2b)*S43(d2b|m1b)
    ierr=exatns_tensor_contract("Z91_1(e1,e2,m1,d1)+=H3(e1,e2,d1,d2)*S43(d2,m1)", &
        Z91_1,H3,S43,prefactor=(1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e1b,d1b|m1bm2b)*Z91_1(e2be3b|m3b,d1b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e1,d1,m1,m2)*Z91_1(e2,e3,m3,d1)", &
        Z60,S44,Z91_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e2b,d1b|m1bm2b)*Z91_1(e1be3b|m3b,d1b)*-1.
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e2,d1,m1,m2)*Z91_1(e1,e3,m3,d1)", &
        Z60,S44,Z91_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e3b,d1b|m1bm2b)*Z91_1(e1be2b|m3b,d1b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e3,d1,m1,m2)*Z91_1(e1,e2,m3,d1)", &
        Z60,S44,Z91_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e1b,d1b|m1bm3b)*Z91_1(e2be3b|m2b,d1b)*-1.
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e1,d1,m1,m3)*Z91_1(e2,e3,m2,d1)", &
        Z60,S44,Z91_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e2b,d1b|m1bm3b)*Z91_1(e1be3b|m2b,d1b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e2,d1,m1,m3)*Z91_1(e1,e3,m2,d1)", &
        Z60,S44,Z91_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e3b,d1b|m1bm3b)*Z91_1(e1be2b|m2b,d1b)*-1.
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e3,d1,m1,m3)*Z91_1(e1,e2,m2,d1)", &
        Z60,S44,Z91_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e1b,d1b|m2bm3b)*Z91_1(e2be3b|m1b,d1b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e1,d1,m2,m3)*Z91_1(e2,e3,m1,d1)", &
        Z60,S44,Z91_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e2b,d1b|m2bm3b)*Z91_1(e1be3b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e2,d1,m2,m3)*Z91_1(e1,e3,m1,d1)", &
        Z60,S44,Z91_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e3b,d1b|m2bm3b)*Z91_1(e1be2b|m1b,d1b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e3,d1,m2,m3)*Z91_1(e1,e2,m1,d1)", &
        Z60,S44,Z91_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z91_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nvir_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z91_1,"Z91_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z91_1,'ZERO')
!   original expression: Z91_1(e1be2b|m1b,d1b)+=H17(e1b,l1b|d1b,d2b)*S44(e2b,d2b|m1b,l1b)
    ierr=exatns_tensor_contract("Z91_1(e1,e2,m1,d1)+=H17(e1,l1,d1,d2)*S44(e2,d2,m1,l1)", &
        Z91_1,H17,S44,prefactor=(1.0d0,0.0d0))
!   original expression: Z91_1(e1be2b|m1b,d1b)+=H17(e2b,l1b|d1b,d2b)*S44(e1b,d2b|m1b,l1b)*-1.
    ierr=exatns_tensor_contract("Z91_1(e1,e2,m1,d1)+=H17(e2,l1,d1,d2)*S44(e1,d2,m1,l1)", &
        Z91_1,H17,S44,prefactor=(-1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e1b,d1b|m1bm2b)*Z91_1(e2be3b|m3b,d1b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e1,d1,m1,m2)*Z91_1(e2,e3,m3,d1)", &
        Z60,S44,Z91_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e2b,d1b|m1bm2b)*Z91_1(e1be3b|m3b,d1b)*-1.
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e2,d1,m1,m2)*Z91_1(e1,e3,m3,d1)", &
        Z60,S44,Z91_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e3b,d1b|m1bm2b)*Z91_1(e1be2b|m3b,d1b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e3,d1,m1,m2)*Z91_1(e1,e2,m3,d1)", &
        Z60,S44,Z91_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e1b,d1b|m1bm3b)*Z91_1(e2be3b|m2b,d1b)*-1.
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e1,d1,m1,m3)*Z91_1(e2,e3,m2,d1)", &
        Z60,S44,Z91_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e2b,d1b|m1bm3b)*Z91_1(e1be3b|m2b,d1b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e2,d1,m1,m3)*Z91_1(e1,e3,m2,d1)", &
        Z60,S44,Z91_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e3b,d1b|m1bm3b)*Z91_1(e1be2b|m2b,d1b)*-1.
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e3,d1,m1,m3)*Z91_1(e1,e2,m2,d1)", &
        Z60,S44,Z91_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e1b,d1b|m2bm3b)*Z91_1(e2be3b|m1b,d1b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e1,d1,m2,m3)*Z91_1(e2,e3,m1,d1)", &
        Z60,S44,Z91_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e2b,d1b|m2bm3b)*Z91_1(e1be3b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e2,d1,m2,m3)*Z91_1(e1,e3,m1,d1)", &
        Z60,S44,Z91_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e3b,d1b|m2bm3b)*Z91_1(e1be2b|m1b,d1b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e3,d1,m2,m3)*Z91_1(e1,e2,m1,d1)", &
        Z60,S44,Z91_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z91_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nvir_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z91_1,"Z91_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z91_1,'ZERO')
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e1b,d1b|m1bm2b)*Z91_1(e2be3b|m3b,d1b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e1,d1,m1,m2)*Z91_1(e2,e3,m3,d1)", &
        Z60,S44,Z91_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e2b,d1b|m1bm2b)*Z91_1(e1be3b|m3b,d1b)*-1.
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e2,d1,m1,m2)*Z91_1(e1,e3,m3,d1)", &
        Z60,S44,Z91_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e3b,d1b|m1bm2b)*Z91_1(e1be2b|m3b,d1b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e3,d1,m1,m2)*Z91_1(e1,e2,m3,d1)", &
        Z60,S44,Z91_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e1b,d1b|m1bm3b)*Z91_1(e2be3b|m2b,d1b)*-1.
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e1,d1,m1,m3)*Z91_1(e2,e3,m2,d1)", &
        Z60,S44,Z91_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e2b,d1b|m1bm3b)*Z91_1(e1be3b|m2b,d1b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e2,d1,m1,m3)*Z91_1(e1,e3,m2,d1)", &
        Z60,S44,Z91_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e3b,d1b|m1bm3b)*Z91_1(e1be2b|m2b,d1b)*-1.
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e3,d1,m1,m3)*Z91_1(e1,e2,m2,d1)", &
        Z60,S44,Z91_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e1b,d1b|m2bm3b)*Z91_1(e2be3b|m1b,d1b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e1,d1,m2,m3)*Z91_1(e2,e3,m1,d1)", &
        Z60,S44,Z91_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e2b,d1b|m2bm3b)*Z91_1(e1be3b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e2,d1,m2,m3)*Z91_1(e1,e3,m1,d1)", &
        Z60,S44,Z91_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e3b,d1b|m2bm3b)*Z91_1(e1be2b|m1b,d1b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e3,d1,m2,m3)*Z91_1(e1,e2,m1,d1)", &
        Z60,S44,Z91_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z91_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z129_2,"Z129_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z129_2,'ZERO')
!   original expression: Z129_2(l1bl2b|m1b,d1b)+=H24(l1bl2b|d1b,d2b)*S43(d2b|m1b)
    ierr=exatns_tensor_contract("Z129_2(l1,l2,m1,d1)+=H24(l1,l2,d1,d2)*S43(d2,m1)", &
        Z129_2,H24,S43,prefactor=(1.0d0,0.0d0))
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nvir_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z91_1,"Z91_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z91_1,'ZERO')
!   original expression: Z91_1(e1be2b|m1b,d1b)+=S44(e1be2b|l1bl2b)*Z129_2(l1bl2b|m1b,d1b)
    ierr=exatns_tensor_contract("Z91_1(e1,e2,m1,d1)+=S44(e1,e2,l1,l2)*Z129_2(l1,l2,m1,d1)", &
        Z91_1,S44,Z129_2,prefactor=(0.5d0,0.0d0))
    ierr=exatns_tensor_destroy(Z129_2)
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e1b,d1b|m1bm2b)*Z91_1(e2be3b|m3b,d1b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e1,d1,m1,m2)*Z91_1(e2,e3,m3,d1)", &
        Z60,S44,Z91_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e2b,d1b|m1bm2b)*Z91_1(e1be3b|m3b,d1b)*-1.
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e2,d1,m1,m2)*Z91_1(e1,e3,m3,d1)", &
        Z60,S44,Z91_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e3b,d1b|m1bm2b)*Z91_1(e1be2b|m3b,d1b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e3,d1,m1,m2)*Z91_1(e1,e2,m3,d1)", &
        Z60,S44,Z91_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e1b,d1b|m1bm3b)*Z91_1(e2be3b|m2b,d1b)*-1.
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e1,d1,m1,m3)*Z91_1(e2,e3,m2,d1)", &
        Z60,S44,Z91_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e2b,d1b|m1bm3b)*Z91_1(e1be3b|m2b,d1b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e2,d1,m1,m3)*Z91_1(e1,e3,m2,d1)", &
        Z60,S44,Z91_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e3b,d1b|m1bm3b)*Z91_1(e1be2b|m2b,d1b)*-1.
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e3,d1,m1,m3)*Z91_1(e1,e2,m2,d1)", &
        Z60,S44,Z91_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e1b,d1b|m2bm3b)*Z91_1(e2be3b|m1b,d1b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e1,d1,m2,m3)*Z91_1(e2,e3,m1,d1)", &
        Z60,S44,Z91_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e2b,d1b|m2bm3b)*Z91_1(e1be3b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e2,d1,m2,m3)*Z91_1(e1,e3,m1,d1)", &
        Z60,S44,Z91_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e3b,d1b|m2bm3b)*Z91_1(e1be2b|m1b,d1b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e3,d1,m2,m3)*Z91_1(e1,e2,m1,d1)", &
        Z60,S44,Z91_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z91_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nvir_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z91_1,"Z91_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z91_1,'ZERO')
!   original expression: Z91_1(e1be2b|m1b,d1b)+=S44(e1be2b|l1bl2b)*H25(l1bl2b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z91_1(e1,e2,m1,d1)+=S44(e1,e2,l1,l2)*H25(l1,l2,m1,d1)", &
        Z91_1,S44,H25,prefactor=(-0.5d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e1b,d1b|m1bm2b)*Z91_1(e2be3b|m3b,d1b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e1,d1,m1,m2)*Z91_1(e2,e3,m3,d1)", &
        Z60,S44,Z91_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e2b,d1b|m1bm2b)*Z91_1(e1be3b|m3b,d1b)*-1.
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e2,d1,m1,m2)*Z91_1(e1,e3,m3,d1)", &
        Z60,S44,Z91_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e3b,d1b|m1bm2b)*Z91_1(e1be2b|m3b,d1b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e3,d1,m1,m2)*Z91_1(e1,e2,m3,d1)", &
        Z60,S44,Z91_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e1b,d1b|m1bm3b)*Z91_1(e2be3b|m2b,d1b)*-1.
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e1,d1,m1,m3)*Z91_1(e2,e3,m2,d1)", &
        Z60,S44,Z91_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e2b,d1b|m1bm3b)*Z91_1(e1be3b|m2b,d1b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e2,d1,m1,m3)*Z91_1(e1,e3,m2,d1)", &
        Z60,S44,Z91_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e3b,d1b|m1bm3b)*Z91_1(e1be2b|m2b,d1b)*-1.
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e3,d1,m1,m3)*Z91_1(e1,e2,m2,d1)", &
        Z60,S44,Z91_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e1b,d1b|m2bm3b)*Z91_1(e2be3b|m1b,d1b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e1,d1,m2,m3)*Z91_1(e2,e3,m1,d1)", &
        Z60,S44,Z91_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e2b,d1b|m2bm3b)*Z91_1(e1be3b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e2,d1,m2,m3)*Z91_1(e1,e3,m1,d1)", &
        Z60,S44,Z91_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e3b,d1b|m2bm3b)*Z91_1(e1be2b|m1b,d1b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e3,d1,m2,m3)*Z91_1(e1,e2,m1,d1)", &
        Z60,S44,Z91_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z91_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nvir_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z91_1,"Z91_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z91_1,'ZERO')
!   original expression: Z91_1(e1be2b|m1b,d1b)+=S45(e1be2b,d2b|m1b,l1bl2b)*H24(l1bl2b|d1b,d2b)
    ierr=exatns_tensor_contract("Z91_1(e1,e2,m1,d1)+=S45(e1,e2,d2,m1,l1,l2)*H24(l1,l2,d1,d2)", &
        Z91_1,S45,H24,prefactor=(0.5d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e1b,d1b|m1bm2b)*Z91_1(e2be3b|m3b,d1b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e1,d1,m1,m2)*Z91_1(e2,e3,m3,d1)", &
        Z60,S44,Z91_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e2b,d1b|m1bm2b)*Z91_1(e1be3b|m3b,d1b)*-1.
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e2,d1,m1,m2)*Z91_1(e1,e3,m3,d1)", &
        Z60,S44,Z91_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e3b,d1b|m1bm2b)*Z91_1(e1be2b|m3b,d1b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e3,d1,m1,m2)*Z91_1(e1,e2,m3,d1)", &
        Z60,S44,Z91_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e1b,d1b|m1bm3b)*Z91_1(e2be3b|m2b,d1b)*-1.
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e1,d1,m1,m3)*Z91_1(e2,e3,m2,d1)", &
        Z60,S44,Z91_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e2b,d1b|m1bm3b)*Z91_1(e1be3b|m2b,d1b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e2,d1,m1,m3)*Z91_1(e1,e3,m2,d1)", &
        Z60,S44,Z91_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e3b,d1b|m1bm3b)*Z91_1(e1be2b|m2b,d1b)*-1.
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e3,d1,m1,m3)*Z91_1(e1,e2,m2,d1)", &
        Z60,S44,Z91_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e1b,d1b|m2bm3b)*Z91_1(e2be3b|m1b,d1b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e1,d1,m2,m3)*Z91_1(e2,e3,m1,d1)", &
        Z60,S44,Z91_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e2b,d1b|m2bm3b)*Z91_1(e1be3b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e2,d1,m2,m3)*Z91_1(e1,e3,m1,d1)", &
        Z60,S44,Z91_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e3b,d1b|m2bm3b)*Z91_1(e1be2b|m1b,d1b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e3,d1,m2,m3)*Z91_1(e1,e2,m1,d1)", &
        Z60,S44,Z91_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z91_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nvir_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z91_1,"Z91_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z91_1,'ZERO')
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e1b,d1b|m1bm2b)*Z91_1(e2be3b|m3b,d1b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e1,d1,m1,m2)*Z91_1(e2,e3,m3,d1)", &
        Z60,S44,Z91_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e2b,d1b|m1bm2b)*Z91_1(e1be3b|m3b,d1b)*-1.
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e2,d1,m1,m2)*Z91_1(e1,e3,m3,d1)", &
        Z60,S44,Z91_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e3b,d1b|m1bm2b)*Z91_1(e1be2b|m3b,d1b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e3,d1,m1,m2)*Z91_1(e1,e2,m3,d1)", &
        Z60,S44,Z91_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e1b,d1b|m1bm3b)*Z91_1(e2be3b|m2b,d1b)*-1.
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e1,d1,m1,m3)*Z91_1(e2,e3,m2,d1)", &
        Z60,S44,Z91_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e2b,d1b|m1bm3b)*Z91_1(e1be3b|m2b,d1b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e2,d1,m1,m3)*Z91_1(e1,e3,m2,d1)", &
        Z60,S44,Z91_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e3b,d1b|m1bm3b)*Z91_1(e1be2b|m2b,d1b)*-1.
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e3,d1,m1,m3)*Z91_1(e1,e2,m2,d1)", &
        Z60,S44,Z91_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e1b,d1b|m2bm3b)*Z91_1(e2be3b|m1b,d1b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e1,d1,m2,m3)*Z91_1(e2,e3,m1,d1)", &
        Z60,S44,Z91_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e2b,d1b|m2bm3b)*Z91_1(e1be3b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e2,d1,m2,m3)*Z91_1(e1,e3,m1,d1)", &
        Z60,S44,Z91_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e3b,d1b|m2bm3b)*Z91_1(e1be2b|m1b,d1b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e3,d1,m2,m3)*Z91_1(e1,e2,m1,d1)", &
        Z60,S44,Z91_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z91_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z81_1,"Z81_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z81_1,'ZERO')
!   original expression: Z81_1(e1b,l1b|m1bm2b)+=H17(e1b,l1b|d1bd2b)*S44(d1bd2b|m1bm2b)
    ierr=exatns_tensor_contract("Z81_1(e1,l1,m1,m2)+=H17(e1,l1,d1,d2)*S44(d1,d2,m1,m2)", &
        Z81_1,H17,S44,prefactor=(0.5d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e1be2b|m1b,l1b)*Z81_1(e3b,l1b|m2bm3b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e1,e2,m1,l1)*Z81_1(e3,l1,m2,m3)", &
        Z60,S44,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e1be3b|m1b,l1b)*Z81_1(e2b,l1b|m2bm3b)*-1.
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e1,e3,m1,l1)*Z81_1(e2,l1,m2,m3)", &
        Z60,S44,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e2be3b|m1b,l1b)*Z81_1(e1b,l1b|m2bm3b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e2,e3,m1,l1)*Z81_1(e1,l1,m2,m3)", &
        Z60,S44,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e1be2b|m2b,l1b)*Z81_1(e3b,l1b|m1bm3b)*-1.
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e1,e2,m2,l1)*Z81_1(e3,l1,m1,m3)", &
        Z60,S44,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e1be3b|m2b,l1b)*Z81_1(e2b,l1b|m1bm3b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e1,e3,m2,l1)*Z81_1(e2,l1,m1,m3)", &
        Z60,S44,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e2be3b|m2b,l1b)*Z81_1(e1b,l1b|m1bm3b)*-1.
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e2,e3,m2,l1)*Z81_1(e1,l1,m1,m3)", &
        Z60,S44,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e1be2b|m3b,l1b)*Z81_1(e3b,l1b|m1bm2b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e1,e2,m3,l1)*Z81_1(e3,l1,m1,m2)", &
        Z60,S44,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e1be3b|m3b,l1b)*Z81_1(e2b,l1b|m1bm2b)*-1.
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e1,e3,m3,l1)*Z81_1(e2,l1,m1,m2)", &
        Z60,S44,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e2be3b|m3b,l1b)*Z81_1(e1b,l1b|m1bm2b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e2,e3,m3,l1)*Z81_1(e1,l1,m1,m2)", &
        Z60,S44,Z81_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z81_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z81_1,"Z81_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z81_1,'ZERO')
!   original expression: Z81_1(e1b,l1b|m1bm2b)+=H26(l1b,l2b|m1bm2b)*S43(e1b|l2b)
    ierr=exatns_tensor_contract("Z81_1(e1,l1,m1,m2)+=H26(l1,l2,m1,m2)*S43(e1,l2)", &
        Z81_1,H26,S43,prefactor=(1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e1be2b|m1b,l1b)*Z81_1(e3b,l1b|m2bm3b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e1,e2,m1,l1)*Z81_1(e3,l1,m2,m3)", &
        Z60,S44,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e1be3b|m1b,l1b)*Z81_1(e2b,l1b|m2bm3b)*-1.
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e1,e3,m1,l1)*Z81_1(e2,l1,m2,m3)", &
        Z60,S44,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e2be3b|m1b,l1b)*Z81_1(e1b,l1b|m2bm3b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e2,e3,m1,l1)*Z81_1(e1,l1,m2,m3)", &
        Z60,S44,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e1be2b|m2b,l1b)*Z81_1(e3b,l1b|m1bm3b)*-1.
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e1,e2,m2,l1)*Z81_1(e3,l1,m1,m3)", &
        Z60,S44,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e1be3b|m2b,l1b)*Z81_1(e2b,l1b|m1bm3b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e1,e3,m2,l1)*Z81_1(e2,l1,m1,m3)", &
        Z60,S44,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e2be3b|m2b,l1b)*Z81_1(e1b,l1b|m1bm3b)*-1.
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e2,e3,m2,l1)*Z81_1(e1,l1,m1,m3)", &
        Z60,S44,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e1be2b|m3b,l1b)*Z81_1(e3b,l1b|m1bm2b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e1,e2,m3,l1)*Z81_1(e3,l1,m1,m2)", &
        Z60,S44,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e1be3b|m3b,l1b)*Z81_1(e2b,l1b|m1bm2b)*-1.
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e1,e3,m3,l1)*Z81_1(e2,l1,m1,m2)", &
        Z60,S44,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e2be3b|m3b,l1b)*Z81_1(e1b,l1b|m1bm2b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e2,e3,m3,l1)*Z81_1(e1,l1,m1,m2)", &
        Z60,S44,Z81_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z81_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z81_1,"Z81_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z81_1,'ZERO')
!   original expression: Z81_1(e1b,l1b|m1bm2b)+=H18(e1b,l1b|m1b,d1b)*S43(d1b|m2b)
    ierr=exatns_tensor_contract("Z81_1(e1,l1,m1,m2)+=H18(e1,l1,m1,d1)*S43(d1,m2)", &
        Z81_1,H18,S43,prefactor=(1.0d0,0.0d0))
!   original expression: Z81_1(e1b,l1b|m1bm2b)+=H18(e1b,l1b|m2b,d1b)*S43(d1b|m1b)*-1.
    ierr=exatns_tensor_contract("Z81_1(e1,l1,m1,m2)+=H18(e1,l1,m2,d1)*S43(d1,m1)", &
        Z81_1,H18,S43,prefactor=(-1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e1be2b|m1b,l1b)*Z81_1(e3b,l1b|m2bm3b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e1,e2,m1,l1)*Z81_1(e3,l1,m2,m3)", &
        Z60,S44,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e1be3b|m1b,l1b)*Z81_1(e2b,l1b|m2bm3b)*-1.
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e1,e3,m1,l1)*Z81_1(e2,l1,m2,m3)", &
        Z60,S44,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e2be3b|m1b,l1b)*Z81_1(e1b,l1b|m2bm3b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e2,e3,m1,l1)*Z81_1(e1,l1,m2,m3)", &
        Z60,S44,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e1be2b|m2b,l1b)*Z81_1(e3b,l1b|m1bm3b)*-1.
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e1,e2,m2,l1)*Z81_1(e3,l1,m1,m3)", &
        Z60,S44,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e1be3b|m2b,l1b)*Z81_1(e2b,l1b|m1bm3b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e1,e3,m2,l1)*Z81_1(e2,l1,m1,m3)", &
        Z60,S44,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e2be3b|m2b,l1b)*Z81_1(e1b,l1b|m1bm3b)*-1.
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e2,e3,m2,l1)*Z81_1(e1,l1,m1,m3)", &
        Z60,S44,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e1be2b|m3b,l1b)*Z81_1(e3b,l1b|m1bm2b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e1,e2,m3,l1)*Z81_1(e3,l1,m1,m2)", &
        Z60,S44,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e1be3b|m3b,l1b)*Z81_1(e2b,l1b|m1bm2b)*-1.
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e1,e3,m3,l1)*Z81_1(e2,l1,m1,m2)", &
        Z60,S44,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e2be3b|m3b,l1b)*Z81_1(e1b,l1b|m1bm2b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e2,e3,m3,l1)*Z81_1(e1,l1,m1,m2)", &
        Z60,S44,Z81_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z81_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z127_2,"Z127_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z127_2,'ZERO')
!   original expression: Z127_2(l1b,l2b|m1bm2b)+=H24(l1b,l2b|d1bd2b)*S44(d1bd2b|m1bm2b)
    ierr=exatns_tensor_contract("Z127_2(l1,l2,m1,m2)+=H24(l1,l2,d1,d2)*S44(d1,d2,m1,m2)", &
        Z127_2,H24,S44,prefactor=(0.5d0,0.0d0))
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z81_1,"Z81_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z81_1,'ZERO')
!   original expression: Z81_1(e1b,l1b|m1bm2b)+=S43(e1b|l2b)*Z127_2(l1b,l2b|m1bm2b)
    ierr=exatns_tensor_contract("Z81_1(e1,l1,m1,m2)+=S43(e1,l2)*Z127_2(l1,l2,m1,m2)", &
        Z81_1,S43,Z127_2,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z127_2)
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e1be2b|m1b,l1b)*Z81_1(e3b,l1b|m2bm3b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e1,e2,m1,l1)*Z81_1(e3,l1,m2,m3)", &
        Z60,S44,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e1be3b|m1b,l1b)*Z81_1(e2b,l1b|m2bm3b)*-1.
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e1,e3,m1,l1)*Z81_1(e2,l1,m2,m3)", &
        Z60,S44,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e2be3b|m1b,l1b)*Z81_1(e1b,l1b|m2bm3b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e2,e3,m1,l1)*Z81_1(e1,l1,m2,m3)", &
        Z60,S44,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e1be2b|m2b,l1b)*Z81_1(e3b,l1b|m1bm3b)*-1.
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e1,e2,m2,l1)*Z81_1(e3,l1,m1,m3)", &
        Z60,S44,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e1be3b|m2b,l1b)*Z81_1(e2b,l1b|m1bm3b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e1,e3,m2,l1)*Z81_1(e2,l1,m1,m3)", &
        Z60,S44,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e2be3b|m2b,l1b)*Z81_1(e1b,l1b|m1bm3b)*-1.
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e2,e3,m2,l1)*Z81_1(e1,l1,m1,m3)", &
        Z60,S44,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e1be2b|m3b,l1b)*Z81_1(e3b,l1b|m1bm2b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e1,e2,m3,l1)*Z81_1(e3,l1,m1,m2)", &
        Z60,S44,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e1be3b|m3b,l1b)*Z81_1(e2b,l1b|m1bm2b)*-1.
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e1,e3,m3,l1)*Z81_1(e2,l1,m1,m2)", &
        Z60,S44,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e2be3b|m3b,l1b)*Z81_1(e1b,l1b|m1bm2b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e2,e3,m3,l1)*Z81_1(e1,l1,m1,m2)", &
        Z60,S44,Z81_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z81_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z127_2,"Z127_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z127_2,'ZERO')
!   original expression: Z127_2(l1b,l2b|m1bm2b)+=H25(l1b,l2b|m1b,d1b)*S43(d1b|m2b)
    ierr=exatns_tensor_contract("Z127_2(l1,l2,m1,m2)+=H25(l1,l2,m1,d1)*S43(d1,m2)", &
        Z127_2,H25,S43,prefactor=(1.0d0,0.0d0))
!   original expression: Z127_2(l1b,l2b|m1bm2b)+=H25(l1b,l2b|m2b,d1b)*S43(d1b|m1b)*-1.
    ierr=exatns_tensor_contract("Z127_2(l1,l2,m1,m2)+=H25(l1,l2,m2,d1)*S43(d1,m1)", &
        Z127_2,H25,S43,prefactor=(-1.0d0,0.0d0))
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z81_1,"Z81_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z81_1,'ZERO')
!   original expression: Z81_1(e1b,l1b|m1bm2b)+=S43(e1b|l2b)*Z127_2(l1b,l2b|m1bm2b)
    ierr=exatns_tensor_contract("Z81_1(e1,l1,m1,m2)+=S43(e1,l2)*Z127_2(l1,l2,m1,m2)", &
        Z81_1,S43,Z127_2,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z127_2)
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e1be2b|m1b,l1b)*Z81_1(e3b,l1b|m2bm3b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e1,e2,m1,l1)*Z81_1(e3,l1,m2,m3)", &
        Z60,S44,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e1be3b|m1b,l1b)*Z81_1(e2b,l1b|m2bm3b)*-1.
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e1,e3,m1,l1)*Z81_1(e2,l1,m2,m3)", &
        Z60,S44,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e2be3b|m1b,l1b)*Z81_1(e1b,l1b|m2bm3b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e2,e3,m1,l1)*Z81_1(e1,l1,m2,m3)", &
        Z60,S44,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e1be2b|m2b,l1b)*Z81_1(e3b,l1b|m1bm3b)*-1.
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e1,e2,m2,l1)*Z81_1(e3,l1,m1,m3)", &
        Z60,S44,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e1be3b|m2b,l1b)*Z81_1(e2b,l1b|m1bm3b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e1,e3,m2,l1)*Z81_1(e2,l1,m1,m3)", &
        Z60,S44,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e2be3b|m2b,l1b)*Z81_1(e1b,l1b|m1bm3b)*-1.
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e2,e3,m2,l1)*Z81_1(e1,l1,m1,m3)", &
        Z60,S44,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e1be2b|m3b,l1b)*Z81_1(e3b,l1b|m1bm2b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e1,e2,m3,l1)*Z81_1(e3,l1,m1,m2)", &
        Z60,S44,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e1be3b|m3b,l1b)*Z81_1(e2b,l1b|m1bm2b)*-1.
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e1,e3,m3,l1)*Z81_1(e2,l1,m1,m2)", &
        Z60,S44,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e2be3b|m3b,l1b)*Z81_1(e1b,l1b|m1bm2b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e2,e3,m3,l1)*Z81_1(e1,l1,m1,m2)", &
        Z60,S44,Z81_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z81_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z165_3,"Z165_3",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z165_3,'ZERO')
!   original expression: Z165_3(l1b,l2b|m1b,d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|m1b)*0.5
    ierr=exatns_tensor_contract("Z165_3(l1,l2,m1,d1)+=H24(l1,l2,d1,d2)*S43(d2,m1)", &
        Z165_3,H24,S43,prefactor=(0.5d0,0.0d0))
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z127_2,"Z127_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z127_2,'ZERO')
!   original expression: Z127_2(l1b,l2b|m1bm2b)+=S43(d1b|m1b)*Z165_3(l1b,l2b|m2b,d1b)
    ierr=exatns_tensor_contract("Z127_2(l1,l2,m1,m2)+=S43(d1,m1)*Z165_3(l1,l2,m2,d1)", &
        Z127_2,S43,Z165_3,prefactor=(1.0d0,0.0d0))
!   original expression: Z127_2(l1b,l2b|m1bm2b)+=S43(d1b|m2b)*Z165_3(l1b,l2b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z127_2(l1,l2,m1,m2)+=S43(d1,m2)*Z165_3(l1,l2,m1,d1)", &
        Z127_2,S43,Z165_3,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z165_3)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z81_1,"Z81_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z81_1,'ZERO')
!   original expression: Z81_1(e1b,l1b|m1bm2b)+=S43(e1b|l2b)*Z127_2(l1b,l2b|m1bm2b)
    ierr=exatns_tensor_contract("Z81_1(e1,l1,m1,m2)+=S43(e1,l2)*Z127_2(l1,l2,m1,m2)", &
        Z81_1,S43,Z127_2,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z127_2)
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e1be2b|m1b,l1b)*Z81_1(e3b,l1b|m2bm3b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e1,e2,m1,l1)*Z81_1(e3,l1,m2,m3)", &
        Z60,S44,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e1be3b|m1b,l1b)*Z81_1(e2b,l1b|m2bm3b)*-1.
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e1,e3,m1,l1)*Z81_1(e2,l1,m2,m3)", &
        Z60,S44,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e2be3b|m1b,l1b)*Z81_1(e1b,l1b|m2bm3b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e2,e3,m1,l1)*Z81_1(e1,l1,m2,m3)", &
        Z60,S44,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e1be2b|m2b,l1b)*Z81_1(e3b,l1b|m1bm3b)*-1.
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e1,e2,m2,l1)*Z81_1(e3,l1,m1,m3)", &
        Z60,S44,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e1be3b|m2b,l1b)*Z81_1(e2b,l1b|m1bm3b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e1,e3,m2,l1)*Z81_1(e2,l1,m1,m3)", &
        Z60,S44,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e2be3b|m2b,l1b)*Z81_1(e1b,l1b|m1bm3b)*-1.
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e2,e3,m2,l1)*Z81_1(e1,l1,m1,m3)", &
        Z60,S44,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e1be2b|m3b,l1b)*Z81_1(e3b,l1b|m1bm2b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e1,e2,m3,l1)*Z81_1(e3,l1,m1,m2)", &
        Z60,S44,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e1be3b|m3b,l1b)*Z81_1(e2b,l1b|m1bm2b)*-1.
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e1,e3,m3,l1)*Z81_1(e2,l1,m1,m2)", &
        Z60,S44,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e2be3b|m3b,l1b)*Z81_1(e1b,l1b|m1bm2b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e2,e3,m3,l1)*Z81_1(e1,l1,m1,m2)", &
        Z60,S44,Z81_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z81_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z136_2,"Z136_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z136_2,'ZERO')
!   original expression: Z136_2(e1b,l1b|m1b,d1b)+=H17(e1b,l1b|d1b,d2b)*S43(d2b|m1b)*0.5
    ierr=exatns_tensor_contract("Z136_2(e1,l1,m1,d1)+=H17(e1,l1,d1,d2)*S43(d2,m1)", &
        Z136_2,H17,S43,prefactor=(0.5d0,0.0d0))
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z81_1,"Z81_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z81_1,'ZERO')
!   original expression: Z81_1(e1b,l1b|m1bm2b)+=S43(d1b|m1b)*Z136_2(e1b,l1b|m2b,d1b)
    ierr=exatns_tensor_contract("Z81_1(e1,l1,m1,m2)+=S43(d1,m1)*Z136_2(e1,l1,m2,d1)", &
        Z81_1,S43,Z136_2,prefactor=(1.0d0,0.0d0))
!   original expression: Z81_1(e1b,l1b|m1bm2b)+=S43(d1b|m2b)*Z136_2(e1b,l1b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z81_1(e1,l1,m1,m2)+=S43(d1,m2)*Z136_2(e1,l1,m1,d1)", &
        Z81_1,S43,Z136_2,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z136_2)
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e1be2b|m1b,l1b)*Z81_1(e3b,l1b|m2bm3b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e1,e2,m1,l1)*Z81_1(e3,l1,m2,m3)", &
        Z60,S44,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e1be3b|m1b,l1b)*Z81_1(e2b,l1b|m2bm3b)*-1.
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e1,e3,m1,l1)*Z81_1(e2,l1,m2,m3)", &
        Z60,S44,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e2be3b|m1b,l1b)*Z81_1(e1b,l1b|m2bm3b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e2,e3,m1,l1)*Z81_1(e1,l1,m2,m3)", &
        Z60,S44,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e1be2b|m2b,l1b)*Z81_1(e3b,l1b|m1bm3b)*-1.
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e1,e2,m2,l1)*Z81_1(e3,l1,m1,m3)", &
        Z60,S44,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e1be3b|m2b,l1b)*Z81_1(e2b,l1b|m1bm3b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e1,e3,m2,l1)*Z81_1(e2,l1,m1,m3)", &
        Z60,S44,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e2be3b|m2b,l1b)*Z81_1(e1b,l1b|m1bm3b)*-1.
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e2,e3,m2,l1)*Z81_1(e1,l1,m1,m3)", &
        Z60,S44,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e1be2b|m3b,l1b)*Z81_1(e3b,l1b|m1bm2b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e1,e2,m3,l1)*Z81_1(e3,l1,m1,m2)", &
        Z60,S44,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e1be3b|m3b,l1b)*Z81_1(e2b,l1b|m1bm2b)*-1.
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e1,e3,m3,l1)*Z81_1(e2,l1,m1,m2)", &
        Z60,S44,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e2be3b|m3b,l1b)*Z81_1(e1b,l1b|m1bm2b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e2,e3,m3,l1)*Z81_1(e1,l1,m1,m2)", &
        Z60,S44,Z81_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z81_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nvir_id/)
    tens_root = (/nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z75_2,"Z75_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z75_2,'ZERO')
!   original expression: Z75_2(l1b|d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|l2b)
    ierr=exatns_tensor_contract("Z75_2(l1,d1)+=H24(l1,l2,d1,d2)*S43(d2,l2)", &
        Z75_2,H24,S43,prefactor=(1.0d0,0.0d0))
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z81_1,"Z81_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z81_1,'ZERO')
!   original expression: Z81_1(e1b,l1b|m1bm2b)+=S44(e1b,d1b|m1bm2b)*Z75_2(l1b|d1b)
    ierr=exatns_tensor_contract("Z81_1(e1,l1,m1,m2)+=S44(e1,d1,m1,m2)*Z75_2(l1,d1)", &
        Z81_1,S44,Z75_2,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z75_2)
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e1be2b|m1b,l1b)*Z81_1(e3b,l1b|m2bm3b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e1,e2,m1,l1)*Z81_1(e3,l1,m2,m3)", &
        Z60,S44,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e1be3b|m1b,l1b)*Z81_1(e2b,l1b|m2bm3b)*-1.
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e1,e3,m1,l1)*Z81_1(e2,l1,m2,m3)", &
        Z60,S44,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e2be3b|m1b,l1b)*Z81_1(e1b,l1b|m2bm3b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e2,e3,m1,l1)*Z81_1(e1,l1,m2,m3)", &
        Z60,S44,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e1be2b|m2b,l1b)*Z81_1(e3b,l1b|m1bm3b)*-1.
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e1,e2,m2,l1)*Z81_1(e3,l1,m1,m3)", &
        Z60,S44,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e1be3b|m2b,l1b)*Z81_1(e2b,l1b|m1bm3b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e1,e3,m2,l1)*Z81_1(e2,l1,m1,m3)", &
        Z60,S44,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e2be3b|m2b,l1b)*Z81_1(e1b,l1b|m1bm3b)*-1.
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e2,e3,m2,l1)*Z81_1(e1,l1,m1,m3)", &
        Z60,S44,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e1be2b|m3b,l1b)*Z81_1(e3b,l1b|m1bm2b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e1,e2,m3,l1)*Z81_1(e3,l1,m1,m2)", &
        Z60,S44,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e1be3b|m3b,l1b)*Z81_1(e2b,l1b|m1bm2b)*-1.
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e1,e3,m3,l1)*Z81_1(e2,l1,m1,m2)", &
        Z60,S44,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e2be3b|m3b,l1b)*Z81_1(e1b,l1b|m1bm2b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e2,e3,m3,l1)*Z81_1(e1,l1,m1,m2)", &
        Z60,S44,Z81_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z81_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nvir_id/)
    tens_root = (/nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z75_2,"Z75_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z75_2,'ZERO')
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z81_1,"Z81_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z81_1,'ZERO')
!   original expression: Z81_1(e1b,l1b|m1bm2b)+=S44(e1b,d1b|m1bm2b)*Z75_2(l1b|d1b)
    ierr=exatns_tensor_contract("Z81_1(e1,l1,m1,m2)+=S44(e1,d1,m1,m2)*Z75_2(l1,d1)", &
        Z81_1,S44,Z75_2,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z75_2)
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e1be2b|m1b,l1b)*Z81_1(e3b,l1b|m2bm3b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e1,e2,m1,l1)*Z81_1(e3,l1,m2,m3)", &
        Z60,S44,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e1be3b|m1b,l1b)*Z81_1(e2b,l1b|m2bm3b)*-1.
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e1,e3,m1,l1)*Z81_1(e2,l1,m2,m3)", &
        Z60,S44,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e2be3b|m1b,l1b)*Z81_1(e1b,l1b|m2bm3b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e2,e3,m1,l1)*Z81_1(e1,l1,m2,m3)", &
        Z60,S44,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e1be2b|m2b,l1b)*Z81_1(e3b,l1b|m1bm3b)*-1.
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e1,e2,m2,l1)*Z81_1(e3,l1,m1,m3)", &
        Z60,S44,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e1be3b|m2b,l1b)*Z81_1(e2b,l1b|m1bm3b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e1,e3,m2,l1)*Z81_1(e2,l1,m1,m3)", &
        Z60,S44,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e2be3b|m2b,l1b)*Z81_1(e1b,l1b|m1bm3b)*-1.
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e2,e3,m2,l1)*Z81_1(e1,l1,m1,m3)", &
        Z60,S44,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e1be2b|m3b,l1b)*Z81_1(e3b,l1b|m1bm2b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e1,e2,m3,l1)*Z81_1(e3,l1,m1,m2)", &
        Z60,S44,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e1be3b|m3b,l1b)*Z81_1(e2b,l1b|m1bm2b)*-1.
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e1,e3,m3,l1)*Z81_1(e2,l1,m1,m2)", &
        Z60,S44,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e2be3b|m3b,l1b)*Z81_1(e1b,l1b|m1bm2b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e2,e3,m3,l1)*Z81_1(e1,l1,m1,m2)", &
        Z60,S44,Z81_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z81_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z81_1,"Z81_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z81_1,'ZERO')
!   original expression: Z81_1(e1b,l1b|m1bm2b)+=S44(e1b,d1b|m1bm2b)*H15(l1b|d1b)
    ierr=exatns_tensor_contract("Z81_1(e1,l1,m1,m2)+=S44(e1,d1,m1,m2)*H15(l1,d1)", &
        Z81_1,S44,H15,prefactor=(1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e1be2b|m1b,l1b)*Z81_1(e3b,l1b|m2bm3b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e1,e2,m1,l1)*Z81_1(e3,l1,m2,m3)", &
        Z60,S44,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e1be3b|m1b,l1b)*Z81_1(e2b,l1b|m2bm3b)*-1.
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e1,e3,m1,l1)*Z81_1(e2,l1,m2,m3)", &
        Z60,S44,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e2be3b|m1b,l1b)*Z81_1(e1b,l1b|m2bm3b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e2,e3,m1,l1)*Z81_1(e1,l1,m2,m3)", &
        Z60,S44,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e1be2b|m2b,l1b)*Z81_1(e3b,l1b|m1bm3b)*-1.
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e1,e2,m2,l1)*Z81_1(e3,l1,m1,m3)", &
        Z60,S44,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e1be3b|m2b,l1b)*Z81_1(e2b,l1b|m1bm3b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e1,e3,m2,l1)*Z81_1(e2,l1,m1,m3)", &
        Z60,S44,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e2be3b|m2b,l1b)*Z81_1(e1b,l1b|m1bm3b)*-1.
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e2,e3,m2,l1)*Z81_1(e1,l1,m1,m3)", &
        Z60,S44,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e1be2b|m3b,l1b)*Z81_1(e3b,l1b|m1bm2b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e1,e2,m3,l1)*Z81_1(e3,l1,m1,m2)", &
        Z60,S44,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e1be3b|m3b,l1b)*Z81_1(e2b,l1b|m1bm2b)*-1.
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e1,e3,m3,l1)*Z81_1(e2,l1,m1,m2)", &
        Z60,S44,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e2be3b|m3b,l1b)*Z81_1(e1b,l1b|m1bm2b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e2,e3,m3,l1)*Z81_1(e1,l1,m1,m2)", &
        Z60,S44,Z81_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z81_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z165_2,"Z165_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z165_2,'ZERO')
!   original expression: Z165_2(l1b,l2b|m1b,d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|m1b)*-1.
    ierr=exatns_tensor_contract("Z165_2(l1,l2,m1,d1)+=H24(l1,l2,d1,d2)*S43(d2,m1)", &
        Z165_2,H24,S43,prefactor=(-1.0d0,0.0d0))
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z81_1,"Z81_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z81_1,'ZERO')
!   original expression: Z81_1(e1b,l1b|m1bm2b)+=S44(e1b,d1b|m1b,l2b)*Z165_2(l1b,l2b|m2b,d1b)
    ierr=exatns_tensor_contract("Z81_1(e1,l1,m1,m2)+=S44(e1,d1,m1,l2)*Z165_2(l1,l2,m2,d1)", &
        Z81_1,S44,Z165_2,prefactor=(1.0d0,0.0d0))
!   original expression: Z81_1(e1b,l1b|m1bm2b)+=S44(e1b,d1b|m2b,l2b)*Z165_2(l1b,l2b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z81_1(e1,l1,m1,m2)+=S44(e1,d1,m2,l2)*Z165_2(l1,l2,m1,d1)", &
        Z81_1,S44,Z165_2,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z165_2)
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e1be2b|m1b,l1b)*Z81_1(e3b,l1b|m2bm3b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e1,e2,m1,l1)*Z81_1(e3,l1,m2,m3)", &
        Z60,S44,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e1be3b|m1b,l1b)*Z81_1(e2b,l1b|m2bm3b)*-1.
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e1,e3,m1,l1)*Z81_1(e2,l1,m2,m3)", &
        Z60,S44,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e2be3b|m1b,l1b)*Z81_1(e1b,l1b|m2bm3b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e2,e3,m1,l1)*Z81_1(e1,l1,m2,m3)", &
        Z60,S44,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e1be2b|m2b,l1b)*Z81_1(e3b,l1b|m1bm3b)*-1.
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e1,e2,m2,l1)*Z81_1(e3,l1,m1,m3)", &
        Z60,S44,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e1be3b|m2b,l1b)*Z81_1(e2b,l1b|m1bm3b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e1,e3,m2,l1)*Z81_1(e2,l1,m1,m3)", &
        Z60,S44,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e2be3b|m2b,l1b)*Z81_1(e1b,l1b|m1bm3b)*-1.
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e2,e3,m2,l1)*Z81_1(e1,l1,m1,m3)", &
        Z60,S44,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e1be2b|m3b,l1b)*Z81_1(e3b,l1b|m1bm2b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e1,e2,m3,l1)*Z81_1(e3,l1,m1,m2)", &
        Z60,S44,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e1be3b|m3b,l1b)*Z81_1(e2b,l1b|m1bm2b)*-1.
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e1,e3,m3,l1)*Z81_1(e2,l1,m1,m2)", &
        Z60,S44,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e2be3b|m3b,l1b)*Z81_1(e1b,l1b|m1bm2b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e2,e3,m3,l1)*Z81_1(e1,l1,m1,m2)", &
        Z60,S44,Z81_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z81_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z81_1,"Z81_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z81_1,'ZERO')
!   original expression: Z81_1(e1b,l1b|m1bm2b)+=S44(e1b,d1b|m1b,l2b)*H25(l1b,l2b|m2b,d1b)
    ierr=exatns_tensor_contract("Z81_1(e1,l1,m1,m2)+=S44(e1,d1,m1,l2)*H25(l1,l2,m2,d1)", &
        Z81_1,S44,H25,prefactor=(1.0d0,0.0d0))
!   original expression: Z81_1(e1b,l1b|m1bm2b)+=S44(e1b,d1b|m2b,l2b)*H25(l1b,l2b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z81_1(e1,l1,m1,m2)+=S44(e1,d1,m2,l2)*H25(l1,l2,m1,d1)", &
        Z81_1,S44,H25,prefactor=(-1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e1be2b|m1b,l1b)*Z81_1(e3b,l1b|m2bm3b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e1,e2,m1,l1)*Z81_1(e3,l1,m2,m3)", &
        Z60,S44,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e1be3b|m1b,l1b)*Z81_1(e2b,l1b|m2bm3b)*-1.
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e1,e3,m1,l1)*Z81_1(e2,l1,m2,m3)", &
        Z60,S44,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e2be3b|m1b,l1b)*Z81_1(e1b,l1b|m2bm3b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e2,e3,m1,l1)*Z81_1(e1,l1,m2,m3)", &
        Z60,S44,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e1be2b|m2b,l1b)*Z81_1(e3b,l1b|m1bm3b)*-1.
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e1,e2,m2,l1)*Z81_1(e3,l1,m1,m3)", &
        Z60,S44,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e1be3b|m2b,l1b)*Z81_1(e2b,l1b|m1bm3b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e1,e3,m2,l1)*Z81_1(e2,l1,m1,m3)", &
        Z60,S44,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e2be3b|m2b,l1b)*Z81_1(e1b,l1b|m1bm3b)*-1.
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e2,e3,m2,l1)*Z81_1(e1,l1,m1,m3)", &
        Z60,S44,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e1be2b|m3b,l1b)*Z81_1(e3b,l1b|m1bm2b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e1,e2,m3,l1)*Z81_1(e3,l1,m1,m2)", &
        Z60,S44,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e1be3b|m3b,l1b)*Z81_1(e2b,l1b|m1bm2b)*-1.
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e1,e3,m3,l1)*Z81_1(e2,l1,m1,m2)", &
        Z60,S44,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e2be3b|m3b,l1b)*Z81_1(e1b,l1b|m1bm2b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e2,e3,m3,l1)*Z81_1(e1,l1,m1,m2)", &
        Z60,S44,Z81_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z81_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z81_1,"Z81_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z81_1,'ZERO')
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e1be2b|m1b,l1b)*Z81_1(e3b,l1b|m2bm3b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e1,e2,m1,l1)*Z81_1(e3,l1,m2,m3)", &
        Z60,S44,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e1be3b|m1b,l1b)*Z81_1(e2b,l1b|m2bm3b)*-1.
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e1,e3,m1,l1)*Z81_1(e2,l1,m2,m3)", &
        Z60,S44,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e2be3b|m1b,l1b)*Z81_1(e1b,l1b|m2bm3b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e2,e3,m1,l1)*Z81_1(e1,l1,m2,m3)", &
        Z60,S44,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e1be2b|m2b,l1b)*Z81_1(e3b,l1b|m1bm3b)*-1.
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e1,e2,m2,l1)*Z81_1(e3,l1,m1,m3)", &
        Z60,S44,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e1be3b|m2b,l1b)*Z81_1(e2b,l1b|m1bm3b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e1,e3,m2,l1)*Z81_1(e2,l1,m1,m3)", &
        Z60,S44,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e2be3b|m2b,l1b)*Z81_1(e1b,l1b|m1bm3b)*-1.
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e2,e3,m2,l1)*Z81_1(e1,l1,m1,m3)", &
        Z60,S44,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e1be2b|m3b,l1b)*Z81_1(e3b,l1b|m1bm2b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e1,e2,m3,l1)*Z81_1(e3,l1,m1,m2)", &
        Z60,S44,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e1be3b|m3b,l1b)*Z81_1(e2b,l1b|m1bm2b)*-1.
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e1,e3,m3,l1)*Z81_1(e2,l1,m1,m2)", &
        Z60,S44,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e2be3b|m3b,l1b)*Z81_1(e1b,l1b|m1bm2b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e2,e3,m3,l1)*Z81_1(e1,l1,m1,m2)", &
        Z60,S44,Z81_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z81_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z81_1,"Z81_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z81_1,'ZERO')
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e1be2b|m1b,l1b)*Z81_1(e3b,l1b|m2bm3b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e1,e2,m1,l1)*Z81_1(e3,l1,m2,m3)", &
        Z60,S44,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e1be3b|m1b,l1b)*Z81_1(e2b,l1b|m2bm3b)*-1.
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e1,e3,m1,l1)*Z81_1(e2,l1,m2,m3)", &
        Z60,S44,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e2be3b|m1b,l1b)*Z81_1(e1b,l1b|m2bm3b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e2,e3,m1,l1)*Z81_1(e1,l1,m2,m3)", &
        Z60,S44,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e1be2b|m2b,l1b)*Z81_1(e3b,l1b|m1bm3b)*-1.
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e1,e2,m2,l1)*Z81_1(e3,l1,m1,m3)", &
        Z60,S44,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e1be3b|m2b,l1b)*Z81_1(e2b,l1b|m1bm3b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e1,e3,m2,l1)*Z81_1(e2,l1,m1,m3)", &
        Z60,S44,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e2be3b|m2b,l1b)*Z81_1(e1b,l1b|m1bm3b)*-1.
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e2,e3,m2,l1)*Z81_1(e1,l1,m1,m3)", &
        Z60,S44,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e1be2b|m3b,l1b)*Z81_1(e3b,l1b|m1bm2b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e1,e2,m3,l1)*Z81_1(e3,l1,m1,m2)", &
        Z60,S44,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e1be3b|m3b,l1b)*Z81_1(e2b,l1b|m1bm2b)*-1.
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e1,e3,m3,l1)*Z81_1(e2,l1,m1,m2)", &
        Z60,S44,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e2be3b|m3b,l1b)*Z81_1(e1b,l1b|m1bm2b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e2,e3,m3,l1)*Z81_1(e1,l1,m1,m2)", &
        Z60,S44,Z81_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z81_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z81_1,"Z81_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z81_1,'ZERO')
!   original expression: Z81_1(e1b,l1b|m1bm2b)+=S45(e1b,d1bd2b|m1bm2b,l2b)*H24(l1b,l2b|d1bd2b)
    ierr=exatns_tensor_contract("Z81_1(e1,l1,m1,m2)+=S45(e1,d1,d2,m1,m2,l2)*H24(l1,l2,d1,d2)", &
        Z81_1,S45,H24,prefactor=(0.5d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e1be2b|m1b,l1b)*Z81_1(e3b,l1b|m2bm3b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e1,e2,m1,l1)*Z81_1(e3,l1,m2,m3)", &
        Z60,S44,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e1be3b|m1b,l1b)*Z81_1(e2b,l1b|m2bm3b)*-1.
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e1,e3,m1,l1)*Z81_1(e2,l1,m2,m3)", &
        Z60,S44,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e2be3b|m1b,l1b)*Z81_1(e1b,l1b|m2bm3b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e2,e3,m1,l1)*Z81_1(e1,l1,m2,m3)", &
        Z60,S44,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e1be2b|m2b,l1b)*Z81_1(e3b,l1b|m1bm3b)*-1.
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e1,e2,m2,l1)*Z81_1(e3,l1,m1,m3)", &
        Z60,S44,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e1be3b|m2b,l1b)*Z81_1(e2b,l1b|m1bm3b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e1,e3,m2,l1)*Z81_1(e2,l1,m1,m3)", &
        Z60,S44,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e2be3b|m2b,l1b)*Z81_1(e1b,l1b|m1bm3b)*-1.
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e2,e3,m2,l1)*Z81_1(e1,l1,m1,m3)", &
        Z60,S44,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e1be2b|m3b,l1b)*Z81_1(e3b,l1b|m1bm2b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e1,e2,m3,l1)*Z81_1(e3,l1,m1,m2)", &
        Z60,S44,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e1be3b|m3b,l1b)*Z81_1(e2b,l1b|m1bm2b)*-1.
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e1,e3,m3,l1)*Z81_1(e2,l1,m1,m2)", &
        Z60,S44,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e2be3b|m3b,l1b)*Z81_1(e1b,l1b|m1bm2b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e2,e3,m3,l1)*Z81_1(e1,l1,m1,m2)", &
        Z60,S44,Z81_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z81_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z81_1,"Z81_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z81_1,'ZERO')
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e1be2b|m1b,l1b)*Z81_1(e3b,l1b|m2bm3b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e1,e2,m1,l1)*Z81_1(e3,l1,m2,m3)", &
        Z60,S44,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e1be3b|m1b,l1b)*Z81_1(e2b,l1b|m2bm3b)*-1.
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e1,e3,m1,l1)*Z81_1(e2,l1,m2,m3)", &
        Z60,S44,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e2be3b|m1b,l1b)*Z81_1(e1b,l1b|m2bm3b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e2,e3,m1,l1)*Z81_1(e1,l1,m2,m3)", &
        Z60,S44,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e1be2b|m2b,l1b)*Z81_1(e3b,l1b|m1bm3b)*-1.
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e1,e2,m2,l1)*Z81_1(e3,l1,m1,m3)", &
        Z60,S44,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e1be3b|m2b,l1b)*Z81_1(e2b,l1b|m1bm3b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e1,e3,m2,l1)*Z81_1(e2,l1,m1,m3)", &
        Z60,S44,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e2be3b|m2b,l1b)*Z81_1(e1b,l1b|m1bm3b)*-1.
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e2,e3,m2,l1)*Z81_1(e1,l1,m1,m3)", &
        Z60,S44,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e1be2b|m3b,l1b)*Z81_1(e3b,l1b|m1bm2b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e1,e2,m3,l1)*Z81_1(e3,l1,m1,m2)", &
        Z60,S44,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e1be3b|m3b,l1b)*Z81_1(e2b,l1b|m1bm2b)*-1.
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e1,e3,m3,l1)*Z81_1(e2,l1,m1,m2)", &
        Z60,S44,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e2be3b|m3b,l1b)*Z81_1(e1b,l1b|m1bm2b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e2,e3,m3,l1)*Z81_1(e1,l1,m1,m2)", &
        Z60,S44,Z81_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z81_1)
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e1be2b|m1b,l1b)*H19(e3b,l1b|m2bm3b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e1,e2,m1,l1)*H19(e3,l1,m2,m3)", &
        Z60,S44,H19,prefactor=(1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e1be3b|m1b,l1b)*H19(e2b,l1b|m2bm3b)*-1.
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e1,e3,m1,l1)*H19(e2,l1,m2,m3)", &
        Z60,S44,H19,prefactor=(-1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e2be3b|m1b,l1b)*H19(e1b,l1b|m2bm3b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e2,e3,m1,l1)*H19(e1,l1,m2,m3)", &
        Z60,S44,H19,prefactor=(1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e1be2b|m2b,l1b)*H19(e3b,l1b|m1bm3b)*-1.
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e1,e2,m2,l1)*H19(e3,l1,m1,m3)", &
        Z60,S44,H19,prefactor=(-1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e1be3b|m2b,l1b)*H19(e2b,l1b|m1bm3b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e1,e3,m2,l1)*H19(e2,l1,m1,m3)", &
        Z60,S44,H19,prefactor=(1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e2be3b|m2b,l1b)*H19(e1b,l1b|m1bm3b)*-1.
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e2,e3,m2,l1)*H19(e1,l1,m1,m3)", &
        Z60,S44,H19,prefactor=(-1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e1be2b|m3b,l1b)*H19(e3b,l1b|m1bm2b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e1,e2,m3,l1)*H19(e3,l1,m1,m2)", &
        Z60,S44,H19,prefactor=(1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e1be3b|m3b,l1b)*H19(e2b,l1b|m1bm2b)*-1.
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e1,e3,m3,l1)*H19(e2,l1,m1,m2)", &
        Z60,S44,H19,prefactor=(-1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S44(e2be3b|m3b,l1b)*H19(e1b,l1b|m1bm2b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S44(e2,e3,m3,l1)*H19(e1,l1,m1,m2)", &
        Z60,S44,H19,prefactor=(1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S45(e1b,d1bd2b|m1bm2bm3b)*H3(e2be3b|d1bd2b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S45(e1,d1,d2,m1,m2,m3)*H3(e2,e3,d1,d2)", &
        Z60,S45,H3,prefactor=(0.5d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S45(e2b,d1bd2b|m1bm2bm3b)*H3(e1be3b|d1bd2b)*-1.
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S45(e2,d1,d2,m1,m2,m3)*H3(e1,e3,d1,d2)", &
        Z60,S45,H3,prefactor=(-0.5d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S45(e3b,d1bd2b|m1bm2bm3b)*H3(e1be2b|d1bd2b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S45(e3,d1,d2,m1,m2,m3)*H3(e1,e2,d1,d2)", &
        Z60,S45,H3,prefactor=(0.5d0,0.0d0))
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nvir_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root/)
    ierr=exatns_tensor_create(Z72_1,"Z72_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z72_1,'ZERO')
!   original expression: Z72_1(e1b|d1b)+=H17(e1b,l1b|d1b,d2b)*S43(d2b|l1b)
    ierr=exatns_tensor_contract("Z72_1(e1,d1)+=H17(e1,l1,d1,d2)*S43(d2,l1)", &
        Z72_1,H17,S43,prefactor=(1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S45(e1be2b,d1b|m1bm2bm3b)*Z72_1(e3b|d1b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S45(e1,e2,d1,m1,m2,m3)*Z72_1(e3,d1)", &
        Z60,S45,Z72_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S45(e1be3b,d1b|m1bm2bm3b)*Z72_1(e2b|d1b)*-1.
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S45(e1,e3,d1,m1,m2,m3)*Z72_1(e2,d1)", &
        Z60,S45,Z72_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S45(e2be3b,d1b|m1bm2bm3b)*Z72_1(e1b|d1b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S45(e2,e3,d1,m1,m2,m3)*Z72_1(e1,d1)", &
        Z60,S45,Z72_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z72_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nvir_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root/)
    ierr=exatns_tensor_create(Z72_1,"Z72_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z72_1,'ZERO')
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S45(e1be2b,d1b|m1bm2bm3b)*Z72_1(e3b|d1b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S45(e1,e2,d1,m1,m2,m3)*Z72_1(e3,d1)", &
        Z60,S45,Z72_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S45(e1be3b,d1b|m1bm2bm3b)*Z72_1(e2b|d1b)*-1.
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S45(e1,e3,d1,m1,m2,m3)*Z72_1(e2,d1)", &
        Z60,S45,Z72_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S45(e2be3b,d1b|m1bm2bm3b)*Z72_1(e1b|d1b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S45(e2,e3,d1,m1,m2,m3)*Z72_1(e1,d1)", &
        Z60,S45,Z72_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z72_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nvir_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root/)
    ierr=exatns_tensor_create(Z72_1,"Z72_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z72_1,'ZERO')
!   original expression: Z72_1(e1b|d1b)+=S44(e1b,d2b|l1bl2b)*H24(l1bl2b|d1b,d2b)*-1.
    ierr=exatns_tensor_contract("Z72_1(e1,d1)+=S44(e1,d2,l1,l2)*H24(l1,l2,d1,d2)", &
        Z72_1,S44,H24,prefactor=(-0.5d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S45(e1be2b,d1b|m1bm2bm3b)*Z72_1(e3b|d1b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S45(e1,e2,d1,m1,m2,m3)*Z72_1(e3,d1)", &
        Z60,S45,Z72_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S45(e1be3b,d1b|m1bm2bm3b)*Z72_1(e2b|d1b)*-1.
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S45(e1,e3,d1,m1,m2,m3)*Z72_1(e2,d1)", &
        Z60,S45,Z72_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S45(e2be3b,d1b|m1bm2bm3b)*Z72_1(e1b|d1b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S45(e2,e3,d1,m1,m2,m3)*Z72_1(e1,d1)", &
        Z60,S45,Z72_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z72_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nvir_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root/)
    ierr=exatns_tensor_create(Z72_1,"Z72_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z72_1,'ZERO')
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S45(e1be2b,d1b|m1bm2bm3b)*Z72_1(e3b|d1b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S45(e1,e2,d1,m1,m2,m3)*Z72_1(e3,d1)", &
        Z60,S45,Z72_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S45(e1be3b,d1b|m1bm2bm3b)*Z72_1(e2b|d1b)*-1.
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S45(e1,e3,d1,m1,m2,m3)*Z72_1(e2,d1)", &
        Z60,S45,Z72_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S45(e2be3b,d1b|m1bm2bm3b)*Z72_1(e1b|d1b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S45(e2,e3,d1,m1,m2,m3)*Z72_1(e1,d1)", &
        Z60,S45,Z72_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z72_1)
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S45(e1be2b,d1b|m1bm2bm3b)*H1(e3b|d1b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S45(e1,e2,d1,m1,m2,m3)*H1(e3,d1)", &
        Z60,S45,H1,prefactor=(1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S45(e1be3b,d1b|m1bm2bm3b)*H1(e2b|d1b)*-1.
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S45(e1,e3,d1,m1,m2,m3)*H1(e2,d1)", &
        Z60,S45,H1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S45(e2be3b,d1b|m1bm2bm3b)*H1(e1b|d1b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S45(e2,e3,d1,m1,m2,m3)*H1(e1,d1)", &
        Z60,S45,H1,prefactor=(1.0d0,0.0d0))
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z76_1,"Z76_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z76_1,'ZERO')
!   original expression: Z76_1(l1bl2b|m1bm2b)+=H25(l1bl2b|m1b,d1b)*S43(d1b|m2b)
    ierr=exatns_tensor_contract("Z76_1(l1,l2,m1,m2)+=H25(l1,l2,m1,d1)*S43(d1,m2)", &
        Z76_1,H25,S43,prefactor=(1.0d0,0.0d0))
!   original expression: Z76_1(l1bl2b|m1bm2b)+=H25(l1bl2b|m2b,d1b)*S43(d1b|m1b)*-1.
    ierr=exatns_tensor_contract("Z76_1(l1,l2,m1,m2)+=H25(l1,l2,m2,d1)*S43(d1,m1)", &
        Z76_1,H25,S43,prefactor=(-1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S45(e1be2be3b|m1b,l1bl2b)*Z76_1(l1bl2b|m2bm3b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S45(e1,e2,e3,m1,l1,l2)*Z76_1(l1,l2,m2,m3)", &
        Z60,S45,Z76_1,prefactor=(0.5d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S45(e1be2be3b|m2b,l1bl2b)*Z76_1(l1bl2b|m1bm3b)*-1.
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S45(e1,e2,e3,m2,l1,l2)*Z76_1(l1,l2,m1,m3)", &
        Z60,S45,Z76_1,prefactor=(-0.5d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S45(e1be2be3b|m3b,l1bl2b)*Z76_1(l1bl2b|m1bm2b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S45(e1,e2,e3,m3,l1,l2)*Z76_1(l1,l2,m1,m2)", &
        Z60,S45,Z76_1,prefactor=(0.5d0,0.0d0))
    ierr=exatns_tensor_destroy(Z76_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z129_2,"Z129_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z129_2,'ZERO')
!   original expression: Z129_2(l1bl2b|m1b,d1b)+=H24(l1bl2b|d1b,d2b)*S43(d2b|m1b)*0.5
    ierr=exatns_tensor_contract("Z129_2(l1,l2,m1,d1)+=H24(l1,l2,d1,d2)*S43(d2,m1)", &
        Z129_2,H24,S43,prefactor=(0.5d0,0.0d0))
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z76_1,"Z76_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z76_1,'ZERO')
!   original expression: Z76_1(l1bl2b|m1bm2b)+=S43(d1b|m1b)*Z129_2(l1bl2b|m2b,d1b)
    ierr=exatns_tensor_contract("Z76_1(l1,l2,m1,m2)+=S43(d1,m1)*Z129_2(l1,l2,m2,d1)", &
        Z76_1,S43,Z129_2,prefactor=(1.0d0,0.0d0))
!   original expression: Z76_1(l1bl2b|m1bm2b)+=S43(d1b|m2b)*Z129_2(l1bl2b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z76_1(l1,l2,m1,m2)+=S43(d1,m2)*Z129_2(l1,l2,m1,d1)", &
        Z76_1,S43,Z129_2,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z129_2)
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S45(e1be2be3b|m1b,l1bl2b)*Z76_1(l1bl2b|m2bm3b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S45(e1,e2,e3,m1,l1,l2)*Z76_1(l1,l2,m2,m3)", &
        Z60,S45,Z76_1,prefactor=(0.5d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S45(e1be2be3b|m2b,l1bl2b)*Z76_1(l1bl2b|m1bm3b)*-1.
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S45(e1,e2,e3,m2,l1,l2)*Z76_1(l1,l2,m1,m3)", &
        Z60,S45,Z76_1,prefactor=(-0.5d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S45(e1be2be3b|m3b,l1bl2b)*Z76_1(l1bl2b|m1bm2b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S45(e1,e2,e3,m3,l1,l2)*Z76_1(l1,l2,m1,m2)", &
        Z60,S45,Z76_1,prefactor=(0.5d0,0.0d0))
    ierr=exatns_tensor_destroy(Z76_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z76_1,"Z76_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z76_1,'ZERO')
!   original expression: Z76_1(l1bl2b|m1bm2b)+=S44(d1bd2b|m1bm2b)*H24(l1bl2b|d1bd2b)
    ierr=exatns_tensor_contract("Z76_1(l1,l2,m1,m2)+=S44(d1,d2,m1,m2)*H24(l1,l2,d1,d2)", &
        Z76_1,S44,H24,prefactor=(0.5d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S45(e1be2be3b|m1b,l1bl2b)*Z76_1(l1bl2b|m2bm3b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S45(e1,e2,e3,m1,l1,l2)*Z76_1(l1,l2,m2,m3)", &
        Z60,S45,Z76_1,prefactor=(0.5d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S45(e1be2be3b|m2b,l1bl2b)*Z76_1(l1bl2b|m1bm3b)*-1.
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S45(e1,e2,e3,m2,l1,l2)*Z76_1(l1,l2,m1,m3)", &
        Z60,S45,Z76_1,prefactor=(-0.5d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S45(e1be2be3b|m3b,l1bl2b)*Z76_1(l1bl2b|m1bm2b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S45(e1,e2,e3,m3,l1,l2)*Z76_1(l1,l2,m1,m2)", &
        Z60,S45,Z76_1,prefactor=(0.5d0,0.0d0))
    ierr=exatns_tensor_destroy(Z76_1)
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S45(e1be2be3b|m1b,l1bl2b)*H26(l1bl2b|m2bm3b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S45(e1,e2,e3,m1,l1,l2)*H26(l1,l2,m2,m3)", &
        Z60,S45,H26,prefactor=(0.5d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S45(e1be2be3b|m2b,l1bl2b)*H26(l1bl2b|m1bm3b)*-1.
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S45(e1,e2,e3,m2,l1,l2)*H26(l1,l2,m1,m3)", &
        Z60,S45,H26,prefactor=(-0.5d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S45(e1be2be3b|m3b,l1bl2b)*H26(l1bl2b|m1bm2b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S45(e1,e2,e3,m3,l1,l2)*H26(l1,l2,m1,m2)", &
        Z60,S45,H26,prefactor=(0.5d0,0.0d0))
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z74_1,"Z74_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z74_1,'ZERO')
!   original expression: Z74_1(l1b|m1b)+=H25(l1b,l2b|m1b,d1b)*S43(d1b|l2b)*-1.
    ierr=exatns_tensor_contract("Z74_1(l1,m1)+=H25(l1,l2,m1,d1)*S43(d1,l2)", &
        Z74_1,H25,S43,prefactor=(-1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S45(e1be2be3b|m1bm2b,l1b)*Z74_1(l1b|m3b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S45(e1,e2,e3,m1,m2,l1)*Z74_1(l1,m3)", &
        Z60,S45,Z74_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S45(e1be2be3b|m1bm3b,l1b)*Z74_1(l1b|m2b)*-1.
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S45(e1,e2,e3,m1,m3,l1)*Z74_1(l1,m2)", &
        Z60,S45,Z74_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S45(e1be2be3b|m2bm3b,l1b)*Z74_1(l1b|m1b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S45(e1,e2,e3,m2,m3,l1)*Z74_1(l1,m1)", &
        Z60,S45,Z74_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z74_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z74_1,"Z74_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z74_1,'ZERO')
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S45(e1be2be3b|m1bm2b,l1b)*Z74_1(l1b|m3b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S45(e1,e2,e3,m1,m2,l1)*Z74_1(l1,m3)", &
        Z60,S45,Z74_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S45(e1be2be3b|m1bm3b,l1b)*Z74_1(l1b|m2b)*-1.
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S45(e1,e2,e3,m1,m3,l1)*Z74_1(l1,m2)", &
        Z60,S45,Z74_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S45(e1be2be3b|m2bm3b,l1b)*Z74_1(l1b|m1b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S45(e1,e2,e3,m2,m3,l1)*Z74_1(l1,m1)", &
        Z60,S45,Z74_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z74_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nvir_id/)
    tens_root = (/nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z75_2,"Z75_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z75_2,'ZERO')
!   original expression: Z75_2(l1b|d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|l2b)*-1.
    ierr=exatns_tensor_contract("Z75_2(l1,d1)+=H24(l1,l2,d1,d2)*S43(d2,l2)", &
        Z75_2,H24,S43,prefactor=(-1.0d0,0.0d0))
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z74_1,"Z74_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z74_1,'ZERO')
!   original expression: Z74_1(l1b|m1b)+=S43(d1b|m1b)*Z75_2(l1b|d1b)
    ierr=exatns_tensor_contract("Z74_1(l1,m1)+=S43(d1,m1)*Z75_2(l1,d1)", &
        Z74_1,S43,Z75_2,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z75_2)
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S45(e1be2be3b|m1bm2b,l1b)*Z74_1(l1b|m3b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S45(e1,e2,e3,m1,m2,l1)*Z74_1(l1,m3)", &
        Z60,S45,Z74_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S45(e1be2be3b|m1bm3b,l1b)*Z74_1(l1b|m2b)*-1.
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S45(e1,e2,e3,m1,m3,l1)*Z74_1(l1,m2)", &
        Z60,S45,Z74_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S45(e1be2be3b|m2bm3b,l1b)*Z74_1(l1b|m1b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S45(e1,e2,e3,m2,m3,l1)*Z74_1(l1,m1)", &
        Z60,S45,Z74_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z74_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nvir_id/)
    tens_root = (/nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z75_2,"Z75_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z75_2,'ZERO')
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z74_1,"Z74_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z74_1,'ZERO')
!   original expression: Z74_1(l1b|m1b)+=S43(d1b|m1b)*Z75_2(l1b|d1b)
    ierr=exatns_tensor_contract("Z74_1(l1,m1)+=S43(d1,m1)*Z75_2(l1,d1)", &
        Z74_1,S43,Z75_2,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z75_2)
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S45(e1be2be3b|m1bm2b,l1b)*Z74_1(l1b|m3b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S45(e1,e2,e3,m1,m2,l1)*Z74_1(l1,m3)", &
        Z60,S45,Z74_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S45(e1be2be3b|m1bm3b,l1b)*Z74_1(l1b|m2b)*-1.
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S45(e1,e2,e3,m1,m3,l1)*Z74_1(l1,m2)", &
        Z60,S45,Z74_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S45(e1be2be3b|m2bm3b,l1b)*Z74_1(l1b|m1b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S45(e1,e2,e3,m2,m3,l1)*Z74_1(l1,m1)", &
        Z60,S45,Z74_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z74_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z74_1,"Z74_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z74_1,'ZERO')
!   original expression: Z74_1(l1b|m1b)+=S43(d1b|m1b)*H15(l1b|d1b)*-1.
    ierr=exatns_tensor_contract("Z74_1(l1,m1)+=S43(d1,m1)*H15(l1,d1)", &
        Z74_1,S43,H15,prefactor=(-1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S45(e1be2be3b|m1bm2b,l1b)*Z74_1(l1b|m3b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S45(e1,e2,e3,m1,m2,l1)*Z74_1(l1,m3)", &
        Z60,S45,Z74_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S45(e1be2be3b|m1bm3b,l1b)*Z74_1(l1b|m2b)*-1.
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S45(e1,e2,e3,m1,m3,l1)*Z74_1(l1,m2)", &
        Z60,S45,Z74_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S45(e1be2be3b|m2bm3b,l1b)*Z74_1(l1b|m1b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S45(e1,e2,e3,m2,m3,l1)*Z74_1(l1,m1)", &
        Z60,S45,Z74_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z74_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z74_1,"Z74_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z74_1,'ZERO')
!   original expression: Z74_1(l1b|m1b)+=S44(d1bd2b|m1b,l2b)*H24(l1b,l2b|d1bd2b)*-1.
    ierr=exatns_tensor_contract("Z74_1(l1,m1)+=S44(d1,d2,m1,l2)*H24(l1,l2,d1,d2)", &
        Z74_1,S44,H24,prefactor=(-0.5d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S45(e1be2be3b|m1bm2b,l1b)*Z74_1(l1b|m3b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S45(e1,e2,e3,m1,m2,l1)*Z74_1(l1,m3)", &
        Z60,S45,Z74_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S45(e1be2be3b|m1bm3b,l1b)*Z74_1(l1b|m2b)*-1.
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S45(e1,e2,e3,m1,m3,l1)*Z74_1(l1,m2)", &
        Z60,S45,Z74_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S45(e1be2be3b|m2bm3b,l1b)*Z74_1(l1b|m1b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S45(e1,e2,e3,m2,m3,l1)*Z74_1(l1,m1)", &
        Z60,S45,Z74_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z74_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z74_1,"Z74_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z74_1,'ZERO')
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S45(e1be2be3b|m1bm2b,l1b)*Z74_1(l1b|m3b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S45(e1,e2,e3,m1,m2,l1)*Z74_1(l1,m3)", &
        Z60,S45,Z74_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S45(e1be2be3b|m1bm3b,l1b)*Z74_1(l1b|m2b)*-1.
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S45(e1,e2,e3,m1,m3,l1)*Z74_1(l1,m2)", &
        Z60,S45,Z74_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S45(e1be2be3b|m2bm3b,l1b)*Z74_1(l1b|m1b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S45(e1,e2,e3,m2,m3,l1)*Z74_1(l1,m1)", &
        Z60,S45,Z74_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z74_1)
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S45(e1be2be3b|m1bm2b,l1b)*H16(l1b|m3b)*-1.
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S45(e1,e2,e3,m1,m2,l1)*H16(l1,m3)", &
        Z60,S45,H16,prefactor=(-1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S45(e1be2be3b|m1bm3b,l1b)*H16(l1b|m2b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S45(e1,e2,e3,m1,m3,l1)*H16(l1,m2)", &
        Z60,S45,H16,prefactor=(1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S45(e1be2be3b|m2bm3b,l1b)*H16(l1b|m1b)*-1.
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S45(e1,e2,e3,m2,m3,l1)*H16(l1,m1)", &
        Z60,S45,H16,prefactor=(-1.0d0,0.0d0))
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z136_1,"Z136_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z136_1,'ZERO')
!   original expression: Z136_1(e1b,l1b|m1b,d1b)+=H17(e1b,l1b|d1b,d2b)*S43(d2b|m1b)*-1.
    ierr=exatns_tensor_contract("Z136_1(e1,l1,m1,d1)+=H17(e1,l1,d1,d2)*S43(d2,m1)", &
        Z136_1,H17,S43,prefactor=(-1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S45(e1be2b,d1b|m1bm2b,l1b)*Z136_1(e3b,l1b|m3b,d1b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S45(e1,e2,d1,m1,m2,l1)*Z136_1(e3,l1,m3,d1)", &
        Z60,S45,Z136_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S45(e1be3b,d1b|m1bm2b,l1b)*Z136_1(e2b,l1b|m3b,d1b)*-1.
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S45(e1,e3,d1,m1,m2,l1)*Z136_1(e2,l1,m3,d1)", &
        Z60,S45,Z136_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S45(e2be3b,d1b|m1bm2b,l1b)*Z136_1(e1b,l1b|m3b,d1b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S45(e2,e3,d1,m1,m2,l1)*Z136_1(e1,l1,m3,d1)", &
        Z60,S45,Z136_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S45(e1be2b,d1b|m1bm3b,l1b)*Z136_1(e3b,l1b|m2b,d1b)*-1.
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S45(e1,e2,d1,m1,m3,l1)*Z136_1(e3,l1,m2,d1)", &
        Z60,S45,Z136_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S45(e1be3b,d1b|m1bm3b,l1b)*Z136_1(e2b,l1b|m2b,d1b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S45(e1,e3,d1,m1,m3,l1)*Z136_1(e2,l1,m2,d1)", &
        Z60,S45,Z136_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S45(e2be3b,d1b|m1bm3b,l1b)*Z136_1(e1b,l1b|m2b,d1b)*-1.
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S45(e2,e3,d1,m1,m3,l1)*Z136_1(e1,l1,m2,d1)", &
        Z60,S45,Z136_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S45(e1be2b,d1b|m2bm3b,l1b)*Z136_1(e3b,l1b|m1b,d1b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S45(e1,e2,d1,m2,m3,l1)*Z136_1(e3,l1,m1,d1)", &
        Z60,S45,Z136_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S45(e1be3b,d1b|m2bm3b,l1b)*Z136_1(e2b,l1b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S45(e1,e3,d1,m2,m3,l1)*Z136_1(e2,l1,m1,d1)", &
        Z60,S45,Z136_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S45(e2be3b,d1b|m2bm3b,l1b)*Z136_1(e1b,l1b|m1b,d1b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S45(e2,e3,d1,m2,m3,l1)*Z136_1(e1,l1,m1,d1)", &
        Z60,S45,Z136_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z136_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z136_1,"Z136_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z136_1,'ZERO')
!   original expression: Z136_1(e1b,l1b|m1b,d1b)+=S44(e1b,d2b|m1b,l2b)*H24(l1b,l2b|d1b,d2b)
    ierr=exatns_tensor_contract("Z136_1(e1,l1,m1,d1)+=S44(e1,d2,m1,l2)*H24(l1,l2,d1,d2)", &
        Z136_1,S44,H24,prefactor=(1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S45(e1be2b,d1b|m1bm2b,l1b)*Z136_1(e3b,l1b|m3b,d1b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S45(e1,e2,d1,m1,m2,l1)*Z136_1(e3,l1,m3,d1)", &
        Z60,S45,Z136_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S45(e1be3b,d1b|m1bm2b,l1b)*Z136_1(e2b,l1b|m3b,d1b)*-1.
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S45(e1,e3,d1,m1,m2,l1)*Z136_1(e2,l1,m3,d1)", &
        Z60,S45,Z136_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S45(e2be3b,d1b|m1bm2b,l1b)*Z136_1(e1b,l1b|m3b,d1b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S45(e2,e3,d1,m1,m2,l1)*Z136_1(e1,l1,m3,d1)", &
        Z60,S45,Z136_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S45(e1be2b,d1b|m1bm3b,l1b)*Z136_1(e3b,l1b|m2b,d1b)*-1.
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S45(e1,e2,d1,m1,m3,l1)*Z136_1(e3,l1,m2,d1)", &
        Z60,S45,Z136_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S45(e1be3b,d1b|m1bm3b,l1b)*Z136_1(e2b,l1b|m2b,d1b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S45(e1,e3,d1,m1,m3,l1)*Z136_1(e2,l1,m2,d1)", &
        Z60,S45,Z136_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S45(e2be3b,d1b|m1bm3b,l1b)*Z136_1(e1b,l1b|m2b,d1b)*-1.
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S45(e2,e3,d1,m1,m3,l1)*Z136_1(e1,l1,m2,d1)", &
        Z60,S45,Z136_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S45(e1be2b,d1b|m2bm3b,l1b)*Z136_1(e3b,l1b|m1b,d1b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S45(e1,e2,d1,m2,m3,l1)*Z136_1(e3,l1,m1,d1)", &
        Z60,S45,Z136_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S45(e1be3b,d1b|m2bm3b,l1b)*Z136_1(e2b,l1b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S45(e1,e3,d1,m2,m3,l1)*Z136_1(e2,l1,m1,d1)", &
        Z60,S45,Z136_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S45(e2be3b,d1b|m2bm3b,l1b)*Z136_1(e1b,l1b|m1b,d1b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S45(e2,e3,d1,m2,m3,l1)*Z136_1(e1,l1,m1,d1)", &
        Z60,S45,Z136_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z136_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z136_1,"Z136_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z136_1,'ZERO')
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S45(e1be2b,d1b|m1bm2b,l1b)*Z136_1(e3b,l1b|m3b,d1b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S45(e1,e2,d1,m1,m2,l1)*Z136_1(e3,l1,m3,d1)", &
        Z60,S45,Z136_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S45(e1be3b,d1b|m1bm2b,l1b)*Z136_1(e2b,l1b|m3b,d1b)*-1.
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S45(e1,e3,d1,m1,m2,l1)*Z136_1(e2,l1,m3,d1)", &
        Z60,S45,Z136_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S45(e2be3b,d1b|m1bm2b,l1b)*Z136_1(e1b,l1b|m3b,d1b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S45(e2,e3,d1,m1,m2,l1)*Z136_1(e1,l1,m3,d1)", &
        Z60,S45,Z136_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S45(e1be2b,d1b|m1bm3b,l1b)*Z136_1(e3b,l1b|m2b,d1b)*-1.
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S45(e1,e2,d1,m1,m3,l1)*Z136_1(e3,l1,m2,d1)", &
        Z60,S45,Z136_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S45(e1be3b,d1b|m1bm3b,l1b)*Z136_1(e2b,l1b|m2b,d1b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S45(e1,e3,d1,m1,m3,l1)*Z136_1(e2,l1,m2,d1)", &
        Z60,S45,Z136_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S45(e2be3b,d1b|m1bm3b,l1b)*Z136_1(e1b,l1b|m2b,d1b)*-1.
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S45(e2,e3,d1,m1,m3,l1)*Z136_1(e1,l1,m2,d1)", &
        Z60,S45,Z136_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S45(e1be2b,d1b|m2bm3b,l1b)*Z136_1(e3b,l1b|m1b,d1b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S45(e1,e2,d1,m2,m3,l1)*Z136_1(e3,l1,m1,d1)", &
        Z60,S45,Z136_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S45(e1be3b,d1b|m2bm3b,l1b)*Z136_1(e2b,l1b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S45(e1,e3,d1,m2,m3,l1)*Z136_1(e2,l1,m1,d1)", &
        Z60,S45,Z136_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S45(e2be3b,d1b|m2bm3b,l1b)*Z136_1(e1b,l1b|m1b,d1b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S45(e2,e3,d1,m2,m3,l1)*Z136_1(e1,l1,m1,d1)", &
        Z60,S45,Z136_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z136_1)
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S45(e1be2b,d1b|m1bm2b,l1b)*H18(e3b,l1b|m3b,d1b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S45(e1,e2,d1,m1,m2,l1)*H18(e3,l1,m3,d1)", &
        Z60,S45,H18,prefactor=(1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S45(e1be3b,d1b|m1bm2b,l1b)*H18(e2b,l1b|m3b,d1b)*-1.
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S45(e1,e3,d1,m1,m2,l1)*H18(e2,l1,m3,d1)", &
        Z60,S45,H18,prefactor=(-1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S45(e2be3b,d1b|m1bm2b,l1b)*H18(e1b,l1b|m3b,d1b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S45(e2,e3,d1,m1,m2,l1)*H18(e1,l1,m3,d1)", &
        Z60,S45,H18,prefactor=(1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S45(e1be2b,d1b|m1bm3b,l1b)*H18(e3b,l1b|m2b,d1b)*-1.
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S45(e1,e2,d1,m1,m3,l1)*H18(e3,l1,m2,d1)", &
        Z60,S45,H18,prefactor=(-1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S45(e1be3b,d1b|m1bm3b,l1b)*H18(e2b,l1b|m2b,d1b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S45(e1,e3,d1,m1,m3,l1)*H18(e2,l1,m2,d1)", &
        Z60,S45,H18,prefactor=(1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S45(e2be3b,d1b|m1bm3b,l1b)*H18(e1b,l1b|m2b,d1b)*-1.
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S45(e2,e3,d1,m1,m3,l1)*H18(e1,l1,m2,d1)", &
        Z60,S45,H18,prefactor=(-1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S45(e1be2b,d1b|m2bm3b,l1b)*H18(e3b,l1b|m1b,d1b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S45(e1,e2,d1,m2,m3,l1)*H18(e3,l1,m1,d1)", &
        Z60,S45,H18,prefactor=(1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S45(e1be3b,d1b|m2bm3b,l1b)*H18(e2b,l1b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S45(e1,e3,d1,m2,m3,l1)*H18(e2,l1,m1,d1)", &
        Z60,S45,H18,prefactor=(-1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S45(e2be3b,d1b|m2bm3b,l1b)*H18(e1b,l1b|m1b,d1b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S45(e2,e3,d1,m2,m3,l1)*H18(e1,l1,m1,d1)", &
        Z60,S45,H18,prefactor=(1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S46(e1be2b,d1bd2b|m1bm2bm3b,l1b)*H17(e3b,l1b|d1bd2b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S46(e1,e2,d1,d2,m1,m2,m3,l1)*H17(e3,l1,d1,d2)", &
        Z60,S46,H17,prefactor=(0.5d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S46(e1be3b,d1bd2b|m1bm2bm3b,l1b)*H17(e2b,l1b|d1bd2b)*-1.
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S46(e1,e3,d1,d2,m1,m2,m3,l1)*H17(e2,l1,d1,d2)", &
        Z60,S46,H17,prefactor=(-0.5d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S46(e2be3b,d1bd2b|m1bm2bm3b,l1b)*H17(e1b,l1b|d1bd2b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S46(e2,e3,d1,d2,m1,m2,m3,l1)*H17(e1,l1,d1,d2)", &
        Z60,S46,H17,prefactor=(0.5d0,0.0d0))
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z129_1,"Z129_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z129_1,'ZERO')
!   original expression: Z129_1(l1bl2b|m1b,d1b)+=H24(l1bl2b|d1b,d2b)*S43(d2b|m1b)
    ierr=exatns_tensor_contract("Z129_1(l1,l2,m1,d1)+=H24(l1,l2,d1,d2)*S43(d2,m1)", &
        Z129_1,H24,S43,prefactor=(1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S46(e1be2be3b,d1b|m1bm2b,l1bl2b)*Z129_1(l1bl2b|m3b,d1b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S46(e1,e2,e3,d1,m1,m2,l1,l2)*Z129_1(l1,l2,m3,d1)", &
        Z60,S46,Z129_1,prefactor=(0.5d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S46(e1be2be3b,d1b|m1bm3b,l1bl2b)*Z129_1(l1bl2b|m2b,d1b)*-1.
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S46(e1,e2,e3,d1,m1,m3,l1,l2)*Z129_1(l1,l2,m2,d1)", &
        Z60,S46,Z129_1,prefactor=(-0.5d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S46(e1be2be3b,d1b|m2bm3b,l1bl2b)*Z129_1(l1bl2b|m1b,d1b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S46(e1,e2,e3,d1,m2,m3,l1,l2)*Z129_1(l1,l2,m1,d1)", &
        Z60,S46,Z129_1,prefactor=(0.5d0,0.0d0))
    ierr=exatns_tensor_destroy(Z129_1)
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S46(e1be2be3b,d1b|m1bm2b,l1bl2b)*H25(l1bl2b|m3b,d1b)*-1.
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S46(e1,e2,e3,d1,m1,m2,l1,l2)*H25(l1,l2,m3,d1)", &
        Z60,S46,H25,prefactor=(-0.5d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S46(e1be2be3b,d1b|m1bm3b,l1bl2b)*H25(l1bl2b|m2b,d1b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S46(e1,e2,e3,d1,m1,m3,l1,l2)*H25(l1,l2,m2,d1)", &
        Z60,S46,H25,prefactor=(0.5d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S46(e1be2be3b,d1b|m2bm3b,l1bl2b)*H25(l1bl2b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S46(e1,e2,e3,d1,m2,m3,l1,l2)*H25(l1,l2,m1,d1)", &
        Z60,S46,H25,prefactor=(-0.5d0,0.0d0))
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nvir_id/)
    tens_root = (/nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z75_1,"Z75_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z75_1,'ZERO')
!   original expression: Z75_1(l1b|d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|l2b)
    ierr=exatns_tensor_contract("Z75_1(l1,d1)+=H24(l1,l2,d1,d2)*S43(d2,l2)", &
        Z75_1,H24,S43,prefactor=(1.0d0,0.0d0))
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S46(e1be2be3b,d1b|m1bm2bm3b,l1b)*Z75_1(l1b|d1b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S46(e1,e2,e3,d1,m1,m2,m3,l1)*Z75_1(l1,d1)", &
        Z60,S46,Z75_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z75_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nvir_id/)
    tens_root = (/nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z75_1,"Z75_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z75_1,'ZERO')
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S46(e1be2be3b,d1b|m1bm2bm3b,l1b)*Z75_1(l1b|d1b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S46(e1,e2,e3,d1,m1,m2,m3,l1)*Z75_1(l1,d1)", &
        Z60,S46,Z75_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z75_1)
!   original expression: Z60(e1be2be3b|m1bm2bm3b)+=S46(e1be2be3b,d1b|m1bm2bm3b,l1b)*H15(l1b|d1b)
    ierr=exatns_tensor_contract("Z60(e1,e2,e3,m1,m2,m3)+=S46(e1,e2,e3,d1,m1,m2,m3,l1)*H15(l1,d1)", &
        Z60,S46,H15,prefactor=(1.0d0,0.0d0))
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z165_3,"Z165_3",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z165_3,'ZERO')
!   original expression: Z165_3(l1b,l2b|m1b,d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|m1b)*0.5
    ierr=exatns_tensor_contract("Z165_3(l1,l2,m1,d1)+=H24(l1,l2,d1,d2)*S43(d2,m1)", &
        Z165_3,H24,S43,prefactor=(0.5d0,0.0d0))
    ierr=exatns_tensor_destroy(Z165_3)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z136_2,"Z136_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z136_2,'ZERO')
!   original expression: Z136_2(e1b,l1b|m1b,d1b)+=H17(e1b,l1b|d1b,d2b)*S43(d2b|m1b)
    ierr=exatns_tensor_contract("Z136_2(e1,l1,m1,d1)+=H17(e1,l1,d1,d2)*S43(d2,m1)", &
        Z136_2,H17,S43,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z136_2)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z136_2,"Z136_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z136_2,'ZERO')
!   original expression: Z136_2(e1b,l1b|m1b,d1b)+=S44(e1b,d2b|m1b,l2b)*H24(l1b,l2b|d1b,d2b)*-1.
    ierr=exatns_tensor_contract("Z136_2(e1,l1,m1,d1)+=S44(e1,d2,m1,l2)*H24(l1,l2,d1,d2)", &
        Z136_2,S44,H24,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z136_2)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z136_2,"Z136_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z136_2,'ZERO')
    ierr=exatns_tensor_destroy(Z136_2)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nvir_id/)
    tens_root = (/nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z75_2,"Z75_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z75_2,'ZERO')
!   original expression: Z75_2(l1b|d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|l2b)
    ierr=exatns_tensor_contract("Z75_2(l1,d1)+=H24(l1,l2,d1,d2)*S43(d2,l2)", &
        Z75_2,H24,S43,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z75_2)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nvir_id/)
    tens_root = (/nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z75_2,"Z75_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z75_2,'ZERO')
    ierr=exatns_tensor_destroy(Z75_2)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z165_2,"Z165_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z165_2,'ZERO')
!   original expression: Z165_2(l1b,l2b|m1b,d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|m1b)*-1.
    ierr=exatns_tensor_contract("Z165_2(l1,l2,m1,d1)+=H24(l1,l2,d1,d2)*S43(d2,m1)", &
        Z165_2,H24,S43,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z165_2)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nvir_id/)
    tens_root = (/nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z75_2,"Z75_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z75_2,'ZERO')
!   original expression: Z75_2(l1b|d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|l2b)*-1.
    ierr=exatns_tensor_contract("Z75_2(l1,d1)+=H24(l1,l2,d1,d2)*S43(d2,l2)", &
        Z75_2,H24,S43,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z75_2)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nvir_id/)
    tens_root = (/nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z75_2,"Z75_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z75_2,'ZERO')
    ierr=exatns_tensor_destroy(Z75_2)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z165_2,"Z165_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z165_2,'ZERO')
!   original expression: Z165_2(l1b,l2b|m1b,d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|m1b)
    ierr=exatns_tensor_contract("Z165_2(l1,l2,m1,d1)+=H24(l1,l2,d1,d2)*S43(d2,m1)", &
        Z165_2,H24,S43,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z165_2)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nvir_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z91_1,"Z91_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z91_1,'ZERO')
!   original expression: Z91_1(e1be2b|m1b,d1b)+=H3(e1be2b|d1b,d2b)*S43(d2b|m1b)
    ierr=exatns_tensor_contract("Z91_1(e1,e2,m1,d1)+=H3(e1,e2,d1,d2)*S43(d2,m1)", &
        Z91_1,H3,S43,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z91_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nvir_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z91_1,"Z91_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z91_1,'ZERO')
!   original expression: Z91_1(e1be2b|m1b,d1b)+=H17(e1b,l1b|d1b,d2b)*S44(e2b,d2b|m1b,l1b)
    ierr=exatns_tensor_contract("Z91_1(e1,e2,m1,d1)+=H17(e1,l1,d1,d2)*S44(e2,d2,m1,l1)", &
        Z91_1,H17,S44,prefactor=(1.0d0,0.0d0))
!   original expression: Z91_1(e1be2b|m1b,d1b)+=H17(e2b,l1b|d1b,d2b)*S44(e1b,d2b|m1b,l1b)*-1.
    ierr=exatns_tensor_contract("Z91_1(e1,e2,m1,d1)+=H17(e2,l1,d1,d2)*S44(e1,d2,m1,l1)", &
        Z91_1,H17,S44,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z91_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nvir_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z91_1,"Z91_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z91_1,'ZERO')
    ierr=exatns_tensor_destroy(Z91_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z129_2,"Z129_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z129_2,'ZERO')
!   original expression: Z129_2(l1bl2b|m1b,d1b)+=H24(l1bl2b|d1b,d2b)*S43(d2b|m1b)
    ierr=exatns_tensor_contract("Z129_2(l1,l2,m1,d1)+=H24(l1,l2,d1,d2)*S43(d2,m1)", &
        Z129_2,H24,S43,prefactor=(1.0d0,0.0d0))
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nvir_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z91_1,"Z91_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z91_1,'ZERO')
!   original expression: Z91_1(e1be2b|m1b,d1b)+=S44(e1be2b|l1bl2b)*Z129_2(l1bl2b|m1b,d1b)
    ierr=exatns_tensor_contract("Z91_1(e1,e2,m1,d1)+=S44(e1,e2,l1,l2)*Z129_2(l1,l2,m1,d1)", &
        Z91_1,S44,Z129_2,prefactor=(0.5d0,0.0d0))
    ierr=exatns_tensor_destroy(Z129_2)
    ierr=exatns_tensor_destroy(Z91_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nvir_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z91_1,"Z91_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z91_1,'ZERO')
!   original expression: Z91_1(e1be2b|m1b,d1b)+=S44(e1be2b|l1bl2b)*H25(l1bl2b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z91_1(e1,e2,m1,d1)+=S44(e1,e2,l1,l2)*H25(l1,l2,m1,d1)", &
        Z91_1,S44,H25,prefactor=(-0.5d0,0.0d0))
    ierr=exatns_tensor_destroy(Z91_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nvir_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z91_1,"Z91_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z91_1,'ZERO')
!   original expression: Z91_1(e1be2b|m1b,d1b)+=S45(e1be2b,d2b|m1b,l1bl2b)*H24(l1bl2b|d1b,d2b)
    ierr=exatns_tensor_contract("Z91_1(e1,e2,m1,d1)+=S45(e1,e2,d2,m1,l1,l2)*H24(l1,l2,d1,d2)", &
        Z91_1,S45,H24,prefactor=(0.5d0,0.0d0))
    ierr=exatns_tensor_destroy(Z91_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nvir_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z91_1,"Z91_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z91_1,'ZERO')
    ierr=exatns_tensor_destroy(Z91_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z81_1,"Z81_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z81_1,'ZERO')
!   original expression: Z81_1(e1b,l1b|m1bm2b)+=H17(e1b,l1b|d1bd2b)*S44(d1bd2b|m1bm2b)
    ierr=exatns_tensor_contract("Z81_1(e1,l1,m1,m2)+=H17(e1,l1,d1,d2)*S44(d1,d2,m1,m2)", &
        Z81_1,H17,S44,prefactor=(0.5d0,0.0d0))
    ierr=exatns_tensor_destroy(Z81_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z81_1,"Z81_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z81_1,'ZERO')
!   original expression: Z81_1(e1b,l1b|m1bm2b)+=H26(l1b,l2b|m1bm2b)*S43(e1b|l2b)
    ierr=exatns_tensor_contract("Z81_1(e1,l1,m1,m2)+=H26(l1,l2,m1,m2)*S43(e1,l2)", &
        Z81_1,H26,S43,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z81_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z81_1,"Z81_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z81_1,'ZERO')
!   original expression: Z81_1(e1b,l1b|m1bm2b)+=H18(e1b,l1b|m1b,d1b)*S43(d1b|m2b)
    ierr=exatns_tensor_contract("Z81_1(e1,l1,m1,m2)+=H18(e1,l1,m1,d1)*S43(d1,m2)", &
        Z81_1,H18,S43,prefactor=(1.0d0,0.0d0))
!   original expression: Z81_1(e1b,l1b|m1bm2b)+=H18(e1b,l1b|m2b,d1b)*S43(d1b|m1b)*-1.
    ierr=exatns_tensor_contract("Z81_1(e1,l1,m1,m2)+=H18(e1,l1,m2,d1)*S43(d1,m1)", &
        Z81_1,H18,S43,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z81_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z127_2,"Z127_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z127_2,'ZERO')
!   original expression: Z127_2(l1b,l2b|m1bm2b)+=H24(l1b,l2b|d1bd2b)*S44(d1bd2b|m1bm2b)
    ierr=exatns_tensor_contract("Z127_2(l1,l2,m1,m2)+=H24(l1,l2,d1,d2)*S44(d1,d2,m1,m2)", &
        Z127_2,H24,S44,prefactor=(0.5d0,0.0d0))
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z81_1,"Z81_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z81_1,'ZERO')
!   original expression: Z81_1(e1b,l1b|m1bm2b)+=S43(e1b|l2b)*Z127_2(l1b,l2b|m1bm2b)
    ierr=exatns_tensor_contract("Z81_1(e1,l1,m1,m2)+=S43(e1,l2)*Z127_2(l1,l2,m1,m2)", &
        Z81_1,S43,Z127_2,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z127_2)
    ierr=exatns_tensor_destroy(Z81_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z127_2,"Z127_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z127_2,'ZERO')
!   original expression: Z127_2(l1b,l2b|m1bm2b)+=H25(l1b,l2b|m1b,d1b)*S43(d1b|m2b)
    ierr=exatns_tensor_contract("Z127_2(l1,l2,m1,m2)+=H25(l1,l2,m1,d1)*S43(d1,m2)", &
        Z127_2,H25,S43,prefactor=(1.0d0,0.0d0))
!   original expression: Z127_2(l1b,l2b|m1bm2b)+=H25(l1b,l2b|m2b,d1b)*S43(d1b|m1b)*-1.
    ierr=exatns_tensor_contract("Z127_2(l1,l2,m1,m2)+=H25(l1,l2,m2,d1)*S43(d1,m1)", &
        Z127_2,H25,S43,prefactor=(-1.0d0,0.0d0))
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z81_1,"Z81_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z81_1,'ZERO')
!   original expression: Z81_1(e1b,l1b|m1bm2b)+=S43(e1b|l2b)*Z127_2(l1b,l2b|m1bm2b)
    ierr=exatns_tensor_contract("Z81_1(e1,l1,m1,m2)+=S43(e1,l2)*Z127_2(l1,l2,m1,m2)", &
        Z81_1,S43,Z127_2,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z127_2)
    ierr=exatns_tensor_destroy(Z81_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z165_3,"Z165_3",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z165_3,'ZERO')
!   original expression: Z165_3(l1b,l2b|m1b,d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|m1b)*0.5
    ierr=exatns_tensor_contract("Z165_3(l1,l2,m1,d1)+=H24(l1,l2,d1,d2)*S43(d2,m1)", &
        Z165_3,H24,S43,prefactor=(0.5d0,0.0d0))
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z127_2,"Z127_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z127_2,'ZERO')
!   original expression: Z127_2(l1b,l2b|m1bm2b)+=S43(d1b|m1b)*Z165_3(l1b,l2b|m2b,d1b)
    ierr=exatns_tensor_contract("Z127_2(l1,l2,m1,m2)+=S43(d1,m1)*Z165_3(l1,l2,m2,d1)", &
        Z127_2,S43,Z165_3,prefactor=(1.0d0,0.0d0))
!   original expression: Z127_2(l1b,l2b|m1bm2b)+=S43(d1b|m2b)*Z165_3(l1b,l2b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z127_2(l1,l2,m1,m2)+=S43(d1,m2)*Z165_3(l1,l2,m1,d1)", &
        Z127_2,S43,Z165_3,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z165_3)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z81_1,"Z81_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z81_1,'ZERO')
!   original expression: Z81_1(e1b,l1b|m1bm2b)+=S43(e1b|l2b)*Z127_2(l1b,l2b|m1bm2b)
    ierr=exatns_tensor_contract("Z81_1(e1,l1,m1,m2)+=S43(e1,l2)*Z127_2(l1,l2,m1,m2)", &
        Z81_1,S43,Z127_2,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z127_2)
    ierr=exatns_tensor_destroy(Z81_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z136_2,"Z136_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z136_2,'ZERO')
!   original expression: Z136_2(e1b,l1b|m1b,d1b)+=H17(e1b,l1b|d1b,d2b)*S43(d2b|m1b)*0.5
    ierr=exatns_tensor_contract("Z136_2(e1,l1,m1,d1)+=H17(e1,l1,d1,d2)*S43(d2,m1)", &
        Z136_2,H17,S43,prefactor=(0.5d0,0.0d0))
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z81_1,"Z81_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z81_1,'ZERO')
!   original expression: Z81_1(e1b,l1b|m1bm2b)+=S43(d1b|m1b)*Z136_2(e1b,l1b|m2b,d1b)
    ierr=exatns_tensor_contract("Z81_1(e1,l1,m1,m2)+=S43(d1,m1)*Z136_2(e1,l1,m2,d1)", &
        Z81_1,S43,Z136_2,prefactor=(1.0d0,0.0d0))
!   original expression: Z81_1(e1b,l1b|m1bm2b)+=S43(d1b|m2b)*Z136_2(e1b,l1b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z81_1(e1,l1,m1,m2)+=S43(d1,m2)*Z136_2(e1,l1,m1,d1)", &
        Z81_1,S43,Z136_2,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z136_2)
    ierr=exatns_tensor_destroy(Z81_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nvir_id/)
    tens_root = (/nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z75_2,"Z75_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z75_2,'ZERO')
!   original expression: Z75_2(l1b|d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|l2b)
    ierr=exatns_tensor_contract("Z75_2(l1,d1)+=H24(l1,l2,d1,d2)*S43(d2,l2)", &
        Z75_2,H24,S43,prefactor=(1.0d0,0.0d0))
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z81_1,"Z81_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z81_1,'ZERO')
!   original expression: Z81_1(e1b,l1b|m1bm2b)+=S44(e1b,d1b|m1bm2b)*Z75_2(l1b|d1b)
    ierr=exatns_tensor_contract("Z81_1(e1,l1,m1,m2)+=S44(e1,d1,m1,m2)*Z75_2(l1,d1)", &
        Z81_1,S44,Z75_2,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z75_2)
    ierr=exatns_tensor_destroy(Z81_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nvir_id/)
    tens_root = (/nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z75_2,"Z75_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z75_2,'ZERO')
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z81_1,"Z81_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z81_1,'ZERO')
!   original expression: Z81_1(e1b,l1b|m1bm2b)+=S44(e1b,d1b|m1bm2b)*Z75_2(l1b|d1b)
    ierr=exatns_tensor_contract("Z81_1(e1,l1,m1,m2)+=S44(e1,d1,m1,m2)*Z75_2(l1,d1)", &
        Z81_1,S44,Z75_2,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z75_2)
    ierr=exatns_tensor_destroy(Z81_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z81_1,"Z81_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z81_1,'ZERO')
!   original expression: Z81_1(e1b,l1b|m1bm2b)+=S44(e1b,d1b|m1bm2b)*H15(l1b|d1b)
    ierr=exatns_tensor_contract("Z81_1(e1,l1,m1,m2)+=S44(e1,d1,m1,m2)*H15(l1,d1)", &
        Z81_1,S44,H15,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z81_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z165_2,"Z165_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z165_2,'ZERO')
!   original expression: Z165_2(l1b,l2b|m1b,d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|m1b)*-1.
    ierr=exatns_tensor_contract("Z165_2(l1,l2,m1,d1)+=H24(l1,l2,d1,d2)*S43(d2,m1)", &
        Z165_2,H24,S43,prefactor=(-1.0d0,0.0d0))
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z81_1,"Z81_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z81_1,'ZERO')
!   original expression: Z81_1(e1b,l1b|m1bm2b)+=S44(e1b,d1b|m1b,l2b)*Z165_2(l1b,l2b|m2b,d1b)
    ierr=exatns_tensor_contract("Z81_1(e1,l1,m1,m2)+=S44(e1,d1,m1,l2)*Z165_2(l1,l2,m2,d1)", &
        Z81_1,S44,Z165_2,prefactor=(1.0d0,0.0d0))
!   original expression: Z81_1(e1b,l1b|m1bm2b)+=S44(e1b,d1b|m2b,l2b)*Z165_2(l1b,l2b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z81_1(e1,l1,m1,m2)+=S44(e1,d1,m2,l2)*Z165_2(l1,l2,m1,d1)", &
        Z81_1,S44,Z165_2,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z165_2)
    ierr=exatns_tensor_destroy(Z81_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z81_1,"Z81_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z81_1,'ZERO')
!   original expression: Z81_1(e1b,l1b|m1bm2b)+=S44(e1b,d1b|m1b,l2b)*H25(l1b,l2b|m2b,d1b)
    ierr=exatns_tensor_contract("Z81_1(e1,l1,m1,m2)+=S44(e1,d1,m1,l2)*H25(l1,l2,m2,d1)", &
        Z81_1,S44,H25,prefactor=(1.0d0,0.0d0))
!   original expression: Z81_1(e1b,l1b|m1bm2b)+=S44(e1b,d1b|m2b,l2b)*H25(l1b,l2b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z81_1(e1,l1,m1,m2)+=S44(e1,d1,m2,l2)*H25(l1,l2,m1,d1)", &
        Z81_1,S44,H25,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z81_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z81_1,"Z81_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z81_1,'ZERO')
    ierr=exatns_tensor_destroy(Z81_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z81_1,"Z81_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z81_1,'ZERO')
    ierr=exatns_tensor_destroy(Z81_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z81_1,"Z81_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z81_1,'ZERO')
!   original expression: Z81_1(e1b,l1b|m1bm2b)+=S45(e1b,d1bd2b|m1bm2b,l2b)*H24(l1b,l2b|d1bd2b)
    ierr=exatns_tensor_contract("Z81_1(e1,l1,m1,m2)+=S45(e1,d1,d2,m1,m2,l2)*H24(l1,l2,d1,d2)", &
        Z81_1,S45,H24,prefactor=(0.5d0,0.0d0))
    ierr=exatns_tensor_destroy(Z81_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z81_1,"Z81_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z81_1,'ZERO')
    ierr=exatns_tensor_destroy(Z81_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nvir_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root/)
    ierr=exatns_tensor_create(Z72_1,"Z72_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z72_1,'ZERO')
!   original expression: Z72_1(e1b|d1b)+=H17(e1b,l1b|d1b,d2b)*S43(d2b|l1b)
    ierr=exatns_tensor_contract("Z72_1(e1,d1)+=H17(e1,l1,d1,d2)*S43(d2,l1)", &
        Z72_1,H17,S43,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z72_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nvir_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root/)
    ierr=exatns_tensor_create(Z72_1,"Z72_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z72_1,'ZERO')
    ierr=exatns_tensor_destroy(Z72_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nvir_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root/)
    ierr=exatns_tensor_create(Z72_1,"Z72_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z72_1,'ZERO')
!   original expression: Z72_1(e1b|d1b)+=S44(e1b,d2b|l1bl2b)*H24(l1bl2b|d1b,d2b)*-1.
    ierr=exatns_tensor_contract("Z72_1(e1,d1)+=S44(e1,d2,l1,l2)*H24(l1,l2,d1,d2)", &
        Z72_1,S44,H24,prefactor=(-0.5d0,0.0d0))
    ierr=exatns_tensor_destroy(Z72_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nvir_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root/)
    ierr=exatns_tensor_create(Z72_1,"Z72_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z72_1,'ZERO')
    ierr=exatns_tensor_destroy(Z72_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z76_1,"Z76_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z76_1,'ZERO')
!   original expression: Z76_1(l1bl2b|m1bm2b)+=H25(l1bl2b|m1b,d1b)*S43(d1b|m2b)
    ierr=exatns_tensor_contract("Z76_1(l1,l2,m1,m2)+=H25(l1,l2,m1,d1)*S43(d1,m2)", &
        Z76_1,H25,S43,prefactor=(1.0d0,0.0d0))
!   original expression: Z76_1(l1bl2b|m1bm2b)+=H25(l1bl2b|m2b,d1b)*S43(d1b|m1b)*-1.
    ierr=exatns_tensor_contract("Z76_1(l1,l2,m1,m2)+=H25(l1,l2,m2,d1)*S43(d1,m1)", &
        Z76_1,H25,S43,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z76_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z129_2,"Z129_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z129_2,'ZERO')
!   original expression: Z129_2(l1bl2b|m1b,d1b)+=H24(l1bl2b|d1b,d2b)*S43(d2b|m1b)*0.5
    ierr=exatns_tensor_contract("Z129_2(l1,l2,m1,d1)+=H24(l1,l2,d1,d2)*S43(d2,m1)", &
        Z129_2,H24,S43,prefactor=(0.5d0,0.0d0))
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z76_1,"Z76_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z76_1,'ZERO')
!   original expression: Z76_1(l1bl2b|m1bm2b)+=S43(d1b|m1b)*Z129_2(l1bl2b|m2b,d1b)
    ierr=exatns_tensor_contract("Z76_1(l1,l2,m1,m2)+=S43(d1,m1)*Z129_2(l1,l2,m2,d1)", &
        Z76_1,S43,Z129_2,prefactor=(1.0d0,0.0d0))
!   original expression: Z76_1(l1bl2b|m1bm2b)+=S43(d1b|m2b)*Z129_2(l1bl2b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z76_1(l1,l2,m1,m2)+=S43(d1,m2)*Z129_2(l1,l2,m1,d1)", &
        Z76_1,S43,Z129_2,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z129_2)
    ierr=exatns_tensor_destroy(Z76_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z76_1,"Z76_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z76_1,'ZERO')
!   original expression: Z76_1(l1bl2b|m1bm2b)+=S44(d1bd2b|m1bm2b)*H24(l1bl2b|d1bd2b)
    ierr=exatns_tensor_contract("Z76_1(l1,l2,m1,m2)+=S44(d1,d2,m1,m2)*H24(l1,l2,d1,d2)", &
        Z76_1,S44,H24,prefactor=(0.5d0,0.0d0))
    ierr=exatns_tensor_destroy(Z76_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z74_1,"Z74_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z74_1,'ZERO')
!   original expression: Z74_1(l1b|m1b)+=H25(l1b,l2b|m1b,d1b)*S43(d1b|l2b)*-1.
    ierr=exatns_tensor_contract("Z74_1(l1,m1)+=H25(l1,l2,m1,d1)*S43(d1,l2)", &
        Z74_1,H25,S43,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z74_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z74_1,"Z74_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z74_1,'ZERO')
    ierr=exatns_tensor_destroy(Z74_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nvir_id/)
    tens_root = (/nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z75_2,"Z75_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z75_2,'ZERO')
!   original expression: Z75_2(l1b|d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|l2b)*-1.
    ierr=exatns_tensor_contract("Z75_2(l1,d1)+=H24(l1,l2,d1,d2)*S43(d2,l2)", &
        Z75_2,H24,S43,prefactor=(-1.0d0,0.0d0))
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z74_1,"Z74_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z74_1,'ZERO')
!   original expression: Z74_1(l1b|m1b)+=S43(d1b|m1b)*Z75_2(l1b|d1b)
    ierr=exatns_tensor_contract("Z74_1(l1,m1)+=S43(d1,m1)*Z75_2(l1,d1)", &
        Z74_1,S43,Z75_2,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z75_2)
    ierr=exatns_tensor_destroy(Z74_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nvir_id/)
    tens_root = (/nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z75_2,"Z75_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z75_2,'ZERO')
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z74_1,"Z74_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z74_1,'ZERO')
!   original expression: Z74_1(l1b|m1b)+=S43(d1b|m1b)*Z75_2(l1b|d1b)
    ierr=exatns_tensor_contract("Z74_1(l1,m1)+=S43(d1,m1)*Z75_2(l1,d1)", &
        Z74_1,S43,Z75_2,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z75_2)
    ierr=exatns_tensor_destroy(Z74_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z74_1,"Z74_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z74_1,'ZERO')
!   original expression: Z74_1(l1b|m1b)+=S43(d1b|m1b)*H15(l1b|d1b)*-1.
    ierr=exatns_tensor_contract("Z74_1(l1,m1)+=S43(d1,m1)*H15(l1,d1)", &
        Z74_1,S43,H15,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z74_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z74_1,"Z74_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z74_1,'ZERO')
!   original expression: Z74_1(l1b|m1b)+=S44(d1bd2b|m1b,l2b)*H24(l1b,l2b|d1bd2b)*-1.
    ierr=exatns_tensor_contract("Z74_1(l1,m1)+=S44(d1,d2,m1,l2)*H24(l1,l2,d1,d2)", &
        Z74_1,S44,H24,prefactor=(-0.5d0,0.0d0))
    ierr=exatns_tensor_destroy(Z74_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z74_1,"Z74_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z74_1,'ZERO')
    ierr=exatns_tensor_destroy(Z74_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z136_1,"Z136_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z136_1,'ZERO')
!   original expression: Z136_1(e1b,l1b|m1b,d1b)+=H17(e1b,l1b|d1b,d2b)*S43(d2b|m1b)*-1.
    ierr=exatns_tensor_contract("Z136_1(e1,l1,m1,d1)+=H17(e1,l1,d1,d2)*S43(d2,m1)", &
        Z136_1,H17,S43,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z136_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z136_1,"Z136_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z136_1,'ZERO')
!   original expression: Z136_1(e1b,l1b|m1b,d1b)+=S44(e1b,d2b|m1b,l2b)*H24(l1b,l2b|d1b,d2b)
    ierr=exatns_tensor_contract("Z136_1(e1,l1,m1,d1)+=S44(e1,d2,m1,l2)*H24(l1,l2,d1,d2)", &
        Z136_1,S44,H24,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z136_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z136_1,"Z136_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z136_1,'ZERO')
    ierr=exatns_tensor_destroy(Z136_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z129_1,"Z129_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z129_1,'ZERO')
!   original expression: Z129_1(l1bl2b|m1b,d1b)+=H24(l1bl2b|d1b,d2b)*S43(d2b|m1b)
    ierr=exatns_tensor_contract("Z129_1(l1,l2,m1,d1)+=H24(l1,l2,d1,d2)*S43(d2,m1)", &
        Z129_1,H24,S43,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z129_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nvir_id/)
    tens_root = (/nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z75_1,"Z75_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z75_1,'ZERO')
!   original expression: Z75_1(l1b|d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|l2b)
    ierr=exatns_tensor_contract("Z75_1(l1,d1)+=H24(l1,l2,d1,d2)*S43(d2,l2)", &
        Z75_1,H24,S43,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z75_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nvir_id/)
    tens_root = (/nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z75_1,"Z75_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z75_1,'ZERO')
    ierr=exatns_tensor_destroy(Z75_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nvir_id/)
    tens_root = (/nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z75_2,"Z75_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z75_2,'ZERO')
!   original expression: Z75_2(l1b|d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|l2b)*-1.
    ierr=exatns_tensor_contract("Z75_2(l1,d1)+=H24(l1,l2,d1,d2)*S43(d2,l2)", &
        Z75_2,H24,S43,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z75_2)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nvir_id/)
    tens_root = (/nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z75_2,"Z75_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z75_2,'ZERO')
    ierr=exatns_tensor_destroy(Z75_2)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z165_2,"Z165_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z165_2,'ZERO')
!   original expression: Z165_2(l1b,l2b|m1b,d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|m1b)
    ierr=exatns_tensor_contract("Z165_2(l1,l2,m1,d1)+=H24(l1,l2,d1,d2)*S43(d2,m1)", &
        Z165_2,H24,S43,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z165_2)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nvir_id/)
    tens_root = (/nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z75_2,"Z75_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z75_2,'ZERO')
!   original expression: Z75_2(l1b|d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|l2b)*-1.
    ierr=exatns_tensor_contract("Z75_2(l1,d1)+=H24(l1,l2,d1,d2)*S43(d2,l2)", &
        Z75_2,H24,S43,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z75_2)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nvir_id/)
    tens_root = (/nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z75_2,"Z75_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z75_2,'ZERO')
    ierr=exatns_tensor_destroy(Z75_2)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z165_2,"Z165_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z165_2,'ZERO')
!   original expression: Z165_2(l1b,l2b|m1b,d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|m1b)
    ierr=exatns_tensor_contract("Z165_2(l1,l2,m1,d1)+=H24(l1,l2,d1,d2)*S43(d2,m1)", &
        Z165_2,H24,S43,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z165_2)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nvir_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root/)
    ierr=exatns_tensor_create(Z72_1,"Z72_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z72_1,'ZERO')
!   original expression: Z72_1(e1b|d1b)+=H17(e1b,l1b|d1b,d2b)*S43(d2b|l1b)
    ierr=exatns_tensor_contract("Z72_1(e1,d1)+=H17(e1,l1,d1,d2)*S43(d2,l1)", &
        Z72_1,H17,S43,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z72_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nvir_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root/)
    ierr=exatns_tensor_create(Z72_1,"Z72_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z72_1,'ZERO')
    ierr=exatns_tensor_destroy(Z72_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nvir_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root/)
    ierr=exatns_tensor_create(Z72_1,"Z72_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z72_1,'ZERO')
!   original expression: Z72_1(e1b|d1b)+=S44(e1b,d2b|l1bl2b)*H24(l1bl2b|d1b,d2b)*-1.
    ierr=exatns_tensor_contract("Z72_1(e1,d1)+=S44(e1,d2,l1,l2)*H24(l1,l2,d1,d2)", &
        Z72_1,S44,H24,prefactor=(-0.5d0,0.0d0))
    ierr=exatns_tensor_destroy(Z72_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nvir_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root/)
    ierr=exatns_tensor_create(Z72_1,"Z72_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z72_1,'ZERO')
    ierr=exatns_tensor_destroy(Z72_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z74_1,"Z74_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z74_1,'ZERO')
!   original expression: Z74_1(l1b|m1b)+=H25(l1b,l2b|m1b,d1b)*S43(d1b|l2b)*-1.
    ierr=exatns_tensor_contract("Z74_1(l1,m1)+=H25(l1,l2,m1,d1)*S43(d1,l2)", &
        Z74_1,H25,S43,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z74_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z74_1,"Z74_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z74_1,'ZERO')
    ierr=exatns_tensor_destroy(Z74_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nvir_id/)
    tens_root = (/nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z75_2,"Z75_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z75_2,'ZERO')
!   original expression: Z75_2(l1b|d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|l2b)*-1.
    ierr=exatns_tensor_contract("Z75_2(l1,d1)+=H24(l1,l2,d1,d2)*S43(d2,l2)", &
        Z75_2,H24,S43,prefactor=(-1.0d0,0.0d0))
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z74_1,"Z74_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z74_1,'ZERO')
!   original expression: Z74_1(l1b|m1b)+=S43(d1b|m1b)*Z75_2(l1b|d1b)
    ierr=exatns_tensor_contract("Z74_1(l1,m1)+=S43(d1,m1)*Z75_2(l1,d1)", &
        Z74_1,S43,Z75_2,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z75_2)
    ierr=exatns_tensor_destroy(Z74_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nvir_id/)
    tens_root = (/nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z75_2,"Z75_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z75_2,'ZERO')
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z74_1,"Z74_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z74_1,'ZERO')
!   original expression: Z74_1(l1b|m1b)+=S43(d1b|m1b)*Z75_2(l1b|d1b)
    ierr=exatns_tensor_contract("Z74_1(l1,m1)+=S43(d1,m1)*Z75_2(l1,d1)", &
        Z74_1,S43,Z75_2,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z75_2)
    ierr=exatns_tensor_destroy(Z74_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z74_1,"Z74_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z74_1,'ZERO')
!   original expression: Z74_1(l1b|m1b)+=S43(d1b|m1b)*H15(l1b|d1b)*-1.
    ierr=exatns_tensor_contract("Z74_1(l1,m1)+=S43(d1,m1)*H15(l1,d1)", &
        Z74_1,S43,H15,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z74_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z74_1,"Z74_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z74_1,'ZERO')
!   original expression: Z74_1(l1b|m1b)+=S44(d1bd2b|m1b,l2b)*H24(l1b,l2b|d1bd2b)*-1.
    ierr=exatns_tensor_contract("Z74_1(l1,m1)+=S44(d1,d2,m1,l2)*H24(l1,l2,d1,d2)", &
        Z74_1,S44,H24,prefactor=(-0.5d0,0.0d0))
    ierr=exatns_tensor_destroy(Z74_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z74_1,"Z74_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z74_1,'ZERO')
    ierr=exatns_tensor_destroy(Z74_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z136_1,"Z136_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z136_1,'ZERO')
!   original expression: Z136_1(e1b,l1b|m1b,d1b)+=H17(e1b,l1b|d1b,d2b)*S43(d2b|m1b)*-1.
    ierr=exatns_tensor_contract("Z136_1(e1,l1,m1,d1)+=H17(e1,l1,d1,d2)*S43(d2,m1)", &
        Z136_1,H17,S43,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z136_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z136_1,"Z136_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z136_1,'ZERO')
!   original expression: Z136_1(e1b,l1b|m1b,d1b)+=S44(e1b,d2b|m1b,l2b)*H24(l1b,l2b|d1b,d2b)
    ierr=exatns_tensor_contract("Z136_1(e1,l1,m1,d1)+=S44(e1,d2,m1,l2)*H24(l1,l2,d1,d2)", &
        Z136_1,S44,H24,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z136_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z136_1,"Z136_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z136_1,'ZERO')
    ierr=exatns_tensor_destroy(Z136_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z129_1,"Z129_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z129_1,'ZERO')
!   original expression: Z129_1(l1bl2b|m1b,d1b)+=H24(l1bl2b|d1b,d2b)*S43(d2b|m1b)
    ierr=exatns_tensor_contract("Z129_1(l1,l2,m1,d1)+=H24(l1,l2,d1,d2)*S43(d2,m1)", &
        Z129_1,H24,S43,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z129_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nvir_id/)
    tens_root = (/nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z75_1,"Z75_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z75_1,'ZERO')
!   original expression: Z75_1(l1b|d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|l2b)
    ierr=exatns_tensor_contract("Z75_1(l1,d1)+=H24(l1,l2,d1,d2)*S43(d2,l2)", &
        Z75_1,H24,S43,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z75_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nvir_id/)
    tens_root = (/nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z75_1,"Z75_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z75_1,'ZERO')
    ierr=exatns_tensor_destroy(Z75_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nvir_id/)
    tens_root = (/nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z75_1,"Z75_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z75_1,'ZERO')
!   original expression: Z75_1(l1b|d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|l2b)
    ierr=exatns_tensor_contract("Z75_1(l1,d1)+=H24(l1,l2,d1,d2)*S43(d2,l2)", &
        Z75_1,H24,S43,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z75_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nvir_id/)
    tens_root = (/nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z75_1,"Z75_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z75_1,'ZERO')
    ierr=exatns_tensor_destroy(Z75_1)
    
    allocate(tens_id(6), tens_root(6))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z169_3,"Z169_3",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z169_3,'ZERO')
!   original expression: Z169_3(e1b,l1b,l2b|m1bm2b,d1b)+=H24(l1b,l2b|d1b,d2b)*S44(e1b,d2b|m1bm2b)*-0.25
    ierr=exatns_tensor_contract("Z169_3(e1,l1,l2,m1,m2,d1)+=H24(l1,l2,d1,d2)*S44(e1,d2,m1,m2)", &
        Z169_3,H24,S44,prefactor=(-0.25d0,0.0d0))
    
    allocate(tens_id(8), tens_root(8))
    tens_id   = (/nvir_id,nvir_id,nocc_id,nocc_id,nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nvir_root,nocc_root,nocc_root,nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z140_2,"Z140_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z140_2,'ZERO')
!   original expression: Z140_2(e1be2b,l1b,l2b|m1bm2bm3bm4b)+=S44(e1b,d1b|m1bm2b)*Z169_3(e2b,l1b,l2b|m3bm4b,d1b)
    ierr=exatns_tensor_contract("Z140_2(e1,e2,l1,l2,m1,m2,m3,m4)+=S44(e1,d1,m1,m2)*Z169_3(e2,l1,l2,m3,m4,d1)", &
        Z140_2,S44,Z169_3,prefactor=(1.0d0,0.0d0))
!   original expression: Z140_2(e1be2b,l1b,l2b|m1bm2bm3bm4b)+=S44(e2b,d1b|m1bm2b)*Z169_3(e1b,l1b,l2b|m3bm4b,d1b)*-1.
    ierr=exatns_tensor_contract("Z140_2(e1,e2,l1,l2,m1,m2,m3,m4)+=S44(e2,d1,m1,m2)*Z169_3(e1,l1,l2,m3,m4,d1)", &
        Z140_2,S44,Z169_3,prefactor=(-1.0d0,0.0d0))
!   original expression: Z140_2(e1be2b,l1b,l2b|m1bm2bm3bm4b)+=S44(e1b,d1b|m1bm3b)*Z169_3(e2b,l1b,l2b|m2bm4b,d1b)*-1.
    ierr=exatns_tensor_contract("Z140_2(e1,e2,l1,l2,m1,m2,m3,m4)+=S44(e1,d1,m1,m3)*Z169_3(e2,l1,l2,m2,m4,d1)", &
        Z140_2,S44,Z169_3,prefactor=(-1.0d0,0.0d0))
!   original expression: Z140_2(e1be2b,l1b,l2b|m1bm2bm3bm4b)+=S44(e2b,d1b|m1bm3b)*Z169_3(e1b,l1b,l2b|m2bm4b,d1b)
    ierr=exatns_tensor_contract("Z140_2(e1,e2,l1,l2,m1,m2,m3,m4)+=S44(e2,d1,m1,m3)*Z169_3(e1,l1,l2,m2,m4,d1)", &
        Z140_2,S44,Z169_3,prefactor=(1.0d0,0.0d0))
!   original expression: Z140_2(e1be2b,l1b,l2b|m1bm2bm3bm4b)+=S44(e1b,d1b|m1bm4b)*Z169_3(e2b,l1b,l2b|m2bm3b,d1b)
    ierr=exatns_tensor_contract("Z140_2(e1,e2,l1,l2,m1,m2,m3,m4)+=S44(e1,d1,m1,m4)*Z169_3(e2,l1,l2,m2,m3,d1)", &
        Z140_2,S44,Z169_3,prefactor=(1.0d0,0.0d0))
!   original expression: Z140_2(e1be2b,l1b,l2b|m1bm2bm3bm4b)+=S44(e2b,d1b|m1bm4b)*Z169_3(e1b,l1b,l2b|m2bm3b,d1b)*-1.
    ierr=exatns_tensor_contract("Z140_2(e1,e2,l1,l2,m1,m2,m3,m4)+=S44(e2,d1,m1,m4)*Z169_3(e1,l1,l2,m2,m3,d1)", &
        Z140_2,S44,Z169_3,prefactor=(-1.0d0,0.0d0))
!   original expression: Z140_2(e1be2b,l1b,l2b|m1bm2bm3bm4b)+=S44(e1b,d1b|m2bm3b)*Z169_3(e2b,l1b,l2b|m1bm4b,d1b)
    ierr=exatns_tensor_contract("Z140_2(e1,e2,l1,l2,m1,m2,m3,m4)+=S44(e1,d1,m2,m3)*Z169_3(e2,l1,l2,m1,m4,d1)", &
        Z140_2,S44,Z169_3,prefactor=(1.0d0,0.0d0))
!   original expression: Z140_2(e1be2b,l1b,l2b|m1bm2bm3bm4b)+=S44(e2b,d1b|m2bm3b)*Z169_3(e1b,l1b,l2b|m1bm4b,d1b)*-1.
    ierr=exatns_tensor_contract("Z140_2(e1,e2,l1,l2,m1,m2,m3,m4)+=S44(e2,d1,m2,m3)*Z169_3(e1,l1,l2,m1,m4,d1)", &
        Z140_2,S44,Z169_3,prefactor=(-1.0d0,0.0d0))
!   original expression: Z140_2(e1be2b,l1b,l2b|m1bm2bm3bm4b)+=S44(e1b,d1b|m2bm4b)*Z169_3(e2b,l1b,l2b|m1bm3b,d1b)*-1.
    ierr=exatns_tensor_contract("Z140_2(e1,e2,l1,l2,m1,m2,m3,m4)+=S44(e1,d1,m2,m4)*Z169_3(e2,l1,l2,m1,m3,d1)", &
        Z140_2,S44,Z169_3,prefactor=(-1.0d0,0.0d0))
!   original expression: Z140_2(e1be2b,l1b,l2b|m1bm2bm3bm4b)+=S44(e2b,d1b|m2bm4b)*Z169_3(e1b,l1b,l2b|m1bm3b,d1b)
    ierr=exatns_tensor_contract("Z140_2(e1,e2,l1,l2,m1,m2,m3,m4)+=S44(e2,d1,m2,m4)*Z169_3(e1,l1,l2,m1,m3,d1)", &
        Z140_2,S44,Z169_3,prefactor=(1.0d0,0.0d0))
!   original expression: Z140_2(e1be2b,l1b,l2b|m1bm2bm3bm4b)+=S44(e1b,d1b|m3bm4b)*Z169_3(e2b,l1b,l2b|m1bm2b,d1b)
    ierr=exatns_tensor_contract("Z140_2(e1,e2,l1,l2,m1,m2,m3,m4)+=S44(e1,d1,m3,m4)*Z169_3(e2,l1,l2,m1,m2,d1)", &
        Z140_2,S44,Z169_3,prefactor=(1.0d0,0.0d0))
!   original expression: Z140_2(e1be2b,l1b,l2b|m1bm2bm3bm4b)+=S44(e2b,d1b|m3bm4b)*Z169_3(e1b,l1b,l2b|m1bm2b,d1b)*-1.
    ierr=exatns_tensor_contract("Z140_2(e1,e2,l1,l2,m1,m2,m3,m4)+=S44(e2,d1,m3,m4)*Z169_3(e1,l1,l2,m1,m2,d1)", &
        Z140_2,S44,Z169_3,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z169_3)
    
    allocate(tens_id(8), tens_root(8))
    tens_id   = (/nvir_id,nvir_id,nvir_id,nocc_id,nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nvir_root,nvir_root,nocc_root,nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z93_1,"Z93_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z93_1,'ZERO')
!   original expression: Z93_1(e1be2be3b,l1b|m1bm2bm3bm4b)+=S43(e1b|l2b)*Z140_2(e2be3b,l1b,l2b|m1bm2bm3bm4b)
    ierr=exatns_tensor_contract("Z93_1(e1,e2,e3,l1,m1,m2,m3,m4)+=S43(e1,l2)*Z140_2(e2,e3,l1,l2,m1,m2,m3,m4)", &
        Z93_1,S43,Z140_2,prefactor=(1.0d0,0.0d0))
!   original expression: Z93_1(e1be2be3b,l1b|m1bm2bm3bm4b)+=S43(e2b|l2b)*Z140_2(e1be3b,l1b,l2b|m1bm2bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z93_1(e1,e2,e3,l1,m1,m2,m3,m4)+=S43(e2,l2)*Z140_2(e1,e3,l1,l2,m1,m2,m3,m4)", &
        Z93_1,S43,Z140_2,prefactor=(-1.0d0,0.0d0))
!   original expression: Z93_1(e1be2be3b,l1b|m1bm2bm3bm4b)+=S43(e3b|l2b)*Z140_2(e1be2b,l1b,l2b|m1bm2bm3bm4b)
    ierr=exatns_tensor_contract("Z93_1(e1,e2,e3,l1,m1,m2,m3,m4)+=S43(e3,l2)*Z140_2(e1,e2,l1,l2,m1,m2,m3,m4)", &
        Z93_1,S43,Z140_2,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z140_2)
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S43(e1b|l1b)*Z93_1(e2be3be4b,l1b|m1bm2bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S43(e1,l1)*Z93_1(e2,e3,e4,l1,m1,m2,m3,m4)", &
        Z61,S43,Z93_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S43(e2b|l1b)*Z93_1(e1be3be4b,l1b|m1bm2bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S43(e2,l1)*Z93_1(e1,e3,e4,l1,m1,m2,m3,m4)", &
        Z61,S43,Z93_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S43(e3b|l1b)*Z93_1(e1be2be4b,l1b|m1bm2bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S43(e3,l1)*Z93_1(e1,e2,e4,l1,m1,m2,m3,m4)", &
        Z61,S43,Z93_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S43(e4b|l1b)*Z93_1(e1be2be3b,l1b|m1bm2bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S43(e4,l1)*Z93_1(e1,e2,e3,l1,m1,m2,m3,m4)", &
        Z61,S43,Z93_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z93_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z165_3,"Z165_3",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z165_3,'ZERO')
!   original expression: Z165_3(l1b,l2b|m1b,d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|m1b)*0.5
    ierr=exatns_tensor_contract("Z165_3(l1,l2,m1,d1)+=H24(l1,l2,d1,d2)*S43(d2,m1)", &
        Z165_3,H24,S43,prefactor=(0.5d0,0.0d0))
    
    allocate(tens_id(8), tens_root(8))
    tens_id   = (/nvir_id,nvir_id,nocc_id,nocc_id,nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nvir_root,nocc_root,nocc_root,nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z140_2,"Z140_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z140_2,'ZERO')
!   original expression: Z140_2(e1be2b,l1b,l2b|m1bm2bm3bm4b)+=S45(e1be2b,d1b|m1bm2bm3b)*Z165_3(l1b,l2b|m4b,d1b)
    ierr=exatns_tensor_contract("Z140_2(e1,e2,l1,l2,m1,m2,m3,m4)+=S45(e1,e2,d1,m1,m2,m3)*Z165_3(l1,l2,m4,d1)", &
        Z140_2,S45,Z165_3,prefactor=(1.0d0,0.0d0))
!   original expression: Z140_2(e1be2b,l1b,l2b|m1bm2bm3bm4b)+=S45(e1be2b,d1b|m1bm2bm4b)*Z165_3(l1b,l2b|m3b,d1b)*-1.
    ierr=exatns_tensor_contract("Z140_2(e1,e2,l1,l2,m1,m2,m3,m4)+=S45(e1,e2,d1,m1,m2,m4)*Z165_3(l1,l2,m3,d1)", &
        Z140_2,S45,Z165_3,prefactor=(-1.0d0,0.0d0))
!   original expression: Z140_2(e1be2b,l1b,l2b|m1bm2bm3bm4b)+=S45(e1be2b,d1b|m1bm3bm4b)*Z165_3(l1b,l2b|m2b,d1b)
    ierr=exatns_tensor_contract("Z140_2(e1,e2,l1,l2,m1,m2,m3,m4)+=S45(e1,e2,d1,m1,m3,m4)*Z165_3(l1,l2,m2,d1)", &
        Z140_2,S45,Z165_3,prefactor=(1.0d0,0.0d0))
!   original expression: Z140_2(e1be2b,l1b,l2b|m1bm2bm3bm4b)+=S45(e1be2b,d1b|m2bm3bm4b)*Z165_3(l1b,l2b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z140_2(e1,e2,l1,l2,m1,m2,m3,m4)+=S45(e1,e2,d1,m2,m3,m4)*Z165_3(l1,l2,m1,d1)", &
        Z140_2,S45,Z165_3,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z165_3)
    
    allocate(tens_id(8), tens_root(8))
    tens_id   = (/nvir_id,nvir_id,nvir_id,nocc_id,nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nvir_root,nvir_root,nocc_root,nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z93_1,"Z93_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z93_1,'ZERO')
!   original expression: Z93_1(e1be2be3b,l1b|m1bm2bm3bm4b)+=S43(e1b|l2b)*Z140_2(e2be3b,l1b,l2b|m1bm2bm3bm4b)
    ierr=exatns_tensor_contract("Z93_1(e1,e2,e3,l1,m1,m2,m3,m4)+=S43(e1,l2)*Z140_2(e2,e3,l1,l2,m1,m2,m3,m4)", &
        Z93_1,S43,Z140_2,prefactor=(1.0d0,0.0d0))
!   original expression: Z93_1(e1be2be3b,l1b|m1bm2bm3bm4b)+=S43(e2b|l2b)*Z140_2(e1be3b,l1b,l2b|m1bm2bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z93_1(e1,e2,e3,l1,m1,m2,m3,m4)+=S43(e2,l2)*Z140_2(e1,e3,l1,l2,m1,m2,m3,m4)", &
        Z93_1,S43,Z140_2,prefactor=(-1.0d0,0.0d0))
!   original expression: Z93_1(e1be2be3b,l1b|m1bm2bm3bm4b)+=S43(e3b|l2b)*Z140_2(e1be2b,l1b,l2b|m1bm2bm3bm4b)
    ierr=exatns_tensor_contract("Z93_1(e1,e2,e3,l1,m1,m2,m3,m4)+=S43(e3,l2)*Z140_2(e1,e2,l1,l2,m1,m2,m3,m4)", &
        Z93_1,S43,Z140_2,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z140_2)
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S43(e1b|l1b)*Z93_1(e2be3be4b,l1b|m1bm2bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S43(e1,l1)*Z93_1(e2,e3,e4,l1,m1,m2,m3,m4)", &
        Z61,S43,Z93_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S43(e2b|l1b)*Z93_1(e1be3be4b,l1b|m1bm2bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S43(e2,l1)*Z93_1(e1,e3,e4,l1,m1,m2,m3,m4)", &
        Z61,S43,Z93_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S43(e3b|l1b)*Z93_1(e1be2be4b,l1b|m1bm2bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S43(e3,l1)*Z93_1(e1,e2,e4,l1,m1,m2,m3,m4)", &
        Z61,S43,Z93_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S43(e4b|l1b)*Z93_1(e1be2be3b,l1b|m1bm2bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S43(e4,l1)*Z93_1(e1,e2,e3,l1,m1,m2,m3,m4)", &
        Z61,S43,Z93_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z93_1)
    
    allocate(tens_id(8), tens_root(8))
    tens_id   = (/nvir_id,nvir_id,nocc_id,nocc_id,nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nvir_root,nocc_root,nocc_root,nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z140_2,"Z140_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z140_2,'ZERO')
!   original expression: Z140_2(e1be2b,l1b,l2b|m1bm2bm3bm4b)+=S45(e1be2b,d1b|m1bm2bm3b)*H25(l1b,l2b|m4b,d1b)*-0.5
    ierr=exatns_tensor_contract("Z140_2(e1,e2,l1,l2,m1,m2,m3,m4)+=S45(e1,e2,d1,m1,m2,m3)*H25(l1,l2,m4,d1)", &
        Z140_2,S45,H25,prefactor=(-0.5d0,0.0d0))
!   original expression: Z140_2(e1be2b,l1b,l2b|m1bm2bm3bm4b)+=S45(e1be2b,d1b|m1bm2bm4b)*H25(l1b,l2b|m3b,d1b)*+0.5
    ierr=exatns_tensor_contract("Z140_2(e1,e2,l1,l2,m1,m2,m3,m4)+=S45(e1,e2,d1,m1,m2,m4)*H25(l1,l2,m3,d1)", &
        Z140_2,S45,H25,prefactor=(0.5d0,0.0d0))
!   original expression: Z140_2(e1be2b,l1b,l2b|m1bm2bm3bm4b)+=S45(e1be2b,d1b|m1bm3bm4b)*H25(l1b,l2b|m2b,d1b)*+0.5
    ierr=exatns_tensor_contract("Z140_2(e1,e2,l1,l2,m1,m2,m3,m4)+=S45(e1,e2,d1,m1,m3,m4)*H25(l1,l2,m2,d1)", &
        Z140_2,S45,H25,prefactor=(0.5d0,0.0d0))
!   original expression: Z140_2(e1be2b,l1b,l2b|m1bm2bm3bm4b)+=S45(e1be2b,d1b|m2bm3bm4b)*H25(l1b,l2b|m1b,d1b)*+0.5
    ierr=exatns_tensor_contract("Z140_2(e1,e2,l1,l2,m1,m2,m3,m4)+=S45(e1,e2,d1,m2,m3,m4)*H25(l1,l2,m1,d1)", &
        Z140_2,S45,H25,prefactor=(0.5d0,0.0d0))
    
    allocate(tens_id(8), tens_root(8))
    tens_id   = (/nvir_id,nvir_id,nvir_id,nocc_id,nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nvir_root,nvir_root,nocc_root,nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z93_1,"Z93_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z93_1,'ZERO')
!   original expression: Z93_1(e1be2be3b,l1b|m1bm2bm3bm4b)+=S43(e1b|l2b)*Z140_2(e2be3b,l1b,l2b|m1bm2bm3bm4b)
    ierr=exatns_tensor_contract("Z93_1(e1,e2,e3,l1,m1,m2,m3,m4)+=S43(e1,l2)*Z140_2(e2,e3,l1,l2,m1,m2,m3,m4)", &
        Z93_1,S43,Z140_2,prefactor=(1.0d0,0.0d0))
!   original expression: Z93_1(e1be2be3b,l1b|m1bm2bm3bm4b)+=S43(e2b|l2b)*Z140_2(e1be3b,l1b,l2b|m1bm2bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z93_1(e1,e2,e3,l1,m1,m2,m3,m4)+=S43(e2,l2)*Z140_2(e1,e3,l1,l2,m1,m2,m3,m4)", &
        Z93_1,S43,Z140_2,prefactor=(-1.0d0,0.0d0))
!   original expression: Z93_1(e1be2be3b,l1b|m1bm2bm3bm4b)+=S43(e3b|l2b)*Z140_2(e1be2b,l1b,l2b|m1bm2bm3bm4b)
    ierr=exatns_tensor_contract("Z93_1(e1,e2,e3,l1,m1,m2,m3,m4)+=S43(e3,l2)*Z140_2(e1,e2,l1,l2,m1,m2,m3,m4)", &
        Z93_1,S43,Z140_2,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z140_2)
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S43(e1b|l1b)*Z93_1(e2be3be4b,l1b|m1bm2bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S43(e1,l1)*Z93_1(e2,e3,e4,l1,m1,m2,m3,m4)", &
        Z61,S43,Z93_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S43(e2b|l1b)*Z93_1(e1be3be4b,l1b|m1bm2bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S43(e2,l1)*Z93_1(e1,e3,e4,l1,m1,m2,m3,m4)", &
        Z61,S43,Z93_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S43(e3b|l1b)*Z93_1(e1be2be4b,l1b|m1bm2bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S43(e3,l1)*Z93_1(e1,e2,e4,l1,m1,m2,m3,m4)", &
        Z61,S43,Z93_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S43(e4b|l1b)*Z93_1(e1be2be3b,l1b|m1bm2bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S43(e4,l1)*Z93_1(e1,e2,e3,l1,m1,m2,m3,m4)", &
        Z61,S43,Z93_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z93_1)
    
    allocate(tens_id(8), tens_root(8))
    tens_id   = (/nvir_id,nvir_id,nocc_id,nocc_id,nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nvir_root,nocc_root,nocc_root,nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z140_2,"Z140_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z140_2,'ZERO')
!   original expression: Z140_2(e1be2b,l1b,l2b|m1bm2bm3bm4b)+=S46(e1be2b,d1bd2b|m1bm2bm3bm4b)*H24(l1b,l2b|d1bd2b)*0.5
    ierr=exatns_tensor_contract("Z140_2(e1,e2,l1,l2,m1,m2,m3,m4)+=S46(e1,e2,d1,d2,m1,m2,m3,m4)*H24(l1,l2,d1,d2)", &
        Z140_2,S46,H24,prefactor=(0.25d0,0.0d0))
    
    allocate(tens_id(8), tens_root(8))
    tens_id   = (/nvir_id,nvir_id,nvir_id,nocc_id,nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nvir_root,nvir_root,nocc_root,nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z93_1,"Z93_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z93_1,'ZERO')
!   original expression: Z93_1(e1be2be3b,l1b|m1bm2bm3bm4b)+=S43(e1b|l2b)*Z140_2(e2be3b,l1b,l2b|m1bm2bm3bm4b)
    ierr=exatns_tensor_contract("Z93_1(e1,e2,e3,l1,m1,m2,m3,m4)+=S43(e1,l2)*Z140_2(e2,e3,l1,l2,m1,m2,m3,m4)", &
        Z93_1,S43,Z140_2,prefactor=(1.0d0,0.0d0))
!   original expression: Z93_1(e1be2be3b,l1b|m1bm2bm3bm4b)+=S43(e2b|l2b)*Z140_2(e1be3b,l1b,l2b|m1bm2bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z93_1(e1,e2,e3,l1,m1,m2,m3,m4)+=S43(e2,l2)*Z140_2(e1,e3,l1,l2,m1,m2,m3,m4)", &
        Z93_1,S43,Z140_2,prefactor=(-1.0d0,0.0d0))
!   original expression: Z93_1(e1be2be3b,l1b|m1bm2bm3bm4b)+=S43(e3b|l2b)*Z140_2(e1be2b,l1b,l2b|m1bm2bm3bm4b)
    ierr=exatns_tensor_contract("Z93_1(e1,e2,e3,l1,m1,m2,m3,m4)+=S43(e3,l2)*Z140_2(e1,e2,l1,l2,m1,m2,m3,m4)", &
        Z93_1,S43,Z140_2,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z140_2)
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S43(e1b|l1b)*Z93_1(e2be3be4b,l1b|m1bm2bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S43(e1,l1)*Z93_1(e2,e3,e4,l1,m1,m2,m3,m4)", &
        Z61,S43,Z93_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S43(e2b|l1b)*Z93_1(e1be3be4b,l1b|m1bm2bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S43(e2,l1)*Z93_1(e1,e3,e4,l1,m1,m2,m3,m4)", &
        Z61,S43,Z93_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S43(e3b|l1b)*Z93_1(e1be2be4b,l1b|m1bm2bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S43(e3,l1)*Z93_1(e1,e2,e4,l1,m1,m2,m3,m4)", &
        Z61,S43,Z93_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S43(e4b|l1b)*Z93_1(e1be2be3b,l1b|m1bm2bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S43(e4,l1)*Z93_1(e1,e2,e3,l1,m1,m2,m3,m4)", &
        Z61,S43,Z93_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z93_1)
    
    allocate(tens_id(6), tens_root(6))
    tens_id   = (/nvir_id,nvir_id,nocc_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root,nocc_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z142_2,"Z142_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z142_2,'ZERO')
!   original expression: Z142_2(e1be2b,l1b|m1bm2b,d1b)+=H17(e1b,l1b|d1b,d2b)*S44(e2b,d2b|m1bm2b)*0.5
    ierr=exatns_tensor_contract("Z142_2(e1,e2,l1,m1,m2,d1)+=H17(e1,l1,d1,d2)*S44(e2,d2,m1,m2)", &
        Z142_2,H17,S44,prefactor=(0.5d0,0.0d0))
!   original expression: Z142_2(e1be2b,l1b|m1bm2b,d1b)+=H17(e2b,l1b|d1b,d2b)*S44(e1b,d2b|m1bm2b)*-0.5
    ierr=exatns_tensor_contract("Z142_2(e1,e2,l1,m1,m2,d1)+=H17(e2,l1,d1,d2)*S44(e1,d2,m1,m2)", &
        Z142_2,H17,S44,prefactor=(-0.5d0,0.0d0))
    
    allocate(tens_id(8), tens_root(8))
    tens_id   = (/nvir_id,nvir_id,nvir_id,nocc_id,nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nvir_root,nvir_root,nocc_root,nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z93_1,"Z93_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z93_1,'ZERO')
!   original expression: Z93_1(e1be2be3b,l1b|m1bm2bm3bm4b)+=S44(e1b,d1b|m1bm2b)*Z142_2(e2be3b,l1b|m3bm4b,d1b)
    ierr=exatns_tensor_contract("Z93_1(e1,e2,e3,l1,m1,m2,m3,m4)+=S44(e1,d1,m1,m2)*Z142_2(e2,e3,l1,m3,m4,d1)", &
        Z93_1,S44,Z142_2,prefactor=(1.0d0,0.0d0))
!   original expression: Z93_1(e1be2be3b,l1b|m1bm2bm3bm4b)+=S44(e2b,d1b|m1bm2b)*Z142_2(e1be3b,l1b|m3bm4b,d1b)*-1.
    ierr=exatns_tensor_contract("Z93_1(e1,e2,e3,l1,m1,m2,m3,m4)+=S44(e2,d1,m1,m2)*Z142_2(e1,e3,l1,m3,m4,d1)", &
        Z93_1,S44,Z142_2,prefactor=(-1.0d0,0.0d0))
!   original expression: Z93_1(e1be2be3b,l1b|m1bm2bm3bm4b)+=S44(e3b,d1b|m1bm2b)*Z142_2(e1be2b,l1b|m3bm4b,d1b)
    ierr=exatns_tensor_contract("Z93_1(e1,e2,e3,l1,m1,m2,m3,m4)+=S44(e3,d1,m1,m2)*Z142_2(e1,e2,l1,m3,m4,d1)", &
        Z93_1,S44,Z142_2,prefactor=(1.0d0,0.0d0))
!   original expression: Z93_1(e1be2be3b,l1b|m1bm2bm3bm4b)+=S44(e1b,d1b|m1bm3b)*Z142_2(e2be3b,l1b|m2bm4b,d1b)*-1.
    ierr=exatns_tensor_contract("Z93_1(e1,e2,e3,l1,m1,m2,m3,m4)+=S44(e1,d1,m1,m3)*Z142_2(e2,e3,l1,m2,m4,d1)", &
        Z93_1,S44,Z142_2,prefactor=(-1.0d0,0.0d0))
!   original expression: Z93_1(e1be2be3b,l1b|m1bm2bm3bm4b)+=S44(e2b,d1b|m1bm3b)*Z142_2(e1be3b,l1b|m2bm4b,d1b)
    ierr=exatns_tensor_contract("Z93_1(e1,e2,e3,l1,m1,m2,m3,m4)+=S44(e2,d1,m1,m3)*Z142_2(e1,e3,l1,m2,m4,d1)", &
        Z93_1,S44,Z142_2,prefactor=(1.0d0,0.0d0))
!   original expression: Z93_1(e1be2be3b,l1b|m1bm2bm3bm4b)+=S44(e3b,d1b|m1bm3b)*Z142_2(e1be2b,l1b|m2bm4b,d1b)*-1.
    ierr=exatns_tensor_contract("Z93_1(e1,e2,e3,l1,m1,m2,m3,m4)+=S44(e3,d1,m1,m3)*Z142_2(e1,e2,l1,m2,m4,d1)", &
        Z93_1,S44,Z142_2,prefactor=(-1.0d0,0.0d0))
!   original expression: Z93_1(e1be2be3b,l1b|m1bm2bm3bm4b)+=S44(e1b,d1b|m1bm4b)*Z142_2(e2be3b,l1b|m2bm3b,d1b)
    ierr=exatns_tensor_contract("Z93_1(e1,e2,e3,l1,m1,m2,m3,m4)+=S44(e1,d1,m1,m4)*Z142_2(e2,e3,l1,m2,m3,d1)", &
        Z93_1,S44,Z142_2,prefactor=(1.0d0,0.0d0))
!   original expression: Z93_1(e1be2be3b,l1b|m1bm2bm3bm4b)+=S44(e2b,d1b|m1bm4b)*Z142_2(e1be3b,l1b|m2bm3b,d1b)*-1.
    ierr=exatns_tensor_contract("Z93_1(e1,e2,e3,l1,m1,m2,m3,m4)+=S44(e2,d1,m1,m4)*Z142_2(e1,e3,l1,m2,m3,d1)", &
        Z93_1,S44,Z142_2,prefactor=(-1.0d0,0.0d0))
!   original expression: Z93_1(e1be2be3b,l1b|m1bm2bm3bm4b)+=S44(e3b,d1b|m1bm4b)*Z142_2(e1be2b,l1b|m2bm3b,d1b)
    ierr=exatns_tensor_contract("Z93_1(e1,e2,e3,l1,m1,m2,m3,m4)+=S44(e3,d1,m1,m4)*Z142_2(e1,e2,l1,m2,m3,d1)", &
        Z93_1,S44,Z142_2,prefactor=(1.0d0,0.0d0))
!   original expression: Z93_1(e1be2be3b,l1b|m1bm2bm3bm4b)+=S44(e1b,d1b|m2bm3b)*Z142_2(e2be3b,l1b|m1bm4b,d1b)
    ierr=exatns_tensor_contract("Z93_1(e1,e2,e3,l1,m1,m2,m3,m4)+=S44(e1,d1,m2,m3)*Z142_2(e2,e3,l1,m1,m4,d1)", &
        Z93_1,S44,Z142_2,prefactor=(1.0d0,0.0d0))
!   original expression: Z93_1(e1be2be3b,l1b|m1bm2bm3bm4b)+=S44(e2b,d1b|m2bm3b)*Z142_2(e1be3b,l1b|m1bm4b,d1b)*-1.
    ierr=exatns_tensor_contract("Z93_1(e1,e2,e3,l1,m1,m2,m3,m4)+=S44(e2,d1,m2,m3)*Z142_2(e1,e3,l1,m1,m4,d1)", &
        Z93_1,S44,Z142_2,prefactor=(-1.0d0,0.0d0))
!   original expression: Z93_1(e1be2be3b,l1b|m1bm2bm3bm4b)+=S44(e3b,d1b|m2bm3b)*Z142_2(e1be2b,l1b|m1bm4b,d1b)
    ierr=exatns_tensor_contract("Z93_1(e1,e2,e3,l1,m1,m2,m3,m4)+=S44(e3,d1,m2,m3)*Z142_2(e1,e2,l1,m1,m4,d1)", &
        Z93_1,S44,Z142_2,prefactor=(1.0d0,0.0d0))
!   original expression: Z93_1(e1be2be3b,l1b|m1bm2bm3bm4b)+=S44(e1b,d1b|m2bm4b)*Z142_2(e2be3b,l1b|m1bm3b,d1b)*-1.
    ierr=exatns_tensor_contract("Z93_1(e1,e2,e3,l1,m1,m2,m3,m4)+=S44(e1,d1,m2,m4)*Z142_2(e2,e3,l1,m1,m3,d1)", &
        Z93_1,S44,Z142_2,prefactor=(-1.0d0,0.0d0))
!   original expression: Z93_1(e1be2be3b,l1b|m1bm2bm3bm4b)+=S44(e2b,d1b|m2bm4b)*Z142_2(e1be3b,l1b|m1bm3b,d1b)
    ierr=exatns_tensor_contract("Z93_1(e1,e2,e3,l1,m1,m2,m3,m4)+=S44(e2,d1,m2,m4)*Z142_2(e1,e3,l1,m1,m3,d1)", &
        Z93_1,S44,Z142_2,prefactor=(1.0d0,0.0d0))
!   original expression: Z93_1(e1be2be3b,l1b|m1bm2bm3bm4b)+=S44(e3b,d1b|m2bm4b)*Z142_2(e1be2b,l1b|m1bm3b,d1b)*-1.
    ierr=exatns_tensor_contract("Z93_1(e1,e2,e3,l1,m1,m2,m3,m4)+=S44(e3,d1,m2,m4)*Z142_2(e1,e2,l1,m1,m3,d1)", &
        Z93_1,S44,Z142_2,prefactor=(-1.0d0,0.0d0))
!   original expression: Z93_1(e1be2be3b,l1b|m1bm2bm3bm4b)+=S44(e1b,d1b|m3bm4b)*Z142_2(e2be3b,l1b|m1bm2b,d1b)
    ierr=exatns_tensor_contract("Z93_1(e1,e2,e3,l1,m1,m2,m3,m4)+=S44(e1,d1,m3,m4)*Z142_2(e2,e3,l1,m1,m2,d1)", &
        Z93_1,S44,Z142_2,prefactor=(1.0d0,0.0d0))
!   original expression: Z93_1(e1be2be3b,l1b|m1bm2bm3bm4b)+=S44(e2b,d1b|m3bm4b)*Z142_2(e1be3b,l1b|m1bm2b,d1b)*-1.
    ierr=exatns_tensor_contract("Z93_1(e1,e2,e3,l1,m1,m2,m3,m4)+=S44(e2,d1,m3,m4)*Z142_2(e1,e3,l1,m1,m2,d1)", &
        Z93_1,S44,Z142_2,prefactor=(-1.0d0,0.0d0))
!   original expression: Z93_1(e1be2be3b,l1b|m1bm2bm3bm4b)+=S44(e3b,d1b|m3bm4b)*Z142_2(e1be2b,l1b|m1bm2b,d1b)
    ierr=exatns_tensor_contract("Z93_1(e1,e2,e3,l1,m1,m2,m3,m4)+=S44(e3,d1,m3,m4)*Z142_2(e1,e2,l1,m1,m2,d1)", &
        Z93_1,S44,Z142_2,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z142_2)
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S43(e1b|l1b)*Z93_1(e2be3be4b,l1b|m1bm2bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S43(e1,l1)*Z93_1(e2,e3,e4,l1,m1,m2,m3,m4)", &
        Z61,S43,Z93_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S43(e2b|l1b)*Z93_1(e1be3be4b,l1b|m1bm2bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S43(e2,l1)*Z93_1(e1,e3,e4,l1,m1,m2,m3,m4)", &
        Z61,S43,Z93_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S43(e3b|l1b)*Z93_1(e1be2be4b,l1b|m1bm2bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S43(e3,l1)*Z93_1(e1,e2,e4,l1,m1,m2,m3,m4)", &
        Z61,S43,Z93_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S43(e4b|l1b)*Z93_1(e1be2be3b,l1b|m1bm2bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S43(e4,l1)*Z93_1(e1,e2,e3,l1,m1,m2,m3,m4)", &
        Z61,S43,Z93_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z93_1)
    
    allocate(tens_id(6), tens_root(6))
    tens_id   = (/nvir_id,nvir_id,nocc_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root,nocc_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z142_2,"Z142_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z142_2,'ZERO')
!   original expression: Z142_2(e1be2b,l1b|m1bm2b,d1b)+=S45(e1be2b,d2b|m1bm2b,l2b)*H24(l1b,l2b|d1b,d2b)
    ierr=exatns_tensor_contract("Z142_2(e1,e2,l1,m1,m2,d1)+=S45(e1,e2,d2,m1,m2,l2)*H24(l1,l2,d1,d2)", &
        Z142_2,S45,H24,prefactor=(1.0d0,0.0d0))
    
    allocate(tens_id(8), tens_root(8))
    tens_id   = (/nvir_id,nvir_id,nvir_id,nocc_id,nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nvir_root,nvir_root,nocc_root,nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z93_1,"Z93_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z93_1,'ZERO')
!   original expression: Z93_1(e1be2be3b,l1b|m1bm2bm3bm4b)+=S44(e1b,d1b|m1bm2b)*Z142_2(e2be3b,l1b|m3bm4b,d1b)
    ierr=exatns_tensor_contract("Z93_1(e1,e2,e3,l1,m1,m2,m3,m4)+=S44(e1,d1,m1,m2)*Z142_2(e2,e3,l1,m3,m4,d1)", &
        Z93_1,S44,Z142_2,prefactor=(1.0d0,0.0d0))
!   original expression: Z93_1(e1be2be3b,l1b|m1bm2bm3bm4b)+=S44(e2b,d1b|m1bm2b)*Z142_2(e1be3b,l1b|m3bm4b,d1b)*-1.
    ierr=exatns_tensor_contract("Z93_1(e1,e2,e3,l1,m1,m2,m3,m4)+=S44(e2,d1,m1,m2)*Z142_2(e1,e3,l1,m3,m4,d1)", &
        Z93_1,S44,Z142_2,prefactor=(-1.0d0,0.0d0))
!   original expression: Z93_1(e1be2be3b,l1b|m1bm2bm3bm4b)+=S44(e3b,d1b|m1bm2b)*Z142_2(e1be2b,l1b|m3bm4b,d1b)
    ierr=exatns_tensor_contract("Z93_1(e1,e2,e3,l1,m1,m2,m3,m4)+=S44(e3,d1,m1,m2)*Z142_2(e1,e2,l1,m3,m4,d1)", &
        Z93_1,S44,Z142_2,prefactor=(1.0d0,0.0d0))
!   original expression: Z93_1(e1be2be3b,l1b|m1bm2bm3bm4b)+=S44(e1b,d1b|m1bm3b)*Z142_2(e2be3b,l1b|m2bm4b,d1b)*-1.
    ierr=exatns_tensor_contract("Z93_1(e1,e2,e3,l1,m1,m2,m3,m4)+=S44(e1,d1,m1,m3)*Z142_2(e2,e3,l1,m2,m4,d1)", &
        Z93_1,S44,Z142_2,prefactor=(-1.0d0,0.0d0))
!   original expression: Z93_1(e1be2be3b,l1b|m1bm2bm3bm4b)+=S44(e2b,d1b|m1bm3b)*Z142_2(e1be3b,l1b|m2bm4b,d1b)
    ierr=exatns_tensor_contract("Z93_1(e1,e2,e3,l1,m1,m2,m3,m4)+=S44(e2,d1,m1,m3)*Z142_2(e1,e3,l1,m2,m4,d1)", &
        Z93_1,S44,Z142_2,prefactor=(1.0d0,0.0d0))
!   original expression: Z93_1(e1be2be3b,l1b|m1bm2bm3bm4b)+=S44(e3b,d1b|m1bm3b)*Z142_2(e1be2b,l1b|m2bm4b,d1b)*-1.
    ierr=exatns_tensor_contract("Z93_1(e1,e2,e3,l1,m1,m2,m3,m4)+=S44(e3,d1,m1,m3)*Z142_2(e1,e2,l1,m2,m4,d1)", &
        Z93_1,S44,Z142_2,prefactor=(-1.0d0,0.0d0))
!   original expression: Z93_1(e1be2be3b,l1b|m1bm2bm3bm4b)+=S44(e1b,d1b|m1bm4b)*Z142_2(e2be3b,l1b|m2bm3b,d1b)
    ierr=exatns_tensor_contract("Z93_1(e1,e2,e3,l1,m1,m2,m3,m4)+=S44(e1,d1,m1,m4)*Z142_2(e2,e3,l1,m2,m3,d1)", &
        Z93_1,S44,Z142_2,prefactor=(1.0d0,0.0d0))
!   original expression: Z93_1(e1be2be3b,l1b|m1bm2bm3bm4b)+=S44(e2b,d1b|m1bm4b)*Z142_2(e1be3b,l1b|m2bm3b,d1b)*-1.
    ierr=exatns_tensor_contract("Z93_1(e1,e2,e3,l1,m1,m2,m3,m4)+=S44(e2,d1,m1,m4)*Z142_2(e1,e3,l1,m2,m3,d1)", &
        Z93_1,S44,Z142_2,prefactor=(-1.0d0,0.0d0))
!   original expression: Z93_1(e1be2be3b,l1b|m1bm2bm3bm4b)+=S44(e3b,d1b|m1bm4b)*Z142_2(e1be2b,l1b|m2bm3b,d1b)
    ierr=exatns_tensor_contract("Z93_1(e1,e2,e3,l1,m1,m2,m3,m4)+=S44(e3,d1,m1,m4)*Z142_2(e1,e2,l1,m2,m3,d1)", &
        Z93_1,S44,Z142_2,prefactor=(1.0d0,0.0d0))
!   original expression: Z93_1(e1be2be3b,l1b|m1bm2bm3bm4b)+=S44(e1b,d1b|m2bm3b)*Z142_2(e2be3b,l1b|m1bm4b,d1b)
    ierr=exatns_tensor_contract("Z93_1(e1,e2,e3,l1,m1,m2,m3,m4)+=S44(e1,d1,m2,m3)*Z142_2(e2,e3,l1,m1,m4,d1)", &
        Z93_1,S44,Z142_2,prefactor=(1.0d0,0.0d0))
!   original expression: Z93_1(e1be2be3b,l1b|m1bm2bm3bm4b)+=S44(e2b,d1b|m2bm3b)*Z142_2(e1be3b,l1b|m1bm4b,d1b)*-1.
    ierr=exatns_tensor_contract("Z93_1(e1,e2,e3,l1,m1,m2,m3,m4)+=S44(e2,d1,m2,m3)*Z142_2(e1,e3,l1,m1,m4,d1)", &
        Z93_1,S44,Z142_2,prefactor=(-1.0d0,0.0d0))
!   original expression: Z93_1(e1be2be3b,l1b|m1bm2bm3bm4b)+=S44(e3b,d1b|m2bm3b)*Z142_2(e1be2b,l1b|m1bm4b,d1b)
    ierr=exatns_tensor_contract("Z93_1(e1,e2,e3,l1,m1,m2,m3,m4)+=S44(e3,d1,m2,m3)*Z142_2(e1,e2,l1,m1,m4,d1)", &
        Z93_1,S44,Z142_2,prefactor=(1.0d0,0.0d0))
!   original expression: Z93_1(e1be2be3b,l1b|m1bm2bm3bm4b)+=S44(e1b,d1b|m2bm4b)*Z142_2(e2be3b,l1b|m1bm3b,d1b)*-1.
    ierr=exatns_tensor_contract("Z93_1(e1,e2,e3,l1,m1,m2,m3,m4)+=S44(e1,d1,m2,m4)*Z142_2(e2,e3,l1,m1,m3,d1)", &
        Z93_1,S44,Z142_2,prefactor=(-1.0d0,0.0d0))
!   original expression: Z93_1(e1be2be3b,l1b|m1bm2bm3bm4b)+=S44(e2b,d1b|m2bm4b)*Z142_2(e1be3b,l1b|m1bm3b,d1b)
    ierr=exatns_tensor_contract("Z93_1(e1,e2,e3,l1,m1,m2,m3,m4)+=S44(e2,d1,m2,m4)*Z142_2(e1,e3,l1,m1,m3,d1)", &
        Z93_1,S44,Z142_2,prefactor=(1.0d0,0.0d0))
!   original expression: Z93_1(e1be2be3b,l1b|m1bm2bm3bm4b)+=S44(e3b,d1b|m2bm4b)*Z142_2(e1be2b,l1b|m1bm3b,d1b)*-1.
    ierr=exatns_tensor_contract("Z93_1(e1,e2,e3,l1,m1,m2,m3,m4)+=S44(e3,d1,m2,m4)*Z142_2(e1,e2,l1,m1,m3,d1)", &
        Z93_1,S44,Z142_2,prefactor=(-1.0d0,0.0d0))
!   original expression: Z93_1(e1be2be3b,l1b|m1bm2bm3bm4b)+=S44(e1b,d1b|m3bm4b)*Z142_2(e2be3b,l1b|m1bm2b,d1b)
    ierr=exatns_tensor_contract("Z93_1(e1,e2,e3,l1,m1,m2,m3,m4)+=S44(e1,d1,m3,m4)*Z142_2(e2,e3,l1,m1,m2,d1)", &
        Z93_1,S44,Z142_2,prefactor=(1.0d0,0.0d0))
!   original expression: Z93_1(e1be2be3b,l1b|m1bm2bm3bm4b)+=S44(e2b,d1b|m3bm4b)*Z142_2(e1be3b,l1b|m1bm2b,d1b)*-1.
    ierr=exatns_tensor_contract("Z93_1(e1,e2,e3,l1,m1,m2,m3,m4)+=S44(e2,d1,m3,m4)*Z142_2(e1,e3,l1,m1,m2,d1)", &
        Z93_1,S44,Z142_2,prefactor=(-1.0d0,0.0d0))
!   original expression: Z93_1(e1be2be3b,l1b|m1bm2bm3bm4b)+=S44(e3b,d1b|m3bm4b)*Z142_2(e1be2b,l1b|m1bm2b,d1b)
    ierr=exatns_tensor_contract("Z93_1(e1,e2,e3,l1,m1,m2,m3,m4)+=S44(e3,d1,m3,m4)*Z142_2(e1,e2,l1,m1,m2,d1)", &
        Z93_1,S44,Z142_2,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z142_2)
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S43(e1b|l1b)*Z93_1(e2be3be4b,l1b|m1bm2bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S43(e1,l1)*Z93_1(e2,e3,e4,l1,m1,m2,m3,m4)", &
        Z61,S43,Z93_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S43(e2b|l1b)*Z93_1(e1be3be4b,l1b|m1bm2bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S43(e2,l1)*Z93_1(e1,e3,e4,l1,m1,m2,m3,m4)", &
        Z61,S43,Z93_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S43(e3b|l1b)*Z93_1(e1be2be4b,l1b|m1bm2bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S43(e3,l1)*Z93_1(e1,e2,e4,l1,m1,m2,m3,m4)", &
        Z61,S43,Z93_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S43(e4b|l1b)*Z93_1(e1be2be3b,l1b|m1bm2bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S43(e4,l1)*Z93_1(e1,e2,e3,l1,m1,m2,m3,m4)", &
        Z61,S43,Z93_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z93_1)
    
    allocate(tens_id(6), tens_root(6))
    tens_id   = (/nvir_id,nvir_id,nocc_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root,nocc_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z142_2,"Z142_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z142_2,'ZERO')
    
    allocate(tens_id(8), tens_root(8))
    tens_id   = (/nvir_id,nvir_id,nvir_id,nocc_id,nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nvir_root,nvir_root,nocc_root,nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z93_1,"Z93_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z93_1,'ZERO')
!   original expression: Z93_1(e1be2be3b,l1b|m1bm2bm3bm4b)+=S44(e1b,d1b|m1bm2b)*Z142_2(e2be3b,l1b|m3bm4b,d1b)
    ierr=exatns_tensor_contract("Z93_1(e1,e2,e3,l1,m1,m2,m3,m4)+=S44(e1,d1,m1,m2)*Z142_2(e2,e3,l1,m3,m4,d1)", &
        Z93_1,S44,Z142_2,prefactor=(1.0d0,0.0d0))
!   original expression: Z93_1(e1be2be3b,l1b|m1bm2bm3bm4b)+=S44(e2b,d1b|m1bm2b)*Z142_2(e1be3b,l1b|m3bm4b,d1b)*-1.
    ierr=exatns_tensor_contract("Z93_1(e1,e2,e3,l1,m1,m2,m3,m4)+=S44(e2,d1,m1,m2)*Z142_2(e1,e3,l1,m3,m4,d1)", &
        Z93_1,S44,Z142_2,prefactor=(-1.0d0,0.0d0))
!   original expression: Z93_1(e1be2be3b,l1b|m1bm2bm3bm4b)+=S44(e3b,d1b|m1bm2b)*Z142_2(e1be2b,l1b|m3bm4b,d1b)
    ierr=exatns_tensor_contract("Z93_1(e1,e2,e3,l1,m1,m2,m3,m4)+=S44(e3,d1,m1,m2)*Z142_2(e1,e2,l1,m3,m4,d1)", &
        Z93_1,S44,Z142_2,prefactor=(1.0d0,0.0d0))
!   original expression: Z93_1(e1be2be3b,l1b|m1bm2bm3bm4b)+=S44(e1b,d1b|m1bm3b)*Z142_2(e2be3b,l1b|m2bm4b,d1b)*-1.
    ierr=exatns_tensor_contract("Z93_1(e1,e2,e3,l1,m1,m2,m3,m4)+=S44(e1,d1,m1,m3)*Z142_2(e2,e3,l1,m2,m4,d1)", &
        Z93_1,S44,Z142_2,prefactor=(-1.0d0,0.0d0))
!   original expression: Z93_1(e1be2be3b,l1b|m1bm2bm3bm4b)+=S44(e2b,d1b|m1bm3b)*Z142_2(e1be3b,l1b|m2bm4b,d1b)
    ierr=exatns_tensor_contract("Z93_1(e1,e2,e3,l1,m1,m2,m3,m4)+=S44(e2,d1,m1,m3)*Z142_2(e1,e3,l1,m2,m4,d1)", &
        Z93_1,S44,Z142_2,prefactor=(1.0d0,0.0d0))
!   original expression: Z93_1(e1be2be3b,l1b|m1bm2bm3bm4b)+=S44(e3b,d1b|m1bm3b)*Z142_2(e1be2b,l1b|m2bm4b,d1b)*-1.
    ierr=exatns_tensor_contract("Z93_1(e1,e2,e3,l1,m1,m2,m3,m4)+=S44(e3,d1,m1,m3)*Z142_2(e1,e2,l1,m2,m4,d1)", &
        Z93_1,S44,Z142_2,prefactor=(-1.0d0,0.0d0))
!   original expression: Z93_1(e1be2be3b,l1b|m1bm2bm3bm4b)+=S44(e1b,d1b|m1bm4b)*Z142_2(e2be3b,l1b|m2bm3b,d1b)
    ierr=exatns_tensor_contract("Z93_1(e1,e2,e3,l1,m1,m2,m3,m4)+=S44(e1,d1,m1,m4)*Z142_2(e2,e3,l1,m2,m3,d1)", &
        Z93_1,S44,Z142_2,prefactor=(1.0d0,0.0d0))
!   original expression: Z93_1(e1be2be3b,l1b|m1bm2bm3bm4b)+=S44(e2b,d1b|m1bm4b)*Z142_2(e1be3b,l1b|m2bm3b,d1b)*-1.
    ierr=exatns_tensor_contract("Z93_1(e1,e2,e3,l1,m1,m2,m3,m4)+=S44(e2,d1,m1,m4)*Z142_2(e1,e3,l1,m2,m3,d1)", &
        Z93_1,S44,Z142_2,prefactor=(-1.0d0,0.0d0))
!   original expression: Z93_1(e1be2be3b,l1b|m1bm2bm3bm4b)+=S44(e3b,d1b|m1bm4b)*Z142_2(e1be2b,l1b|m2bm3b,d1b)
    ierr=exatns_tensor_contract("Z93_1(e1,e2,e3,l1,m1,m2,m3,m4)+=S44(e3,d1,m1,m4)*Z142_2(e1,e2,l1,m2,m3,d1)", &
        Z93_1,S44,Z142_2,prefactor=(1.0d0,0.0d0))
!   original expression: Z93_1(e1be2be3b,l1b|m1bm2bm3bm4b)+=S44(e1b,d1b|m2bm3b)*Z142_2(e2be3b,l1b|m1bm4b,d1b)
    ierr=exatns_tensor_contract("Z93_1(e1,e2,e3,l1,m1,m2,m3,m4)+=S44(e1,d1,m2,m3)*Z142_2(e2,e3,l1,m1,m4,d1)", &
        Z93_1,S44,Z142_2,prefactor=(1.0d0,0.0d0))
!   original expression: Z93_1(e1be2be3b,l1b|m1bm2bm3bm4b)+=S44(e2b,d1b|m2bm3b)*Z142_2(e1be3b,l1b|m1bm4b,d1b)*-1.
    ierr=exatns_tensor_contract("Z93_1(e1,e2,e3,l1,m1,m2,m3,m4)+=S44(e2,d1,m2,m3)*Z142_2(e1,e3,l1,m1,m4,d1)", &
        Z93_1,S44,Z142_2,prefactor=(-1.0d0,0.0d0))
!   original expression: Z93_1(e1be2be3b,l1b|m1bm2bm3bm4b)+=S44(e3b,d1b|m2bm3b)*Z142_2(e1be2b,l1b|m1bm4b,d1b)
    ierr=exatns_tensor_contract("Z93_1(e1,e2,e3,l1,m1,m2,m3,m4)+=S44(e3,d1,m2,m3)*Z142_2(e1,e2,l1,m1,m4,d1)", &
        Z93_1,S44,Z142_2,prefactor=(1.0d0,0.0d0))
!   original expression: Z93_1(e1be2be3b,l1b|m1bm2bm3bm4b)+=S44(e1b,d1b|m2bm4b)*Z142_2(e2be3b,l1b|m1bm3b,d1b)*-1.
    ierr=exatns_tensor_contract("Z93_1(e1,e2,e3,l1,m1,m2,m3,m4)+=S44(e1,d1,m2,m4)*Z142_2(e2,e3,l1,m1,m3,d1)", &
        Z93_1,S44,Z142_2,prefactor=(-1.0d0,0.0d0))
!   original expression: Z93_1(e1be2be3b,l1b|m1bm2bm3bm4b)+=S44(e2b,d1b|m2bm4b)*Z142_2(e1be3b,l1b|m1bm3b,d1b)
    ierr=exatns_tensor_contract("Z93_1(e1,e2,e3,l1,m1,m2,m3,m4)+=S44(e2,d1,m2,m4)*Z142_2(e1,e3,l1,m1,m3,d1)", &
        Z93_1,S44,Z142_2,prefactor=(1.0d0,0.0d0))
!   original expression: Z93_1(e1be2be3b,l1b|m1bm2bm3bm4b)+=S44(e3b,d1b|m2bm4b)*Z142_2(e1be2b,l1b|m1bm3b,d1b)*-1.
    ierr=exatns_tensor_contract("Z93_1(e1,e2,e3,l1,m1,m2,m3,m4)+=S44(e3,d1,m2,m4)*Z142_2(e1,e2,l1,m1,m3,d1)", &
        Z93_1,S44,Z142_2,prefactor=(-1.0d0,0.0d0))
!   original expression: Z93_1(e1be2be3b,l1b|m1bm2bm3bm4b)+=S44(e1b,d1b|m3bm4b)*Z142_2(e2be3b,l1b|m1bm2b,d1b)
    ierr=exatns_tensor_contract("Z93_1(e1,e2,e3,l1,m1,m2,m3,m4)+=S44(e1,d1,m3,m4)*Z142_2(e2,e3,l1,m1,m2,d1)", &
        Z93_1,S44,Z142_2,prefactor=(1.0d0,0.0d0))
!   original expression: Z93_1(e1be2be3b,l1b|m1bm2bm3bm4b)+=S44(e2b,d1b|m3bm4b)*Z142_2(e1be3b,l1b|m1bm2b,d1b)*-1.
    ierr=exatns_tensor_contract("Z93_1(e1,e2,e3,l1,m1,m2,m3,m4)+=S44(e2,d1,m3,m4)*Z142_2(e1,e3,l1,m1,m2,d1)", &
        Z93_1,S44,Z142_2,prefactor=(-1.0d0,0.0d0))
!   original expression: Z93_1(e1be2be3b,l1b|m1bm2bm3bm4b)+=S44(e3b,d1b|m3bm4b)*Z142_2(e1be2b,l1b|m1bm2b,d1b)
    ierr=exatns_tensor_contract("Z93_1(e1,e2,e3,l1,m1,m2,m3,m4)+=S44(e3,d1,m3,m4)*Z142_2(e1,e2,l1,m1,m2,d1)", &
        Z93_1,S44,Z142_2,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z142_2)
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S43(e1b|l1b)*Z93_1(e2be3be4b,l1b|m1bm2bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S43(e1,l1)*Z93_1(e2,e3,e4,l1,m1,m2,m3,m4)", &
        Z61,S43,Z93_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S43(e2b|l1b)*Z93_1(e1be3be4b,l1b|m1bm2bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S43(e2,l1)*Z93_1(e1,e3,e4,l1,m1,m2,m3,m4)", &
        Z61,S43,Z93_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S43(e3b|l1b)*Z93_1(e1be2be4b,l1b|m1bm2bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S43(e3,l1)*Z93_1(e1,e2,e4,l1,m1,m2,m3,m4)", &
        Z61,S43,Z93_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S43(e4b|l1b)*Z93_1(e1be2be3b,l1b|m1bm2bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S43(e4,l1)*Z93_1(e1,e2,e3,l1,m1,m2,m3,m4)", &
        Z61,S43,Z93_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z93_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z136_2,"Z136_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z136_2,'ZERO')
!   original expression: Z136_2(e1b,l1b|m1b,d1b)+=H17(e1b,l1b|d1b,d2b)*S43(d2b|m1b)
    ierr=exatns_tensor_contract("Z136_2(e1,l1,m1,d1)+=H17(e1,l1,d1,d2)*S43(d2,m1)", &
        Z136_2,H17,S43,prefactor=(1.0d0,0.0d0))
    
    allocate(tens_id(8), tens_root(8))
    tens_id   = (/nvir_id,nvir_id,nvir_id,nocc_id,nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nvir_root,nvir_root,nocc_root,nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z93_1,"Z93_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z93_1,'ZERO')
!   original expression: Z93_1(e1be2be3b,l1b|m1bm2bm3bm4b)+=S45(e1be2b,d1b|m1bm2bm3b)*Z136_2(e3b,l1b|m4b,d1b)
    ierr=exatns_tensor_contract("Z93_1(e1,e2,e3,l1,m1,m2,m3,m4)+=S45(e1,e2,d1,m1,m2,m3)*Z136_2(e3,l1,m4,d1)", &
        Z93_1,S45,Z136_2,prefactor=(1.0d0,0.0d0))
!   original expression: Z93_1(e1be2be3b,l1b|m1bm2bm3bm4b)+=S45(e1be3b,d1b|m1bm2bm3b)*Z136_2(e2b,l1b|m4b,d1b)*-1.
    ierr=exatns_tensor_contract("Z93_1(e1,e2,e3,l1,m1,m2,m3,m4)+=S45(e1,e3,d1,m1,m2,m3)*Z136_2(e2,l1,m4,d1)", &
        Z93_1,S45,Z136_2,prefactor=(-1.0d0,0.0d0))
!   original expression: Z93_1(e1be2be3b,l1b|m1bm2bm3bm4b)+=S45(e2be3b,d1b|m1bm2bm3b)*Z136_2(e1b,l1b|m4b,d1b)
    ierr=exatns_tensor_contract("Z93_1(e1,e2,e3,l1,m1,m2,m3,m4)+=S45(e2,e3,d1,m1,m2,m3)*Z136_2(e1,l1,m4,d1)", &
        Z93_1,S45,Z136_2,prefactor=(1.0d0,0.0d0))
!   original expression: Z93_1(e1be2be3b,l1b|m1bm2bm3bm4b)+=S45(e1be2b,d1b|m1bm2bm4b)*Z136_2(e3b,l1b|m3b,d1b)*-1.
    ierr=exatns_tensor_contract("Z93_1(e1,e2,e3,l1,m1,m2,m3,m4)+=S45(e1,e2,d1,m1,m2,m4)*Z136_2(e3,l1,m3,d1)", &
        Z93_1,S45,Z136_2,prefactor=(-1.0d0,0.0d0))
!   original expression: Z93_1(e1be2be3b,l1b|m1bm2bm3bm4b)+=S45(e1be3b,d1b|m1bm2bm4b)*Z136_2(e2b,l1b|m3b,d1b)
    ierr=exatns_tensor_contract("Z93_1(e1,e2,e3,l1,m1,m2,m3,m4)+=S45(e1,e3,d1,m1,m2,m4)*Z136_2(e2,l1,m3,d1)", &
        Z93_1,S45,Z136_2,prefactor=(1.0d0,0.0d0))
!   original expression: Z93_1(e1be2be3b,l1b|m1bm2bm3bm4b)+=S45(e2be3b,d1b|m1bm2bm4b)*Z136_2(e1b,l1b|m3b,d1b)*-1.
    ierr=exatns_tensor_contract("Z93_1(e1,e2,e3,l1,m1,m2,m3,m4)+=S45(e2,e3,d1,m1,m2,m4)*Z136_2(e1,l1,m3,d1)", &
        Z93_1,S45,Z136_2,prefactor=(-1.0d0,0.0d0))
!   original expression: Z93_1(e1be2be3b,l1b|m1bm2bm3bm4b)+=S45(e1be2b,d1b|m1bm3bm4b)*Z136_2(e3b,l1b|m2b,d1b)
    ierr=exatns_tensor_contract("Z93_1(e1,e2,e3,l1,m1,m2,m3,m4)+=S45(e1,e2,d1,m1,m3,m4)*Z136_2(e3,l1,m2,d1)", &
        Z93_1,S45,Z136_2,prefactor=(1.0d0,0.0d0))
!   original expression: Z93_1(e1be2be3b,l1b|m1bm2bm3bm4b)+=S45(e1be3b,d1b|m1bm3bm4b)*Z136_2(e2b,l1b|m2b,d1b)*-1.
    ierr=exatns_tensor_contract("Z93_1(e1,e2,e3,l1,m1,m2,m3,m4)+=S45(e1,e3,d1,m1,m3,m4)*Z136_2(e2,l1,m2,d1)", &
        Z93_1,S45,Z136_2,prefactor=(-1.0d0,0.0d0))
!   original expression: Z93_1(e1be2be3b,l1b|m1bm2bm3bm4b)+=S45(e2be3b,d1b|m1bm3bm4b)*Z136_2(e1b,l1b|m2b,d1b)
    ierr=exatns_tensor_contract("Z93_1(e1,e2,e3,l1,m1,m2,m3,m4)+=S45(e2,e3,d1,m1,m3,m4)*Z136_2(e1,l1,m2,d1)", &
        Z93_1,S45,Z136_2,prefactor=(1.0d0,0.0d0))
!   original expression: Z93_1(e1be2be3b,l1b|m1bm2bm3bm4b)+=S45(e1be2b,d1b|m2bm3bm4b)*Z136_2(e3b,l1b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z93_1(e1,e2,e3,l1,m1,m2,m3,m4)+=S45(e1,e2,d1,m2,m3,m4)*Z136_2(e3,l1,m1,d1)", &
        Z93_1,S45,Z136_2,prefactor=(-1.0d0,0.0d0))
!   original expression: Z93_1(e1be2be3b,l1b|m1bm2bm3bm4b)+=S45(e1be3b,d1b|m2bm3bm4b)*Z136_2(e2b,l1b|m1b,d1b)
    ierr=exatns_tensor_contract("Z93_1(e1,e2,e3,l1,m1,m2,m3,m4)+=S45(e1,e3,d1,m2,m3,m4)*Z136_2(e2,l1,m1,d1)", &
        Z93_1,S45,Z136_2,prefactor=(1.0d0,0.0d0))
!   original expression: Z93_1(e1be2be3b,l1b|m1bm2bm3bm4b)+=S45(e2be3b,d1b|m2bm3bm4b)*Z136_2(e1b,l1b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z93_1(e1,e2,e3,l1,m1,m2,m3,m4)+=S45(e2,e3,d1,m2,m3,m4)*Z136_2(e1,l1,m1,d1)", &
        Z93_1,S45,Z136_2,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z136_2)
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S43(e1b|l1b)*Z93_1(e2be3be4b,l1b|m1bm2bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S43(e1,l1)*Z93_1(e2,e3,e4,l1,m1,m2,m3,m4)", &
        Z61,S43,Z93_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S43(e2b|l1b)*Z93_1(e1be3be4b,l1b|m1bm2bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S43(e2,l1)*Z93_1(e1,e3,e4,l1,m1,m2,m3,m4)", &
        Z61,S43,Z93_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S43(e3b|l1b)*Z93_1(e1be2be4b,l1b|m1bm2bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S43(e3,l1)*Z93_1(e1,e2,e4,l1,m1,m2,m3,m4)", &
        Z61,S43,Z93_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S43(e4b|l1b)*Z93_1(e1be2be3b,l1b|m1bm2bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S43(e4,l1)*Z93_1(e1,e2,e3,l1,m1,m2,m3,m4)", &
        Z61,S43,Z93_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z93_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z136_2,"Z136_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z136_2,'ZERO')
!   original expression: Z136_2(e1b,l1b|m1b,d1b)+=S44(e1b,d2b|m1b,l2b)*H24(l1b,l2b|d1b,d2b)*-1.
    ierr=exatns_tensor_contract("Z136_2(e1,l1,m1,d1)+=S44(e1,d2,m1,l2)*H24(l1,l2,d1,d2)", &
        Z136_2,S44,H24,prefactor=(-1.0d0,0.0d0))
    
    allocate(tens_id(8), tens_root(8))
    tens_id   = (/nvir_id,nvir_id,nvir_id,nocc_id,nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nvir_root,nvir_root,nocc_root,nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z93_1,"Z93_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z93_1,'ZERO')
!   original expression: Z93_1(e1be2be3b,l1b|m1bm2bm3bm4b)+=S45(e1be2b,d1b|m1bm2bm3b)*Z136_2(e3b,l1b|m4b,d1b)
    ierr=exatns_tensor_contract("Z93_1(e1,e2,e3,l1,m1,m2,m3,m4)+=S45(e1,e2,d1,m1,m2,m3)*Z136_2(e3,l1,m4,d1)", &
        Z93_1,S45,Z136_2,prefactor=(1.0d0,0.0d0))
!   original expression: Z93_1(e1be2be3b,l1b|m1bm2bm3bm4b)+=S45(e1be3b,d1b|m1bm2bm3b)*Z136_2(e2b,l1b|m4b,d1b)*-1.
    ierr=exatns_tensor_contract("Z93_1(e1,e2,e3,l1,m1,m2,m3,m4)+=S45(e1,e3,d1,m1,m2,m3)*Z136_2(e2,l1,m4,d1)", &
        Z93_1,S45,Z136_2,prefactor=(-1.0d0,0.0d0))
!   original expression: Z93_1(e1be2be3b,l1b|m1bm2bm3bm4b)+=S45(e2be3b,d1b|m1bm2bm3b)*Z136_2(e1b,l1b|m4b,d1b)
    ierr=exatns_tensor_contract("Z93_1(e1,e2,e3,l1,m1,m2,m3,m4)+=S45(e2,e3,d1,m1,m2,m3)*Z136_2(e1,l1,m4,d1)", &
        Z93_1,S45,Z136_2,prefactor=(1.0d0,0.0d0))
!   original expression: Z93_1(e1be2be3b,l1b|m1bm2bm3bm4b)+=S45(e1be2b,d1b|m1bm2bm4b)*Z136_2(e3b,l1b|m3b,d1b)*-1.
    ierr=exatns_tensor_contract("Z93_1(e1,e2,e3,l1,m1,m2,m3,m4)+=S45(e1,e2,d1,m1,m2,m4)*Z136_2(e3,l1,m3,d1)", &
        Z93_1,S45,Z136_2,prefactor=(-1.0d0,0.0d0))
!   original expression: Z93_1(e1be2be3b,l1b|m1bm2bm3bm4b)+=S45(e1be3b,d1b|m1bm2bm4b)*Z136_2(e2b,l1b|m3b,d1b)
    ierr=exatns_tensor_contract("Z93_1(e1,e2,e3,l1,m1,m2,m3,m4)+=S45(e1,e3,d1,m1,m2,m4)*Z136_2(e2,l1,m3,d1)", &
        Z93_1,S45,Z136_2,prefactor=(1.0d0,0.0d0))
!   original expression: Z93_1(e1be2be3b,l1b|m1bm2bm3bm4b)+=S45(e2be3b,d1b|m1bm2bm4b)*Z136_2(e1b,l1b|m3b,d1b)*-1.
    ierr=exatns_tensor_contract("Z93_1(e1,e2,e3,l1,m1,m2,m3,m4)+=S45(e2,e3,d1,m1,m2,m4)*Z136_2(e1,l1,m3,d1)", &
        Z93_1,S45,Z136_2,prefactor=(-1.0d0,0.0d0))
!   original expression: Z93_1(e1be2be3b,l1b|m1bm2bm3bm4b)+=S45(e1be2b,d1b|m1bm3bm4b)*Z136_2(e3b,l1b|m2b,d1b)
    ierr=exatns_tensor_contract("Z93_1(e1,e2,e3,l1,m1,m2,m3,m4)+=S45(e1,e2,d1,m1,m3,m4)*Z136_2(e3,l1,m2,d1)", &
        Z93_1,S45,Z136_2,prefactor=(1.0d0,0.0d0))
!   original expression: Z93_1(e1be2be3b,l1b|m1bm2bm3bm4b)+=S45(e1be3b,d1b|m1bm3bm4b)*Z136_2(e2b,l1b|m2b,d1b)*-1.
    ierr=exatns_tensor_contract("Z93_1(e1,e2,e3,l1,m1,m2,m3,m4)+=S45(e1,e3,d1,m1,m3,m4)*Z136_2(e2,l1,m2,d1)", &
        Z93_1,S45,Z136_2,prefactor=(-1.0d0,0.0d0))
!   original expression: Z93_1(e1be2be3b,l1b|m1bm2bm3bm4b)+=S45(e2be3b,d1b|m1bm3bm4b)*Z136_2(e1b,l1b|m2b,d1b)
    ierr=exatns_tensor_contract("Z93_1(e1,e2,e3,l1,m1,m2,m3,m4)+=S45(e2,e3,d1,m1,m3,m4)*Z136_2(e1,l1,m2,d1)", &
        Z93_1,S45,Z136_2,prefactor=(1.0d0,0.0d0))
!   original expression: Z93_1(e1be2be3b,l1b|m1bm2bm3bm4b)+=S45(e1be2b,d1b|m2bm3bm4b)*Z136_2(e3b,l1b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z93_1(e1,e2,e3,l1,m1,m2,m3,m4)+=S45(e1,e2,d1,m2,m3,m4)*Z136_2(e3,l1,m1,d1)", &
        Z93_1,S45,Z136_2,prefactor=(-1.0d0,0.0d0))
!   original expression: Z93_1(e1be2be3b,l1b|m1bm2bm3bm4b)+=S45(e1be3b,d1b|m2bm3bm4b)*Z136_2(e2b,l1b|m1b,d1b)
    ierr=exatns_tensor_contract("Z93_1(e1,e2,e3,l1,m1,m2,m3,m4)+=S45(e1,e3,d1,m2,m3,m4)*Z136_2(e2,l1,m1,d1)", &
        Z93_1,S45,Z136_2,prefactor=(1.0d0,0.0d0))
!   original expression: Z93_1(e1be2be3b,l1b|m1bm2bm3bm4b)+=S45(e2be3b,d1b|m2bm3bm4b)*Z136_2(e1b,l1b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z93_1(e1,e2,e3,l1,m1,m2,m3,m4)+=S45(e2,e3,d1,m2,m3,m4)*Z136_2(e1,l1,m1,d1)", &
        Z93_1,S45,Z136_2,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z136_2)
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S43(e1b|l1b)*Z93_1(e2be3be4b,l1b|m1bm2bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S43(e1,l1)*Z93_1(e2,e3,e4,l1,m1,m2,m3,m4)", &
        Z61,S43,Z93_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S43(e2b|l1b)*Z93_1(e1be3be4b,l1b|m1bm2bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S43(e2,l1)*Z93_1(e1,e3,e4,l1,m1,m2,m3,m4)", &
        Z61,S43,Z93_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S43(e3b|l1b)*Z93_1(e1be2be4b,l1b|m1bm2bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S43(e3,l1)*Z93_1(e1,e2,e4,l1,m1,m2,m3,m4)", &
        Z61,S43,Z93_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S43(e4b|l1b)*Z93_1(e1be2be3b,l1b|m1bm2bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S43(e4,l1)*Z93_1(e1,e2,e3,l1,m1,m2,m3,m4)", &
        Z61,S43,Z93_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z93_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z136_2,"Z136_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z136_2,'ZERO')
    
    allocate(tens_id(8), tens_root(8))
    tens_id   = (/nvir_id,nvir_id,nvir_id,nocc_id,nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nvir_root,nvir_root,nocc_root,nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z93_1,"Z93_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z93_1,'ZERO')
!   original expression: Z93_1(e1be2be3b,l1b|m1bm2bm3bm4b)+=S45(e1be2b,d1b|m1bm2bm3b)*Z136_2(e3b,l1b|m4b,d1b)
    ierr=exatns_tensor_contract("Z93_1(e1,e2,e3,l1,m1,m2,m3,m4)+=S45(e1,e2,d1,m1,m2,m3)*Z136_2(e3,l1,m4,d1)", &
        Z93_1,S45,Z136_2,prefactor=(1.0d0,0.0d0))
!   original expression: Z93_1(e1be2be3b,l1b|m1bm2bm3bm4b)+=S45(e1be3b,d1b|m1bm2bm3b)*Z136_2(e2b,l1b|m4b,d1b)*-1.
    ierr=exatns_tensor_contract("Z93_1(e1,e2,e3,l1,m1,m2,m3,m4)+=S45(e1,e3,d1,m1,m2,m3)*Z136_2(e2,l1,m4,d1)", &
        Z93_1,S45,Z136_2,prefactor=(-1.0d0,0.0d0))
!   original expression: Z93_1(e1be2be3b,l1b|m1bm2bm3bm4b)+=S45(e2be3b,d1b|m1bm2bm3b)*Z136_2(e1b,l1b|m4b,d1b)
    ierr=exatns_tensor_contract("Z93_1(e1,e2,e3,l1,m1,m2,m3,m4)+=S45(e2,e3,d1,m1,m2,m3)*Z136_2(e1,l1,m4,d1)", &
        Z93_1,S45,Z136_2,prefactor=(1.0d0,0.0d0))
!   original expression: Z93_1(e1be2be3b,l1b|m1bm2bm3bm4b)+=S45(e1be2b,d1b|m1bm2bm4b)*Z136_2(e3b,l1b|m3b,d1b)*-1.
    ierr=exatns_tensor_contract("Z93_1(e1,e2,e3,l1,m1,m2,m3,m4)+=S45(e1,e2,d1,m1,m2,m4)*Z136_2(e3,l1,m3,d1)", &
        Z93_1,S45,Z136_2,prefactor=(-1.0d0,0.0d0))
!   original expression: Z93_1(e1be2be3b,l1b|m1bm2bm3bm4b)+=S45(e1be3b,d1b|m1bm2bm4b)*Z136_2(e2b,l1b|m3b,d1b)
    ierr=exatns_tensor_contract("Z93_1(e1,e2,e3,l1,m1,m2,m3,m4)+=S45(e1,e3,d1,m1,m2,m4)*Z136_2(e2,l1,m3,d1)", &
        Z93_1,S45,Z136_2,prefactor=(1.0d0,0.0d0))
!   original expression: Z93_1(e1be2be3b,l1b|m1bm2bm3bm4b)+=S45(e2be3b,d1b|m1bm2bm4b)*Z136_2(e1b,l1b|m3b,d1b)*-1.
    ierr=exatns_tensor_contract("Z93_1(e1,e2,e3,l1,m1,m2,m3,m4)+=S45(e2,e3,d1,m1,m2,m4)*Z136_2(e1,l1,m3,d1)", &
        Z93_1,S45,Z136_2,prefactor=(-1.0d0,0.0d0))
!   original expression: Z93_1(e1be2be3b,l1b|m1bm2bm3bm4b)+=S45(e1be2b,d1b|m1bm3bm4b)*Z136_2(e3b,l1b|m2b,d1b)
    ierr=exatns_tensor_contract("Z93_1(e1,e2,e3,l1,m1,m2,m3,m4)+=S45(e1,e2,d1,m1,m3,m4)*Z136_2(e3,l1,m2,d1)", &
        Z93_1,S45,Z136_2,prefactor=(1.0d0,0.0d0))
!   original expression: Z93_1(e1be2be3b,l1b|m1bm2bm3bm4b)+=S45(e1be3b,d1b|m1bm3bm4b)*Z136_2(e2b,l1b|m2b,d1b)*-1.
    ierr=exatns_tensor_contract("Z93_1(e1,e2,e3,l1,m1,m2,m3,m4)+=S45(e1,e3,d1,m1,m3,m4)*Z136_2(e2,l1,m2,d1)", &
        Z93_1,S45,Z136_2,prefactor=(-1.0d0,0.0d0))
!   original expression: Z93_1(e1be2be3b,l1b|m1bm2bm3bm4b)+=S45(e2be3b,d1b|m1bm3bm4b)*Z136_2(e1b,l1b|m2b,d1b)
    ierr=exatns_tensor_contract("Z93_1(e1,e2,e3,l1,m1,m2,m3,m4)+=S45(e2,e3,d1,m1,m3,m4)*Z136_2(e1,l1,m2,d1)", &
        Z93_1,S45,Z136_2,prefactor=(1.0d0,0.0d0))
!   original expression: Z93_1(e1be2be3b,l1b|m1bm2bm3bm4b)+=S45(e1be2b,d1b|m2bm3bm4b)*Z136_2(e3b,l1b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z93_1(e1,e2,e3,l1,m1,m2,m3,m4)+=S45(e1,e2,d1,m2,m3,m4)*Z136_2(e3,l1,m1,d1)", &
        Z93_1,S45,Z136_2,prefactor=(-1.0d0,0.0d0))
!   original expression: Z93_1(e1be2be3b,l1b|m1bm2bm3bm4b)+=S45(e1be3b,d1b|m2bm3bm4b)*Z136_2(e2b,l1b|m1b,d1b)
    ierr=exatns_tensor_contract("Z93_1(e1,e2,e3,l1,m1,m2,m3,m4)+=S45(e1,e3,d1,m2,m3,m4)*Z136_2(e2,l1,m1,d1)", &
        Z93_1,S45,Z136_2,prefactor=(1.0d0,0.0d0))
!   original expression: Z93_1(e1be2be3b,l1b|m1bm2bm3bm4b)+=S45(e2be3b,d1b|m2bm3bm4b)*Z136_2(e1b,l1b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z93_1(e1,e2,e3,l1,m1,m2,m3,m4)+=S45(e2,e3,d1,m2,m3,m4)*Z136_2(e1,l1,m1,d1)", &
        Z93_1,S45,Z136_2,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z136_2)
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S43(e1b|l1b)*Z93_1(e2be3be4b,l1b|m1bm2bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S43(e1,l1)*Z93_1(e2,e3,e4,l1,m1,m2,m3,m4)", &
        Z61,S43,Z93_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S43(e2b|l1b)*Z93_1(e1be3be4b,l1b|m1bm2bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S43(e2,l1)*Z93_1(e1,e3,e4,l1,m1,m2,m3,m4)", &
        Z61,S43,Z93_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S43(e3b|l1b)*Z93_1(e1be2be4b,l1b|m1bm2bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S43(e3,l1)*Z93_1(e1,e2,e4,l1,m1,m2,m3,m4)", &
        Z61,S43,Z93_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S43(e4b|l1b)*Z93_1(e1be2be3b,l1b|m1bm2bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S43(e4,l1)*Z93_1(e1,e2,e3,l1,m1,m2,m3,m4)", &
        Z61,S43,Z93_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z93_1)
    
    allocate(tens_id(8), tens_root(8))
    tens_id   = (/nvir_id,nvir_id,nvir_id,nocc_id,nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nvir_root,nvir_root,nocc_root,nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z93_1,"Z93_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z93_1,'ZERO')
!   original expression: Z93_1(e1be2be3b,l1b|m1bm2bm3bm4b)+=S45(e1be2b,d1b|m1bm2bm3b)*H18(e3b,l1b|m4b,d1b)*-1.
    ierr=exatns_tensor_contract("Z93_1(e1,e2,e3,l1,m1,m2,m3,m4)+=S45(e1,e2,d1,m1,m2,m3)*H18(e3,l1,m4,d1)", &
        Z93_1,S45,H18,prefactor=(-1.0d0,0.0d0))
!   original expression: Z93_1(e1be2be3b,l1b|m1bm2bm3bm4b)+=S45(e1be3b,d1b|m1bm2bm3b)*H18(e2b,l1b|m4b,d1b)
    ierr=exatns_tensor_contract("Z93_1(e1,e2,e3,l1,m1,m2,m3,m4)+=S45(e1,e3,d1,m1,m2,m3)*H18(e2,l1,m4,d1)", &
        Z93_1,S45,H18,prefactor=(1.0d0,0.0d0))
!   original expression: Z93_1(e1be2be3b,l1b|m1bm2bm3bm4b)+=S45(e2be3b,d1b|m1bm2bm3b)*H18(e1b,l1b|m4b,d1b)*-1.
    ierr=exatns_tensor_contract("Z93_1(e1,e2,e3,l1,m1,m2,m3,m4)+=S45(e2,e3,d1,m1,m2,m3)*H18(e1,l1,m4,d1)", &
        Z93_1,S45,H18,prefactor=(-1.0d0,0.0d0))
!   original expression: Z93_1(e1be2be3b,l1b|m1bm2bm3bm4b)+=S45(e1be2b,d1b|m1bm2bm4b)*H18(e3b,l1b|m3b,d1b)
    ierr=exatns_tensor_contract("Z93_1(e1,e2,e3,l1,m1,m2,m3,m4)+=S45(e1,e2,d1,m1,m2,m4)*H18(e3,l1,m3,d1)", &
        Z93_1,S45,H18,prefactor=(1.0d0,0.0d0))
!   original expression: Z93_1(e1be2be3b,l1b|m1bm2bm3bm4b)+=S45(e1be3b,d1b|m1bm2bm4b)*H18(e2b,l1b|m3b,d1b)*-1.
    ierr=exatns_tensor_contract("Z93_1(e1,e2,e3,l1,m1,m2,m3,m4)+=S45(e1,e3,d1,m1,m2,m4)*H18(e2,l1,m3,d1)", &
        Z93_1,S45,H18,prefactor=(-1.0d0,0.0d0))
!   original expression: Z93_1(e1be2be3b,l1b|m1bm2bm3bm4b)+=S45(e2be3b,d1b|m1bm2bm4b)*H18(e1b,l1b|m3b,d1b)
    ierr=exatns_tensor_contract("Z93_1(e1,e2,e3,l1,m1,m2,m3,m4)+=S45(e2,e3,d1,m1,m2,m4)*H18(e1,l1,m3,d1)", &
        Z93_1,S45,H18,prefactor=(1.0d0,0.0d0))
!   original expression: Z93_1(e1be2be3b,l1b|m1bm2bm3bm4b)+=S45(e1be2b,d1b|m1bm3bm4b)*H18(e3b,l1b|m2b,d1b)*-1.
    ierr=exatns_tensor_contract("Z93_1(e1,e2,e3,l1,m1,m2,m3,m4)+=S45(e1,e2,d1,m1,m3,m4)*H18(e3,l1,m2,d1)", &
        Z93_1,S45,H18,prefactor=(-1.0d0,0.0d0))
!   original expression: Z93_1(e1be2be3b,l1b|m1bm2bm3bm4b)+=S45(e1be3b,d1b|m1bm3bm4b)*H18(e2b,l1b|m2b,d1b)
    ierr=exatns_tensor_contract("Z93_1(e1,e2,e3,l1,m1,m2,m3,m4)+=S45(e1,e3,d1,m1,m3,m4)*H18(e2,l1,m2,d1)", &
        Z93_1,S45,H18,prefactor=(1.0d0,0.0d0))
!   original expression: Z93_1(e1be2be3b,l1b|m1bm2bm3bm4b)+=S45(e2be3b,d1b|m1bm3bm4b)*H18(e1b,l1b|m2b,d1b)*-1.
    ierr=exatns_tensor_contract("Z93_1(e1,e2,e3,l1,m1,m2,m3,m4)+=S45(e2,e3,d1,m1,m3,m4)*H18(e1,l1,m2,d1)", &
        Z93_1,S45,H18,prefactor=(-1.0d0,0.0d0))
!   original expression: Z93_1(e1be2be3b,l1b|m1bm2bm3bm4b)+=S45(e1be2b,d1b|m2bm3bm4b)*H18(e3b,l1b|m1b,d1b)
    ierr=exatns_tensor_contract("Z93_1(e1,e2,e3,l1,m1,m2,m3,m4)+=S45(e1,e2,d1,m2,m3,m4)*H18(e3,l1,m1,d1)", &
        Z93_1,S45,H18,prefactor=(1.0d0,0.0d0))
!   original expression: Z93_1(e1be2be3b,l1b|m1bm2bm3bm4b)+=S45(e1be3b,d1b|m2bm3bm4b)*H18(e2b,l1b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z93_1(e1,e2,e3,l1,m1,m2,m3,m4)+=S45(e1,e3,d1,m2,m3,m4)*H18(e2,l1,m1,d1)", &
        Z93_1,S45,H18,prefactor=(-1.0d0,0.0d0))
!   original expression: Z93_1(e1be2be3b,l1b|m1bm2bm3bm4b)+=S45(e2be3b,d1b|m2bm3bm4b)*H18(e1b,l1b|m1b,d1b)
    ierr=exatns_tensor_contract("Z93_1(e1,e2,e3,l1,m1,m2,m3,m4)+=S45(e2,e3,d1,m2,m3,m4)*H18(e1,l1,m1,d1)", &
        Z93_1,S45,H18,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S43(e1b|l1b)*Z93_1(e2be3be4b,l1b|m1bm2bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S43(e1,l1)*Z93_1(e2,e3,e4,l1,m1,m2,m3,m4)", &
        Z61,S43,Z93_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S43(e2b|l1b)*Z93_1(e1be3be4b,l1b|m1bm2bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S43(e2,l1)*Z93_1(e1,e3,e4,l1,m1,m2,m3,m4)", &
        Z61,S43,Z93_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S43(e3b|l1b)*Z93_1(e1be2be4b,l1b|m1bm2bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S43(e3,l1)*Z93_1(e1,e2,e4,l1,m1,m2,m3,m4)", &
        Z61,S43,Z93_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S43(e4b|l1b)*Z93_1(e1be2be3b,l1b|m1bm2bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S43(e4,l1)*Z93_1(e1,e2,e3,l1,m1,m2,m3,m4)", &
        Z61,S43,Z93_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z93_1)
    
    allocate(tens_id(8), tens_root(8))
    tens_id   = (/nvir_id,nvir_id,nvir_id,nocc_id,nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nvir_root,nvir_root,nocc_root,nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z93_1,"Z93_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z93_1,'ZERO')
!   original expression: Z93_1(e1be2be3b,l1b|m1bm2bm3bm4b)+=S46(e1be2b,d1bd2b|m1bm2bm3bm4b)*H17(e3b,l1b|d1bd2b)
    ierr=exatns_tensor_contract("Z93_1(e1,e2,e3,l1,m1,m2,m3,m4)+=S46(e1,e2,d1,d2,m1,m2,m3,m4)*H17(e3,l1,d1,d2)", &
        Z93_1,S46,H17,prefactor=(0.5d0,0.0d0))
!   original expression: Z93_1(e1be2be3b,l1b|m1bm2bm3bm4b)+=S46(e1be3b,d1bd2b|m1bm2bm3bm4b)*H17(e2b,l1b|d1bd2b)*-1.
    ierr=exatns_tensor_contract("Z93_1(e1,e2,e3,l1,m1,m2,m3,m4)+=S46(e1,e3,d1,d2,m1,m2,m3,m4)*H17(e2,l1,d1,d2)", &
        Z93_1,S46,H17,prefactor=(-0.5d0,0.0d0))
!   original expression: Z93_1(e1be2be3b,l1b|m1bm2bm3bm4b)+=S46(e2be3b,d1bd2b|m1bm2bm3bm4b)*H17(e1b,l1b|d1bd2b)
    ierr=exatns_tensor_contract("Z93_1(e1,e2,e3,l1,m1,m2,m3,m4)+=S46(e2,e3,d1,d2,m1,m2,m3,m4)*H17(e1,l1,d1,d2)", &
        Z93_1,S46,H17,prefactor=(0.5d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S43(e1b|l1b)*Z93_1(e2be3be4b,l1b|m1bm2bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S43(e1,l1)*Z93_1(e2,e3,e4,l1,m1,m2,m3,m4)", &
        Z61,S43,Z93_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S43(e2b|l1b)*Z93_1(e1be3be4b,l1b|m1bm2bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S43(e2,l1)*Z93_1(e1,e3,e4,l1,m1,m2,m3,m4)", &
        Z61,S43,Z93_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S43(e3b|l1b)*Z93_1(e1be2be4b,l1b|m1bm2bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S43(e3,l1)*Z93_1(e1,e2,e4,l1,m1,m2,m3,m4)", &
        Z61,S43,Z93_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S43(e4b|l1b)*Z93_1(e1be2be3b,l1b|m1bm2bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S43(e4,l1)*Z93_1(e1,e2,e3,l1,m1,m2,m3,m4)", &
        Z61,S43,Z93_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z93_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nvir_id/)
    tens_root = (/nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z75_2,"Z75_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z75_2,'ZERO')
!   original expression: Z75_2(l1b|d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|l2b)
    ierr=exatns_tensor_contract("Z75_2(l1,d1)+=H24(l1,l2,d1,d2)*S43(d2,l2)", &
        Z75_2,H24,S43,prefactor=(1.0d0,0.0d0))
    
    allocate(tens_id(8), tens_root(8))
    tens_id   = (/nvir_id,nvir_id,nvir_id,nocc_id,nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nvir_root,nvir_root,nocc_root,nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z93_1,"Z93_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z93_1,'ZERO')
!   original expression: Z93_1(e1be2be3b,l1b|m1bm2bm3bm4b)+=S46(e1be2be3b,d1b|m1bm2bm3bm4b)*Z75_2(l1b|d1b)
    ierr=exatns_tensor_contract("Z93_1(e1,e2,e3,l1,m1,m2,m3,m4)+=S46(e1,e2,e3,d1,m1,m2,m3,m4)*Z75_2(l1,d1)", &
        Z93_1,S46,Z75_2,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z75_2)
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S43(e1b|l1b)*Z93_1(e2be3be4b,l1b|m1bm2bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S43(e1,l1)*Z93_1(e2,e3,e4,l1,m1,m2,m3,m4)", &
        Z61,S43,Z93_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S43(e2b|l1b)*Z93_1(e1be3be4b,l1b|m1bm2bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S43(e2,l1)*Z93_1(e1,e3,e4,l1,m1,m2,m3,m4)", &
        Z61,S43,Z93_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S43(e3b|l1b)*Z93_1(e1be2be4b,l1b|m1bm2bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S43(e3,l1)*Z93_1(e1,e2,e4,l1,m1,m2,m3,m4)", &
        Z61,S43,Z93_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S43(e4b|l1b)*Z93_1(e1be2be3b,l1b|m1bm2bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S43(e4,l1)*Z93_1(e1,e2,e3,l1,m1,m2,m3,m4)", &
        Z61,S43,Z93_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z93_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nvir_id/)
    tens_root = (/nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z75_2,"Z75_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z75_2,'ZERO')
    
    allocate(tens_id(8), tens_root(8))
    tens_id   = (/nvir_id,nvir_id,nvir_id,nocc_id,nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nvir_root,nvir_root,nocc_root,nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z93_1,"Z93_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z93_1,'ZERO')
!   original expression: Z93_1(e1be2be3b,l1b|m1bm2bm3bm4b)+=S46(e1be2be3b,d1b|m1bm2bm3bm4b)*Z75_2(l1b|d1b)
    ierr=exatns_tensor_contract("Z93_1(e1,e2,e3,l1,m1,m2,m3,m4)+=S46(e1,e2,e3,d1,m1,m2,m3,m4)*Z75_2(l1,d1)", &
        Z93_1,S46,Z75_2,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z75_2)
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S43(e1b|l1b)*Z93_1(e2be3be4b,l1b|m1bm2bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S43(e1,l1)*Z93_1(e2,e3,e4,l1,m1,m2,m3,m4)", &
        Z61,S43,Z93_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S43(e2b|l1b)*Z93_1(e1be3be4b,l1b|m1bm2bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S43(e2,l1)*Z93_1(e1,e3,e4,l1,m1,m2,m3,m4)", &
        Z61,S43,Z93_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S43(e3b|l1b)*Z93_1(e1be2be4b,l1b|m1bm2bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S43(e3,l1)*Z93_1(e1,e2,e4,l1,m1,m2,m3,m4)", &
        Z61,S43,Z93_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S43(e4b|l1b)*Z93_1(e1be2be3b,l1b|m1bm2bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S43(e4,l1)*Z93_1(e1,e2,e3,l1,m1,m2,m3,m4)", &
        Z61,S43,Z93_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z93_1)
    
    allocate(tens_id(8), tens_root(8))
    tens_id   = (/nvir_id,nvir_id,nvir_id,nocc_id,nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nvir_root,nvir_root,nocc_root,nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z93_1,"Z93_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z93_1,'ZERO')
!   original expression: Z93_1(e1be2be3b,l1b|m1bm2bm3bm4b)+=S46(e1be2be3b,d1b|m1bm2bm3bm4b)*H15(l1b|d1b)
    ierr=exatns_tensor_contract("Z93_1(e1,e2,e3,l1,m1,m2,m3,m4)+=S46(e1,e2,e3,d1,m1,m2,m3,m4)*H15(l1,d1)", &
        Z93_1,S46,H15,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S43(e1b|l1b)*Z93_1(e2be3be4b,l1b|m1bm2bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S43(e1,l1)*Z93_1(e2,e3,e4,l1,m1,m2,m3,m4)", &
        Z61,S43,Z93_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S43(e2b|l1b)*Z93_1(e1be3be4b,l1b|m1bm2bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S43(e2,l1)*Z93_1(e1,e3,e4,l1,m1,m2,m3,m4)", &
        Z61,S43,Z93_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S43(e3b|l1b)*Z93_1(e1be2be4b,l1b|m1bm2bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S43(e3,l1)*Z93_1(e1,e2,e4,l1,m1,m2,m3,m4)", &
        Z61,S43,Z93_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S43(e4b|l1b)*Z93_1(e1be2be3b,l1b|m1bm2bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S43(e4,l1)*Z93_1(e1,e2,e3,l1,m1,m2,m3,m4)", &
        Z61,S43,Z93_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z93_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z165_2,"Z165_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z165_2,'ZERO')
!   original expression: Z165_2(l1b,l2b|m1b,d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|m1b)*-1.
    ierr=exatns_tensor_contract("Z165_2(l1,l2,m1,d1)+=H24(l1,l2,d1,d2)*S43(d2,m1)", &
        Z165_2,H24,S43,prefactor=(-1.0d0,0.0d0))
    
    allocate(tens_id(8), tens_root(8))
    tens_id   = (/nvir_id,nvir_id,nvir_id,nocc_id,nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nvir_root,nvir_root,nocc_root,nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z93_1,"Z93_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z93_1,'ZERO')
!   original expression: Z93_1(e1be2be3b,l1b|m1bm2bm3bm4b)+=S46(e1be2be3b,d1b|m1bm2bm3b,l2b)*Z165_2(l1b,l2b|m4b,d1b)
    ierr=exatns_tensor_contract("Z93_1(e1,e2,e3,l1,m1,m2,m3,m4)+=S46(e1,e2,e3,d1,m1,m2,m3,l2)*Z165_2(l1,l2,m4,d1)", &
        Z93_1,S46,Z165_2,prefactor=(1.0d0,0.0d0))
!   original expression: Z93_1(e1be2be3b,l1b|m1bm2bm3bm4b)+=S46(e1be2be3b,d1b|m1bm2bm4b,l2b)*Z165_2(l1b,l2b|m3b,d1b)*-1.
    ierr=exatns_tensor_contract("Z93_1(e1,e2,e3,l1,m1,m2,m3,m4)+=S46(e1,e2,e3,d1,m1,m2,m4,l2)*Z165_2(l1,l2,m3,d1)", &
        Z93_1,S46,Z165_2,prefactor=(-1.0d0,0.0d0))
!   original expression: Z93_1(e1be2be3b,l1b|m1bm2bm3bm4b)+=S46(e1be2be3b,d1b|m1bm3bm4b,l2b)*Z165_2(l1b,l2b|m2b,d1b)
    ierr=exatns_tensor_contract("Z93_1(e1,e2,e3,l1,m1,m2,m3,m4)+=S46(e1,e2,e3,d1,m1,m3,m4,l2)*Z165_2(l1,l2,m2,d1)", &
        Z93_1,S46,Z165_2,prefactor=(1.0d0,0.0d0))
!   original expression: Z93_1(e1be2be3b,l1b|m1bm2bm3bm4b)+=S46(e1be2be3b,d1b|m2bm3bm4b,l2b)*Z165_2(l1b,l2b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z93_1(e1,e2,e3,l1,m1,m2,m3,m4)+=S46(e1,e2,e3,d1,m2,m3,m4,l2)*Z165_2(l1,l2,m1,d1)", &
        Z93_1,S46,Z165_2,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z165_2)
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S43(e1b|l1b)*Z93_1(e2be3be4b,l1b|m1bm2bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S43(e1,l1)*Z93_1(e2,e3,e4,l1,m1,m2,m3,m4)", &
        Z61,S43,Z93_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S43(e2b|l1b)*Z93_1(e1be3be4b,l1b|m1bm2bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S43(e2,l1)*Z93_1(e1,e3,e4,l1,m1,m2,m3,m4)", &
        Z61,S43,Z93_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S43(e3b|l1b)*Z93_1(e1be2be4b,l1b|m1bm2bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S43(e3,l1)*Z93_1(e1,e2,e4,l1,m1,m2,m3,m4)", &
        Z61,S43,Z93_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S43(e4b|l1b)*Z93_1(e1be2be3b,l1b|m1bm2bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S43(e4,l1)*Z93_1(e1,e2,e3,l1,m1,m2,m3,m4)", &
        Z61,S43,Z93_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z93_1)
    
    allocate(tens_id(8), tens_root(8))
    tens_id   = (/nvir_id,nvir_id,nvir_id,nocc_id,nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nvir_root,nvir_root,nocc_root,nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z93_1,"Z93_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z93_1,'ZERO')
!   original expression: Z93_1(e1be2be3b,l1b|m1bm2bm3bm4b)+=S46(e1be2be3b,d1b|m1bm2bm3b,l2b)*H25(l1b,l2b|m4b,d1b)
    ierr=exatns_tensor_contract("Z93_1(e1,e2,e3,l1,m1,m2,m3,m4)+=S46(e1,e2,e3,d1,m1,m2,m3,l2)*H25(l1,l2,m4,d1)", &
        Z93_1,S46,H25,prefactor=(1.0d0,0.0d0))
!   original expression: Z93_1(e1be2be3b,l1b|m1bm2bm3bm4b)+=S46(e1be2be3b,d1b|m1bm2bm4b,l2b)*H25(l1b,l2b|m3b,d1b)*-1.
    ierr=exatns_tensor_contract("Z93_1(e1,e2,e3,l1,m1,m2,m3,m4)+=S46(e1,e2,e3,d1,m1,m2,m4,l2)*H25(l1,l2,m3,d1)", &
        Z93_1,S46,H25,prefactor=(-1.0d0,0.0d0))
!   original expression: Z93_1(e1be2be3b,l1b|m1bm2bm3bm4b)+=S46(e1be2be3b,d1b|m1bm3bm4b,l2b)*H25(l1b,l2b|m2b,d1b)
    ierr=exatns_tensor_contract("Z93_1(e1,e2,e3,l1,m1,m2,m3,m4)+=S46(e1,e2,e3,d1,m1,m3,m4,l2)*H25(l1,l2,m2,d1)", &
        Z93_1,S46,H25,prefactor=(1.0d0,0.0d0))
!   original expression: Z93_1(e1be2be3b,l1b|m1bm2bm3bm4b)+=S46(e1be2be3b,d1b|m2bm3bm4b,l2b)*H25(l1b,l2b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z93_1(e1,e2,e3,l1,m1,m2,m3,m4)+=S46(e1,e2,e3,d1,m2,m3,m4,l2)*H25(l1,l2,m1,d1)", &
        Z93_1,S46,H25,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S43(e1b|l1b)*Z93_1(e2be3be4b,l1b|m1bm2bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S43(e1,l1)*Z93_1(e2,e3,e4,l1,m1,m2,m3,m4)", &
        Z61,S43,Z93_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S43(e2b|l1b)*Z93_1(e1be3be4b,l1b|m1bm2bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S43(e2,l1)*Z93_1(e1,e3,e4,l1,m1,m2,m3,m4)", &
        Z61,S43,Z93_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S43(e3b|l1b)*Z93_1(e1be2be4b,l1b|m1bm2bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S43(e3,l1)*Z93_1(e1,e2,e4,l1,m1,m2,m3,m4)", &
        Z61,S43,Z93_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S43(e4b|l1b)*Z93_1(e1be2be3b,l1b|m1bm2bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S43(e4,l1)*Z93_1(e1,e2,e3,l1,m1,m2,m3,m4)", &
        Z61,S43,Z93_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z93_1)
    
    allocate(tens_id(8), tens_root(8))
    tens_id   = (/nvir_id,nvir_id,nvir_id,nocc_id,nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nvir_root,nvir_root,nocc_root,nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z93_1,"Z93_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z93_1,'ZERO')
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S43(e1b|l1b)*Z93_1(e2be3be4b,l1b|m1bm2bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S43(e1,l1)*Z93_1(e2,e3,e4,l1,m1,m2,m3,m4)", &
        Z61,S43,Z93_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S43(e2b|l1b)*Z93_1(e1be3be4b,l1b|m1bm2bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S43(e2,l1)*Z93_1(e1,e3,e4,l1,m1,m2,m3,m4)", &
        Z61,S43,Z93_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S43(e3b|l1b)*Z93_1(e1be2be4b,l1b|m1bm2bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S43(e3,l1)*Z93_1(e1,e2,e4,l1,m1,m2,m3,m4)", &
        Z61,S43,Z93_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S43(e4b|l1b)*Z93_1(e1be2be3b,l1b|m1bm2bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S43(e4,l1)*Z93_1(e1,e2,e3,l1,m1,m2,m3,m4)", &
        Z61,S43,Z93_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z93_1)
    
    allocate(tens_id(8), tens_root(8))
    tens_id   = (/nvir_id,nvir_id,nvir_id,nocc_id,nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nvir_root,nvir_root,nocc_root,nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z93_1,"Z93_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z93_1,'ZERO')
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S43(e1b|l1b)*Z93_1(e2be3be4b,l1b|m1bm2bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S43(e1,l1)*Z93_1(e2,e3,e4,l1,m1,m2,m3,m4)", &
        Z61,S43,Z93_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S43(e2b|l1b)*Z93_1(e1be3be4b,l1b|m1bm2bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S43(e2,l1)*Z93_1(e1,e3,e4,l1,m1,m2,m3,m4)", &
        Z61,S43,Z93_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S43(e3b|l1b)*Z93_1(e1be2be4b,l1b|m1bm2bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S43(e3,l1)*Z93_1(e1,e2,e4,l1,m1,m2,m3,m4)", &
        Z61,S43,Z93_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S43(e4b|l1b)*Z93_1(e1be2be3b,l1b|m1bm2bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S43(e4,l1)*Z93_1(e1,e2,e3,l1,m1,m2,m3,m4)", &
        Z61,S43,Z93_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z93_1)
    
    allocate(tens_id(8), tens_root(8))
    tens_id   = (/nvir_id,nvir_id,nocc_id,nocc_id,nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nvir_root,nocc_root,nocc_root,nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z87_1,"Z87_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z87_1,'ZERO')
!   original expression: Z87_1(e1be2b,l1bl2b|m1bm2bm3bm4b)+=S46(e1be2b,d1bd2b|m1bm2bm3bm4b)*H24(l1bl2b|d1bd2b)
    ierr=exatns_tensor_contract("Z87_1(e1,e2,l1,l2,m1,m2,m3,m4)+=S46(e1,e2,d1,d2,m1,m2,m3,m4)*H24(l1,l2,d1,d2)", &
        Z87_1,S46,H24,prefactor=(0.5d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be2b|l1bl2b)*Z87_1(e3be4b,l1bl2b|m1bm2bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e2,l1,l2)*Z87_1(e3,e4,l1,l2,m1,m2,m3,m4)", &
        Z61,S44,Z87_1,prefactor=(0.5d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be3b|l1bl2b)*Z87_1(e2be4b,l1bl2b|m1bm2bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e3,l1,l2)*Z87_1(e2,e4,l1,l2,m1,m2,m3,m4)", &
        Z61,S44,Z87_1,prefactor=(-0.5d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be4b|l1bl2b)*Z87_1(e2be3b,l1bl2b|m1bm2bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e4,l1,l2)*Z87_1(e2,e3,l1,l2,m1,m2,m3,m4)", &
        Z61,S44,Z87_1,prefactor=(0.5d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be3b|l1bl2b)*Z87_1(e1be4b,l1bl2b|m1bm2bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e3,l1,l2)*Z87_1(e1,e4,l1,l2,m1,m2,m3,m4)", &
        Z61,S44,Z87_1,prefactor=(0.5d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be4b|l1bl2b)*Z87_1(e1be3b,l1bl2b|m1bm2bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e4,l1,l2)*Z87_1(e1,e3,l1,l2,m1,m2,m3,m4)", &
        Z61,S44,Z87_1,prefactor=(-0.5d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e3be4b|l1bl2b)*Z87_1(e1be2b,l1bl2b|m1bm2bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e3,e4,l1,l2)*Z87_1(e1,e2,l1,l2,m1,m2,m3,m4)", &
        Z61,S44,Z87_1,prefactor=(0.5d0,0.0d0))
    ierr=exatns_tensor_destroy(Z87_1)
    
    allocate(tens_id(6), tens_root(6))
    tens_id   = (/nvir_id,nvir_id,nvir_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root,nvir_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z95_1,"Z95_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z95_1,'ZERO')
!   original expression: Z95_1(e1be2be3b|m1bm2b,d1b)+=H3(e1be2b|d1b,d2b)*S44(e3b,d2b|m1bm2b)*-0.5
    ierr=exatns_tensor_contract("Z95_1(e1,e2,e3,m1,m2,d1)+=H3(e1,e2,d1,d2)*S44(e3,d2,m1,m2)", &
        Z95_1,H3,S44,prefactor=(-0.5d0,0.0d0))
!   original expression: Z95_1(e1be2be3b|m1bm2b,d1b)+=H3(e1be3b|d1b,d2b)*S44(e2b,d2b|m1bm2b)*+0.5
    ierr=exatns_tensor_contract("Z95_1(e1,e2,e3,m1,m2,d1)+=H3(e1,e3,d1,d2)*S44(e2,d2,m1,m2)", &
        Z95_1,H3,S44,prefactor=(0.5d0,0.0d0))
!   original expression: Z95_1(e1be2be3b|m1bm2b,d1b)+=H3(e2be3b|d1b,d2b)*S44(e1b,d2b|m1bm2b)*+0.5
    ierr=exatns_tensor_contract("Z95_1(e1,e2,e3,m1,m2,d1)+=H3(e2,e3,d1,d2)*S44(e1,d2,m1,m2)", &
        Z95_1,H3,S44,prefactor=(0.5d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1b,d1b|m1bm2b)*Z95_1(e2be3be4b|m3bm4b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,d1,m1,m2)*Z95_1(e2,e3,e4,m3,m4,d1)", &
        Z61,S44,Z95_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2b,d1b|m1bm2b)*Z95_1(e1be3be4b|m3bm4b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,d1,m1,m2)*Z95_1(e1,e3,e4,m3,m4,d1)", &
        Z61,S44,Z95_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e3b,d1b|m1bm2b)*Z95_1(e1be2be4b|m3bm4b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e3,d1,m1,m2)*Z95_1(e1,e2,e4,m3,m4,d1)", &
        Z61,S44,Z95_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e4b,d1b|m1bm2b)*Z95_1(e1be2be3b|m3bm4b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e4,d1,m1,m2)*Z95_1(e1,e2,e3,m3,m4,d1)", &
        Z61,S44,Z95_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1b,d1b|m1bm3b)*Z95_1(e2be3be4b|m2bm4b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,d1,m1,m3)*Z95_1(e2,e3,e4,m2,m4,d1)", &
        Z61,S44,Z95_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2b,d1b|m1bm3b)*Z95_1(e1be3be4b|m2bm4b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,d1,m1,m3)*Z95_1(e1,e3,e4,m2,m4,d1)", &
        Z61,S44,Z95_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e3b,d1b|m1bm3b)*Z95_1(e1be2be4b|m2bm4b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e3,d1,m1,m3)*Z95_1(e1,e2,e4,m2,m4,d1)", &
        Z61,S44,Z95_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e4b,d1b|m1bm3b)*Z95_1(e1be2be3b|m2bm4b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e4,d1,m1,m3)*Z95_1(e1,e2,e3,m2,m4,d1)", &
        Z61,S44,Z95_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1b,d1b|m1bm4b)*Z95_1(e2be3be4b|m2bm3b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,d1,m1,m4)*Z95_1(e2,e3,e4,m2,m3,d1)", &
        Z61,S44,Z95_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2b,d1b|m1bm4b)*Z95_1(e1be3be4b|m2bm3b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,d1,m1,m4)*Z95_1(e1,e3,e4,m2,m3,d1)", &
        Z61,S44,Z95_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e3b,d1b|m1bm4b)*Z95_1(e1be2be4b|m2bm3b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e3,d1,m1,m4)*Z95_1(e1,e2,e4,m2,m3,d1)", &
        Z61,S44,Z95_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e4b,d1b|m1bm4b)*Z95_1(e1be2be3b|m2bm3b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e4,d1,m1,m4)*Z95_1(e1,e2,e3,m2,m3,d1)", &
        Z61,S44,Z95_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1b,d1b|m2bm3b)*Z95_1(e2be3be4b|m1bm4b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,d1,m2,m3)*Z95_1(e2,e3,e4,m1,m4,d1)", &
        Z61,S44,Z95_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2b,d1b|m2bm3b)*Z95_1(e1be3be4b|m1bm4b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,d1,m2,m3)*Z95_1(e1,e3,e4,m1,m4,d1)", &
        Z61,S44,Z95_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e3b,d1b|m2bm3b)*Z95_1(e1be2be4b|m1bm4b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e3,d1,m2,m3)*Z95_1(e1,e2,e4,m1,m4,d1)", &
        Z61,S44,Z95_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e4b,d1b|m2bm3b)*Z95_1(e1be2be3b|m1bm4b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e4,d1,m2,m3)*Z95_1(e1,e2,e3,m1,m4,d1)", &
        Z61,S44,Z95_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1b,d1b|m2bm4b)*Z95_1(e2be3be4b|m1bm3b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,d1,m2,m4)*Z95_1(e2,e3,e4,m1,m3,d1)", &
        Z61,S44,Z95_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2b,d1b|m2bm4b)*Z95_1(e1be3be4b|m1bm3b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,d1,m2,m4)*Z95_1(e1,e3,e4,m1,m3,d1)", &
        Z61,S44,Z95_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e3b,d1b|m2bm4b)*Z95_1(e1be2be4b|m1bm3b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e3,d1,m2,m4)*Z95_1(e1,e2,e4,m1,m3,d1)", &
        Z61,S44,Z95_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e4b,d1b|m2bm4b)*Z95_1(e1be2be3b|m1bm3b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e4,d1,m2,m4)*Z95_1(e1,e2,e3,m1,m3,d1)", &
        Z61,S44,Z95_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1b,d1b|m3bm4b)*Z95_1(e2be3be4b|m1bm2b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,d1,m3,m4)*Z95_1(e2,e3,e4,m1,m2,d1)", &
        Z61,S44,Z95_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2b,d1b|m3bm4b)*Z95_1(e1be3be4b|m1bm2b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,d1,m3,m4)*Z95_1(e1,e3,e4,m1,m2,d1)", &
        Z61,S44,Z95_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e3b,d1b|m3bm4b)*Z95_1(e1be2be4b|m1bm2b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e3,d1,m3,m4)*Z95_1(e1,e2,e4,m1,m2,d1)", &
        Z61,S44,Z95_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e4b,d1b|m3bm4b)*Z95_1(e1be2be3b|m1bm2b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e4,d1,m3,m4)*Z95_1(e1,e2,e3,m1,m2,d1)", &
        Z61,S44,Z95_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z95_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nvir_id,nvir_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root,nvir_root,nvir_root/)
    ierr=exatns_tensor_create(Z92_2,"Z92_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z92_2,'ZERO')
!   original expression: Z92_2(e1be2b|d1b,d2b)+=H24(l1bl2b|d1b,d2b)*S44(e1be2b|l1bl2b)*-0.5
    ierr=exatns_tensor_contract("Z92_2(e1,e2,d1,d2)+=H24(l1,l2,d1,d2)*S44(e1,e2,l1,l2)", &
        Z92_2,H24,S44,prefactor=(-0.25d0,0.0d0))
    
    allocate(tens_id(6), tens_root(6))
    tens_id   = (/nvir_id,nvir_id,nvir_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root,nvir_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z95_1,"Z95_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z95_1,'ZERO')
!   original expression: Z95_1(e1be2be3b|m1bm2b,d1b)+=S44(e1b,d2b|m1bm2b)*Z92_2(e2be3b|d1b,d2b)
    ierr=exatns_tensor_contract("Z95_1(e1,e2,e3,m1,m2,d1)+=S44(e1,d2,m1,m2)*Z92_2(e2,e3,d1,d2)", &
        Z95_1,S44,Z92_2,prefactor=(1.0d0,0.0d0))
!   original expression: Z95_1(e1be2be3b|m1bm2b,d1b)+=S44(e2b,d2b|m1bm2b)*Z92_2(e1be3b|d1b,d2b)*-1.
    ierr=exatns_tensor_contract("Z95_1(e1,e2,e3,m1,m2,d1)+=S44(e2,d2,m1,m2)*Z92_2(e1,e3,d1,d2)", &
        Z95_1,S44,Z92_2,prefactor=(-1.0d0,0.0d0))
!   original expression: Z95_1(e1be2be3b|m1bm2b,d1b)+=S44(e3b,d2b|m1bm2b)*Z92_2(e1be2b|d1b,d2b)
    ierr=exatns_tensor_contract("Z95_1(e1,e2,e3,m1,m2,d1)+=S44(e3,d2,m1,m2)*Z92_2(e1,e2,d1,d2)", &
        Z95_1,S44,Z92_2,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z92_2)
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1b,d1b|m1bm2b)*Z95_1(e2be3be4b|m3bm4b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,d1,m1,m2)*Z95_1(e2,e3,e4,m3,m4,d1)", &
        Z61,S44,Z95_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2b,d1b|m1bm2b)*Z95_1(e1be3be4b|m3bm4b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,d1,m1,m2)*Z95_1(e1,e3,e4,m3,m4,d1)", &
        Z61,S44,Z95_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e3b,d1b|m1bm2b)*Z95_1(e1be2be4b|m3bm4b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e3,d1,m1,m2)*Z95_1(e1,e2,e4,m3,m4,d1)", &
        Z61,S44,Z95_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e4b,d1b|m1bm2b)*Z95_1(e1be2be3b|m3bm4b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e4,d1,m1,m2)*Z95_1(e1,e2,e3,m3,m4,d1)", &
        Z61,S44,Z95_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1b,d1b|m1bm3b)*Z95_1(e2be3be4b|m2bm4b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,d1,m1,m3)*Z95_1(e2,e3,e4,m2,m4,d1)", &
        Z61,S44,Z95_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2b,d1b|m1bm3b)*Z95_1(e1be3be4b|m2bm4b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,d1,m1,m3)*Z95_1(e1,e3,e4,m2,m4,d1)", &
        Z61,S44,Z95_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e3b,d1b|m1bm3b)*Z95_1(e1be2be4b|m2bm4b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e3,d1,m1,m3)*Z95_1(e1,e2,e4,m2,m4,d1)", &
        Z61,S44,Z95_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e4b,d1b|m1bm3b)*Z95_1(e1be2be3b|m2bm4b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e4,d1,m1,m3)*Z95_1(e1,e2,e3,m2,m4,d1)", &
        Z61,S44,Z95_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1b,d1b|m1bm4b)*Z95_1(e2be3be4b|m2bm3b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,d1,m1,m4)*Z95_1(e2,e3,e4,m2,m3,d1)", &
        Z61,S44,Z95_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2b,d1b|m1bm4b)*Z95_1(e1be3be4b|m2bm3b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,d1,m1,m4)*Z95_1(e1,e3,e4,m2,m3,d1)", &
        Z61,S44,Z95_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e3b,d1b|m1bm4b)*Z95_1(e1be2be4b|m2bm3b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e3,d1,m1,m4)*Z95_1(e1,e2,e4,m2,m3,d1)", &
        Z61,S44,Z95_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e4b,d1b|m1bm4b)*Z95_1(e1be2be3b|m2bm3b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e4,d1,m1,m4)*Z95_1(e1,e2,e3,m2,m3,d1)", &
        Z61,S44,Z95_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1b,d1b|m2bm3b)*Z95_1(e2be3be4b|m1bm4b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,d1,m2,m3)*Z95_1(e2,e3,e4,m1,m4,d1)", &
        Z61,S44,Z95_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2b,d1b|m2bm3b)*Z95_1(e1be3be4b|m1bm4b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,d1,m2,m3)*Z95_1(e1,e3,e4,m1,m4,d1)", &
        Z61,S44,Z95_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e3b,d1b|m2bm3b)*Z95_1(e1be2be4b|m1bm4b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e3,d1,m2,m3)*Z95_1(e1,e2,e4,m1,m4,d1)", &
        Z61,S44,Z95_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e4b,d1b|m2bm3b)*Z95_1(e1be2be3b|m1bm4b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e4,d1,m2,m3)*Z95_1(e1,e2,e3,m1,m4,d1)", &
        Z61,S44,Z95_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1b,d1b|m2bm4b)*Z95_1(e2be3be4b|m1bm3b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,d1,m2,m4)*Z95_1(e2,e3,e4,m1,m3,d1)", &
        Z61,S44,Z95_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2b,d1b|m2bm4b)*Z95_1(e1be3be4b|m1bm3b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,d1,m2,m4)*Z95_1(e1,e3,e4,m1,m3,d1)", &
        Z61,S44,Z95_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e3b,d1b|m2bm4b)*Z95_1(e1be2be4b|m1bm3b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e3,d1,m2,m4)*Z95_1(e1,e2,e4,m1,m3,d1)", &
        Z61,S44,Z95_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e4b,d1b|m2bm4b)*Z95_1(e1be2be3b|m1bm3b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e4,d1,m2,m4)*Z95_1(e1,e2,e3,m1,m3,d1)", &
        Z61,S44,Z95_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1b,d1b|m3bm4b)*Z95_1(e2be3be4b|m1bm2b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,d1,m3,m4)*Z95_1(e2,e3,e4,m1,m2,d1)", &
        Z61,S44,Z95_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2b,d1b|m3bm4b)*Z95_1(e1be3be4b|m1bm2b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,d1,m3,m4)*Z95_1(e1,e3,e4,m1,m2,d1)", &
        Z61,S44,Z95_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e3b,d1b|m3bm4b)*Z95_1(e1be2be4b|m1bm2b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e3,d1,m3,m4)*Z95_1(e1,e2,e4,m1,m2,d1)", &
        Z61,S44,Z95_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e4b,d1b|m3bm4b)*Z95_1(e1be2be3b|m1bm2b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e4,d1,m3,m4)*Z95_1(e1,e2,e3,m1,m2,d1)", &
        Z61,S44,Z95_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z95_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z129_2,"Z129_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z129_2,'ZERO')
!   original expression: Z129_2(l1bl2b|m1b,d1b)+=H24(l1bl2b|d1b,d2b)*S43(d2b|m1b)*-1.
    ierr=exatns_tensor_contract("Z129_2(l1,l2,m1,d1)+=H24(l1,l2,d1,d2)*S43(d2,m1)", &
        Z129_2,H24,S43,prefactor=(-1.0d0,0.0d0))
    
    allocate(tens_id(6), tens_root(6))
    tens_id   = (/nvir_id,nvir_id,nvir_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root,nvir_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z95_1,"Z95_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z95_1,'ZERO')
!   original expression: Z95_1(e1be2be3b|m1bm2b,d1b)+=S45(e1be2be3b|m1b,l1bl2b)*Z129_2(l1bl2b|m2b,d1b)
    ierr=exatns_tensor_contract("Z95_1(e1,e2,e3,m1,m2,d1)+=S45(e1,e2,e3,m1,l1,l2)*Z129_2(l1,l2,m2,d1)", &
        Z95_1,S45,Z129_2,prefactor=(0.5d0,0.0d0))
!   original expression: Z95_1(e1be2be3b|m1bm2b,d1b)+=S45(e1be2be3b|m2b,l1bl2b)*Z129_2(l1bl2b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z95_1(e1,e2,e3,m1,m2,d1)+=S45(e1,e2,e3,m2,l1,l2)*Z129_2(l1,l2,m1,d1)", &
        Z95_1,S45,Z129_2,prefactor=(-0.5d0,0.0d0))
    ierr=exatns_tensor_destroy(Z129_2)
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1b,d1b|m1bm2b)*Z95_1(e2be3be4b|m3bm4b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,d1,m1,m2)*Z95_1(e2,e3,e4,m3,m4,d1)", &
        Z61,S44,Z95_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2b,d1b|m1bm2b)*Z95_1(e1be3be4b|m3bm4b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,d1,m1,m2)*Z95_1(e1,e3,e4,m3,m4,d1)", &
        Z61,S44,Z95_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e3b,d1b|m1bm2b)*Z95_1(e1be2be4b|m3bm4b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e3,d1,m1,m2)*Z95_1(e1,e2,e4,m3,m4,d1)", &
        Z61,S44,Z95_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e4b,d1b|m1bm2b)*Z95_1(e1be2be3b|m3bm4b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e4,d1,m1,m2)*Z95_1(e1,e2,e3,m3,m4,d1)", &
        Z61,S44,Z95_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1b,d1b|m1bm3b)*Z95_1(e2be3be4b|m2bm4b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,d1,m1,m3)*Z95_1(e2,e3,e4,m2,m4,d1)", &
        Z61,S44,Z95_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2b,d1b|m1bm3b)*Z95_1(e1be3be4b|m2bm4b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,d1,m1,m3)*Z95_1(e1,e3,e4,m2,m4,d1)", &
        Z61,S44,Z95_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e3b,d1b|m1bm3b)*Z95_1(e1be2be4b|m2bm4b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e3,d1,m1,m3)*Z95_1(e1,e2,e4,m2,m4,d1)", &
        Z61,S44,Z95_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e4b,d1b|m1bm3b)*Z95_1(e1be2be3b|m2bm4b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e4,d1,m1,m3)*Z95_1(e1,e2,e3,m2,m4,d1)", &
        Z61,S44,Z95_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1b,d1b|m1bm4b)*Z95_1(e2be3be4b|m2bm3b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,d1,m1,m4)*Z95_1(e2,e3,e4,m2,m3,d1)", &
        Z61,S44,Z95_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2b,d1b|m1bm4b)*Z95_1(e1be3be4b|m2bm3b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,d1,m1,m4)*Z95_1(e1,e3,e4,m2,m3,d1)", &
        Z61,S44,Z95_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e3b,d1b|m1bm4b)*Z95_1(e1be2be4b|m2bm3b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e3,d1,m1,m4)*Z95_1(e1,e2,e4,m2,m3,d1)", &
        Z61,S44,Z95_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e4b,d1b|m1bm4b)*Z95_1(e1be2be3b|m2bm3b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e4,d1,m1,m4)*Z95_1(e1,e2,e3,m2,m3,d1)", &
        Z61,S44,Z95_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1b,d1b|m2bm3b)*Z95_1(e2be3be4b|m1bm4b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,d1,m2,m3)*Z95_1(e2,e3,e4,m1,m4,d1)", &
        Z61,S44,Z95_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2b,d1b|m2bm3b)*Z95_1(e1be3be4b|m1bm4b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,d1,m2,m3)*Z95_1(e1,e3,e4,m1,m4,d1)", &
        Z61,S44,Z95_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e3b,d1b|m2bm3b)*Z95_1(e1be2be4b|m1bm4b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e3,d1,m2,m3)*Z95_1(e1,e2,e4,m1,m4,d1)", &
        Z61,S44,Z95_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e4b,d1b|m2bm3b)*Z95_1(e1be2be3b|m1bm4b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e4,d1,m2,m3)*Z95_1(e1,e2,e3,m1,m4,d1)", &
        Z61,S44,Z95_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1b,d1b|m2bm4b)*Z95_1(e2be3be4b|m1bm3b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,d1,m2,m4)*Z95_1(e2,e3,e4,m1,m3,d1)", &
        Z61,S44,Z95_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2b,d1b|m2bm4b)*Z95_1(e1be3be4b|m1bm3b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,d1,m2,m4)*Z95_1(e1,e3,e4,m1,m3,d1)", &
        Z61,S44,Z95_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e3b,d1b|m2bm4b)*Z95_1(e1be2be4b|m1bm3b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e3,d1,m2,m4)*Z95_1(e1,e2,e4,m1,m3,d1)", &
        Z61,S44,Z95_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e4b,d1b|m2bm4b)*Z95_1(e1be2be3b|m1bm3b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e4,d1,m2,m4)*Z95_1(e1,e2,e3,m1,m3,d1)", &
        Z61,S44,Z95_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1b,d1b|m3bm4b)*Z95_1(e2be3be4b|m1bm2b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,d1,m3,m4)*Z95_1(e2,e3,e4,m1,m2,d1)", &
        Z61,S44,Z95_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2b,d1b|m3bm4b)*Z95_1(e1be3be4b|m1bm2b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,d1,m3,m4)*Z95_1(e1,e3,e4,m1,m2,d1)", &
        Z61,S44,Z95_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e3b,d1b|m3bm4b)*Z95_1(e1be2be4b|m1bm2b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e3,d1,m3,m4)*Z95_1(e1,e2,e4,m1,m2,d1)", &
        Z61,S44,Z95_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e4b,d1b|m3bm4b)*Z95_1(e1be2be3b|m1bm2b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e4,d1,m3,m4)*Z95_1(e1,e2,e3,m1,m2,d1)", &
        Z61,S44,Z95_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z95_1)
    
    allocate(tens_id(6), tens_root(6))
    tens_id   = (/nvir_id,nvir_id,nvir_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root,nvir_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z95_1,"Z95_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z95_1,'ZERO')
!   original expression: Z95_1(e1be2be3b|m1bm2b,d1b)+=S45(e1be2be3b|m1b,l1bl2b)*H25(l1bl2b|m2b,d1b)
    ierr=exatns_tensor_contract("Z95_1(e1,e2,e3,m1,m2,d1)+=S45(e1,e2,e3,m1,l1,l2)*H25(l1,l2,m2,d1)", &
        Z95_1,S45,H25,prefactor=(0.5d0,0.0d0))
!   original expression: Z95_1(e1be2be3b|m1bm2b,d1b)+=S45(e1be2be3b|m2b,l1bl2b)*H25(l1bl2b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z95_1(e1,e2,e3,m1,m2,d1)+=S45(e1,e2,e3,m2,l1,l2)*H25(l1,l2,m1,d1)", &
        Z95_1,S45,H25,prefactor=(-0.5d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1b,d1b|m1bm2b)*Z95_1(e2be3be4b|m3bm4b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,d1,m1,m2)*Z95_1(e2,e3,e4,m3,m4,d1)", &
        Z61,S44,Z95_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2b,d1b|m1bm2b)*Z95_1(e1be3be4b|m3bm4b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,d1,m1,m2)*Z95_1(e1,e3,e4,m3,m4,d1)", &
        Z61,S44,Z95_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e3b,d1b|m1bm2b)*Z95_1(e1be2be4b|m3bm4b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e3,d1,m1,m2)*Z95_1(e1,e2,e4,m3,m4,d1)", &
        Z61,S44,Z95_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e4b,d1b|m1bm2b)*Z95_1(e1be2be3b|m3bm4b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e4,d1,m1,m2)*Z95_1(e1,e2,e3,m3,m4,d1)", &
        Z61,S44,Z95_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1b,d1b|m1bm3b)*Z95_1(e2be3be4b|m2bm4b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,d1,m1,m3)*Z95_1(e2,e3,e4,m2,m4,d1)", &
        Z61,S44,Z95_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2b,d1b|m1bm3b)*Z95_1(e1be3be4b|m2bm4b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,d1,m1,m3)*Z95_1(e1,e3,e4,m2,m4,d1)", &
        Z61,S44,Z95_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e3b,d1b|m1bm3b)*Z95_1(e1be2be4b|m2bm4b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e3,d1,m1,m3)*Z95_1(e1,e2,e4,m2,m4,d1)", &
        Z61,S44,Z95_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e4b,d1b|m1bm3b)*Z95_1(e1be2be3b|m2bm4b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e4,d1,m1,m3)*Z95_1(e1,e2,e3,m2,m4,d1)", &
        Z61,S44,Z95_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1b,d1b|m1bm4b)*Z95_1(e2be3be4b|m2bm3b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,d1,m1,m4)*Z95_1(e2,e3,e4,m2,m3,d1)", &
        Z61,S44,Z95_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2b,d1b|m1bm4b)*Z95_1(e1be3be4b|m2bm3b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,d1,m1,m4)*Z95_1(e1,e3,e4,m2,m3,d1)", &
        Z61,S44,Z95_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e3b,d1b|m1bm4b)*Z95_1(e1be2be4b|m2bm3b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e3,d1,m1,m4)*Z95_1(e1,e2,e4,m2,m3,d1)", &
        Z61,S44,Z95_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e4b,d1b|m1bm4b)*Z95_1(e1be2be3b|m2bm3b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e4,d1,m1,m4)*Z95_1(e1,e2,e3,m2,m3,d1)", &
        Z61,S44,Z95_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1b,d1b|m2bm3b)*Z95_1(e2be3be4b|m1bm4b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,d1,m2,m3)*Z95_1(e2,e3,e4,m1,m4,d1)", &
        Z61,S44,Z95_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2b,d1b|m2bm3b)*Z95_1(e1be3be4b|m1bm4b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,d1,m2,m3)*Z95_1(e1,e3,e4,m1,m4,d1)", &
        Z61,S44,Z95_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e3b,d1b|m2bm3b)*Z95_1(e1be2be4b|m1bm4b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e3,d1,m2,m3)*Z95_1(e1,e2,e4,m1,m4,d1)", &
        Z61,S44,Z95_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e4b,d1b|m2bm3b)*Z95_1(e1be2be3b|m1bm4b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e4,d1,m2,m3)*Z95_1(e1,e2,e3,m1,m4,d1)", &
        Z61,S44,Z95_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1b,d1b|m2bm4b)*Z95_1(e2be3be4b|m1bm3b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,d1,m2,m4)*Z95_1(e2,e3,e4,m1,m3,d1)", &
        Z61,S44,Z95_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2b,d1b|m2bm4b)*Z95_1(e1be3be4b|m1bm3b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,d1,m2,m4)*Z95_1(e1,e3,e4,m1,m3,d1)", &
        Z61,S44,Z95_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e3b,d1b|m2bm4b)*Z95_1(e1be2be4b|m1bm3b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e3,d1,m2,m4)*Z95_1(e1,e2,e4,m1,m3,d1)", &
        Z61,S44,Z95_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e4b,d1b|m2bm4b)*Z95_1(e1be2be3b|m1bm3b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e4,d1,m2,m4)*Z95_1(e1,e2,e3,m1,m3,d1)", &
        Z61,S44,Z95_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1b,d1b|m3bm4b)*Z95_1(e2be3be4b|m1bm2b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,d1,m3,m4)*Z95_1(e2,e3,e4,m1,m2,d1)", &
        Z61,S44,Z95_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2b,d1b|m3bm4b)*Z95_1(e1be3be4b|m1bm2b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,d1,m3,m4)*Z95_1(e1,e3,e4,m1,m2,d1)", &
        Z61,S44,Z95_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e3b,d1b|m3bm4b)*Z95_1(e1be2be4b|m1bm2b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e3,d1,m3,m4)*Z95_1(e1,e2,e4,m1,m2,d1)", &
        Z61,S44,Z95_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e4b,d1b|m3bm4b)*Z95_1(e1be2be3b|m1bm2b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e4,d1,m3,m4)*Z95_1(e1,e2,e3,m1,m2,d1)", &
        Z61,S44,Z95_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z95_1)
    
    allocate(tens_id(6), tens_root(6))
    tens_id   = (/nvir_id,nvir_id,nvir_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root,nvir_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z95_1,"Z95_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z95_1,'ZERO')
!   original expression: Z95_1(e1be2be3b|m1bm2b,d1b)+=S45(e1be2b,d2b|m1bm2b,l1b)*H17(e3b,l1b|d1b,d2b)
    ierr=exatns_tensor_contract("Z95_1(e1,e2,e3,m1,m2,d1)+=S45(e1,e2,d2,m1,m2,l1)*H17(e3,l1,d1,d2)", &
        Z95_1,S45,H17,prefactor=(1.0d0,0.0d0))
!   original expression: Z95_1(e1be2be3b|m1bm2b,d1b)+=S45(e1be3b,d2b|m1bm2b,l1b)*H17(e2b,l1b|d1b,d2b)*-1.
    ierr=exatns_tensor_contract("Z95_1(e1,e2,e3,m1,m2,d1)+=S45(e1,e3,d2,m1,m2,l1)*H17(e2,l1,d1,d2)", &
        Z95_1,S45,H17,prefactor=(-1.0d0,0.0d0))
!   original expression: Z95_1(e1be2be3b|m1bm2b,d1b)+=S45(e2be3b,d2b|m1bm2b,l1b)*H17(e1b,l1b|d1b,d2b)
    ierr=exatns_tensor_contract("Z95_1(e1,e2,e3,m1,m2,d1)+=S45(e2,e3,d2,m1,m2,l1)*H17(e1,l1,d1,d2)", &
        Z95_1,S45,H17,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1b,d1b|m1bm2b)*Z95_1(e2be3be4b|m3bm4b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,d1,m1,m2)*Z95_1(e2,e3,e4,m3,m4,d1)", &
        Z61,S44,Z95_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2b,d1b|m1bm2b)*Z95_1(e1be3be4b|m3bm4b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,d1,m1,m2)*Z95_1(e1,e3,e4,m3,m4,d1)", &
        Z61,S44,Z95_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e3b,d1b|m1bm2b)*Z95_1(e1be2be4b|m3bm4b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e3,d1,m1,m2)*Z95_1(e1,e2,e4,m3,m4,d1)", &
        Z61,S44,Z95_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e4b,d1b|m1bm2b)*Z95_1(e1be2be3b|m3bm4b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e4,d1,m1,m2)*Z95_1(e1,e2,e3,m3,m4,d1)", &
        Z61,S44,Z95_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1b,d1b|m1bm3b)*Z95_1(e2be3be4b|m2bm4b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,d1,m1,m3)*Z95_1(e2,e3,e4,m2,m4,d1)", &
        Z61,S44,Z95_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2b,d1b|m1bm3b)*Z95_1(e1be3be4b|m2bm4b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,d1,m1,m3)*Z95_1(e1,e3,e4,m2,m4,d1)", &
        Z61,S44,Z95_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e3b,d1b|m1bm3b)*Z95_1(e1be2be4b|m2bm4b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e3,d1,m1,m3)*Z95_1(e1,e2,e4,m2,m4,d1)", &
        Z61,S44,Z95_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e4b,d1b|m1bm3b)*Z95_1(e1be2be3b|m2bm4b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e4,d1,m1,m3)*Z95_1(e1,e2,e3,m2,m4,d1)", &
        Z61,S44,Z95_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1b,d1b|m1bm4b)*Z95_1(e2be3be4b|m2bm3b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,d1,m1,m4)*Z95_1(e2,e3,e4,m2,m3,d1)", &
        Z61,S44,Z95_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2b,d1b|m1bm4b)*Z95_1(e1be3be4b|m2bm3b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,d1,m1,m4)*Z95_1(e1,e3,e4,m2,m3,d1)", &
        Z61,S44,Z95_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e3b,d1b|m1bm4b)*Z95_1(e1be2be4b|m2bm3b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e3,d1,m1,m4)*Z95_1(e1,e2,e4,m2,m3,d1)", &
        Z61,S44,Z95_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e4b,d1b|m1bm4b)*Z95_1(e1be2be3b|m2bm3b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e4,d1,m1,m4)*Z95_1(e1,e2,e3,m2,m3,d1)", &
        Z61,S44,Z95_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1b,d1b|m2bm3b)*Z95_1(e2be3be4b|m1bm4b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,d1,m2,m3)*Z95_1(e2,e3,e4,m1,m4,d1)", &
        Z61,S44,Z95_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2b,d1b|m2bm3b)*Z95_1(e1be3be4b|m1bm4b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,d1,m2,m3)*Z95_1(e1,e3,e4,m1,m4,d1)", &
        Z61,S44,Z95_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e3b,d1b|m2bm3b)*Z95_1(e1be2be4b|m1bm4b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e3,d1,m2,m3)*Z95_1(e1,e2,e4,m1,m4,d1)", &
        Z61,S44,Z95_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e4b,d1b|m2bm3b)*Z95_1(e1be2be3b|m1bm4b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e4,d1,m2,m3)*Z95_1(e1,e2,e3,m1,m4,d1)", &
        Z61,S44,Z95_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1b,d1b|m2bm4b)*Z95_1(e2be3be4b|m1bm3b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,d1,m2,m4)*Z95_1(e2,e3,e4,m1,m3,d1)", &
        Z61,S44,Z95_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2b,d1b|m2bm4b)*Z95_1(e1be3be4b|m1bm3b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,d1,m2,m4)*Z95_1(e1,e3,e4,m1,m3,d1)", &
        Z61,S44,Z95_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e3b,d1b|m2bm4b)*Z95_1(e1be2be4b|m1bm3b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e3,d1,m2,m4)*Z95_1(e1,e2,e4,m1,m3,d1)", &
        Z61,S44,Z95_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e4b,d1b|m2bm4b)*Z95_1(e1be2be3b|m1bm3b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e4,d1,m2,m4)*Z95_1(e1,e2,e3,m1,m3,d1)", &
        Z61,S44,Z95_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1b,d1b|m3bm4b)*Z95_1(e2be3be4b|m1bm2b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,d1,m3,m4)*Z95_1(e2,e3,e4,m1,m2,d1)", &
        Z61,S44,Z95_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2b,d1b|m3bm4b)*Z95_1(e1be3be4b|m1bm2b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,d1,m3,m4)*Z95_1(e1,e3,e4,m1,m2,d1)", &
        Z61,S44,Z95_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e3b,d1b|m3bm4b)*Z95_1(e1be2be4b|m1bm2b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e3,d1,m3,m4)*Z95_1(e1,e2,e4,m1,m2,d1)", &
        Z61,S44,Z95_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e4b,d1b|m3bm4b)*Z95_1(e1be2be3b|m1bm2b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e4,d1,m3,m4)*Z95_1(e1,e2,e3,m1,m2,d1)", &
        Z61,S44,Z95_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z95_1)
    
    allocate(tens_id(6), tens_root(6))
    tens_id   = (/nvir_id,nvir_id,nvir_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root,nvir_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z95_1,"Z95_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z95_1,'ZERO')
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1b,d1b|m1bm2b)*Z95_1(e2be3be4b|m3bm4b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,d1,m1,m2)*Z95_1(e2,e3,e4,m3,m4,d1)", &
        Z61,S44,Z95_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2b,d1b|m1bm2b)*Z95_1(e1be3be4b|m3bm4b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,d1,m1,m2)*Z95_1(e1,e3,e4,m3,m4,d1)", &
        Z61,S44,Z95_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e3b,d1b|m1bm2b)*Z95_1(e1be2be4b|m3bm4b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e3,d1,m1,m2)*Z95_1(e1,e2,e4,m3,m4,d1)", &
        Z61,S44,Z95_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e4b,d1b|m1bm2b)*Z95_1(e1be2be3b|m3bm4b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e4,d1,m1,m2)*Z95_1(e1,e2,e3,m3,m4,d1)", &
        Z61,S44,Z95_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1b,d1b|m1bm3b)*Z95_1(e2be3be4b|m2bm4b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,d1,m1,m3)*Z95_1(e2,e3,e4,m2,m4,d1)", &
        Z61,S44,Z95_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2b,d1b|m1bm3b)*Z95_1(e1be3be4b|m2bm4b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,d1,m1,m3)*Z95_1(e1,e3,e4,m2,m4,d1)", &
        Z61,S44,Z95_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e3b,d1b|m1bm3b)*Z95_1(e1be2be4b|m2bm4b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e3,d1,m1,m3)*Z95_1(e1,e2,e4,m2,m4,d1)", &
        Z61,S44,Z95_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e4b,d1b|m1bm3b)*Z95_1(e1be2be3b|m2bm4b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e4,d1,m1,m3)*Z95_1(e1,e2,e3,m2,m4,d1)", &
        Z61,S44,Z95_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1b,d1b|m1bm4b)*Z95_1(e2be3be4b|m2bm3b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,d1,m1,m4)*Z95_1(e2,e3,e4,m2,m3,d1)", &
        Z61,S44,Z95_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2b,d1b|m1bm4b)*Z95_1(e1be3be4b|m2bm3b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,d1,m1,m4)*Z95_1(e1,e3,e4,m2,m3,d1)", &
        Z61,S44,Z95_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e3b,d1b|m1bm4b)*Z95_1(e1be2be4b|m2bm3b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e3,d1,m1,m4)*Z95_1(e1,e2,e4,m2,m3,d1)", &
        Z61,S44,Z95_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e4b,d1b|m1bm4b)*Z95_1(e1be2be3b|m2bm3b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e4,d1,m1,m4)*Z95_1(e1,e2,e3,m2,m3,d1)", &
        Z61,S44,Z95_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1b,d1b|m2bm3b)*Z95_1(e2be3be4b|m1bm4b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,d1,m2,m3)*Z95_1(e2,e3,e4,m1,m4,d1)", &
        Z61,S44,Z95_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2b,d1b|m2bm3b)*Z95_1(e1be3be4b|m1bm4b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,d1,m2,m3)*Z95_1(e1,e3,e4,m1,m4,d1)", &
        Z61,S44,Z95_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e3b,d1b|m2bm3b)*Z95_1(e1be2be4b|m1bm4b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e3,d1,m2,m3)*Z95_1(e1,e2,e4,m1,m4,d1)", &
        Z61,S44,Z95_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e4b,d1b|m2bm3b)*Z95_1(e1be2be3b|m1bm4b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e4,d1,m2,m3)*Z95_1(e1,e2,e3,m1,m4,d1)", &
        Z61,S44,Z95_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1b,d1b|m2bm4b)*Z95_1(e2be3be4b|m1bm3b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,d1,m2,m4)*Z95_1(e2,e3,e4,m1,m3,d1)", &
        Z61,S44,Z95_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2b,d1b|m2bm4b)*Z95_1(e1be3be4b|m1bm3b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,d1,m2,m4)*Z95_1(e1,e3,e4,m1,m3,d1)", &
        Z61,S44,Z95_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e3b,d1b|m2bm4b)*Z95_1(e1be2be4b|m1bm3b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e3,d1,m2,m4)*Z95_1(e1,e2,e4,m1,m3,d1)", &
        Z61,S44,Z95_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e4b,d1b|m2bm4b)*Z95_1(e1be2be3b|m1bm3b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e4,d1,m2,m4)*Z95_1(e1,e2,e3,m1,m3,d1)", &
        Z61,S44,Z95_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1b,d1b|m3bm4b)*Z95_1(e2be3be4b|m1bm2b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,d1,m3,m4)*Z95_1(e2,e3,e4,m1,m2,d1)", &
        Z61,S44,Z95_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2b,d1b|m3bm4b)*Z95_1(e1be3be4b|m1bm2b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,d1,m3,m4)*Z95_1(e1,e3,e4,m1,m2,d1)", &
        Z61,S44,Z95_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e3b,d1b|m3bm4b)*Z95_1(e1be2be4b|m1bm2b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e3,d1,m3,m4)*Z95_1(e1,e2,e4,m1,m2,d1)", &
        Z61,S44,Z95_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e4b,d1b|m3bm4b)*Z95_1(e1be2be3b|m1bm2b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e4,d1,m3,m4)*Z95_1(e1,e2,e3,m1,m2,d1)", &
        Z61,S44,Z95_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z95_1)
    
    allocate(tens_id(6), tens_root(6))
    tens_id   = (/nvir_id,nvir_id,nvir_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root,nvir_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z95_1,"Z95_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z95_1,'ZERO')
!   original expression: Z95_1(e1be2be3b|m1bm2b,d1b)+=S46(e1be2be3b,d2b|m1bm2b,l1bl2b)*H24(l1bl2b|d1b,d2b)*-1.
    ierr=exatns_tensor_contract("Z95_1(e1,e2,e3,m1,m2,d1)+=S46(e1,e2,e3,d2,m1,m2,l1,l2)*H24(l1,l2,d1,d2)", &
        Z95_1,S46,H24,prefactor=(-0.5d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1b,d1b|m1bm2b)*Z95_1(e2be3be4b|m3bm4b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,d1,m1,m2)*Z95_1(e2,e3,e4,m3,m4,d1)", &
        Z61,S44,Z95_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2b,d1b|m1bm2b)*Z95_1(e1be3be4b|m3bm4b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,d1,m1,m2)*Z95_1(e1,e3,e4,m3,m4,d1)", &
        Z61,S44,Z95_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e3b,d1b|m1bm2b)*Z95_1(e1be2be4b|m3bm4b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e3,d1,m1,m2)*Z95_1(e1,e2,e4,m3,m4,d1)", &
        Z61,S44,Z95_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e4b,d1b|m1bm2b)*Z95_1(e1be2be3b|m3bm4b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e4,d1,m1,m2)*Z95_1(e1,e2,e3,m3,m4,d1)", &
        Z61,S44,Z95_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1b,d1b|m1bm3b)*Z95_1(e2be3be4b|m2bm4b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,d1,m1,m3)*Z95_1(e2,e3,e4,m2,m4,d1)", &
        Z61,S44,Z95_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2b,d1b|m1bm3b)*Z95_1(e1be3be4b|m2bm4b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,d1,m1,m3)*Z95_1(e1,e3,e4,m2,m4,d1)", &
        Z61,S44,Z95_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e3b,d1b|m1bm3b)*Z95_1(e1be2be4b|m2bm4b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e3,d1,m1,m3)*Z95_1(e1,e2,e4,m2,m4,d1)", &
        Z61,S44,Z95_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e4b,d1b|m1bm3b)*Z95_1(e1be2be3b|m2bm4b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e4,d1,m1,m3)*Z95_1(e1,e2,e3,m2,m4,d1)", &
        Z61,S44,Z95_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1b,d1b|m1bm4b)*Z95_1(e2be3be4b|m2bm3b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,d1,m1,m4)*Z95_1(e2,e3,e4,m2,m3,d1)", &
        Z61,S44,Z95_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2b,d1b|m1bm4b)*Z95_1(e1be3be4b|m2bm3b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,d1,m1,m4)*Z95_1(e1,e3,e4,m2,m3,d1)", &
        Z61,S44,Z95_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e3b,d1b|m1bm4b)*Z95_1(e1be2be4b|m2bm3b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e3,d1,m1,m4)*Z95_1(e1,e2,e4,m2,m3,d1)", &
        Z61,S44,Z95_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e4b,d1b|m1bm4b)*Z95_1(e1be2be3b|m2bm3b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e4,d1,m1,m4)*Z95_1(e1,e2,e3,m2,m3,d1)", &
        Z61,S44,Z95_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1b,d1b|m2bm3b)*Z95_1(e2be3be4b|m1bm4b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,d1,m2,m3)*Z95_1(e2,e3,e4,m1,m4,d1)", &
        Z61,S44,Z95_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2b,d1b|m2bm3b)*Z95_1(e1be3be4b|m1bm4b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,d1,m2,m3)*Z95_1(e1,e3,e4,m1,m4,d1)", &
        Z61,S44,Z95_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e3b,d1b|m2bm3b)*Z95_1(e1be2be4b|m1bm4b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e3,d1,m2,m3)*Z95_1(e1,e2,e4,m1,m4,d1)", &
        Z61,S44,Z95_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e4b,d1b|m2bm3b)*Z95_1(e1be2be3b|m1bm4b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e4,d1,m2,m3)*Z95_1(e1,e2,e3,m1,m4,d1)", &
        Z61,S44,Z95_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1b,d1b|m2bm4b)*Z95_1(e2be3be4b|m1bm3b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,d1,m2,m4)*Z95_1(e2,e3,e4,m1,m3,d1)", &
        Z61,S44,Z95_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2b,d1b|m2bm4b)*Z95_1(e1be3be4b|m1bm3b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,d1,m2,m4)*Z95_1(e1,e3,e4,m1,m3,d1)", &
        Z61,S44,Z95_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e3b,d1b|m2bm4b)*Z95_1(e1be2be4b|m1bm3b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e3,d1,m2,m4)*Z95_1(e1,e2,e4,m1,m3,d1)", &
        Z61,S44,Z95_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e4b,d1b|m2bm4b)*Z95_1(e1be2be3b|m1bm3b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e4,d1,m2,m4)*Z95_1(e1,e2,e3,m1,m3,d1)", &
        Z61,S44,Z95_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1b,d1b|m3bm4b)*Z95_1(e2be3be4b|m1bm2b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,d1,m3,m4)*Z95_1(e2,e3,e4,m1,m2,d1)", &
        Z61,S44,Z95_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2b,d1b|m3bm4b)*Z95_1(e1be3be4b|m1bm2b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,d1,m3,m4)*Z95_1(e1,e3,e4,m1,m2,d1)", &
        Z61,S44,Z95_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e3b,d1b|m3bm4b)*Z95_1(e1be2be4b|m1bm2b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e3,d1,m3,m4)*Z95_1(e1,e2,e4,m1,m2,d1)", &
        Z61,S44,Z95_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e4b,d1b|m3bm4b)*Z95_1(e1be2be3b|m1bm2b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e4,d1,m3,m4)*Z95_1(e1,e2,e3,m1,m2,d1)", &
        Z61,S44,Z95_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z95_1)
    
    allocate(tens_id(6), tens_root(6))
    tens_id   = (/nvir_id,nvir_id,nvir_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root,nvir_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z95_1,"Z95_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z95_1,'ZERO')
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1b,d1b|m1bm2b)*Z95_1(e2be3be4b|m3bm4b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,d1,m1,m2)*Z95_1(e2,e3,e4,m3,m4,d1)", &
        Z61,S44,Z95_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2b,d1b|m1bm2b)*Z95_1(e1be3be4b|m3bm4b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,d1,m1,m2)*Z95_1(e1,e3,e4,m3,m4,d1)", &
        Z61,S44,Z95_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e3b,d1b|m1bm2b)*Z95_1(e1be2be4b|m3bm4b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e3,d1,m1,m2)*Z95_1(e1,e2,e4,m3,m4,d1)", &
        Z61,S44,Z95_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e4b,d1b|m1bm2b)*Z95_1(e1be2be3b|m3bm4b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e4,d1,m1,m2)*Z95_1(e1,e2,e3,m3,m4,d1)", &
        Z61,S44,Z95_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1b,d1b|m1bm3b)*Z95_1(e2be3be4b|m2bm4b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,d1,m1,m3)*Z95_1(e2,e3,e4,m2,m4,d1)", &
        Z61,S44,Z95_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2b,d1b|m1bm3b)*Z95_1(e1be3be4b|m2bm4b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,d1,m1,m3)*Z95_1(e1,e3,e4,m2,m4,d1)", &
        Z61,S44,Z95_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e3b,d1b|m1bm3b)*Z95_1(e1be2be4b|m2bm4b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e3,d1,m1,m3)*Z95_1(e1,e2,e4,m2,m4,d1)", &
        Z61,S44,Z95_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e4b,d1b|m1bm3b)*Z95_1(e1be2be3b|m2bm4b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e4,d1,m1,m3)*Z95_1(e1,e2,e3,m2,m4,d1)", &
        Z61,S44,Z95_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1b,d1b|m1bm4b)*Z95_1(e2be3be4b|m2bm3b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,d1,m1,m4)*Z95_1(e2,e3,e4,m2,m3,d1)", &
        Z61,S44,Z95_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2b,d1b|m1bm4b)*Z95_1(e1be3be4b|m2bm3b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,d1,m1,m4)*Z95_1(e1,e3,e4,m2,m3,d1)", &
        Z61,S44,Z95_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e3b,d1b|m1bm4b)*Z95_1(e1be2be4b|m2bm3b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e3,d1,m1,m4)*Z95_1(e1,e2,e4,m2,m3,d1)", &
        Z61,S44,Z95_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e4b,d1b|m1bm4b)*Z95_1(e1be2be3b|m2bm3b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e4,d1,m1,m4)*Z95_1(e1,e2,e3,m2,m3,d1)", &
        Z61,S44,Z95_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1b,d1b|m2bm3b)*Z95_1(e2be3be4b|m1bm4b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,d1,m2,m3)*Z95_1(e2,e3,e4,m1,m4,d1)", &
        Z61,S44,Z95_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2b,d1b|m2bm3b)*Z95_1(e1be3be4b|m1bm4b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,d1,m2,m3)*Z95_1(e1,e3,e4,m1,m4,d1)", &
        Z61,S44,Z95_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e3b,d1b|m2bm3b)*Z95_1(e1be2be4b|m1bm4b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e3,d1,m2,m3)*Z95_1(e1,e2,e4,m1,m4,d1)", &
        Z61,S44,Z95_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e4b,d1b|m2bm3b)*Z95_1(e1be2be3b|m1bm4b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e4,d1,m2,m3)*Z95_1(e1,e2,e3,m1,m4,d1)", &
        Z61,S44,Z95_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1b,d1b|m2bm4b)*Z95_1(e2be3be4b|m1bm3b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,d1,m2,m4)*Z95_1(e2,e3,e4,m1,m3,d1)", &
        Z61,S44,Z95_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2b,d1b|m2bm4b)*Z95_1(e1be3be4b|m1bm3b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,d1,m2,m4)*Z95_1(e1,e3,e4,m1,m3,d1)", &
        Z61,S44,Z95_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e3b,d1b|m2bm4b)*Z95_1(e1be2be4b|m1bm3b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e3,d1,m2,m4)*Z95_1(e1,e2,e4,m1,m3,d1)", &
        Z61,S44,Z95_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e4b,d1b|m2bm4b)*Z95_1(e1be2be3b|m1bm3b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e4,d1,m2,m4)*Z95_1(e1,e2,e3,m1,m3,d1)", &
        Z61,S44,Z95_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1b,d1b|m3bm4b)*Z95_1(e2be3be4b|m1bm2b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,d1,m3,m4)*Z95_1(e2,e3,e4,m1,m2,d1)", &
        Z61,S44,Z95_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2b,d1b|m3bm4b)*Z95_1(e1be3be4b|m1bm2b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,d1,m3,m4)*Z95_1(e1,e3,e4,m1,m2,d1)", &
        Z61,S44,Z95_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e3b,d1b|m3bm4b)*Z95_1(e1be2be4b|m1bm2b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e3,d1,m3,m4)*Z95_1(e1,e2,e4,m1,m2,d1)", &
        Z61,S44,Z95_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e4b,d1b|m3bm4b)*Z95_1(e1be2be3b|m1bm2b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e4,d1,m3,m4)*Z95_1(e1,e2,e3,m1,m2,d1)", &
        Z61,S44,Z95_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z95_1)
    
    allocate(tens_id(6), tens_root(6))
    tens_id   = (/nvir_id,nvir_id,nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nvir_root,nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z86_1,"Z86_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z86_1,'ZERO')
!   original expression: Z86_1(e1be2b,l1b|m1bm2bm3b)+=H18(e1b,l1b|m1b,d1b)*S44(e2b,d1b|m2bm3b)*-1.
    ierr=exatns_tensor_contract("Z86_1(e1,e2,l1,m1,m2,m3)+=H18(e1,l1,m1,d1)*S44(e2,d1,m2,m3)", &
        Z86_1,H18,S44,prefactor=(-1.0d0,0.0d0))
!   original expression: Z86_1(e1be2b,l1b|m1bm2bm3b)+=H18(e2b,l1b|m1b,d1b)*S44(e1b,d1b|m2bm3b)
    ierr=exatns_tensor_contract("Z86_1(e1,e2,l1,m1,m2,m3)+=H18(e2,l1,m1,d1)*S44(e1,d1,m2,m3)", &
        Z86_1,H18,S44,prefactor=(1.0d0,0.0d0))
!   original expression: Z86_1(e1be2b,l1b|m1bm2bm3b)+=H18(e1b,l1b|m2b,d1b)*S44(e2b,d1b|m1bm3b)
    ierr=exatns_tensor_contract("Z86_1(e1,e2,l1,m1,m2,m3)+=H18(e1,l1,m2,d1)*S44(e2,d1,m1,m3)", &
        Z86_1,H18,S44,prefactor=(1.0d0,0.0d0))
!   original expression: Z86_1(e1be2b,l1b|m1bm2bm3b)+=H18(e2b,l1b|m2b,d1b)*S44(e1b,d1b|m1bm3b)*-1.
    ierr=exatns_tensor_contract("Z86_1(e1,e2,l1,m1,m2,m3)+=H18(e2,l1,m2,d1)*S44(e1,d1,m1,m3)", &
        Z86_1,H18,S44,prefactor=(-1.0d0,0.0d0))
!   original expression: Z86_1(e1be2b,l1b|m1bm2bm3b)+=H18(e1b,l1b|m3b,d1b)*S44(e2b,d1b|m1bm2b)*-1.
    ierr=exatns_tensor_contract("Z86_1(e1,e2,l1,m1,m2,m3)+=H18(e1,l1,m3,d1)*S44(e2,d1,m1,m2)", &
        Z86_1,H18,S44,prefactor=(-1.0d0,0.0d0))
!   original expression: Z86_1(e1be2b,l1b|m1bm2bm3b)+=H18(e2b,l1b|m3b,d1b)*S44(e1b,d1b|m1bm2b)
    ierr=exatns_tensor_contract("Z86_1(e1,e2,l1,m1,m2,m3)+=H18(e2,l1,m3,d1)*S44(e1,d1,m1,m2)", &
        Z86_1,H18,S44,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be2b|m1b,l1b)*Z86_1(e3be4b,l1b|m2bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e2,m1,l1)*Z86_1(e3,e4,l1,m2,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be3b|m1b,l1b)*Z86_1(e2be4b,l1b|m2bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e3,m1,l1)*Z86_1(e2,e4,l1,m2,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be4b|m1b,l1b)*Z86_1(e2be3b,l1b|m2bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e4,m1,l1)*Z86_1(e2,e3,l1,m2,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be3b|m1b,l1b)*Z86_1(e1be4b,l1b|m2bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e3,m1,l1)*Z86_1(e1,e4,l1,m2,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be4b|m1b,l1b)*Z86_1(e1be3b,l1b|m2bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e4,m1,l1)*Z86_1(e1,e3,l1,m2,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e3be4b|m1b,l1b)*Z86_1(e1be2b,l1b|m2bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e3,e4,m1,l1)*Z86_1(e1,e2,l1,m2,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be2b|m2b,l1b)*Z86_1(e3be4b,l1b|m1bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e2,m2,l1)*Z86_1(e3,e4,l1,m1,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be3b|m2b,l1b)*Z86_1(e2be4b,l1b|m1bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e3,m2,l1)*Z86_1(e2,e4,l1,m1,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be4b|m2b,l1b)*Z86_1(e2be3b,l1b|m1bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e4,m2,l1)*Z86_1(e2,e3,l1,m1,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be3b|m2b,l1b)*Z86_1(e1be4b,l1b|m1bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e3,m2,l1)*Z86_1(e1,e4,l1,m1,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be4b|m2b,l1b)*Z86_1(e1be3b,l1b|m1bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e4,m2,l1)*Z86_1(e1,e3,l1,m1,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e3be4b|m2b,l1b)*Z86_1(e1be2b,l1b|m1bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e3,e4,m2,l1)*Z86_1(e1,e2,l1,m1,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be2b|m3b,l1b)*Z86_1(e3be4b,l1b|m1bm2bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e2,m3,l1)*Z86_1(e3,e4,l1,m1,m2,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be3b|m3b,l1b)*Z86_1(e2be4b,l1b|m1bm2bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e3,m3,l1)*Z86_1(e2,e4,l1,m1,m2,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be4b|m3b,l1b)*Z86_1(e2be3b,l1b|m1bm2bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e4,m3,l1)*Z86_1(e2,e3,l1,m1,m2,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be3b|m3b,l1b)*Z86_1(e1be4b,l1b|m1bm2bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e3,m3,l1)*Z86_1(e1,e4,l1,m1,m2,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be4b|m3b,l1b)*Z86_1(e1be3b,l1b|m1bm2bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e4,m3,l1)*Z86_1(e1,e3,l1,m1,m2,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e3be4b|m3b,l1b)*Z86_1(e1be2b,l1b|m1bm2bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e3,e4,m3,l1)*Z86_1(e1,e2,l1,m1,m2,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be2b|m4b,l1b)*Z86_1(e3be4b,l1b|m1bm2bm3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e2,m4,l1)*Z86_1(e3,e4,l1,m1,m2,m3)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be3b|m4b,l1b)*Z86_1(e2be4b,l1b|m1bm2bm3b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e3,m4,l1)*Z86_1(e2,e4,l1,m1,m2,m3)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be4b|m4b,l1b)*Z86_1(e2be3b,l1b|m1bm2bm3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e4,m4,l1)*Z86_1(e2,e3,l1,m1,m2,m3)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be3b|m4b,l1b)*Z86_1(e1be4b,l1b|m1bm2bm3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e3,m4,l1)*Z86_1(e1,e4,l1,m1,m2,m3)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be4b|m4b,l1b)*Z86_1(e1be3b,l1b|m1bm2bm3b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e4,m4,l1)*Z86_1(e1,e3,l1,m1,m2,m3)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e3be4b|m4b,l1b)*Z86_1(e1be2b,l1b|m1bm2bm3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e3,e4,m4,l1)*Z86_1(e1,e2,l1,m1,m2,m3)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z86_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z165_3,"Z165_3",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z165_3,'ZERO')
!   original expression: Z165_3(l1b,l2b|m1b,d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|m1b)
    ierr=exatns_tensor_contract("Z165_3(l1,l2,m1,d1)+=H24(l1,l2,d1,d2)*S43(d2,m1)", &
        Z165_3,H24,S43,prefactor=(1.0d0,0.0d0))
    
    allocate(tens_id(6), tens_root(6))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z134_2,"Z134_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z134_2,'ZERO')
!   original expression: Z134_2(e1b,l1b,l2b|m1bm2bm3b)+=S44(e1b,d1b|m1bm2b)*Z165_3(l1b,l2b|m3b,d1b)
    ierr=exatns_tensor_contract("Z134_2(e1,l1,l2,m1,m2,m3)+=S44(e1,d1,m1,m2)*Z165_3(l1,l2,m3,d1)", &
        Z134_2,S44,Z165_3,prefactor=(1.0d0,0.0d0))
!   original expression: Z134_2(e1b,l1b,l2b|m1bm2bm3b)+=S44(e1b,d1b|m1bm3b)*Z165_3(l1b,l2b|m2b,d1b)*-1.
    ierr=exatns_tensor_contract("Z134_2(e1,l1,l2,m1,m2,m3)+=S44(e1,d1,m1,m3)*Z165_3(l1,l2,m2,d1)", &
        Z134_2,S44,Z165_3,prefactor=(-1.0d0,0.0d0))
!   original expression: Z134_2(e1b,l1b,l2b|m1bm2bm3b)+=S44(e1b,d1b|m2bm3b)*Z165_3(l1b,l2b|m1b,d1b)
    ierr=exatns_tensor_contract("Z134_2(e1,l1,l2,m1,m2,m3)+=S44(e1,d1,m2,m3)*Z165_3(l1,l2,m1,d1)", &
        Z134_2,S44,Z165_3,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z165_3)
    
    allocate(tens_id(6), tens_root(6))
    tens_id   = (/nvir_id,nvir_id,nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nvir_root,nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z86_1,"Z86_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z86_1,'ZERO')
!   original expression: Z86_1(e1be2b,l1b|m1bm2bm3b)+=S43(e1b|l2b)*Z134_2(e2b,l1b,l2b|m1bm2bm3b)
    ierr=exatns_tensor_contract("Z86_1(e1,e2,l1,m1,m2,m3)+=S43(e1,l2)*Z134_2(e2,l1,l2,m1,m2,m3)", &
        Z86_1,S43,Z134_2,prefactor=(1.0d0,0.0d0))
!   original expression: Z86_1(e1be2b,l1b|m1bm2bm3b)+=S43(e2b|l2b)*Z134_2(e1b,l1b,l2b|m1bm2bm3b)*-1.
    ierr=exatns_tensor_contract("Z86_1(e1,e2,l1,m1,m2,m3)+=S43(e2,l2)*Z134_2(e1,l1,l2,m1,m2,m3)", &
        Z86_1,S43,Z134_2,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z134_2)
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be2b|m1b,l1b)*Z86_1(e3be4b,l1b|m2bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e2,m1,l1)*Z86_1(e3,e4,l1,m2,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be3b|m1b,l1b)*Z86_1(e2be4b,l1b|m2bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e3,m1,l1)*Z86_1(e2,e4,l1,m2,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be4b|m1b,l1b)*Z86_1(e2be3b,l1b|m2bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e4,m1,l1)*Z86_1(e2,e3,l1,m2,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be3b|m1b,l1b)*Z86_1(e1be4b,l1b|m2bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e3,m1,l1)*Z86_1(e1,e4,l1,m2,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be4b|m1b,l1b)*Z86_1(e1be3b,l1b|m2bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e4,m1,l1)*Z86_1(e1,e3,l1,m2,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e3be4b|m1b,l1b)*Z86_1(e1be2b,l1b|m2bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e3,e4,m1,l1)*Z86_1(e1,e2,l1,m2,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be2b|m2b,l1b)*Z86_1(e3be4b,l1b|m1bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e2,m2,l1)*Z86_1(e3,e4,l1,m1,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be3b|m2b,l1b)*Z86_1(e2be4b,l1b|m1bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e3,m2,l1)*Z86_1(e2,e4,l1,m1,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be4b|m2b,l1b)*Z86_1(e2be3b,l1b|m1bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e4,m2,l1)*Z86_1(e2,e3,l1,m1,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be3b|m2b,l1b)*Z86_1(e1be4b,l1b|m1bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e3,m2,l1)*Z86_1(e1,e4,l1,m1,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be4b|m2b,l1b)*Z86_1(e1be3b,l1b|m1bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e4,m2,l1)*Z86_1(e1,e3,l1,m1,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e3be4b|m2b,l1b)*Z86_1(e1be2b,l1b|m1bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e3,e4,m2,l1)*Z86_1(e1,e2,l1,m1,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be2b|m3b,l1b)*Z86_1(e3be4b,l1b|m1bm2bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e2,m3,l1)*Z86_1(e3,e4,l1,m1,m2,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be3b|m3b,l1b)*Z86_1(e2be4b,l1b|m1bm2bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e3,m3,l1)*Z86_1(e2,e4,l1,m1,m2,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be4b|m3b,l1b)*Z86_1(e2be3b,l1b|m1bm2bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e4,m3,l1)*Z86_1(e2,e3,l1,m1,m2,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be3b|m3b,l1b)*Z86_1(e1be4b,l1b|m1bm2bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e3,m3,l1)*Z86_1(e1,e4,l1,m1,m2,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be4b|m3b,l1b)*Z86_1(e1be3b,l1b|m1bm2bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e4,m3,l1)*Z86_1(e1,e3,l1,m1,m2,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e3be4b|m3b,l1b)*Z86_1(e1be2b,l1b|m1bm2bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e3,e4,m3,l1)*Z86_1(e1,e2,l1,m1,m2,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be2b|m4b,l1b)*Z86_1(e3be4b,l1b|m1bm2bm3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e2,m4,l1)*Z86_1(e3,e4,l1,m1,m2,m3)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be3b|m4b,l1b)*Z86_1(e2be4b,l1b|m1bm2bm3b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e3,m4,l1)*Z86_1(e2,e4,l1,m1,m2,m3)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be4b|m4b,l1b)*Z86_1(e2be3b,l1b|m1bm2bm3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e4,m4,l1)*Z86_1(e2,e3,l1,m1,m2,m3)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be3b|m4b,l1b)*Z86_1(e1be4b,l1b|m1bm2bm3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e3,m4,l1)*Z86_1(e1,e4,l1,m1,m2,m3)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be4b|m4b,l1b)*Z86_1(e1be3b,l1b|m1bm2bm3b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e4,m4,l1)*Z86_1(e1,e3,l1,m1,m2,m3)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e3be4b|m4b,l1b)*Z86_1(e1be2b,l1b|m1bm2bm3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e3,e4,m4,l1)*Z86_1(e1,e2,l1,m1,m2,m3)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z86_1)
    
    allocate(tens_id(6), tens_root(6))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z134_2,"Z134_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z134_2,'ZERO')
!   original expression: Z134_2(e1b,l1b,l2b|m1bm2bm3b)+=S44(e1b,d1b|m1bm2b)*H25(l1b,l2b|m3b,d1b)*-1.
    ierr=exatns_tensor_contract("Z134_2(e1,l1,l2,m1,m2,m3)+=S44(e1,d1,m1,m2)*H25(l1,l2,m3,d1)", &
        Z134_2,S44,H25,prefactor=(-1.0d0,0.0d0))
!   original expression: Z134_2(e1b,l1b,l2b|m1bm2bm3b)+=S44(e1b,d1b|m1bm3b)*H25(l1b,l2b|m2b,d1b)
    ierr=exatns_tensor_contract("Z134_2(e1,l1,l2,m1,m2,m3)+=S44(e1,d1,m1,m3)*H25(l1,l2,m2,d1)", &
        Z134_2,S44,H25,prefactor=(1.0d0,0.0d0))
!   original expression: Z134_2(e1b,l1b,l2b|m1bm2bm3b)+=S44(e1b,d1b|m2bm3b)*H25(l1b,l2b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z134_2(e1,l1,l2,m1,m2,m3)+=S44(e1,d1,m2,m3)*H25(l1,l2,m1,d1)", &
        Z134_2,S44,H25,prefactor=(-1.0d0,0.0d0))
    
    allocate(tens_id(6), tens_root(6))
    tens_id   = (/nvir_id,nvir_id,nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nvir_root,nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z86_1,"Z86_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z86_1,'ZERO')
!   original expression: Z86_1(e1be2b,l1b|m1bm2bm3b)+=S43(e1b|l2b)*Z134_2(e2b,l1b,l2b|m1bm2bm3b)
    ierr=exatns_tensor_contract("Z86_1(e1,e2,l1,m1,m2,m3)+=S43(e1,l2)*Z134_2(e2,l1,l2,m1,m2,m3)", &
        Z86_1,S43,Z134_2,prefactor=(1.0d0,0.0d0))
!   original expression: Z86_1(e1be2b,l1b|m1bm2bm3b)+=S43(e2b|l2b)*Z134_2(e1b,l1b,l2b|m1bm2bm3b)*-1.
    ierr=exatns_tensor_contract("Z86_1(e1,e2,l1,m1,m2,m3)+=S43(e2,l2)*Z134_2(e1,l1,l2,m1,m2,m3)", &
        Z86_1,S43,Z134_2,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z134_2)
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be2b|m1b,l1b)*Z86_1(e3be4b,l1b|m2bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e2,m1,l1)*Z86_1(e3,e4,l1,m2,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be3b|m1b,l1b)*Z86_1(e2be4b,l1b|m2bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e3,m1,l1)*Z86_1(e2,e4,l1,m2,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be4b|m1b,l1b)*Z86_1(e2be3b,l1b|m2bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e4,m1,l1)*Z86_1(e2,e3,l1,m2,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be3b|m1b,l1b)*Z86_1(e1be4b,l1b|m2bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e3,m1,l1)*Z86_1(e1,e4,l1,m2,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be4b|m1b,l1b)*Z86_1(e1be3b,l1b|m2bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e4,m1,l1)*Z86_1(e1,e3,l1,m2,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e3be4b|m1b,l1b)*Z86_1(e1be2b,l1b|m2bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e3,e4,m1,l1)*Z86_1(e1,e2,l1,m2,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be2b|m2b,l1b)*Z86_1(e3be4b,l1b|m1bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e2,m2,l1)*Z86_1(e3,e4,l1,m1,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be3b|m2b,l1b)*Z86_1(e2be4b,l1b|m1bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e3,m2,l1)*Z86_1(e2,e4,l1,m1,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be4b|m2b,l1b)*Z86_1(e2be3b,l1b|m1bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e4,m2,l1)*Z86_1(e2,e3,l1,m1,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be3b|m2b,l1b)*Z86_1(e1be4b,l1b|m1bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e3,m2,l1)*Z86_1(e1,e4,l1,m1,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be4b|m2b,l1b)*Z86_1(e1be3b,l1b|m1bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e4,m2,l1)*Z86_1(e1,e3,l1,m1,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e3be4b|m2b,l1b)*Z86_1(e1be2b,l1b|m1bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e3,e4,m2,l1)*Z86_1(e1,e2,l1,m1,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be2b|m3b,l1b)*Z86_1(e3be4b,l1b|m1bm2bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e2,m3,l1)*Z86_1(e3,e4,l1,m1,m2,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be3b|m3b,l1b)*Z86_1(e2be4b,l1b|m1bm2bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e3,m3,l1)*Z86_1(e2,e4,l1,m1,m2,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be4b|m3b,l1b)*Z86_1(e2be3b,l1b|m1bm2bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e4,m3,l1)*Z86_1(e2,e3,l1,m1,m2,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be3b|m3b,l1b)*Z86_1(e1be4b,l1b|m1bm2bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e3,m3,l1)*Z86_1(e1,e4,l1,m1,m2,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be4b|m3b,l1b)*Z86_1(e1be3b,l1b|m1bm2bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e4,m3,l1)*Z86_1(e1,e3,l1,m1,m2,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e3be4b|m3b,l1b)*Z86_1(e1be2b,l1b|m1bm2bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e3,e4,m3,l1)*Z86_1(e1,e2,l1,m1,m2,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be2b|m4b,l1b)*Z86_1(e3be4b,l1b|m1bm2bm3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e2,m4,l1)*Z86_1(e3,e4,l1,m1,m2,m3)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be3b|m4b,l1b)*Z86_1(e2be4b,l1b|m1bm2bm3b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e3,m4,l1)*Z86_1(e2,e4,l1,m1,m2,m3)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be4b|m4b,l1b)*Z86_1(e2be3b,l1b|m1bm2bm3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e4,m4,l1)*Z86_1(e2,e3,l1,m1,m2,m3)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be3b|m4b,l1b)*Z86_1(e1be4b,l1b|m1bm2bm3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e3,m4,l1)*Z86_1(e1,e4,l1,m1,m2,m3)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be4b|m4b,l1b)*Z86_1(e1be3b,l1b|m1bm2bm3b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e4,m4,l1)*Z86_1(e1,e3,l1,m1,m2,m3)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e3be4b|m4b,l1b)*Z86_1(e1be2b,l1b|m1bm2bm3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e3,e4,m4,l1)*Z86_1(e1,e2,l1,m1,m2,m3)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z86_1)
    
    allocate(tens_id(6), tens_root(6))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z134_2,"Z134_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z134_2,'ZERO')
!   original expression: Z134_2(e1b,l1b,l2b|m1bm2bm3b)+=S45(e1b,d1bd2b|m1bm2bm3b)*H24(l1b,l2b|d1bd2b)
    ierr=exatns_tensor_contract("Z134_2(e1,l1,l2,m1,m2,m3)+=S45(e1,d1,d2,m1,m2,m3)*H24(l1,l2,d1,d2)", &
        Z134_2,S45,H24,prefactor=(0.5d0,0.0d0))
    
    allocate(tens_id(6), tens_root(6))
    tens_id   = (/nvir_id,nvir_id,nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nvir_root,nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z86_1,"Z86_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z86_1,'ZERO')
!   original expression: Z86_1(e1be2b,l1b|m1bm2bm3b)+=S43(e1b|l2b)*Z134_2(e2b,l1b,l2b|m1bm2bm3b)
    ierr=exatns_tensor_contract("Z86_1(e1,e2,l1,m1,m2,m3)+=S43(e1,l2)*Z134_2(e2,l1,l2,m1,m2,m3)", &
        Z86_1,S43,Z134_2,prefactor=(1.0d0,0.0d0))
!   original expression: Z86_1(e1be2b,l1b|m1bm2bm3b)+=S43(e2b|l2b)*Z134_2(e1b,l1b,l2b|m1bm2bm3b)*-1.
    ierr=exatns_tensor_contract("Z86_1(e1,e2,l1,m1,m2,m3)+=S43(e2,l2)*Z134_2(e1,l1,l2,m1,m2,m3)", &
        Z86_1,S43,Z134_2,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z134_2)
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be2b|m1b,l1b)*Z86_1(e3be4b,l1b|m2bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e2,m1,l1)*Z86_1(e3,e4,l1,m2,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be3b|m1b,l1b)*Z86_1(e2be4b,l1b|m2bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e3,m1,l1)*Z86_1(e2,e4,l1,m2,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be4b|m1b,l1b)*Z86_1(e2be3b,l1b|m2bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e4,m1,l1)*Z86_1(e2,e3,l1,m2,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be3b|m1b,l1b)*Z86_1(e1be4b,l1b|m2bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e3,m1,l1)*Z86_1(e1,e4,l1,m2,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be4b|m1b,l1b)*Z86_1(e1be3b,l1b|m2bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e4,m1,l1)*Z86_1(e1,e3,l1,m2,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e3be4b|m1b,l1b)*Z86_1(e1be2b,l1b|m2bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e3,e4,m1,l1)*Z86_1(e1,e2,l1,m2,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be2b|m2b,l1b)*Z86_1(e3be4b,l1b|m1bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e2,m2,l1)*Z86_1(e3,e4,l1,m1,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be3b|m2b,l1b)*Z86_1(e2be4b,l1b|m1bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e3,m2,l1)*Z86_1(e2,e4,l1,m1,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be4b|m2b,l1b)*Z86_1(e2be3b,l1b|m1bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e4,m2,l1)*Z86_1(e2,e3,l1,m1,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be3b|m2b,l1b)*Z86_1(e1be4b,l1b|m1bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e3,m2,l1)*Z86_1(e1,e4,l1,m1,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be4b|m2b,l1b)*Z86_1(e1be3b,l1b|m1bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e4,m2,l1)*Z86_1(e1,e3,l1,m1,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e3be4b|m2b,l1b)*Z86_1(e1be2b,l1b|m1bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e3,e4,m2,l1)*Z86_1(e1,e2,l1,m1,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be2b|m3b,l1b)*Z86_1(e3be4b,l1b|m1bm2bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e2,m3,l1)*Z86_1(e3,e4,l1,m1,m2,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be3b|m3b,l1b)*Z86_1(e2be4b,l1b|m1bm2bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e3,m3,l1)*Z86_1(e2,e4,l1,m1,m2,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be4b|m3b,l1b)*Z86_1(e2be3b,l1b|m1bm2bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e4,m3,l1)*Z86_1(e2,e3,l1,m1,m2,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be3b|m3b,l1b)*Z86_1(e1be4b,l1b|m1bm2bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e3,m3,l1)*Z86_1(e1,e4,l1,m1,m2,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be4b|m3b,l1b)*Z86_1(e1be3b,l1b|m1bm2bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e4,m3,l1)*Z86_1(e1,e3,l1,m1,m2,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e3be4b|m3b,l1b)*Z86_1(e1be2b,l1b|m1bm2bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e3,e4,m3,l1)*Z86_1(e1,e2,l1,m1,m2,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be2b|m4b,l1b)*Z86_1(e3be4b,l1b|m1bm2bm3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e2,m4,l1)*Z86_1(e3,e4,l1,m1,m2,m3)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be3b|m4b,l1b)*Z86_1(e2be4b,l1b|m1bm2bm3b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e3,m4,l1)*Z86_1(e2,e4,l1,m1,m2,m3)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be4b|m4b,l1b)*Z86_1(e2be3b,l1b|m1bm2bm3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e4,m4,l1)*Z86_1(e2,e3,l1,m1,m2,m3)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be3b|m4b,l1b)*Z86_1(e1be4b,l1b|m1bm2bm3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e3,m4,l1)*Z86_1(e1,e4,l1,m1,m2,m3)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be4b|m4b,l1b)*Z86_1(e1be3b,l1b|m1bm2bm3b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e4,m4,l1)*Z86_1(e1,e3,l1,m1,m2,m3)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e3be4b|m4b,l1b)*Z86_1(e1be2b,l1b|m1bm2bm3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e3,e4,m4,l1)*Z86_1(e1,e2,l1,m1,m2,m3)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z86_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z136_2,"Z136_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z136_2,'ZERO')
!   original expression: Z136_2(e1b,l1b|m1b,d1b)+=H17(e1b,l1b|d1b,d2b)*S43(d2b|m1b)*-1.
    ierr=exatns_tensor_contract("Z136_2(e1,l1,m1,d1)+=H17(e1,l1,d1,d2)*S43(d2,m1)", &
        Z136_2,H17,S43,prefactor=(-1.0d0,0.0d0))
    
    allocate(tens_id(6), tens_root(6))
    tens_id   = (/nvir_id,nvir_id,nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nvir_root,nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z86_1,"Z86_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z86_1,'ZERO')
!   original expression: Z86_1(e1be2b,l1b|m1bm2bm3b)+=S44(e1b,d1b|m1bm2b)*Z136_2(e2b,l1b|m3b,d1b)
    ierr=exatns_tensor_contract("Z86_1(e1,e2,l1,m1,m2,m3)+=S44(e1,d1,m1,m2)*Z136_2(e2,l1,m3,d1)", &
        Z86_1,S44,Z136_2,prefactor=(1.0d0,0.0d0))
!   original expression: Z86_1(e1be2b,l1b|m1bm2bm3b)+=S44(e2b,d1b|m1bm2b)*Z136_2(e1b,l1b|m3b,d1b)*-1.
    ierr=exatns_tensor_contract("Z86_1(e1,e2,l1,m1,m2,m3)+=S44(e2,d1,m1,m2)*Z136_2(e1,l1,m3,d1)", &
        Z86_1,S44,Z136_2,prefactor=(-1.0d0,0.0d0))
!   original expression: Z86_1(e1be2b,l1b|m1bm2bm3b)+=S44(e1b,d1b|m1bm3b)*Z136_2(e2b,l1b|m2b,d1b)*-1.
    ierr=exatns_tensor_contract("Z86_1(e1,e2,l1,m1,m2,m3)+=S44(e1,d1,m1,m3)*Z136_2(e2,l1,m2,d1)", &
        Z86_1,S44,Z136_2,prefactor=(-1.0d0,0.0d0))
!   original expression: Z86_1(e1be2b,l1b|m1bm2bm3b)+=S44(e2b,d1b|m1bm3b)*Z136_2(e1b,l1b|m2b,d1b)
    ierr=exatns_tensor_contract("Z86_1(e1,e2,l1,m1,m2,m3)+=S44(e2,d1,m1,m3)*Z136_2(e1,l1,m2,d1)", &
        Z86_1,S44,Z136_2,prefactor=(1.0d0,0.0d0))
!   original expression: Z86_1(e1be2b,l1b|m1bm2bm3b)+=S44(e1b,d1b|m2bm3b)*Z136_2(e2b,l1b|m1b,d1b)
    ierr=exatns_tensor_contract("Z86_1(e1,e2,l1,m1,m2,m3)+=S44(e1,d1,m2,m3)*Z136_2(e2,l1,m1,d1)", &
        Z86_1,S44,Z136_2,prefactor=(1.0d0,0.0d0))
!   original expression: Z86_1(e1be2b,l1b|m1bm2bm3b)+=S44(e2b,d1b|m2bm3b)*Z136_2(e1b,l1b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z86_1(e1,e2,l1,m1,m2,m3)+=S44(e2,d1,m2,m3)*Z136_2(e1,l1,m1,d1)", &
        Z86_1,S44,Z136_2,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z136_2)
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be2b|m1b,l1b)*Z86_1(e3be4b,l1b|m2bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e2,m1,l1)*Z86_1(e3,e4,l1,m2,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be3b|m1b,l1b)*Z86_1(e2be4b,l1b|m2bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e3,m1,l1)*Z86_1(e2,e4,l1,m2,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be4b|m1b,l1b)*Z86_1(e2be3b,l1b|m2bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e4,m1,l1)*Z86_1(e2,e3,l1,m2,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be3b|m1b,l1b)*Z86_1(e1be4b,l1b|m2bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e3,m1,l1)*Z86_1(e1,e4,l1,m2,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be4b|m1b,l1b)*Z86_1(e1be3b,l1b|m2bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e4,m1,l1)*Z86_1(e1,e3,l1,m2,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e3be4b|m1b,l1b)*Z86_1(e1be2b,l1b|m2bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e3,e4,m1,l1)*Z86_1(e1,e2,l1,m2,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be2b|m2b,l1b)*Z86_1(e3be4b,l1b|m1bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e2,m2,l1)*Z86_1(e3,e4,l1,m1,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be3b|m2b,l1b)*Z86_1(e2be4b,l1b|m1bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e3,m2,l1)*Z86_1(e2,e4,l1,m1,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be4b|m2b,l1b)*Z86_1(e2be3b,l1b|m1bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e4,m2,l1)*Z86_1(e2,e3,l1,m1,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be3b|m2b,l1b)*Z86_1(e1be4b,l1b|m1bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e3,m2,l1)*Z86_1(e1,e4,l1,m1,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be4b|m2b,l1b)*Z86_1(e1be3b,l1b|m1bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e4,m2,l1)*Z86_1(e1,e3,l1,m1,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e3be4b|m2b,l1b)*Z86_1(e1be2b,l1b|m1bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e3,e4,m2,l1)*Z86_1(e1,e2,l1,m1,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be2b|m3b,l1b)*Z86_1(e3be4b,l1b|m1bm2bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e2,m3,l1)*Z86_1(e3,e4,l1,m1,m2,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be3b|m3b,l1b)*Z86_1(e2be4b,l1b|m1bm2bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e3,m3,l1)*Z86_1(e2,e4,l1,m1,m2,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be4b|m3b,l1b)*Z86_1(e2be3b,l1b|m1bm2bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e4,m3,l1)*Z86_1(e2,e3,l1,m1,m2,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be3b|m3b,l1b)*Z86_1(e1be4b,l1b|m1bm2bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e3,m3,l1)*Z86_1(e1,e4,l1,m1,m2,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be4b|m3b,l1b)*Z86_1(e1be3b,l1b|m1bm2bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e4,m3,l1)*Z86_1(e1,e3,l1,m1,m2,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e3be4b|m3b,l1b)*Z86_1(e1be2b,l1b|m1bm2bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e3,e4,m3,l1)*Z86_1(e1,e2,l1,m1,m2,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be2b|m4b,l1b)*Z86_1(e3be4b,l1b|m1bm2bm3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e2,m4,l1)*Z86_1(e3,e4,l1,m1,m2,m3)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be3b|m4b,l1b)*Z86_1(e2be4b,l1b|m1bm2bm3b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e3,m4,l1)*Z86_1(e2,e4,l1,m1,m2,m3)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be4b|m4b,l1b)*Z86_1(e2be3b,l1b|m1bm2bm3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e4,m4,l1)*Z86_1(e2,e3,l1,m1,m2,m3)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be3b|m4b,l1b)*Z86_1(e1be4b,l1b|m1bm2bm3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e3,m4,l1)*Z86_1(e1,e4,l1,m1,m2,m3)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be4b|m4b,l1b)*Z86_1(e1be3b,l1b|m1bm2bm3b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e4,m4,l1)*Z86_1(e1,e3,l1,m1,m2,m3)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e3be4b|m4b,l1b)*Z86_1(e1be2b,l1b|m1bm2bm3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e3,e4,m4,l1)*Z86_1(e1,e2,l1,m1,m2,m3)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z86_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z136_2,"Z136_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z136_2,'ZERO')
!   original expression: Z136_2(e1b,l1b|m1b,d1b)+=S44(e1b,d2b|m1b,l2b)*H24(l1b,l2b|d1b,d2b)
    ierr=exatns_tensor_contract("Z136_2(e1,l1,m1,d1)+=S44(e1,d2,m1,l2)*H24(l1,l2,d1,d2)", &
        Z136_2,S44,H24,prefactor=(1.0d0,0.0d0))
    
    allocate(tens_id(6), tens_root(6))
    tens_id   = (/nvir_id,nvir_id,nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nvir_root,nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z86_1,"Z86_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z86_1,'ZERO')
!   original expression: Z86_1(e1be2b,l1b|m1bm2bm3b)+=S44(e1b,d1b|m1bm2b)*Z136_2(e2b,l1b|m3b,d1b)
    ierr=exatns_tensor_contract("Z86_1(e1,e2,l1,m1,m2,m3)+=S44(e1,d1,m1,m2)*Z136_2(e2,l1,m3,d1)", &
        Z86_1,S44,Z136_2,prefactor=(1.0d0,0.0d0))
!   original expression: Z86_1(e1be2b,l1b|m1bm2bm3b)+=S44(e2b,d1b|m1bm2b)*Z136_2(e1b,l1b|m3b,d1b)*-1.
    ierr=exatns_tensor_contract("Z86_1(e1,e2,l1,m1,m2,m3)+=S44(e2,d1,m1,m2)*Z136_2(e1,l1,m3,d1)", &
        Z86_1,S44,Z136_2,prefactor=(-1.0d0,0.0d0))
!   original expression: Z86_1(e1be2b,l1b|m1bm2bm3b)+=S44(e1b,d1b|m1bm3b)*Z136_2(e2b,l1b|m2b,d1b)*-1.
    ierr=exatns_tensor_contract("Z86_1(e1,e2,l1,m1,m2,m3)+=S44(e1,d1,m1,m3)*Z136_2(e2,l1,m2,d1)", &
        Z86_1,S44,Z136_2,prefactor=(-1.0d0,0.0d0))
!   original expression: Z86_1(e1be2b,l1b|m1bm2bm3b)+=S44(e2b,d1b|m1bm3b)*Z136_2(e1b,l1b|m2b,d1b)
    ierr=exatns_tensor_contract("Z86_1(e1,e2,l1,m1,m2,m3)+=S44(e2,d1,m1,m3)*Z136_2(e1,l1,m2,d1)", &
        Z86_1,S44,Z136_2,prefactor=(1.0d0,0.0d0))
!   original expression: Z86_1(e1be2b,l1b|m1bm2bm3b)+=S44(e1b,d1b|m2bm3b)*Z136_2(e2b,l1b|m1b,d1b)
    ierr=exatns_tensor_contract("Z86_1(e1,e2,l1,m1,m2,m3)+=S44(e1,d1,m2,m3)*Z136_2(e2,l1,m1,d1)", &
        Z86_1,S44,Z136_2,prefactor=(1.0d0,0.0d0))
!   original expression: Z86_1(e1be2b,l1b|m1bm2bm3b)+=S44(e2b,d1b|m2bm3b)*Z136_2(e1b,l1b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z86_1(e1,e2,l1,m1,m2,m3)+=S44(e2,d1,m2,m3)*Z136_2(e1,l1,m1,d1)", &
        Z86_1,S44,Z136_2,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z136_2)
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be2b|m1b,l1b)*Z86_1(e3be4b,l1b|m2bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e2,m1,l1)*Z86_1(e3,e4,l1,m2,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be3b|m1b,l1b)*Z86_1(e2be4b,l1b|m2bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e3,m1,l1)*Z86_1(e2,e4,l1,m2,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be4b|m1b,l1b)*Z86_1(e2be3b,l1b|m2bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e4,m1,l1)*Z86_1(e2,e3,l1,m2,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be3b|m1b,l1b)*Z86_1(e1be4b,l1b|m2bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e3,m1,l1)*Z86_1(e1,e4,l1,m2,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be4b|m1b,l1b)*Z86_1(e1be3b,l1b|m2bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e4,m1,l1)*Z86_1(e1,e3,l1,m2,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e3be4b|m1b,l1b)*Z86_1(e1be2b,l1b|m2bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e3,e4,m1,l1)*Z86_1(e1,e2,l1,m2,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be2b|m2b,l1b)*Z86_1(e3be4b,l1b|m1bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e2,m2,l1)*Z86_1(e3,e4,l1,m1,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be3b|m2b,l1b)*Z86_1(e2be4b,l1b|m1bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e3,m2,l1)*Z86_1(e2,e4,l1,m1,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be4b|m2b,l1b)*Z86_1(e2be3b,l1b|m1bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e4,m2,l1)*Z86_1(e2,e3,l1,m1,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be3b|m2b,l1b)*Z86_1(e1be4b,l1b|m1bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e3,m2,l1)*Z86_1(e1,e4,l1,m1,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be4b|m2b,l1b)*Z86_1(e1be3b,l1b|m1bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e4,m2,l1)*Z86_1(e1,e3,l1,m1,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e3be4b|m2b,l1b)*Z86_1(e1be2b,l1b|m1bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e3,e4,m2,l1)*Z86_1(e1,e2,l1,m1,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be2b|m3b,l1b)*Z86_1(e3be4b,l1b|m1bm2bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e2,m3,l1)*Z86_1(e3,e4,l1,m1,m2,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be3b|m3b,l1b)*Z86_1(e2be4b,l1b|m1bm2bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e3,m3,l1)*Z86_1(e2,e4,l1,m1,m2,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be4b|m3b,l1b)*Z86_1(e2be3b,l1b|m1bm2bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e4,m3,l1)*Z86_1(e2,e3,l1,m1,m2,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be3b|m3b,l1b)*Z86_1(e1be4b,l1b|m1bm2bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e3,m3,l1)*Z86_1(e1,e4,l1,m1,m2,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be4b|m3b,l1b)*Z86_1(e1be3b,l1b|m1bm2bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e4,m3,l1)*Z86_1(e1,e3,l1,m1,m2,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e3be4b|m3b,l1b)*Z86_1(e1be2b,l1b|m1bm2bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e3,e4,m3,l1)*Z86_1(e1,e2,l1,m1,m2,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be2b|m4b,l1b)*Z86_1(e3be4b,l1b|m1bm2bm3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e2,m4,l1)*Z86_1(e3,e4,l1,m1,m2,m3)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be3b|m4b,l1b)*Z86_1(e2be4b,l1b|m1bm2bm3b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e3,m4,l1)*Z86_1(e2,e4,l1,m1,m2,m3)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be4b|m4b,l1b)*Z86_1(e2be3b,l1b|m1bm2bm3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e4,m4,l1)*Z86_1(e2,e3,l1,m1,m2,m3)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be3b|m4b,l1b)*Z86_1(e1be4b,l1b|m1bm2bm3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e3,m4,l1)*Z86_1(e1,e4,l1,m1,m2,m3)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be4b|m4b,l1b)*Z86_1(e1be3b,l1b|m1bm2bm3b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e4,m4,l1)*Z86_1(e1,e3,l1,m1,m2,m3)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e3be4b|m4b,l1b)*Z86_1(e1be2b,l1b|m1bm2bm3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e3,e4,m4,l1)*Z86_1(e1,e2,l1,m1,m2,m3)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z86_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z136_2,"Z136_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z136_2,'ZERO')
    
    allocate(tens_id(6), tens_root(6))
    tens_id   = (/nvir_id,nvir_id,nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nvir_root,nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z86_1,"Z86_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z86_1,'ZERO')
!   original expression: Z86_1(e1be2b,l1b|m1bm2bm3b)+=S44(e1b,d1b|m1bm2b)*Z136_2(e2b,l1b|m3b,d1b)
    ierr=exatns_tensor_contract("Z86_1(e1,e2,l1,m1,m2,m3)+=S44(e1,d1,m1,m2)*Z136_2(e2,l1,m3,d1)", &
        Z86_1,S44,Z136_2,prefactor=(1.0d0,0.0d0))
!   original expression: Z86_1(e1be2b,l1b|m1bm2bm3b)+=S44(e2b,d1b|m1bm2b)*Z136_2(e1b,l1b|m3b,d1b)*-1.
    ierr=exatns_tensor_contract("Z86_1(e1,e2,l1,m1,m2,m3)+=S44(e2,d1,m1,m2)*Z136_2(e1,l1,m3,d1)", &
        Z86_1,S44,Z136_2,prefactor=(-1.0d0,0.0d0))
!   original expression: Z86_1(e1be2b,l1b|m1bm2bm3b)+=S44(e1b,d1b|m1bm3b)*Z136_2(e2b,l1b|m2b,d1b)*-1.
    ierr=exatns_tensor_contract("Z86_1(e1,e2,l1,m1,m2,m3)+=S44(e1,d1,m1,m3)*Z136_2(e2,l1,m2,d1)", &
        Z86_1,S44,Z136_2,prefactor=(-1.0d0,0.0d0))
!   original expression: Z86_1(e1be2b,l1b|m1bm2bm3b)+=S44(e2b,d1b|m1bm3b)*Z136_2(e1b,l1b|m2b,d1b)
    ierr=exatns_tensor_contract("Z86_1(e1,e2,l1,m1,m2,m3)+=S44(e2,d1,m1,m3)*Z136_2(e1,l1,m2,d1)", &
        Z86_1,S44,Z136_2,prefactor=(1.0d0,0.0d0))
!   original expression: Z86_1(e1be2b,l1b|m1bm2bm3b)+=S44(e1b,d1b|m2bm3b)*Z136_2(e2b,l1b|m1b,d1b)
    ierr=exatns_tensor_contract("Z86_1(e1,e2,l1,m1,m2,m3)+=S44(e1,d1,m2,m3)*Z136_2(e2,l1,m1,d1)", &
        Z86_1,S44,Z136_2,prefactor=(1.0d0,0.0d0))
!   original expression: Z86_1(e1be2b,l1b|m1bm2bm3b)+=S44(e2b,d1b|m2bm3b)*Z136_2(e1b,l1b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z86_1(e1,e2,l1,m1,m2,m3)+=S44(e2,d1,m2,m3)*Z136_2(e1,l1,m1,d1)", &
        Z86_1,S44,Z136_2,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z136_2)
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be2b|m1b,l1b)*Z86_1(e3be4b,l1b|m2bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e2,m1,l1)*Z86_1(e3,e4,l1,m2,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be3b|m1b,l1b)*Z86_1(e2be4b,l1b|m2bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e3,m1,l1)*Z86_1(e2,e4,l1,m2,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be4b|m1b,l1b)*Z86_1(e2be3b,l1b|m2bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e4,m1,l1)*Z86_1(e2,e3,l1,m2,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be3b|m1b,l1b)*Z86_1(e1be4b,l1b|m2bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e3,m1,l1)*Z86_1(e1,e4,l1,m2,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be4b|m1b,l1b)*Z86_1(e1be3b,l1b|m2bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e4,m1,l1)*Z86_1(e1,e3,l1,m2,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e3be4b|m1b,l1b)*Z86_1(e1be2b,l1b|m2bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e3,e4,m1,l1)*Z86_1(e1,e2,l1,m2,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be2b|m2b,l1b)*Z86_1(e3be4b,l1b|m1bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e2,m2,l1)*Z86_1(e3,e4,l1,m1,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be3b|m2b,l1b)*Z86_1(e2be4b,l1b|m1bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e3,m2,l1)*Z86_1(e2,e4,l1,m1,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be4b|m2b,l1b)*Z86_1(e2be3b,l1b|m1bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e4,m2,l1)*Z86_1(e2,e3,l1,m1,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be3b|m2b,l1b)*Z86_1(e1be4b,l1b|m1bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e3,m2,l1)*Z86_1(e1,e4,l1,m1,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be4b|m2b,l1b)*Z86_1(e1be3b,l1b|m1bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e4,m2,l1)*Z86_1(e1,e3,l1,m1,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e3be4b|m2b,l1b)*Z86_1(e1be2b,l1b|m1bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e3,e4,m2,l1)*Z86_1(e1,e2,l1,m1,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be2b|m3b,l1b)*Z86_1(e3be4b,l1b|m1bm2bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e2,m3,l1)*Z86_1(e3,e4,l1,m1,m2,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be3b|m3b,l1b)*Z86_1(e2be4b,l1b|m1bm2bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e3,m3,l1)*Z86_1(e2,e4,l1,m1,m2,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be4b|m3b,l1b)*Z86_1(e2be3b,l1b|m1bm2bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e4,m3,l1)*Z86_1(e2,e3,l1,m1,m2,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be3b|m3b,l1b)*Z86_1(e1be4b,l1b|m1bm2bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e3,m3,l1)*Z86_1(e1,e4,l1,m1,m2,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be4b|m3b,l1b)*Z86_1(e1be3b,l1b|m1bm2bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e4,m3,l1)*Z86_1(e1,e3,l1,m1,m2,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e3be4b|m3b,l1b)*Z86_1(e1be2b,l1b|m1bm2bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e3,e4,m3,l1)*Z86_1(e1,e2,l1,m1,m2,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be2b|m4b,l1b)*Z86_1(e3be4b,l1b|m1bm2bm3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e2,m4,l1)*Z86_1(e3,e4,l1,m1,m2,m3)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be3b|m4b,l1b)*Z86_1(e2be4b,l1b|m1bm2bm3b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e3,m4,l1)*Z86_1(e2,e4,l1,m1,m2,m3)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be4b|m4b,l1b)*Z86_1(e2be3b,l1b|m1bm2bm3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e4,m4,l1)*Z86_1(e2,e3,l1,m1,m2,m3)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be3b|m4b,l1b)*Z86_1(e1be4b,l1b|m1bm2bm3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e3,m4,l1)*Z86_1(e1,e4,l1,m1,m2,m3)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be4b|m4b,l1b)*Z86_1(e1be3b,l1b|m1bm2bm3b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e4,m4,l1)*Z86_1(e1,e3,l1,m1,m2,m3)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e3be4b|m4b,l1b)*Z86_1(e1be2b,l1b|m1bm2bm3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e3,e4,m4,l1)*Z86_1(e1,e2,l1,m1,m2,m3)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z86_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z127_2,"Z127_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z127_2,'ZERO')
!   original expression: Z127_2(l1b,l2b|m1bm2b)+=H24(l1b,l2b|d1bd2b)*S44(d1bd2b|m1bm2b)*-0.5
    ierr=exatns_tensor_contract("Z127_2(l1,l2,m1,m2)+=H24(l1,l2,d1,d2)*S44(d1,d2,m1,m2)", &
        Z127_2,H24,S44,prefactor=(-0.25d0,0.0d0))
    
    allocate(tens_id(6), tens_root(6))
    tens_id   = (/nvir_id,nvir_id,nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nvir_root,nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z86_1,"Z86_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z86_1,'ZERO')
!   original expression: Z86_1(e1be2b,l1b|m1bm2bm3b)+=S44(e1be2b|m1b,l2b)*Z127_2(l1b,l2b|m2bm3b)
    ierr=exatns_tensor_contract("Z86_1(e1,e2,l1,m1,m2,m3)+=S44(e1,e2,m1,l2)*Z127_2(l1,l2,m2,m3)", &
        Z86_1,S44,Z127_2,prefactor=(1.0d0,0.0d0))
!   original expression: Z86_1(e1be2b,l1b|m1bm2bm3b)+=S44(e1be2b|m2b,l2b)*Z127_2(l1b,l2b|m1bm3b)*-1.
    ierr=exatns_tensor_contract("Z86_1(e1,e2,l1,m1,m2,m3)+=S44(e1,e2,m2,l2)*Z127_2(l1,l2,m1,m3)", &
        Z86_1,S44,Z127_2,prefactor=(-1.0d0,0.0d0))
!   original expression: Z86_1(e1be2b,l1b|m1bm2bm3b)+=S44(e1be2b|m3b,l2b)*Z127_2(l1b,l2b|m1bm2b)
    ierr=exatns_tensor_contract("Z86_1(e1,e2,l1,m1,m2,m3)+=S44(e1,e2,m3,l2)*Z127_2(l1,l2,m1,m2)", &
        Z86_1,S44,Z127_2,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z127_2)
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be2b|m1b,l1b)*Z86_1(e3be4b,l1b|m2bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e2,m1,l1)*Z86_1(e3,e4,l1,m2,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be3b|m1b,l1b)*Z86_1(e2be4b,l1b|m2bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e3,m1,l1)*Z86_1(e2,e4,l1,m2,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be4b|m1b,l1b)*Z86_1(e2be3b,l1b|m2bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e4,m1,l1)*Z86_1(e2,e3,l1,m2,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be3b|m1b,l1b)*Z86_1(e1be4b,l1b|m2bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e3,m1,l1)*Z86_1(e1,e4,l1,m2,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be4b|m1b,l1b)*Z86_1(e1be3b,l1b|m2bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e4,m1,l1)*Z86_1(e1,e3,l1,m2,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e3be4b|m1b,l1b)*Z86_1(e1be2b,l1b|m2bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e3,e4,m1,l1)*Z86_1(e1,e2,l1,m2,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be2b|m2b,l1b)*Z86_1(e3be4b,l1b|m1bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e2,m2,l1)*Z86_1(e3,e4,l1,m1,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be3b|m2b,l1b)*Z86_1(e2be4b,l1b|m1bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e3,m2,l1)*Z86_1(e2,e4,l1,m1,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be4b|m2b,l1b)*Z86_1(e2be3b,l1b|m1bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e4,m2,l1)*Z86_1(e2,e3,l1,m1,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be3b|m2b,l1b)*Z86_1(e1be4b,l1b|m1bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e3,m2,l1)*Z86_1(e1,e4,l1,m1,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be4b|m2b,l1b)*Z86_1(e1be3b,l1b|m1bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e4,m2,l1)*Z86_1(e1,e3,l1,m1,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e3be4b|m2b,l1b)*Z86_1(e1be2b,l1b|m1bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e3,e4,m2,l1)*Z86_1(e1,e2,l1,m1,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be2b|m3b,l1b)*Z86_1(e3be4b,l1b|m1bm2bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e2,m3,l1)*Z86_1(e3,e4,l1,m1,m2,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be3b|m3b,l1b)*Z86_1(e2be4b,l1b|m1bm2bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e3,m3,l1)*Z86_1(e2,e4,l1,m1,m2,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be4b|m3b,l1b)*Z86_1(e2be3b,l1b|m1bm2bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e4,m3,l1)*Z86_1(e2,e3,l1,m1,m2,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be3b|m3b,l1b)*Z86_1(e1be4b,l1b|m1bm2bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e3,m3,l1)*Z86_1(e1,e4,l1,m1,m2,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be4b|m3b,l1b)*Z86_1(e1be3b,l1b|m1bm2bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e4,m3,l1)*Z86_1(e1,e3,l1,m1,m2,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e3be4b|m3b,l1b)*Z86_1(e1be2b,l1b|m1bm2bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e3,e4,m3,l1)*Z86_1(e1,e2,l1,m1,m2,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be2b|m4b,l1b)*Z86_1(e3be4b,l1b|m1bm2bm3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e2,m4,l1)*Z86_1(e3,e4,l1,m1,m2,m3)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be3b|m4b,l1b)*Z86_1(e2be4b,l1b|m1bm2bm3b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e3,m4,l1)*Z86_1(e2,e4,l1,m1,m2,m3)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be4b|m4b,l1b)*Z86_1(e2be3b,l1b|m1bm2bm3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e4,m4,l1)*Z86_1(e2,e3,l1,m1,m2,m3)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be3b|m4b,l1b)*Z86_1(e1be4b,l1b|m1bm2bm3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e3,m4,l1)*Z86_1(e1,e4,l1,m1,m2,m3)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be4b|m4b,l1b)*Z86_1(e1be3b,l1b|m1bm2bm3b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e4,m4,l1)*Z86_1(e1,e3,l1,m1,m2,m3)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e3be4b|m4b,l1b)*Z86_1(e1be2b,l1b|m1bm2bm3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e3,e4,m4,l1)*Z86_1(e1,e2,l1,m1,m2,m3)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z86_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z127_2,"Z127_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z127_2,'ZERO')
!   original expression: Z127_2(l1b,l2b|m1bm2b)+=H25(l1b,l2b|m1b,d1b)*S43(d1b|m2b)*-0.5
    ierr=exatns_tensor_contract("Z127_2(l1,l2,m1,m2)+=H25(l1,l2,m1,d1)*S43(d1,m2)", &
        Z127_2,H25,S43,prefactor=(-0.5d0,0.0d0))
!   original expression: Z127_2(l1b,l2b|m1bm2b)+=H25(l1b,l2b|m2b,d1b)*S43(d1b|m1b)*+0.5
    ierr=exatns_tensor_contract("Z127_2(l1,l2,m1,m2)+=H25(l1,l2,m2,d1)*S43(d1,m1)", &
        Z127_2,H25,S43,prefactor=(0.5d0,0.0d0))
    
    allocate(tens_id(6), tens_root(6))
    tens_id   = (/nvir_id,nvir_id,nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nvir_root,nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z86_1,"Z86_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z86_1,'ZERO')
!   original expression: Z86_1(e1be2b,l1b|m1bm2bm3b)+=S44(e1be2b|m1b,l2b)*Z127_2(l1b,l2b|m2bm3b)
    ierr=exatns_tensor_contract("Z86_1(e1,e2,l1,m1,m2,m3)+=S44(e1,e2,m1,l2)*Z127_2(l1,l2,m2,m3)", &
        Z86_1,S44,Z127_2,prefactor=(1.0d0,0.0d0))
!   original expression: Z86_1(e1be2b,l1b|m1bm2bm3b)+=S44(e1be2b|m2b,l2b)*Z127_2(l1b,l2b|m1bm3b)*-1.
    ierr=exatns_tensor_contract("Z86_1(e1,e2,l1,m1,m2,m3)+=S44(e1,e2,m2,l2)*Z127_2(l1,l2,m1,m3)", &
        Z86_1,S44,Z127_2,prefactor=(-1.0d0,0.0d0))
!   original expression: Z86_1(e1be2b,l1b|m1bm2bm3b)+=S44(e1be2b|m3b,l2b)*Z127_2(l1b,l2b|m1bm2b)
    ierr=exatns_tensor_contract("Z86_1(e1,e2,l1,m1,m2,m3)+=S44(e1,e2,m3,l2)*Z127_2(l1,l2,m1,m2)", &
        Z86_1,S44,Z127_2,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z127_2)
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be2b|m1b,l1b)*Z86_1(e3be4b,l1b|m2bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e2,m1,l1)*Z86_1(e3,e4,l1,m2,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be3b|m1b,l1b)*Z86_1(e2be4b,l1b|m2bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e3,m1,l1)*Z86_1(e2,e4,l1,m2,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be4b|m1b,l1b)*Z86_1(e2be3b,l1b|m2bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e4,m1,l1)*Z86_1(e2,e3,l1,m2,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be3b|m1b,l1b)*Z86_1(e1be4b,l1b|m2bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e3,m1,l1)*Z86_1(e1,e4,l1,m2,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be4b|m1b,l1b)*Z86_1(e1be3b,l1b|m2bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e4,m1,l1)*Z86_1(e1,e3,l1,m2,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e3be4b|m1b,l1b)*Z86_1(e1be2b,l1b|m2bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e3,e4,m1,l1)*Z86_1(e1,e2,l1,m2,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be2b|m2b,l1b)*Z86_1(e3be4b,l1b|m1bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e2,m2,l1)*Z86_1(e3,e4,l1,m1,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be3b|m2b,l1b)*Z86_1(e2be4b,l1b|m1bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e3,m2,l1)*Z86_1(e2,e4,l1,m1,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be4b|m2b,l1b)*Z86_1(e2be3b,l1b|m1bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e4,m2,l1)*Z86_1(e2,e3,l1,m1,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be3b|m2b,l1b)*Z86_1(e1be4b,l1b|m1bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e3,m2,l1)*Z86_1(e1,e4,l1,m1,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be4b|m2b,l1b)*Z86_1(e1be3b,l1b|m1bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e4,m2,l1)*Z86_1(e1,e3,l1,m1,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e3be4b|m2b,l1b)*Z86_1(e1be2b,l1b|m1bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e3,e4,m2,l1)*Z86_1(e1,e2,l1,m1,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be2b|m3b,l1b)*Z86_1(e3be4b,l1b|m1bm2bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e2,m3,l1)*Z86_1(e3,e4,l1,m1,m2,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be3b|m3b,l1b)*Z86_1(e2be4b,l1b|m1bm2bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e3,m3,l1)*Z86_1(e2,e4,l1,m1,m2,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be4b|m3b,l1b)*Z86_1(e2be3b,l1b|m1bm2bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e4,m3,l1)*Z86_1(e2,e3,l1,m1,m2,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be3b|m3b,l1b)*Z86_1(e1be4b,l1b|m1bm2bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e3,m3,l1)*Z86_1(e1,e4,l1,m1,m2,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be4b|m3b,l1b)*Z86_1(e1be3b,l1b|m1bm2bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e4,m3,l1)*Z86_1(e1,e3,l1,m1,m2,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e3be4b|m3b,l1b)*Z86_1(e1be2b,l1b|m1bm2bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e3,e4,m3,l1)*Z86_1(e1,e2,l1,m1,m2,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be2b|m4b,l1b)*Z86_1(e3be4b,l1b|m1bm2bm3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e2,m4,l1)*Z86_1(e3,e4,l1,m1,m2,m3)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be3b|m4b,l1b)*Z86_1(e2be4b,l1b|m1bm2bm3b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e3,m4,l1)*Z86_1(e2,e4,l1,m1,m2,m3)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be4b|m4b,l1b)*Z86_1(e2be3b,l1b|m1bm2bm3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e4,m4,l1)*Z86_1(e2,e3,l1,m1,m2,m3)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be3b|m4b,l1b)*Z86_1(e1be4b,l1b|m1bm2bm3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e3,m4,l1)*Z86_1(e1,e4,l1,m1,m2,m3)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be4b|m4b,l1b)*Z86_1(e1be3b,l1b|m1bm2bm3b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e4,m4,l1)*Z86_1(e1,e3,l1,m1,m2,m3)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e3be4b|m4b,l1b)*Z86_1(e1be2b,l1b|m1bm2bm3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e3,e4,m4,l1)*Z86_1(e1,e2,l1,m1,m2,m3)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z86_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z165_3,"Z165_3",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z165_3,'ZERO')
!   original expression: Z165_3(l1b,l2b|m1b,d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|m1b)*-0.25
    ierr=exatns_tensor_contract("Z165_3(l1,l2,m1,d1)+=H24(l1,l2,d1,d2)*S43(d2,m1)", &
        Z165_3,H24,S43,prefactor=(-0.25d0,0.0d0))
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z127_2,"Z127_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z127_2,'ZERO')
!   original expression: Z127_2(l1b,l2b|m1bm2b)+=S43(d1b|m1b)*Z165_3(l1b,l2b|m2b,d1b)
    ierr=exatns_tensor_contract("Z127_2(l1,l2,m1,m2)+=S43(d1,m1)*Z165_3(l1,l2,m2,d1)", &
        Z127_2,S43,Z165_3,prefactor=(1.0d0,0.0d0))
!   original expression: Z127_2(l1b,l2b|m1bm2b)+=S43(d1b|m2b)*Z165_3(l1b,l2b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z127_2(l1,l2,m1,m2)+=S43(d1,m2)*Z165_3(l1,l2,m1,d1)", &
        Z127_2,S43,Z165_3,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z165_3)
    
    allocate(tens_id(6), tens_root(6))
    tens_id   = (/nvir_id,nvir_id,nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nvir_root,nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z86_1,"Z86_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z86_1,'ZERO')
!   original expression: Z86_1(e1be2b,l1b|m1bm2bm3b)+=S44(e1be2b|m1b,l2b)*Z127_2(l1b,l2b|m2bm3b)
    ierr=exatns_tensor_contract("Z86_1(e1,e2,l1,m1,m2,m3)+=S44(e1,e2,m1,l2)*Z127_2(l1,l2,m2,m3)", &
        Z86_1,S44,Z127_2,prefactor=(1.0d0,0.0d0))
!   original expression: Z86_1(e1be2b,l1b|m1bm2bm3b)+=S44(e1be2b|m2b,l2b)*Z127_2(l1b,l2b|m1bm3b)*-1.
    ierr=exatns_tensor_contract("Z86_1(e1,e2,l1,m1,m2,m3)+=S44(e1,e2,m2,l2)*Z127_2(l1,l2,m1,m3)", &
        Z86_1,S44,Z127_2,prefactor=(-1.0d0,0.0d0))
!   original expression: Z86_1(e1be2b,l1b|m1bm2bm3b)+=S44(e1be2b|m3b,l2b)*Z127_2(l1b,l2b|m1bm2b)
    ierr=exatns_tensor_contract("Z86_1(e1,e2,l1,m1,m2,m3)+=S44(e1,e2,m3,l2)*Z127_2(l1,l2,m1,m2)", &
        Z86_1,S44,Z127_2,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z127_2)
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be2b|m1b,l1b)*Z86_1(e3be4b,l1b|m2bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e2,m1,l1)*Z86_1(e3,e4,l1,m2,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be3b|m1b,l1b)*Z86_1(e2be4b,l1b|m2bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e3,m1,l1)*Z86_1(e2,e4,l1,m2,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be4b|m1b,l1b)*Z86_1(e2be3b,l1b|m2bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e4,m1,l1)*Z86_1(e2,e3,l1,m2,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be3b|m1b,l1b)*Z86_1(e1be4b,l1b|m2bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e3,m1,l1)*Z86_1(e1,e4,l1,m2,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be4b|m1b,l1b)*Z86_1(e1be3b,l1b|m2bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e4,m1,l1)*Z86_1(e1,e3,l1,m2,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e3be4b|m1b,l1b)*Z86_1(e1be2b,l1b|m2bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e3,e4,m1,l1)*Z86_1(e1,e2,l1,m2,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be2b|m2b,l1b)*Z86_1(e3be4b,l1b|m1bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e2,m2,l1)*Z86_1(e3,e4,l1,m1,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be3b|m2b,l1b)*Z86_1(e2be4b,l1b|m1bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e3,m2,l1)*Z86_1(e2,e4,l1,m1,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be4b|m2b,l1b)*Z86_1(e2be3b,l1b|m1bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e4,m2,l1)*Z86_1(e2,e3,l1,m1,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be3b|m2b,l1b)*Z86_1(e1be4b,l1b|m1bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e3,m2,l1)*Z86_1(e1,e4,l1,m1,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be4b|m2b,l1b)*Z86_1(e1be3b,l1b|m1bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e4,m2,l1)*Z86_1(e1,e3,l1,m1,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e3be4b|m2b,l1b)*Z86_1(e1be2b,l1b|m1bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e3,e4,m2,l1)*Z86_1(e1,e2,l1,m1,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be2b|m3b,l1b)*Z86_1(e3be4b,l1b|m1bm2bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e2,m3,l1)*Z86_1(e3,e4,l1,m1,m2,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be3b|m3b,l1b)*Z86_1(e2be4b,l1b|m1bm2bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e3,m3,l1)*Z86_1(e2,e4,l1,m1,m2,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be4b|m3b,l1b)*Z86_1(e2be3b,l1b|m1bm2bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e4,m3,l1)*Z86_1(e2,e3,l1,m1,m2,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be3b|m3b,l1b)*Z86_1(e1be4b,l1b|m1bm2bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e3,m3,l1)*Z86_1(e1,e4,l1,m1,m2,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be4b|m3b,l1b)*Z86_1(e1be3b,l1b|m1bm2bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e4,m3,l1)*Z86_1(e1,e3,l1,m1,m2,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e3be4b|m3b,l1b)*Z86_1(e1be2b,l1b|m1bm2bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e3,e4,m3,l1)*Z86_1(e1,e2,l1,m1,m2,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be2b|m4b,l1b)*Z86_1(e3be4b,l1b|m1bm2bm3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e2,m4,l1)*Z86_1(e3,e4,l1,m1,m2,m3)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be3b|m4b,l1b)*Z86_1(e2be4b,l1b|m1bm2bm3b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e3,m4,l1)*Z86_1(e2,e4,l1,m1,m2,m3)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be4b|m4b,l1b)*Z86_1(e2be3b,l1b|m1bm2bm3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e4,m4,l1)*Z86_1(e2,e3,l1,m1,m2,m3)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be3b|m4b,l1b)*Z86_1(e1be4b,l1b|m1bm2bm3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e3,m4,l1)*Z86_1(e1,e4,l1,m1,m2,m3)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be4b|m4b,l1b)*Z86_1(e1be3b,l1b|m1bm2bm3b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e4,m4,l1)*Z86_1(e1,e3,l1,m1,m2,m3)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e3be4b|m4b,l1b)*Z86_1(e1be2b,l1b|m1bm2bm3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e3,e4,m4,l1)*Z86_1(e1,e2,l1,m1,m2,m3)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z86_1)
    
    allocate(tens_id(6), tens_root(6))
    tens_id   = (/nvir_id,nvir_id,nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nvir_root,nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z86_1,"Z86_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z86_1,'ZERO')
!   original expression: Z86_1(e1be2b,l1b|m1bm2bm3b)+=S44(e1be2b|m1b,l2b)*H26(l1b,l2b|m2bm3b)*-0.5
    ierr=exatns_tensor_contract("Z86_1(e1,e2,l1,m1,m2,m3)+=S44(e1,e2,m1,l2)*H26(l1,l2,m2,m3)", &
        Z86_1,S44,H26,prefactor=(-0.5d0,0.0d0))
!   original expression: Z86_1(e1be2b,l1b|m1bm2bm3b)+=S44(e1be2b|m2b,l2b)*H26(l1b,l2b|m1bm3b)*+0.5
    ierr=exatns_tensor_contract("Z86_1(e1,e2,l1,m1,m2,m3)+=S44(e1,e2,m2,l2)*H26(l1,l2,m1,m3)", &
        Z86_1,S44,H26,prefactor=(0.5d0,0.0d0))
!   original expression: Z86_1(e1be2b,l1b|m1bm2bm3b)+=S44(e1be2b|m3b,l2b)*H26(l1b,l2b|m1bm2b)*+0.5
    ierr=exatns_tensor_contract("Z86_1(e1,e2,l1,m1,m2,m3)+=S44(e1,e2,m3,l2)*H26(l1,l2,m1,m2)", &
        Z86_1,S44,H26,prefactor=(0.5d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be2b|m1b,l1b)*Z86_1(e3be4b,l1b|m2bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e2,m1,l1)*Z86_1(e3,e4,l1,m2,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be3b|m1b,l1b)*Z86_1(e2be4b,l1b|m2bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e3,m1,l1)*Z86_1(e2,e4,l1,m2,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be4b|m1b,l1b)*Z86_1(e2be3b,l1b|m2bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e4,m1,l1)*Z86_1(e2,e3,l1,m2,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be3b|m1b,l1b)*Z86_1(e1be4b,l1b|m2bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e3,m1,l1)*Z86_1(e1,e4,l1,m2,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be4b|m1b,l1b)*Z86_1(e1be3b,l1b|m2bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e4,m1,l1)*Z86_1(e1,e3,l1,m2,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e3be4b|m1b,l1b)*Z86_1(e1be2b,l1b|m2bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e3,e4,m1,l1)*Z86_1(e1,e2,l1,m2,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be2b|m2b,l1b)*Z86_1(e3be4b,l1b|m1bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e2,m2,l1)*Z86_1(e3,e4,l1,m1,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be3b|m2b,l1b)*Z86_1(e2be4b,l1b|m1bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e3,m2,l1)*Z86_1(e2,e4,l1,m1,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be4b|m2b,l1b)*Z86_1(e2be3b,l1b|m1bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e4,m2,l1)*Z86_1(e2,e3,l1,m1,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be3b|m2b,l1b)*Z86_1(e1be4b,l1b|m1bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e3,m2,l1)*Z86_1(e1,e4,l1,m1,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be4b|m2b,l1b)*Z86_1(e1be3b,l1b|m1bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e4,m2,l1)*Z86_1(e1,e3,l1,m1,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e3be4b|m2b,l1b)*Z86_1(e1be2b,l1b|m1bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e3,e4,m2,l1)*Z86_1(e1,e2,l1,m1,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be2b|m3b,l1b)*Z86_1(e3be4b,l1b|m1bm2bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e2,m3,l1)*Z86_1(e3,e4,l1,m1,m2,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be3b|m3b,l1b)*Z86_1(e2be4b,l1b|m1bm2bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e3,m3,l1)*Z86_1(e2,e4,l1,m1,m2,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be4b|m3b,l1b)*Z86_1(e2be3b,l1b|m1bm2bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e4,m3,l1)*Z86_1(e2,e3,l1,m1,m2,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be3b|m3b,l1b)*Z86_1(e1be4b,l1b|m1bm2bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e3,m3,l1)*Z86_1(e1,e4,l1,m1,m2,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be4b|m3b,l1b)*Z86_1(e1be3b,l1b|m1bm2bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e4,m3,l1)*Z86_1(e1,e3,l1,m1,m2,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e3be4b|m3b,l1b)*Z86_1(e1be2b,l1b|m1bm2bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e3,e4,m3,l1)*Z86_1(e1,e2,l1,m1,m2,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be2b|m4b,l1b)*Z86_1(e3be4b,l1b|m1bm2bm3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e2,m4,l1)*Z86_1(e3,e4,l1,m1,m2,m3)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be3b|m4b,l1b)*Z86_1(e2be4b,l1b|m1bm2bm3b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e3,m4,l1)*Z86_1(e2,e4,l1,m1,m2,m3)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be4b|m4b,l1b)*Z86_1(e2be3b,l1b|m1bm2bm3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e4,m4,l1)*Z86_1(e2,e3,l1,m1,m2,m3)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be3b|m4b,l1b)*Z86_1(e1be4b,l1b|m1bm2bm3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e3,m4,l1)*Z86_1(e1,e4,l1,m1,m2,m3)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be4b|m4b,l1b)*Z86_1(e1be3b,l1b|m1bm2bm3b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e4,m4,l1)*Z86_1(e1,e3,l1,m1,m2,m3)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e3be4b|m4b,l1b)*Z86_1(e1be2b,l1b|m1bm2bm3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e3,e4,m4,l1)*Z86_1(e1,e2,l1,m1,m2,m3)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z86_1)
    
    allocate(tens_id(6), tens_root(6))
    tens_id   = (/nvir_id,nvir_id,nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nvir_root,nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z86_1,"Z86_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z86_1,'ZERO')
!   original expression: Z86_1(e1be2b,l1b|m1bm2bm3b)+=S45(e1b,d1bd2b|m1bm2bm3b)*H17(e2b,l1b|d1bd2b)*-1.
    ierr=exatns_tensor_contract("Z86_1(e1,e2,l1,m1,m2,m3)+=S45(e1,d1,d2,m1,m2,m3)*H17(e2,l1,d1,d2)", &
        Z86_1,S45,H17,prefactor=(-0.5d0,0.0d0))
!   original expression: Z86_1(e1be2b,l1b|m1bm2bm3b)+=S45(e2b,d1bd2b|m1bm2bm3b)*H17(e1b,l1b|d1bd2b)
    ierr=exatns_tensor_contract("Z86_1(e1,e2,l1,m1,m2,m3)+=S45(e2,d1,d2,m1,m2,m3)*H17(e1,l1,d1,d2)", &
        Z86_1,S45,H17,prefactor=(0.5d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be2b|m1b,l1b)*Z86_1(e3be4b,l1b|m2bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e2,m1,l1)*Z86_1(e3,e4,l1,m2,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be3b|m1b,l1b)*Z86_1(e2be4b,l1b|m2bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e3,m1,l1)*Z86_1(e2,e4,l1,m2,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be4b|m1b,l1b)*Z86_1(e2be3b,l1b|m2bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e4,m1,l1)*Z86_1(e2,e3,l1,m2,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be3b|m1b,l1b)*Z86_1(e1be4b,l1b|m2bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e3,m1,l1)*Z86_1(e1,e4,l1,m2,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be4b|m1b,l1b)*Z86_1(e1be3b,l1b|m2bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e4,m1,l1)*Z86_1(e1,e3,l1,m2,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e3be4b|m1b,l1b)*Z86_1(e1be2b,l1b|m2bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e3,e4,m1,l1)*Z86_1(e1,e2,l1,m2,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be2b|m2b,l1b)*Z86_1(e3be4b,l1b|m1bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e2,m2,l1)*Z86_1(e3,e4,l1,m1,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be3b|m2b,l1b)*Z86_1(e2be4b,l1b|m1bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e3,m2,l1)*Z86_1(e2,e4,l1,m1,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be4b|m2b,l1b)*Z86_1(e2be3b,l1b|m1bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e4,m2,l1)*Z86_1(e2,e3,l1,m1,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be3b|m2b,l1b)*Z86_1(e1be4b,l1b|m1bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e3,m2,l1)*Z86_1(e1,e4,l1,m1,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be4b|m2b,l1b)*Z86_1(e1be3b,l1b|m1bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e4,m2,l1)*Z86_1(e1,e3,l1,m1,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e3be4b|m2b,l1b)*Z86_1(e1be2b,l1b|m1bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e3,e4,m2,l1)*Z86_1(e1,e2,l1,m1,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be2b|m3b,l1b)*Z86_1(e3be4b,l1b|m1bm2bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e2,m3,l1)*Z86_1(e3,e4,l1,m1,m2,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be3b|m3b,l1b)*Z86_1(e2be4b,l1b|m1bm2bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e3,m3,l1)*Z86_1(e2,e4,l1,m1,m2,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be4b|m3b,l1b)*Z86_1(e2be3b,l1b|m1bm2bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e4,m3,l1)*Z86_1(e2,e3,l1,m1,m2,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be3b|m3b,l1b)*Z86_1(e1be4b,l1b|m1bm2bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e3,m3,l1)*Z86_1(e1,e4,l1,m1,m2,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be4b|m3b,l1b)*Z86_1(e1be3b,l1b|m1bm2bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e4,m3,l1)*Z86_1(e1,e3,l1,m1,m2,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e3be4b|m3b,l1b)*Z86_1(e1be2b,l1b|m1bm2bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e3,e4,m3,l1)*Z86_1(e1,e2,l1,m1,m2,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be2b|m4b,l1b)*Z86_1(e3be4b,l1b|m1bm2bm3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e2,m4,l1)*Z86_1(e3,e4,l1,m1,m2,m3)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be3b|m4b,l1b)*Z86_1(e2be4b,l1b|m1bm2bm3b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e3,m4,l1)*Z86_1(e2,e4,l1,m1,m2,m3)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be4b|m4b,l1b)*Z86_1(e2be3b,l1b|m1bm2bm3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e4,m4,l1)*Z86_1(e2,e3,l1,m1,m2,m3)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be3b|m4b,l1b)*Z86_1(e1be4b,l1b|m1bm2bm3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e3,m4,l1)*Z86_1(e1,e4,l1,m1,m2,m3)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be4b|m4b,l1b)*Z86_1(e1be3b,l1b|m1bm2bm3b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e4,m4,l1)*Z86_1(e1,e3,l1,m1,m2,m3)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e3be4b|m4b,l1b)*Z86_1(e1be2b,l1b|m1bm2bm3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e3,e4,m4,l1)*Z86_1(e1,e2,l1,m1,m2,m3)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z86_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nvir_id/)
    tens_root = (/nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z75_2,"Z75_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z75_2,'ZERO')
!   original expression: Z75_2(l1b|d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|l2b)*-1.
    ierr=exatns_tensor_contract("Z75_2(l1,d1)+=H24(l1,l2,d1,d2)*S43(d2,l2)", &
        Z75_2,H24,S43,prefactor=(-1.0d0,0.0d0))
    
    allocate(tens_id(6), tens_root(6))
    tens_id   = (/nvir_id,nvir_id,nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nvir_root,nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z86_1,"Z86_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z86_1,'ZERO')
!   original expression: Z86_1(e1be2b,l1b|m1bm2bm3b)+=S45(e1be2b,d1b|m1bm2bm3b)*Z75_2(l1b|d1b)
    ierr=exatns_tensor_contract("Z86_1(e1,e2,l1,m1,m2,m3)+=S45(e1,e2,d1,m1,m2,m3)*Z75_2(l1,d1)", &
        Z86_1,S45,Z75_2,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z75_2)
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be2b|m1b,l1b)*Z86_1(e3be4b,l1b|m2bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e2,m1,l1)*Z86_1(e3,e4,l1,m2,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be3b|m1b,l1b)*Z86_1(e2be4b,l1b|m2bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e3,m1,l1)*Z86_1(e2,e4,l1,m2,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be4b|m1b,l1b)*Z86_1(e2be3b,l1b|m2bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e4,m1,l1)*Z86_1(e2,e3,l1,m2,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be3b|m1b,l1b)*Z86_1(e1be4b,l1b|m2bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e3,m1,l1)*Z86_1(e1,e4,l1,m2,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be4b|m1b,l1b)*Z86_1(e1be3b,l1b|m2bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e4,m1,l1)*Z86_1(e1,e3,l1,m2,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e3be4b|m1b,l1b)*Z86_1(e1be2b,l1b|m2bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e3,e4,m1,l1)*Z86_1(e1,e2,l1,m2,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be2b|m2b,l1b)*Z86_1(e3be4b,l1b|m1bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e2,m2,l1)*Z86_1(e3,e4,l1,m1,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be3b|m2b,l1b)*Z86_1(e2be4b,l1b|m1bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e3,m2,l1)*Z86_1(e2,e4,l1,m1,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be4b|m2b,l1b)*Z86_1(e2be3b,l1b|m1bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e4,m2,l1)*Z86_1(e2,e3,l1,m1,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be3b|m2b,l1b)*Z86_1(e1be4b,l1b|m1bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e3,m2,l1)*Z86_1(e1,e4,l1,m1,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be4b|m2b,l1b)*Z86_1(e1be3b,l1b|m1bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e4,m2,l1)*Z86_1(e1,e3,l1,m1,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e3be4b|m2b,l1b)*Z86_1(e1be2b,l1b|m1bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e3,e4,m2,l1)*Z86_1(e1,e2,l1,m1,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be2b|m3b,l1b)*Z86_1(e3be4b,l1b|m1bm2bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e2,m3,l1)*Z86_1(e3,e4,l1,m1,m2,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be3b|m3b,l1b)*Z86_1(e2be4b,l1b|m1bm2bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e3,m3,l1)*Z86_1(e2,e4,l1,m1,m2,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be4b|m3b,l1b)*Z86_1(e2be3b,l1b|m1bm2bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e4,m3,l1)*Z86_1(e2,e3,l1,m1,m2,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be3b|m3b,l1b)*Z86_1(e1be4b,l1b|m1bm2bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e3,m3,l1)*Z86_1(e1,e4,l1,m1,m2,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be4b|m3b,l1b)*Z86_1(e1be3b,l1b|m1bm2bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e4,m3,l1)*Z86_1(e1,e3,l1,m1,m2,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e3be4b|m3b,l1b)*Z86_1(e1be2b,l1b|m1bm2bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e3,e4,m3,l1)*Z86_1(e1,e2,l1,m1,m2,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be2b|m4b,l1b)*Z86_1(e3be4b,l1b|m1bm2bm3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e2,m4,l1)*Z86_1(e3,e4,l1,m1,m2,m3)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be3b|m4b,l1b)*Z86_1(e2be4b,l1b|m1bm2bm3b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e3,m4,l1)*Z86_1(e2,e4,l1,m1,m2,m3)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be4b|m4b,l1b)*Z86_1(e2be3b,l1b|m1bm2bm3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e4,m4,l1)*Z86_1(e2,e3,l1,m1,m2,m3)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be3b|m4b,l1b)*Z86_1(e1be4b,l1b|m1bm2bm3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e3,m4,l1)*Z86_1(e1,e4,l1,m1,m2,m3)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be4b|m4b,l1b)*Z86_1(e1be3b,l1b|m1bm2bm3b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e4,m4,l1)*Z86_1(e1,e3,l1,m1,m2,m3)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e3be4b|m4b,l1b)*Z86_1(e1be2b,l1b|m1bm2bm3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e3,e4,m4,l1)*Z86_1(e1,e2,l1,m1,m2,m3)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z86_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nvir_id/)
    tens_root = (/nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z75_2,"Z75_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z75_2,'ZERO')
    
    allocate(tens_id(6), tens_root(6))
    tens_id   = (/nvir_id,nvir_id,nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nvir_root,nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z86_1,"Z86_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z86_1,'ZERO')
!   original expression: Z86_1(e1be2b,l1b|m1bm2bm3b)+=S45(e1be2b,d1b|m1bm2bm3b)*Z75_2(l1b|d1b)
    ierr=exatns_tensor_contract("Z86_1(e1,e2,l1,m1,m2,m3)+=S45(e1,e2,d1,m1,m2,m3)*Z75_2(l1,d1)", &
        Z86_1,S45,Z75_2,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z75_2)
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be2b|m1b,l1b)*Z86_1(e3be4b,l1b|m2bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e2,m1,l1)*Z86_1(e3,e4,l1,m2,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be3b|m1b,l1b)*Z86_1(e2be4b,l1b|m2bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e3,m1,l1)*Z86_1(e2,e4,l1,m2,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be4b|m1b,l1b)*Z86_1(e2be3b,l1b|m2bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e4,m1,l1)*Z86_1(e2,e3,l1,m2,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be3b|m1b,l1b)*Z86_1(e1be4b,l1b|m2bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e3,m1,l1)*Z86_1(e1,e4,l1,m2,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be4b|m1b,l1b)*Z86_1(e1be3b,l1b|m2bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e4,m1,l1)*Z86_1(e1,e3,l1,m2,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e3be4b|m1b,l1b)*Z86_1(e1be2b,l1b|m2bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e3,e4,m1,l1)*Z86_1(e1,e2,l1,m2,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be2b|m2b,l1b)*Z86_1(e3be4b,l1b|m1bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e2,m2,l1)*Z86_1(e3,e4,l1,m1,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be3b|m2b,l1b)*Z86_1(e2be4b,l1b|m1bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e3,m2,l1)*Z86_1(e2,e4,l1,m1,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be4b|m2b,l1b)*Z86_1(e2be3b,l1b|m1bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e4,m2,l1)*Z86_1(e2,e3,l1,m1,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be3b|m2b,l1b)*Z86_1(e1be4b,l1b|m1bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e3,m2,l1)*Z86_1(e1,e4,l1,m1,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be4b|m2b,l1b)*Z86_1(e1be3b,l1b|m1bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e4,m2,l1)*Z86_1(e1,e3,l1,m1,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e3be4b|m2b,l1b)*Z86_1(e1be2b,l1b|m1bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e3,e4,m2,l1)*Z86_1(e1,e2,l1,m1,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be2b|m3b,l1b)*Z86_1(e3be4b,l1b|m1bm2bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e2,m3,l1)*Z86_1(e3,e4,l1,m1,m2,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be3b|m3b,l1b)*Z86_1(e2be4b,l1b|m1bm2bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e3,m3,l1)*Z86_1(e2,e4,l1,m1,m2,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be4b|m3b,l1b)*Z86_1(e2be3b,l1b|m1bm2bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e4,m3,l1)*Z86_1(e2,e3,l1,m1,m2,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be3b|m3b,l1b)*Z86_1(e1be4b,l1b|m1bm2bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e3,m3,l1)*Z86_1(e1,e4,l1,m1,m2,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be4b|m3b,l1b)*Z86_1(e1be3b,l1b|m1bm2bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e4,m3,l1)*Z86_1(e1,e3,l1,m1,m2,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e3be4b|m3b,l1b)*Z86_1(e1be2b,l1b|m1bm2bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e3,e4,m3,l1)*Z86_1(e1,e2,l1,m1,m2,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be2b|m4b,l1b)*Z86_1(e3be4b,l1b|m1bm2bm3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e2,m4,l1)*Z86_1(e3,e4,l1,m1,m2,m3)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be3b|m4b,l1b)*Z86_1(e2be4b,l1b|m1bm2bm3b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e3,m4,l1)*Z86_1(e2,e4,l1,m1,m2,m3)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be4b|m4b,l1b)*Z86_1(e2be3b,l1b|m1bm2bm3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e4,m4,l1)*Z86_1(e2,e3,l1,m1,m2,m3)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be3b|m4b,l1b)*Z86_1(e1be4b,l1b|m1bm2bm3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e3,m4,l1)*Z86_1(e1,e4,l1,m1,m2,m3)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be4b|m4b,l1b)*Z86_1(e1be3b,l1b|m1bm2bm3b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e4,m4,l1)*Z86_1(e1,e3,l1,m1,m2,m3)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e3be4b|m4b,l1b)*Z86_1(e1be2b,l1b|m1bm2bm3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e3,e4,m4,l1)*Z86_1(e1,e2,l1,m1,m2,m3)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z86_1)
    
    allocate(tens_id(6), tens_root(6))
    tens_id   = (/nvir_id,nvir_id,nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nvir_root,nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z86_1,"Z86_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z86_1,'ZERO')
!   original expression: Z86_1(e1be2b,l1b|m1bm2bm3b)+=S45(e1be2b,d1b|m1bm2bm3b)*H15(l1b|d1b)*-1.
    ierr=exatns_tensor_contract("Z86_1(e1,e2,l1,m1,m2,m3)+=S45(e1,e2,d1,m1,m2,m3)*H15(l1,d1)", &
        Z86_1,S45,H15,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be2b|m1b,l1b)*Z86_1(e3be4b,l1b|m2bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e2,m1,l1)*Z86_1(e3,e4,l1,m2,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be3b|m1b,l1b)*Z86_1(e2be4b,l1b|m2bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e3,m1,l1)*Z86_1(e2,e4,l1,m2,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be4b|m1b,l1b)*Z86_1(e2be3b,l1b|m2bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e4,m1,l1)*Z86_1(e2,e3,l1,m2,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be3b|m1b,l1b)*Z86_1(e1be4b,l1b|m2bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e3,m1,l1)*Z86_1(e1,e4,l1,m2,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be4b|m1b,l1b)*Z86_1(e1be3b,l1b|m2bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e4,m1,l1)*Z86_1(e1,e3,l1,m2,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e3be4b|m1b,l1b)*Z86_1(e1be2b,l1b|m2bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e3,e4,m1,l1)*Z86_1(e1,e2,l1,m2,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be2b|m2b,l1b)*Z86_1(e3be4b,l1b|m1bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e2,m2,l1)*Z86_1(e3,e4,l1,m1,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be3b|m2b,l1b)*Z86_1(e2be4b,l1b|m1bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e3,m2,l1)*Z86_1(e2,e4,l1,m1,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be4b|m2b,l1b)*Z86_1(e2be3b,l1b|m1bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e4,m2,l1)*Z86_1(e2,e3,l1,m1,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be3b|m2b,l1b)*Z86_1(e1be4b,l1b|m1bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e3,m2,l1)*Z86_1(e1,e4,l1,m1,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be4b|m2b,l1b)*Z86_1(e1be3b,l1b|m1bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e4,m2,l1)*Z86_1(e1,e3,l1,m1,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e3be4b|m2b,l1b)*Z86_1(e1be2b,l1b|m1bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e3,e4,m2,l1)*Z86_1(e1,e2,l1,m1,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be2b|m3b,l1b)*Z86_1(e3be4b,l1b|m1bm2bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e2,m3,l1)*Z86_1(e3,e4,l1,m1,m2,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be3b|m3b,l1b)*Z86_1(e2be4b,l1b|m1bm2bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e3,m3,l1)*Z86_1(e2,e4,l1,m1,m2,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be4b|m3b,l1b)*Z86_1(e2be3b,l1b|m1bm2bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e4,m3,l1)*Z86_1(e2,e3,l1,m1,m2,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be3b|m3b,l1b)*Z86_1(e1be4b,l1b|m1bm2bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e3,m3,l1)*Z86_1(e1,e4,l1,m1,m2,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be4b|m3b,l1b)*Z86_1(e1be3b,l1b|m1bm2bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e4,m3,l1)*Z86_1(e1,e3,l1,m1,m2,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e3be4b|m3b,l1b)*Z86_1(e1be2b,l1b|m1bm2bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e3,e4,m3,l1)*Z86_1(e1,e2,l1,m1,m2,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be2b|m4b,l1b)*Z86_1(e3be4b,l1b|m1bm2bm3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e2,m4,l1)*Z86_1(e3,e4,l1,m1,m2,m3)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be3b|m4b,l1b)*Z86_1(e2be4b,l1b|m1bm2bm3b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e3,m4,l1)*Z86_1(e2,e4,l1,m1,m2,m3)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be4b|m4b,l1b)*Z86_1(e2be3b,l1b|m1bm2bm3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e4,m4,l1)*Z86_1(e2,e3,l1,m1,m2,m3)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be3b|m4b,l1b)*Z86_1(e1be4b,l1b|m1bm2bm3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e3,m4,l1)*Z86_1(e1,e4,l1,m1,m2,m3)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be4b|m4b,l1b)*Z86_1(e1be3b,l1b|m1bm2bm3b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e4,m4,l1)*Z86_1(e1,e3,l1,m1,m2,m3)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e3be4b|m4b,l1b)*Z86_1(e1be2b,l1b|m1bm2bm3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e3,e4,m4,l1)*Z86_1(e1,e2,l1,m1,m2,m3)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z86_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z165_2,"Z165_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z165_2,'ZERO')
!   original expression: Z165_2(l1b,l2b|m1b,d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|m1b)
    ierr=exatns_tensor_contract("Z165_2(l1,l2,m1,d1)+=H24(l1,l2,d1,d2)*S43(d2,m1)", &
        Z165_2,H24,S43,prefactor=(1.0d0,0.0d0))
    
    allocate(tens_id(6), tens_root(6))
    tens_id   = (/nvir_id,nvir_id,nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nvir_root,nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z86_1,"Z86_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z86_1,'ZERO')
!   original expression: Z86_1(e1be2b,l1b|m1bm2bm3b)+=S45(e1be2b,d1b|m1bm2b,l2b)*Z165_2(l1b,l2b|m3b,d1b)
    ierr=exatns_tensor_contract("Z86_1(e1,e2,l1,m1,m2,m3)+=S45(e1,e2,d1,m1,m2,l2)*Z165_2(l1,l2,m3,d1)", &
        Z86_1,S45,Z165_2,prefactor=(1.0d0,0.0d0))
!   original expression: Z86_1(e1be2b,l1b|m1bm2bm3b)+=S45(e1be2b,d1b|m1bm3b,l2b)*Z165_2(l1b,l2b|m2b,d1b)*-1.
    ierr=exatns_tensor_contract("Z86_1(e1,e2,l1,m1,m2,m3)+=S45(e1,e2,d1,m1,m3,l2)*Z165_2(l1,l2,m2,d1)", &
        Z86_1,S45,Z165_2,prefactor=(-1.0d0,0.0d0))
!   original expression: Z86_1(e1be2b,l1b|m1bm2bm3b)+=S45(e1be2b,d1b|m2bm3b,l2b)*Z165_2(l1b,l2b|m1b,d1b)
    ierr=exatns_tensor_contract("Z86_1(e1,e2,l1,m1,m2,m3)+=S45(e1,e2,d1,m2,m3,l2)*Z165_2(l1,l2,m1,d1)", &
        Z86_1,S45,Z165_2,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z165_2)
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be2b|m1b,l1b)*Z86_1(e3be4b,l1b|m2bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e2,m1,l1)*Z86_1(e3,e4,l1,m2,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be3b|m1b,l1b)*Z86_1(e2be4b,l1b|m2bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e3,m1,l1)*Z86_1(e2,e4,l1,m2,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be4b|m1b,l1b)*Z86_1(e2be3b,l1b|m2bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e4,m1,l1)*Z86_1(e2,e3,l1,m2,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be3b|m1b,l1b)*Z86_1(e1be4b,l1b|m2bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e3,m1,l1)*Z86_1(e1,e4,l1,m2,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be4b|m1b,l1b)*Z86_1(e1be3b,l1b|m2bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e4,m1,l1)*Z86_1(e1,e3,l1,m2,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e3be4b|m1b,l1b)*Z86_1(e1be2b,l1b|m2bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e3,e4,m1,l1)*Z86_1(e1,e2,l1,m2,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be2b|m2b,l1b)*Z86_1(e3be4b,l1b|m1bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e2,m2,l1)*Z86_1(e3,e4,l1,m1,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be3b|m2b,l1b)*Z86_1(e2be4b,l1b|m1bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e3,m2,l1)*Z86_1(e2,e4,l1,m1,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be4b|m2b,l1b)*Z86_1(e2be3b,l1b|m1bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e4,m2,l1)*Z86_1(e2,e3,l1,m1,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be3b|m2b,l1b)*Z86_1(e1be4b,l1b|m1bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e3,m2,l1)*Z86_1(e1,e4,l1,m1,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be4b|m2b,l1b)*Z86_1(e1be3b,l1b|m1bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e4,m2,l1)*Z86_1(e1,e3,l1,m1,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e3be4b|m2b,l1b)*Z86_1(e1be2b,l1b|m1bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e3,e4,m2,l1)*Z86_1(e1,e2,l1,m1,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be2b|m3b,l1b)*Z86_1(e3be4b,l1b|m1bm2bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e2,m3,l1)*Z86_1(e3,e4,l1,m1,m2,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be3b|m3b,l1b)*Z86_1(e2be4b,l1b|m1bm2bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e3,m3,l1)*Z86_1(e2,e4,l1,m1,m2,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be4b|m3b,l1b)*Z86_1(e2be3b,l1b|m1bm2bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e4,m3,l1)*Z86_1(e2,e3,l1,m1,m2,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be3b|m3b,l1b)*Z86_1(e1be4b,l1b|m1bm2bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e3,m3,l1)*Z86_1(e1,e4,l1,m1,m2,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be4b|m3b,l1b)*Z86_1(e1be3b,l1b|m1bm2bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e4,m3,l1)*Z86_1(e1,e3,l1,m1,m2,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e3be4b|m3b,l1b)*Z86_1(e1be2b,l1b|m1bm2bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e3,e4,m3,l1)*Z86_1(e1,e2,l1,m1,m2,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be2b|m4b,l1b)*Z86_1(e3be4b,l1b|m1bm2bm3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e2,m4,l1)*Z86_1(e3,e4,l1,m1,m2,m3)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be3b|m4b,l1b)*Z86_1(e2be4b,l1b|m1bm2bm3b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e3,m4,l1)*Z86_1(e2,e4,l1,m1,m2,m3)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be4b|m4b,l1b)*Z86_1(e2be3b,l1b|m1bm2bm3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e4,m4,l1)*Z86_1(e2,e3,l1,m1,m2,m3)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be3b|m4b,l1b)*Z86_1(e1be4b,l1b|m1bm2bm3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e3,m4,l1)*Z86_1(e1,e4,l1,m1,m2,m3)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be4b|m4b,l1b)*Z86_1(e1be3b,l1b|m1bm2bm3b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e4,m4,l1)*Z86_1(e1,e3,l1,m1,m2,m3)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e3be4b|m4b,l1b)*Z86_1(e1be2b,l1b|m1bm2bm3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e3,e4,m4,l1)*Z86_1(e1,e2,l1,m1,m2,m3)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z86_1)
    
    allocate(tens_id(6), tens_root(6))
    tens_id   = (/nvir_id,nvir_id,nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nvir_root,nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z86_1,"Z86_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z86_1,'ZERO')
!   original expression: Z86_1(e1be2b,l1b|m1bm2bm3b)+=S45(e1be2b,d1b|m1bm2b,l2b)*H25(l1b,l2b|m3b,d1b)*-1.
    ierr=exatns_tensor_contract("Z86_1(e1,e2,l1,m1,m2,m3)+=S45(e1,e2,d1,m1,m2,l2)*H25(l1,l2,m3,d1)", &
        Z86_1,S45,H25,prefactor=(-1.0d0,0.0d0))
!   original expression: Z86_1(e1be2b,l1b|m1bm2bm3b)+=S45(e1be2b,d1b|m1bm3b,l2b)*H25(l1b,l2b|m2b,d1b)
    ierr=exatns_tensor_contract("Z86_1(e1,e2,l1,m1,m2,m3)+=S45(e1,e2,d1,m1,m3,l2)*H25(l1,l2,m2,d1)", &
        Z86_1,S45,H25,prefactor=(1.0d0,0.0d0))
!   original expression: Z86_1(e1be2b,l1b|m1bm2bm3b)+=S45(e1be2b,d1b|m2bm3b,l2b)*H25(l1b,l2b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z86_1(e1,e2,l1,m1,m2,m3)+=S45(e1,e2,d1,m2,m3,l2)*H25(l1,l2,m1,d1)", &
        Z86_1,S45,H25,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be2b|m1b,l1b)*Z86_1(e3be4b,l1b|m2bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e2,m1,l1)*Z86_1(e3,e4,l1,m2,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be3b|m1b,l1b)*Z86_1(e2be4b,l1b|m2bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e3,m1,l1)*Z86_1(e2,e4,l1,m2,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be4b|m1b,l1b)*Z86_1(e2be3b,l1b|m2bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e4,m1,l1)*Z86_1(e2,e3,l1,m2,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be3b|m1b,l1b)*Z86_1(e1be4b,l1b|m2bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e3,m1,l1)*Z86_1(e1,e4,l1,m2,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be4b|m1b,l1b)*Z86_1(e1be3b,l1b|m2bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e4,m1,l1)*Z86_1(e1,e3,l1,m2,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e3be4b|m1b,l1b)*Z86_1(e1be2b,l1b|m2bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e3,e4,m1,l1)*Z86_1(e1,e2,l1,m2,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be2b|m2b,l1b)*Z86_1(e3be4b,l1b|m1bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e2,m2,l1)*Z86_1(e3,e4,l1,m1,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be3b|m2b,l1b)*Z86_1(e2be4b,l1b|m1bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e3,m2,l1)*Z86_1(e2,e4,l1,m1,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be4b|m2b,l1b)*Z86_1(e2be3b,l1b|m1bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e4,m2,l1)*Z86_1(e2,e3,l1,m1,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be3b|m2b,l1b)*Z86_1(e1be4b,l1b|m1bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e3,m2,l1)*Z86_1(e1,e4,l1,m1,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be4b|m2b,l1b)*Z86_1(e1be3b,l1b|m1bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e4,m2,l1)*Z86_1(e1,e3,l1,m1,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e3be4b|m2b,l1b)*Z86_1(e1be2b,l1b|m1bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e3,e4,m2,l1)*Z86_1(e1,e2,l1,m1,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be2b|m3b,l1b)*Z86_1(e3be4b,l1b|m1bm2bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e2,m3,l1)*Z86_1(e3,e4,l1,m1,m2,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be3b|m3b,l1b)*Z86_1(e2be4b,l1b|m1bm2bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e3,m3,l1)*Z86_1(e2,e4,l1,m1,m2,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be4b|m3b,l1b)*Z86_1(e2be3b,l1b|m1bm2bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e4,m3,l1)*Z86_1(e2,e3,l1,m1,m2,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be3b|m3b,l1b)*Z86_1(e1be4b,l1b|m1bm2bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e3,m3,l1)*Z86_1(e1,e4,l1,m1,m2,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be4b|m3b,l1b)*Z86_1(e1be3b,l1b|m1bm2bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e4,m3,l1)*Z86_1(e1,e3,l1,m1,m2,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e3be4b|m3b,l1b)*Z86_1(e1be2b,l1b|m1bm2bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e3,e4,m3,l1)*Z86_1(e1,e2,l1,m1,m2,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be2b|m4b,l1b)*Z86_1(e3be4b,l1b|m1bm2bm3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e2,m4,l1)*Z86_1(e3,e4,l1,m1,m2,m3)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be3b|m4b,l1b)*Z86_1(e2be4b,l1b|m1bm2bm3b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e3,m4,l1)*Z86_1(e2,e4,l1,m1,m2,m3)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be4b|m4b,l1b)*Z86_1(e2be3b,l1b|m1bm2bm3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e4,m4,l1)*Z86_1(e2,e3,l1,m1,m2,m3)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be3b|m4b,l1b)*Z86_1(e1be4b,l1b|m1bm2bm3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e3,m4,l1)*Z86_1(e1,e4,l1,m1,m2,m3)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be4b|m4b,l1b)*Z86_1(e1be3b,l1b|m1bm2bm3b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e4,m4,l1)*Z86_1(e1,e3,l1,m1,m2,m3)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e3be4b|m4b,l1b)*Z86_1(e1be2b,l1b|m1bm2bm3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e3,e4,m4,l1)*Z86_1(e1,e2,l1,m1,m2,m3)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z86_1)
    
    allocate(tens_id(6), tens_root(6))
    tens_id   = (/nvir_id,nvir_id,nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nvir_root,nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z86_1,"Z86_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z86_1,'ZERO')
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be2b|m1b,l1b)*Z86_1(e3be4b,l1b|m2bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e2,m1,l1)*Z86_1(e3,e4,l1,m2,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be3b|m1b,l1b)*Z86_1(e2be4b,l1b|m2bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e3,m1,l1)*Z86_1(e2,e4,l1,m2,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be4b|m1b,l1b)*Z86_1(e2be3b,l1b|m2bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e4,m1,l1)*Z86_1(e2,e3,l1,m2,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be3b|m1b,l1b)*Z86_1(e1be4b,l1b|m2bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e3,m1,l1)*Z86_1(e1,e4,l1,m2,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be4b|m1b,l1b)*Z86_1(e1be3b,l1b|m2bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e4,m1,l1)*Z86_1(e1,e3,l1,m2,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e3be4b|m1b,l1b)*Z86_1(e1be2b,l1b|m2bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e3,e4,m1,l1)*Z86_1(e1,e2,l1,m2,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be2b|m2b,l1b)*Z86_1(e3be4b,l1b|m1bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e2,m2,l1)*Z86_1(e3,e4,l1,m1,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be3b|m2b,l1b)*Z86_1(e2be4b,l1b|m1bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e3,m2,l1)*Z86_1(e2,e4,l1,m1,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be4b|m2b,l1b)*Z86_1(e2be3b,l1b|m1bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e4,m2,l1)*Z86_1(e2,e3,l1,m1,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be3b|m2b,l1b)*Z86_1(e1be4b,l1b|m1bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e3,m2,l1)*Z86_1(e1,e4,l1,m1,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be4b|m2b,l1b)*Z86_1(e1be3b,l1b|m1bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e4,m2,l1)*Z86_1(e1,e3,l1,m1,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e3be4b|m2b,l1b)*Z86_1(e1be2b,l1b|m1bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e3,e4,m2,l1)*Z86_1(e1,e2,l1,m1,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be2b|m3b,l1b)*Z86_1(e3be4b,l1b|m1bm2bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e2,m3,l1)*Z86_1(e3,e4,l1,m1,m2,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be3b|m3b,l1b)*Z86_1(e2be4b,l1b|m1bm2bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e3,m3,l1)*Z86_1(e2,e4,l1,m1,m2,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be4b|m3b,l1b)*Z86_1(e2be3b,l1b|m1bm2bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e4,m3,l1)*Z86_1(e2,e3,l1,m1,m2,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be3b|m3b,l1b)*Z86_1(e1be4b,l1b|m1bm2bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e3,m3,l1)*Z86_1(e1,e4,l1,m1,m2,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be4b|m3b,l1b)*Z86_1(e1be3b,l1b|m1bm2bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e4,m3,l1)*Z86_1(e1,e3,l1,m1,m2,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e3be4b|m3b,l1b)*Z86_1(e1be2b,l1b|m1bm2bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e3,e4,m3,l1)*Z86_1(e1,e2,l1,m1,m2,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be2b|m4b,l1b)*Z86_1(e3be4b,l1b|m1bm2bm3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e2,m4,l1)*Z86_1(e3,e4,l1,m1,m2,m3)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be3b|m4b,l1b)*Z86_1(e2be4b,l1b|m1bm2bm3b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e3,m4,l1)*Z86_1(e2,e4,l1,m1,m2,m3)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be4b|m4b,l1b)*Z86_1(e2be3b,l1b|m1bm2bm3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e4,m4,l1)*Z86_1(e2,e3,l1,m1,m2,m3)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be3b|m4b,l1b)*Z86_1(e1be4b,l1b|m1bm2bm3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e3,m4,l1)*Z86_1(e1,e4,l1,m1,m2,m3)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be4b|m4b,l1b)*Z86_1(e1be3b,l1b|m1bm2bm3b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e4,m4,l1)*Z86_1(e1,e3,l1,m1,m2,m3)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e3be4b|m4b,l1b)*Z86_1(e1be2b,l1b|m1bm2bm3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e3,e4,m4,l1)*Z86_1(e1,e2,l1,m1,m2,m3)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z86_1)
    
    allocate(tens_id(6), tens_root(6))
    tens_id   = (/nvir_id,nvir_id,nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nvir_root,nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z86_1,"Z86_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z86_1,'ZERO')
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be2b|m1b,l1b)*Z86_1(e3be4b,l1b|m2bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e2,m1,l1)*Z86_1(e3,e4,l1,m2,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be3b|m1b,l1b)*Z86_1(e2be4b,l1b|m2bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e3,m1,l1)*Z86_1(e2,e4,l1,m2,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be4b|m1b,l1b)*Z86_1(e2be3b,l1b|m2bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e4,m1,l1)*Z86_1(e2,e3,l1,m2,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be3b|m1b,l1b)*Z86_1(e1be4b,l1b|m2bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e3,m1,l1)*Z86_1(e1,e4,l1,m2,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be4b|m1b,l1b)*Z86_1(e1be3b,l1b|m2bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e4,m1,l1)*Z86_1(e1,e3,l1,m2,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e3be4b|m1b,l1b)*Z86_1(e1be2b,l1b|m2bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e3,e4,m1,l1)*Z86_1(e1,e2,l1,m2,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be2b|m2b,l1b)*Z86_1(e3be4b,l1b|m1bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e2,m2,l1)*Z86_1(e3,e4,l1,m1,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be3b|m2b,l1b)*Z86_1(e2be4b,l1b|m1bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e3,m2,l1)*Z86_1(e2,e4,l1,m1,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be4b|m2b,l1b)*Z86_1(e2be3b,l1b|m1bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e4,m2,l1)*Z86_1(e2,e3,l1,m1,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be3b|m2b,l1b)*Z86_1(e1be4b,l1b|m1bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e3,m2,l1)*Z86_1(e1,e4,l1,m1,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be4b|m2b,l1b)*Z86_1(e1be3b,l1b|m1bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e4,m2,l1)*Z86_1(e1,e3,l1,m1,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e3be4b|m2b,l1b)*Z86_1(e1be2b,l1b|m1bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e3,e4,m2,l1)*Z86_1(e1,e2,l1,m1,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be2b|m3b,l1b)*Z86_1(e3be4b,l1b|m1bm2bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e2,m3,l1)*Z86_1(e3,e4,l1,m1,m2,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be3b|m3b,l1b)*Z86_1(e2be4b,l1b|m1bm2bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e3,m3,l1)*Z86_1(e2,e4,l1,m1,m2,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be4b|m3b,l1b)*Z86_1(e2be3b,l1b|m1bm2bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e4,m3,l1)*Z86_1(e2,e3,l1,m1,m2,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be3b|m3b,l1b)*Z86_1(e1be4b,l1b|m1bm2bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e3,m3,l1)*Z86_1(e1,e4,l1,m1,m2,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be4b|m3b,l1b)*Z86_1(e1be3b,l1b|m1bm2bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e4,m3,l1)*Z86_1(e1,e3,l1,m1,m2,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e3be4b|m3b,l1b)*Z86_1(e1be2b,l1b|m1bm2bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e3,e4,m3,l1)*Z86_1(e1,e2,l1,m1,m2,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be2b|m4b,l1b)*Z86_1(e3be4b,l1b|m1bm2bm3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e2,m4,l1)*Z86_1(e3,e4,l1,m1,m2,m3)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be3b|m4b,l1b)*Z86_1(e2be4b,l1b|m1bm2bm3b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e3,m4,l1)*Z86_1(e2,e4,l1,m1,m2,m3)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be4b|m4b,l1b)*Z86_1(e2be3b,l1b|m1bm2bm3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e4,m4,l1)*Z86_1(e2,e3,l1,m1,m2,m3)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be3b|m4b,l1b)*Z86_1(e1be4b,l1b|m1bm2bm3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e3,m4,l1)*Z86_1(e1,e4,l1,m1,m2,m3)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be4b|m4b,l1b)*Z86_1(e1be3b,l1b|m1bm2bm3b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e4,m4,l1)*Z86_1(e1,e3,l1,m1,m2,m3)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e3be4b|m4b,l1b)*Z86_1(e1be2b,l1b|m1bm2bm3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e3,e4,m4,l1)*Z86_1(e1,e2,l1,m1,m2,m3)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z86_1)
    
    allocate(tens_id(6), tens_root(6))
    tens_id   = (/nvir_id,nvir_id,nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nvir_root,nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z86_1,"Z86_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z86_1,'ZERO')
!   original expression: Z86_1(e1be2b,l1b|m1bm2bm3b)+=S46(e1be2b,d1bd2b|m1bm2bm3b,l2b)*H24(l1b,l2b|d1bd2b)*-1.
    ierr=exatns_tensor_contract("Z86_1(e1,e2,l1,m1,m2,m3)+=S46(e1,e2,d1,d2,m1,m2,m3,l2)*H24(l1,l2,d1,d2)", &
        Z86_1,S46,H24,prefactor=(-0.5d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be2b|m1b,l1b)*Z86_1(e3be4b,l1b|m2bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e2,m1,l1)*Z86_1(e3,e4,l1,m2,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be3b|m1b,l1b)*Z86_1(e2be4b,l1b|m2bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e3,m1,l1)*Z86_1(e2,e4,l1,m2,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be4b|m1b,l1b)*Z86_1(e2be3b,l1b|m2bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e4,m1,l1)*Z86_1(e2,e3,l1,m2,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be3b|m1b,l1b)*Z86_1(e1be4b,l1b|m2bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e3,m1,l1)*Z86_1(e1,e4,l1,m2,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be4b|m1b,l1b)*Z86_1(e1be3b,l1b|m2bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e4,m1,l1)*Z86_1(e1,e3,l1,m2,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e3be4b|m1b,l1b)*Z86_1(e1be2b,l1b|m2bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e3,e4,m1,l1)*Z86_1(e1,e2,l1,m2,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be2b|m2b,l1b)*Z86_1(e3be4b,l1b|m1bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e2,m2,l1)*Z86_1(e3,e4,l1,m1,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be3b|m2b,l1b)*Z86_1(e2be4b,l1b|m1bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e3,m2,l1)*Z86_1(e2,e4,l1,m1,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be4b|m2b,l1b)*Z86_1(e2be3b,l1b|m1bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e4,m2,l1)*Z86_1(e2,e3,l1,m1,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be3b|m2b,l1b)*Z86_1(e1be4b,l1b|m1bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e3,m2,l1)*Z86_1(e1,e4,l1,m1,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be4b|m2b,l1b)*Z86_1(e1be3b,l1b|m1bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e4,m2,l1)*Z86_1(e1,e3,l1,m1,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e3be4b|m2b,l1b)*Z86_1(e1be2b,l1b|m1bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e3,e4,m2,l1)*Z86_1(e1,e2,l1,m1,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be2b|m3b,l1b)*Z86_1(e3be4b,l1b|m1bm2bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e2,m3,l1)*Z86_1(e3,e4,l1,m1,m2,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be3b|m3b,l1b)*Z86_1(e2be4b,l1b|m1bm2bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e3,m3,l1)*Z86_1(e2,e4,l1,m1,m2,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be4b|m3b,l1b)*Z86_1(e2be3b,l1b|m1bm2bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e4,m3,l1)*Z86_1(e2,e3,l1,m1,m2,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be3b|m3b,l1b)*Z86_1(e1be4b,l1b|m1bm2bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e3,m3,l1)*Z86_1(e1,e4,l1,m1,m2,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be4b|m3b,l1b)*Z86_1(e1be3b,l1b|m1bm2bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e4,m3,l1)*Z86_1(e1,e3,l1,m1,m2,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e3be4b|m3b,l1b)*Z86_1(e1be2b,l1b|m1bm2bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e3,e4,m3,l1)*Z86_1(e1,e2,l1,m1,m2,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be2b|m4b,l1b)*Z86_1(e3be4b,l1b|m1bm2bm3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e2,m4,l1)*Z86_1(e3,e4,l1,m1,m2,m3)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be3b|m4b,l1b)*Z86_1(e2be4b,l1b|m1bm2bm3b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e3,m4,l1)*Z86_1(e2,e4,l1,m1,m2,m3)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be4b|m4b,l1b)*Z86_1(e2be3b,l1b|m1bm2bm3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e4,m4,l1)*Z86_1(e2,e3,l1,m1,m2,m3)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be3b|m4b,l1b)*Z86_1(e1be4b,l1b|m1bm2bm3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e3,m4,l1)*Z86_1(e1,e4,l1,m1,m2,m3)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be4b|m4b,l1b)*Z86_1(e1be3b,l1b|m1bm2bm3b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e4,m4,l1)*Z86_1(e1,e3,l1,m1,m2,m3)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e3be4b|m4b,l1b)*Z86_1(e1be2b,l1b|m1bm2bm3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e3,e4,m4,l1)*Z86_1(e1,e2,l1,m1,m2,m3)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z86_1)
    
    allocate(tens_id(6), tens_root(6))
    tens_id   = (/nvir_id,nvir_id,nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nvir_root,nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z86_1,"Z86_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z86_1,'ZERO')
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be2b|m1b,l1b)*Z86_1(e3be4b,l1b|m2bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e2,m1,l1)*Z86_1(e3,e4,l1,m2,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be3b|m1b,l1b)*Z86_1(e2be4b,l1b|m2bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e3,m1,l1)*Z86_1(e2,e4,l1,m2,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be4b|m1b,l1b)*Z86_1(e2be3b,l1b|m2bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e4,m1,l1)*Z86_1(e2,e3,l1,m2,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be3b|m1b,l1b)*Z86_1(e1be4b,l1b|m2bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e3,m1,l1)*Z86_1(e1,e4,l1,m2,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be4b|m1b,l1b)*Z86_1(e1be3b,l1b|m2bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e4,m1,l1)*Z86_1(e1,e3,l1,m2,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e3be4b|m1b,l1b)*Z86_1(e1be2b,l1b|m2bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e3,e4,m1,l1)*Z86_1(e1,e2,l1,m2,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be2b|m2b,l1b)*Z86_1(e3be4b,l1b|m1bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e2,m2,l1)*Z86_1(e3,e4,l1,m1,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be3b|m2b,l1b)*Z86_1(e2be4b,l1b|m1bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e3,m2,l1)*Z86_1(e2,e4,l1,m1,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be4b|m2b,l1b)*Z86_1(e2be3b,l1b|m1bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e4,m2,l1)*Z86_1(e2,e3,l1,m1,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be3b|m2b,l1b)*Z86_1(e1be4b,l1b|m1bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e3,m2,l1)*Z86_1(e1,e4,l1,m1,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be4b|m2b,l1b)*Z86_1(e1be3b,l1b|m1bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e4,m2,l1)*Z86_1(e1,e3,l1,m1,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e3be4b|m2b,l1b)*Z86_1(e1be2b,l1b|m1bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e3,e4,m2,l1)*Z86_1(e1,e2,l1,m1,m3,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be2b|m3b,l1b)*Z86_1(e3be4b,l1b|m1bm2bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e2,m3,l1)*Z86_1(e3,e4,l1,m1,m2,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be3b|m3b,l1b)*Z86_1(e2be4b,l1b|m1bm2bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e3,m3,l1)*Z86_1(e2,e4,l1,m1,m2,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be4b|m3b,l1b)*Z86_1(e2be3b,l1b|m1bm2bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e4,m3,l1)*Z86_1(e2,e3,l1,m1,m2,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be3b|m3b,l1b)*Z86_1(e1be4b,l1b|m1bm2bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e3,m3,l1)*Z86_1(e1,e4,l1,m1,m2,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be4b|m3b,l1b)*Z86_1(e1be3b,l1b|m1bm2bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e4,m3,l1)*Z86_1(e1,e3,l1,m1,m2,m4)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e3be4b|m3b,l1b)*Z86_1(e1be2b,l1b|m1bm2bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e3,e4,m3,l1)*Z86_1(e1,e2,l1,m1,m2,m4)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be2b|m4b,l1b)*Z86_1(e3be4b,l1b|m1bm2bm3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e2,m4,l1)*Z86_1(e3,e4,l1,m1,m2,m3)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be3b|m4b,l1b)*Z86_1(e2be4b,l1b|m1bm2bm3b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e3,m4,l1)*Z86_1(e2,e4,l1,m1,m2,m3)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e1be4b|m4b,l1b)*Z86_1(e2be3b,l1b|m1bm2bm3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e1,e4,m4,l1)*Z86_1(e2,e3,l1,m1,m2,m3)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be3b|m4b,l1b)*Z86_1(e1be4b,l1b|m1bm2bm3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e3,m4,l1)*Z86_1(e1,e4,l1,m1,m2,m3)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e2be4b|m4b,l1b)*Z86_1(e1be3b,l1b|m1bm2bm3b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e2,e4,m4,l1)*Z86_1(e1,e3,l1,m1,m2,m3)", &
        Z61,S44,Z86_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S44(e3be4b|m4b,l1b)*Z86_1(e1be2b,l1b|m1bm2bm3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S44(e3,e4,m4,l1)*Z86_1(e1,e2,l1,m1,m2,m3)", &
        Z61,S44,Z86_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z86_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nvir_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z91_1,"Z91_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z91_1,'ZERO')
!   original expression: Z91_1(e1be2b|m1b,d1b)+=H3(e1be2b|d1b,d2b)*S43(d2b|m1b)
    ierr=exatns_tensor_contract("Z91_1(e1,e2,m1,d1)+=H3(e1,e2,d1,d2)*S43(d2,m1)", &
        Z91_1,H3,S43,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2b,d1b|m1bm2bm3b)*Z91_1(e3be4b|m4b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,d1,m1,m2,m3)*Z91_1(e3,e4,m4,d1)", &
        Z61,S45,Z91_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be3b,d1b|m1bm2bm3b)*Z91_1(e2be4b|m4b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e3,d1,m1,m2,m3)*Z91_1(e2,e4,m4,d1)", &
        Z61,S45,Z91_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be4b,d1b|m1bm2bm3b)*Z91_1(e2be3b|m4b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e4,d1,m1,m2,m3)*Z91_1(e2,e3,m4,d1)", &
        Z61,S45,Z91_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be3b,d1b|m1bm2bm3b)*Z91_1(e1be4b|m4b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e3,d1,m1,m2,m3)*Z91_1(e1,e4,m4,d1)", &
        Z61,S45,Z91_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be4b,d1b|m1bm2bm3b)*Z91_1(e1be3b|m4b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e4,d1,m1,m2,m3)*Z91_1(e1,e3,m4,d1)", &
        Z61,S45,Z91_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e3be4b,d1b|m1bm2bm3b)*Z91_1(e1be2b|m4b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e3,e4,d1,m1,m2,m3)*Z91_1(e1,e2,m4,d1)", &
        Z61,S45,Z91_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2b,d1b|m1bm2bm4b)*Z91_1(e3be4b|m3b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,d1,m1,m2,m4)*Z91_1(e3,e4,m3,d1)", &
        Z61,S45,Z91_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be3b,d1b|m1bm2bm4b)*Z91_1(e2be4b|m3b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e3,d1,m1,m2,m4)*Z91_1(e2,e4,m3,d1)", &
        Z61,S45,Z91_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be4b,d1b|m1bm2bm4b)*Z91_1(e2be3b|m3b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e4,d1,m1,m2,m4)*Z91_1(e2,e3,m3,d1)", &
        Z61,S45,Z91_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be3b,d1b|m1bm2bm4b)*Z91_1(e1be4b|m3b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e3,d1,m1,m2,m4)*Z91_1(e1,e4,m3,d1)", &
        Z61,S45,Z91_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be4b,d1b|m1bm2bm4b)*Z91_1(e1be3b|m3b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e4,d1,m1,m2,m4)*Z91_1(e1,e3,m3,d1)", &
        Z61,S45,Z91_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e3be4b,d1b|m1bm2bm4b)*Z91_1(e1be2b|m3b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e3,e4,d1,m1,m2,m4)*Z91_1(e1,e2,m3,d1)", &
        Z61,S45,Z91_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2b,d1b|m1bm3bm4b)*Z91_1(e3be4b|m2b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,d1,m1,m3,m4)*Z91_1(e3,e4,m2,d1)", &
        Z61,S45,Z91_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be3b,d1b|m1bm3bm4b)*Z91_1(e2be4b|m2b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e3,d1,m1,m3,m4)*Z91_1(e2,e4,m2,d1)", &
        Z61,S45,Z91_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be4b,d1b|m1bm3bm4b)*Z91_1(e2be3b|m2b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e4,d1,m1,m3,m4)*Z91_1(e2,e3,m2,d1)", &
        Z61,S45,Z91_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be3b,d1b|m1bm3bm4b)*Z91_1(e1be4b|m2b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e3,d1,m1,m3,m4)*Z91_1(e1,e4,m2,d1)", &
        Z61,S45,Z91_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be4b,d1b|m1bm3bm4b)*Z91_1(e1be3b|m2b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e4,d1,m1,m3,m4)*Z91_1(e1,e3,m2,d1)", &
        Z61,S45,Z91_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e3be4b,d1b|m1bm3bm4b)*Z91_1(e1be2b|m2b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e3,e4,d1,m1,m3,m4)*Z91_1(e1,e2,m2,d1)", &
        Z61,S45,Z91_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2b,d1b|m2bm3bm4b)*Z91_1(e3be4b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,d1,m2,m3,m4)*Z91_1(e3,e4,m1,d1)", &
        Z61,S45,Z91_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be3b,d1b|m2bm3bm4b)*Z91_1(e2be4b|m1b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e3,d1,m2,m3,m4)*Z91_1(e2,e4,m1,d1)", &
        Z61,S45,Z91_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be4b,d1b|m2bm3bm4b)*Z91_1(e2be3b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e4,d1,m2,m3,m4)*Z91_1(e2,e3,m1,d1)", &
        Z61,S45,Z91_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be3b,d1b|m2bm3bm4b)*Z91_1(e1be4b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e3,d1,m2,m3,m4)*Z91_1(e1,e4,m1,d1)", &
        Z61,S45,Z91_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be4b,d1b|m2bm3bm4b)*Z91_1(e1be3b|m1b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e4,d1,m2,m3,m4)*Z91_1(e1,e3,m1,d1)", &
        Z61,S45,Z91_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e3be4b,d1b|m2bm3bm4b)*Z91_1(e1be2b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e3,e4,d1,m2,m3,m4)*Z91_1(e1,e2,m1,d1)", &
        Z61,S45,Z91_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z91_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nvir_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z91_1,"Z91_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z91_1,'ZERO')
!   original expression: Z91_1(e1be2b|m1b,d1b)+=H17(e1b,l1b|d1b,d2b)*S44(e2b,d2b|m1b,l1b)
    ierr=exatns_tensor_contract("Z91_1(e1,e2,m1,d1)+=H17(e1,l1,d1,d2)*S44(e2,d2,m1,l1)", &
        Z91_1,H17,S44,prefactor=(1.0d0,0.0d0))
!   original expression: Z91_1(e1be2b|m1b,d1b)+=H17(e2b,l1b|d1b,d2b)*S44(e1b,d2b|m1b,l1b)*-1.
    ierr=exatns_tensor_contract("Z91_1(e1,e2,m1,d1)+=H17(e2,l1,d1,d2)*S44(e1,d2,m1,l1)", &
        Z91_1,H17,S44,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2b,d1b|m1bm2bm3b)*Z91_1(e3be4b|m4b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,d1,m1,m2,m3)*Z91_1(e3,e4,m4,d1)", &
        Z61,S45,Z91_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be3b,d1b|m1bm2bm3b)*Z91_1(e2be4b|m4b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e3,d1,m1,m2,m3)*Z91_1(e2,e4,m4,d1)", &
        Z61,S45,Z91_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be4b,d1b|m1bm2bm3b)*Z91_1(e2be3b|m4b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e4,d1,m1,m2,m3)*Z91_1(e2,e3,m4,d1)", &
        Z61,S45,Z91_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be3b,d1b|m1bm2bm3b)*Z91_1(e1be4b|m4b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e3,d1,m1,m2,m3)*Z91_1(e1,e4,m4,d1)", &
        Z61,S45,Z91_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be4b,d1b|m1bm2bm3b)*Z91_1(e1be3b|m4b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e4,d1,m1,m2,m3)*Z91_1(e1,e3,m4,d1)", &
        Z61,S45,Z91_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e3be4b,d1b|m1bm2bm3b)*Z91_1(e1be2b|m4b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e3,e4,d1,m1,m2,m3)*Z91_1(e1,e2,m4,d1)", &
        Z61,S45,Z91_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2b,d1b|m1bm2bm4b)*Z91_1(e3be4b|m3b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,d1,m1,m2,m4)*Z91_1(e3,e4,m3,d1)", &
        Z61,S45,Z91_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be3b,d1b|m1bm2bm4b)*Z91_1(e2be4b|m3b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e3,d1,m1,m2,m4)*Z91_1(e2,e4,m3,d1)", &
        Z61,S45,Z91_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be4b,d1b|m1bm2bm4b)*Z91_1(e2be3b|m3b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e4,d1,m1,m2,m4)*Z91_1(e2,e3,m3,d1)", &
        Z61,S45,Z91_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be3b,d1b|m1bm2bm4b)*Z91_1(e1be4b|m3b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e3,d1,m1,m2,m4)*Z91_1(e1,e4,m3,d1)", &
        Z61,S45,Z91_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be4b,d1b|m1bm2bm4b)*Z91_1(e1be3b|m3b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e4,d1,m1,m2,m4)*Z91_1(e1,e3,m3,d1)", &
        Z61,S45,Z91_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e3be4b,d1b|m1bm2bm4b)*Z91_1(e1be2b|m3b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e3,e4,d1,m1,m2,m4)*Z91_1(e1,e2,m3,d1)", &
        Z61,S45,Z91_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2b,d1b|m1bm3bm4b)*Z91_1(e3be4b|m2b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,d1,m1,m3,m4)*Z91_1(e3,e4,m2,d1)", &
        Z61,S45,Z91_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be3b,d1b|m1bm3bm4b)*Z91_1(e2be4b|m2b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e3,d1,m1,m3,m4)*Z91_1(e2,e4,m2,d1)", &
        Z61,S45,Z91_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be4b,d1b|m1bm3bm4b)*Z91_1(e2be3b|m2b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e4,d1,m1,m3,m4)*Z91_1(e2,e3,m2,d1)", &
        Z61,S45,Z91_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be3b,d1b|m1bm3bm4b)*Z91_1(e1be4b|m2b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e3,d1,m1,m3,m4)*Z91_1(e1,e4,m2,d1)", &
        Z61,S45,Z91_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be4b,d1b|m1bm3bm4b)*Z91_1(e1be3b|m2b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e4,d1,m1,m3,m4)*Z91_1(e1,e3,m2,d1)", &
        Z61,S45,Z91_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e3be4b,d1b|m1bm3bm4b)*Z91_1(e1be2b|m2b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e3,e4,d1,m1,m3,m4)*Z91_1(e1,e2,m2,d1)", &
        Z61,S45,Z91_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2b,d1b|m2bm3bm4b)*Z91_1(e3be4b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,d1,m2,m3,m4)*Z91_1(e3,e4,m1,d1)", &
        Z61,S45,Z91_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be3b,d1b|m2bm3bm4b)*Z91_1(e2be4b|m1b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e3,d1,m2,m3,m4)*Z91_1(e2,e4,m1,d1)", &
        Z61,S45,Z91_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be4b,d1b|m2bm3bm4b)*Z91_1(e2be3b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e4,d1,m2,m3,m4)*Z91_1(e2,e3,m1,d1)", &
        Z61,S45,Z91_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be3b,d1b|m2bm3bm4b)*Z91_1(e1be4b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e3,d1,m2,m3,m4)*Z91_1(e1,e4,m1,d1)", &
        Z61,S45,Z91_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be4b,d1b|m2bm3bm4b)*Z91_1(e1be3b|m1b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e4,d1,m2,m3,m4)*Z91_1(e1,e3,m1,d1)", &
        Z61,S45,Z91_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e3be4b,d1b|m2bm3bm4b)*Z91_1(e1be2b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e3,e4,d1,m2,m3,m4)*Z91_1(e1,e2,m1,d1)", &
        Z61,S45,Z91_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z91_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nvir_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z91_1,"Z91_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z91_1,'ZERO')
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2b,d1b|m1bm2bm3b)*Z91_1(e3be4b|m4b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,d1,m1,m2,m3)*Z91_1(e3,e4,m4,d1)", &
        Z61,S45,Z91_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be3b,d1b|m1bm2bm3b)*Z91_1(e2be4b|m4b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e3,d1,m1,m2,m3)*Z91_1(e2,e4,m4,d1)", &
        Z61,S45,Z91_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be4b,d1b|m1bm2bm3b)*Z91_1(e2be3b|m4b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e4,d1,m1,m2,m3)*Z91_1(e2,e3,m4,d1)", &
        Z61,S45,Z91_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be3b,d1b|m1bm2bm3b)*Z91_1(e1be4b|m4b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e3,d1,m1,m2,m3)*Z91_1(e1,e4,m4,d1)", &
        Z61,S45,Z91_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be4b,d1b|m1bm2bm3b)*Z91_1(e1be3b|m4b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e4,d1,m1,m2,m3)*Z91_1(e1,e3,m4,d1)", &
        Z61,S45,Z91_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e3be4b,d1b|m1bm2bm3b)*Z91_1(e1be2b|m4b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e3,e4,d1,m1,m2,m3)*Z91_1(e1,e2,m4,d1)", &
        Z61,S45,Z91_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2b,d1b|m1bm2bm4b)*Z91_1(e3be4b|m3b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,d1,m1,m2,m4)*Z91_1(e3,e4,m3,d1)", &
        Z61,S45,Z91_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be3b,d1b|m1bm2bm4b)*Z91_1(e2be4b|m3b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e3,d1,m1,m2,m4)*Z91_1(e2,e4,m3,d1)", &
        Z61,S45,Z91_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be4b,d1b|m1bm2bm4b)*Z91_1(e2be3b|m3b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e4,d1,m1,m2,m4)*Z91_1(e2,e3,m3,d1)", &
        Z61,S45,Z91_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be3b,d1b|m1bm2bm4b)*Z91_1(e1be4b|m3b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e3,d1,m1,m2,m4)*Z91_1(e1,e4,m3,d1)", &
        Z61,S45,Z91_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be4b,d1b|m1bm2bm4b)*Z91_1(e1be3b|m3b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e4,d1,m1,m2,m4)*Z91_1(e1,e3,m3,d1)", &
        Z61,S45,Z91_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e3be4b,d1b|m1bm2bm4b)*Z91_1(e1be2b|m3b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e3,e4,d1,m1,m2,m4)*Z91_1(e1,e2,m3,d1)", &
        Z61,S45,Z91_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2b,d1b|m1bm3bm4b)*Z91_1(e3be4b|m2b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,d1,m1,m3,m4)*Z91_1(e3,e4,m2,d1)", &
        Z61,S45,Z91_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be3b,d1b|m1bm3bm4b)*Z91_1(e2be4b|m2b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e3,d1,m1,m3,m4)*Z91_1(e2,e4,m2,d1)", &
        Z61,S45,Z91_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be4b,d1b|m1bm3bm4b)*Z91_1(e2be3b|m2b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e4,d1,m1,m3,m4)*Z91_1(e2,e3,m2,d1)", &
        Z61,S45,Z91_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be3b,d1b|m1bm3bm4b)*Z91_1(e1be4b|m2b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e3,d1,m1,m3,m4)*Z91_1(e1,e4,m2,d1)", &
        Z61,S45,Z91_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be4b,d1b|m1bm3bm4b)*Z91_1(e1be3b|m2b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e4,d1,m1,m3,m4)*Z91_1(e1,e3,m2,d1)", &
        Z61,S45,Z91_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e3be4b,d1b|m1bm3bm4b)*Z91_1(e1be2b|m2b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e3,e4,d1,m1,m3,m4)*Z91_1(e1,e2,m2,d1)", &
        Z61,S45,Z91_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2b,d1b|m2bm3bm4b)*Z91_1(e3be4b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,d1,m2,m3,m4)*Z91_1(e3,e4,m1,d1)", &
        Z61,S45,Z91_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be3b,d1b|m2bm3bm4b)*Z91_1(e2be4b|m1b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e3,d1,m2,m3,m4)*Z91_1(e2,e4,m1,d1)", &
        Z61,S45,Z91_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be4b,d1b|m2bm3bm4b)*Z91_1(e2be3b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e4,d1,m2,m3,m4)*Z91_1(e2,e3,m1,d1)", &
        Z61,S45,Z91_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be3b,d1b|m2bm3bm4b)*Z91_1(e1be4b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e3,d1,m2,m3,m4)*Z91_1(e1,e4,m1,d1)", &
        Z61,S45,Z91_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be4b,d1b|m2bm3bm4b)*Z91_1(e1be3b|m1b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e4,d1,m2,m3,m4)*Z91_1(e1,e3,m1,d1)", &
        Z61,S45,Z91_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e3be4b,d1b|m2bm3bm4b)*Z91_1(e1be2b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e3,e4,d1,m2,m3,m4)*Z91_1(e1,e2,m1,d1)", &
        Z61,S45,Z91_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z91_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z129_2,"Z129_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z129_2,'ZERO')
!   original expression: Z129_2(l1bl2b|m1b,d1b)+=H24(l1bl2b|d1b,d2b)*S43(d2b|m1b)
    ierr=exatns_tensor_contract("Z129_2(l1,l2,m1,d1)+=H24(l1,l2,d1,d2)*S43(d2,m1)", &
        Z129_2,H24,S43,prefactor=(1.0d0,0.0d0))
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nvir_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z91_1,"Z91_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z91_1,'ZERO')
!   original expression: Z91_1(e1be2b|m1b,d1b)+=S44(e1be2b|l1bl2b)*Z129_2(l1bl2b|m1b,d1b)
    ierr=exatns_tensor_contract("Z91_1(e1,e2,m1,d1)+=S44(e1,e2,l1,l2)*Z129_2(l1,l2,m1,d1)", &
        Z91_1,S44,Z129_2,prefactor=(0.5d0,0.0d0))
    ierr=exatns_tensor_destroy(Z129_2)
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2b,d1b|m1bm2bm3b)*Z91_1(e3be4b|m4b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,d1,m1,m2,m3)*Z91_1(e3,e4,m4,d1)", &
        Z61,S45,Z91_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be3b,d1b|m1bm2bm3b)*Z91_1(e2be4b|m4b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e3,d1,m1,m2,m3)*Z91_1(e2,e4,m4,d1)", &
        Z61,S45,Z91_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be4b,d1b|m1bm2bm3b)*Z91_1(e2be3b|m4b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e4,d1,m1,m2,m3)*Z91_1(e2,e3,m4,d1)", &
        Z61,S45,Z91_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be3b,d1b|m1bm2bm3b)*Z91_1(e1be4b|m4b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e3,d1,m1,m2,m3)*Z91_1(e1,e4,m4,d1)", &
        Z61,S45,Z91_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be4b,d1b|m1bm2bm3b)*Z91_1(e1be3b|m4b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e4,d1,m1,m2,m3)*Z91_1(e1,e3,m4,d1)", &
        Z61,S45,Z91_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e3be4b,d1b|m1bm2bm3b)*Z91_1(e1be2b|m4b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e3,e4,d1,m1,m2,m3)*Z91_1(e1,e2,m4,d1)", &
        Z61,S45,Z91_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2b,d1b|m1bm2bm4b)*Z91_1(e3be4b|m3b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,d1,m1,m2,m4)*Z91_1(e3,e4,m3,d1)", &
        Z61,S45,Z91_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be3b,d1b|m1bm2bm4b)*Z91_1(e2be4b|m3b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e3,d1,m1,m2,m4)*Z91_1(e2,e4,m3,d1)", &
        Z61,S45,Z91_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be4b,d1b|m1bm2bm4b)*Z91_1(e2be3b|m3b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e4,d1,m1,m2,m4)*Z91_1(e2,e3,m3,d1)", &
        Z61,S45,Z91_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be3b,d1b|m1bm2bm4b)*Z91_1(e1be4b|m3b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e3,d1,m1,m2,m4)*Z91_1(e1,e4,m3,d1)", &
        Z61,S45,Z91_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be4b,d1b|m1bm2bm4b)*Z91_1(e1be3b|m3b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e4,d1,m1,m2,m4)*Z91_1(e1,e3,m3,d1)", &
        Z61,S45,Z91_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e3be4b,d1b|m1bm2bm4b)*Z91_1(e1be2b|m3b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e3,e4,d1,m1,m2,m4)*Z91_1(e1,e2,m3,d1)", &
        Z61,S45,Z91_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2b,d1b|m1bm3bm4b)*Z91_1(e3be4b|m2b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,d1,m1,m3,m4)*Z91_1(e3,e4,m2,d1)", &
        Z61,S45,Z91_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be3b,d1b|m1bm3bm4b)*Z91_1(e2be4b|m2b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e3,d1,m1,m3,m4)*Z91_1(e2,e4,m2,d1)", &
        Z61,S45,Z91_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be4b,d1b|m1bm3bm4b)*Z91_1(e2be3b|m2b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e4,d1,m1,m3,m4)*Z91_1(e2,e3,m2,d1)", &
        Z61,S45,Z91_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be3b,d1b|m1bm3bm4b)*Z91_1(e1be4b|m2b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e3,d1,m1,m3,m4)*Z91_1(e1,e4,m2,d1)", &
        Z61,S45,Z91_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be4b,d1b|m1bm3bm4b)*Z91_1(e1be3b|m2b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e4,d1,m1,m3,m4)*Z91_1(e1,e3,m2,d1)", &
        Z61,S45,Z91_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e3be4b,d1b|m1bm3bm4b)*Z91_1(e1be2b|m2b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e3,e4,d1,m1,m3,m4)*Z91_1(e1,e2,m2,d1)", &
        Z61,S45,Z91_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2b,d1b|m2bm3bm4b)*Z91_1(e3be4b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,d1,m2,m3,m4)*Z91_1(e3,e4,m1,d1)", &
        Z61,S45,Z91_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be3b,d1b|m2bm3bm4b)*Z91_1(e2be4b|m1b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e3,d1,m2,m3,m4)*Z91_1(e2,e4,m1,d1)", &
        Z61,S45,Z91_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be4b,d1b|m2bm3bm4b)*Z91_1(e2be3b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e4,d1,m2,m3,m4)*Z91_1(e2,e3,m1,d1)", &
        Z61,S45,Z91_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be3b,d1b|m2bm3bm4b)*Z91_1(e1be4b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e3,d1,m2,m3,m4)*Z91_1(e1,e4,m1,d1)", &
        Z61,S45,Z91_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be4b,d1b|m2bm3bm4b)*Z91_1(e1be3b|m1b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e4,d1,m2,m3,m4)*Z91_1(e1,e3,m1,d1)", &
        Z61,S45,Z91_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e3be4b,d1b|m2bm3bm4b)*Z91_1(e1be2b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e3,e4,d1,m2,m3,m4)*Z91_1(e1,e2,m1,d1)", &
        Z61,S45,Z91_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z91_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nvir_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z91_1,"Z91_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z91_1,'ZERO')
!   original expression: Z91_1(e1be2b|m1b,d1b)+=S44(e1be2b|l1bl2b)*H25(l1bl2b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z91_1(e1,e2,m1,d1)+=S44(e1,e2,l1,l2)*H25(l1,l2,m1,d1)", &
        Z91_1,S44,H25,prefactor=(-0.5d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2b,d1b|m1bm2bm3b)*Z91_1(e3be4b|m4b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,d1,m1,m2,m3)*Z91_1(e3,e4,m4,d1)", &
        Z61,S45,Z91_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be3b,d1b|m1bm2bm3b)*Z91_1(e2be4b|m4b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e3,d1,m1,m2,m3)*Z91_1(e2,e4,m4,d1)", &
        Z61,S45,Z91_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be4b,d1b|m1bm2bm3b)*Z91_1(e2be3b|m4b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e4,d1,m1,m2,m3)*Z91_1(e2,e3,m4,d1)", &
        Z61,S45,Z91_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be3b,d1b|m1bm2bm3b)*Z91_1(e1be4b|m4b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e3,d1,m1,m2,m3)*Z91_1(e1,e4,m4,d1)", &
        Z61,S45,Z91_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be4b,d1b|m1bm2bm3b)*Z91_1(e1be3b|m4b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e4,d1,m1,m2,m3)*Z91_1(e1,e3,m4,d1)", &
        Z61,S45,Z91_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e3be4b,d1b|m1bm2bm3b)*Z91_1(e1be2b|m4b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e3,e4,d1,m1,m2,m3)*Z91_1(e1,e2,m4,d1)", &
        Z61,S45,Z91_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2b,d1b|m1bm2bm4b)*Z91_1(e3be4b|m3b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,d1,m1,m2,m4)*Z91_1(e3,e4,m3,d1)", &
        Z61,S45,Z91_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be3b,d1b|m1bm2bm4b)*Z91_1(e2be4b|m3b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e3,d1,m1,m2,m4)*Z91_1(e2,e4,m3,d1)", &
        Z61,S45,Z91_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be4b,d1b|m1bm2bm4b)*Z91_1(e2be3b|m3b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e4,d1,m1,m2,m4)*Z91_1(e2,e3,m3,d1)", &
        Z61,S45,Z91_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be3b,d1b|m1bm2bm4b)*Z91_1(e1be4b|m3b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e3,d1,m1,m2,m4)*Z91_1(e1,e4,m3,d1)", &
        Z61,S45,Z91_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be4b,d1b|m1bm2bm4b)*Z91_1(e1be3b|m3b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e4,d1,m1,m2,m4)*Z91_1(e1,e3,m3,d1)", &
        Z61,S45,Z91_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e3be4b,d1b|m1bm2bm4b)*Z91_1(e1be2b|m3b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e3,e4,d1,m1,m2,m4)*Z91_1(e1,e2,m3,d1)", &
        Z61,S45,Z91_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2b,d1b|m1bm3bm4b)*Z91_1(e3be4b|m2b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,d1,m1,m3,m4)*Z91_1(e3,e4,m2,d1)", &
        Z61,S45,Z91_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be3b,d1b|m1bm3bm4b)*Z91_1(e2be4b|m2b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e3,d1,m1,m3,m4)*Z91_1(e2,e4,m2,d1)", &
        Z61,S45,Z91_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be4b,d1b|m1bm3bm4b)*Z91_1(e2be3b|m2b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e4,d1,m1,m3,m4)*Z91_1(e2,e3,m2,d1)", &
        Z61,S45,Z91_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be3b,d1b|m1bm3bm4b)*Z91_1(e1be4b|m2b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e3,d1,m1,m3,m4)*Z91_1(e1,e4,m2,d1)", &
        Z61,S45,Z91_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be4b,d1b|m1bm3bm4b)*Z91_1(e1be3b|m2b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e4,d1,m1,m3,m4)*Z91_1(e1,e3,m2,d1)", &
        Z61,S45,Z91_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e3be4b,d1b|m1bm3bm4b)*Z91_1(e1be2b|m2b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e3,e4,d1,m1,m3,m4)*Z91_1(e1,e2,m2,d1)", &
        Z61,S45,Z91_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2b,d1b|m2bm3bm4b)*Z91_1(e3be4b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,d1,m2,m3,m4)*Z91_1(e3,e4,m1,d1)", &
        Z61,S45,Z91_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be3b,d1b|m2bm3bm4b)*Z91_1(e2be4b|m1b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e3,d1,m2,m3,m4)*Z91_1(e2,e4,m1,d1)", &
        Z61,S45,Z91_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be4b,d1b|m2bm3bm4b)*Z91_1(e2be3b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e4,d1,m2,m3,m4)*Z91_1(e2,e3,m1,d1)", &
        Z61,S45,Z91_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be3b,d1b|m2bm3bm4b)*Z91_1(e1be4b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e3,d1,m2,m3,m4)*Z91_1(e1,e4,m1,d1)", &
        Z61,S45,Z91_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be4b,d1b|m2bm3bm4b)*Z91_1(e1be3b|m1b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e4,d1,m2,m3,m4)*Z91_1(e1,e3,m1,d1)", &
        Z61,S45,Z91_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e3be4b,d1b|m2bm3bm4b)*Z91_1(e1be2b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e3,e4,d1,m2,m3,m4)*Z91_1(e1,e2,m1,d1)", &
        Z61,S45,Z91_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z91_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nvir_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z91_1,"Z91_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z91_1,'ZERO')
!   original expression: Z91_1(e1be2b|m1b,d1b)+=S45(e1be2b,d2b|m1b,l1bl2b)*H24(l1bl2b|d1b,d2b)
    ierr=exatns_tensor_contract("Z91_1(e1,e2,m1,d1)+=S45(e1,e2,d2,m1,l1,l2)*H24(l1,l2,d1,d2)", &
        Z91_1,S45,H24,prefactor=(0.5d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2b,d1b|m1bm2bm3b)*Z91_1(e3be4b|m4b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,d1,m1,m2,m3)*Z91_1(e3,e4,m4,d1)", &
        Z61,S45,Z91_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be3b,d1b|m1bm2bm3b)*Z91_1(e2be4b|m4b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e3,d1,m1,m2,m3)*Z91_1(e2,e4,m4,d1)", &
        Z61,S45,Z91_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be4b,d1b|m1bm2bm3b)*Z91_1(e2be3b|m4b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e4,d1,m1,m2,m3)*Z91_1(e2,e3,m4,d1)", &
        Z61,S45,Z91_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be3b,d1b|m1bm2bm3b)*Z91_1(e1be4b|m4b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e3,d1,m1,m2,m3)*Z91_1(e1,e4,m4,d1)", &
        Z61,S45,Z91_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be4b,d1b|m1bm2bm3b)*Z91_1(e1be3b|m4b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e4,d1,m1,m2,m3)*Z91_1(e1,e3,m4,d1)", &
        Z61,S45,Z91_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e3be4b,d1b|m1bm2bm3b)*Z91_1(e1be2b|m4b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e3,e4,d1,m1,m2,m3)*Z91_1(e1,e2,m4,d1)", &
        Z61,S45,Z91_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2b,d1b|m1bm2bm4b)*Z91_1(e3be4b|m3b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,d1,m1,m2,m4)*Z91_1(e3,e4,m3,d1)", &
        Z61,S45,Z91_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be3b,d1b|m1bm2bm4b)*Z91_1(e2be4b|m3b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e3,d1,m1,m2,m4)*Z91_1(e2,e4,m3,d1)", &
        Z61,S45,Z91_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be4b,d1b|m1bm2bm4b)*Z91_1(e2be3b|m3b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e4,d1,m1,m2,m4)*Z91_1(e2,e3,m3,d1)", &
        Z61,S45,Z91_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be3b,d1b|m1bm2bm4b)*Z91_1(e1be4b|m3b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e3,d1,m1,m2,m4)*Z91_1(e1,e4,m3,d1)", &
        Z61,S45,Z91_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be4b,d1b|m1bm2bm4b)*Z91_1(e1be3b|m3b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e4,d1,m1,m2,m4)*Z91_1(e1,e3,m3,d1)", &
        Z61,S45,Z91_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e3be4b,d1b|m1bm2bm4b)*Z91_1(e1be2b|m3b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e3,e4,d1,m1,m2,m4)*Z91_1(e1,e2,m3,d1)", &
        Z61,S45,Z91_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2b,d1b|m1bm3bm4b)*Z91_1(e3be4b|m2b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,d1,m1,m3,m4)*Z91_1(e3,e4,m2,d1)", &
        Z61,S45,Z91_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be3b,d1b|m1bm3bm4b)*Z91_1(e2be4b|m2b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e3,d1,m1,m3,m4)*Z91_1(e2,e4,m2,d1)", &
        Z61,S45,Z91_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be4b,d1b|m1bm3bm4b)*Z91_1(e2be3b|m2b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e4,d1,m1,m3,m4)*Z91_1(e2,e3,m2,d1)", &
        Z61,S45,Z91_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be3b,d1b|m1bm3bm4b)*Z91_1(e1be4b|m2b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e3,d1,m1,m3,m4)*Z91_1(e1,e4,m2,d1)", &
        Z61,S45,Z91_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be4b,d1b|m1bm3bm4b)*Z91_1(e1be3b|m2b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e4,d1,m1,m3,m4)*Z91_1(e1,e3,m2,d1)", &
        Z61,S45,Z91_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e3be4b,d1b|m1bm3bm4b)*Z91_1(e1be2b|m2b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e3,e4,d1,m1,m3,m4)*Z91_1(e1,e2,m2,d1)", &
        Z61,S45,Z91_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2b,d1b|m2bm3bm4b)*Z91_1(e3be4b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,d1,m2,m3,m4)*Z91_1(e3,e4,m1,d1)", &
        Z61,S45,Z91_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be3b,d1b|m2bm3bm4b)*Z91_1(e2be4b|m1b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e3,d1,m2,m3,m4)*Z91_1(e2,e4,m1,d1)", &
        Z61,S45,Z91_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be4b,d1b|m2bm3bm4b)*Z91_1(e2be3b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e4,d1,m2,m3,m4)*Z91_1(e2,e3,m1,d1)", &
        Z61,S45,Z91_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be3b,d1b|m2bm3bm4b)*Z91_1(e1be4b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e3,d1,m2,m3,m4)*Z91_1(e1,e4,m1,d1)", &
        Z61,S45,Z91_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be4b,d1b|m2bm3bm4b)*Z91_1(e1be3b|m1b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e4,d1,m2,m3,m4)*Z91_1(e1,e3,m1,d1)", &
        Z61,S45,Z91_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e3be4b,d1b|m2bm3bm4b)*Z91_1(e1be2b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e3,e4,d1,m2,m3,m4)*Z91_1(e1,e2,m1,d1)", &
        Z61,S45,Z91_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z91_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nvir_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z91_1,"Z91_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z91_1,'ZERO')
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2b,d1b|m1bm2bm3b)*Z91_1(e3be4b|m4b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,d1,m1,m2,m3)*Z91_1(e3,e4,m4,d1)", &
        Z61,S45,Z91_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be3b,d1b|m1bm2bm3b)*Z91_1(e2be4b|m4b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e3,d1,m1,m2,m3)*Z91_1(e2,e4,m4,d1)", &
        Z61,S45,Z91_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be4b,d1b|m1bm2bm3b)*Z91_1(e2be3b|m4b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e4,d1,m1,m2,m3)*Z91_1(e2,e3,m4,d1)", &
        Z61,S45,Z91_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be3b,d1b|m1bm2bm3b)*Z91_1(e1be4b|m4b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e3,d1,m1,m2,m3)*Z91_1(e1,e4,m4,d1)", &
        Z61,S45,Z91_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be4b,d1b|m1bm2bm3b)*Z91_1(e1be3b|m4b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e4,d1,m1,m2,m3)*Z91_1(e1,e3,m4,d1)", &
        Z61,S45,Z91_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e3be4b,d1b|m1bm2bm3b)*Z91_1(e1be2b|m4b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e3,e4,d1,m1,m2,m3)*Z91_1(e1,e2,m4,d1)", &
        Z61,S45,Z91_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2b,d1b|m1bm2bm4b)*Z91_1(e3be4b|m3b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,d1,m1,m2,m4)*Z91_1(e3,e4,m3,d1)", &
        Z61,S45,Z91_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be3b,d1b|m1bm2bm4b)*Z91_1(e2be4b|m3b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e3,d1,m1,m2,m4)*Z91_1(e2,e4,m3,d1)", &
        Z61,S45,Z91_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be4b,d1b|m1bm2bm4b)*Z91_1(e2be3b|m3b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e4,d1,m1,m2,m4)*Z91_1(e2,e3,m3,d1)", &
        Z61,S45,Z91_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be3b,d1b|m1bm2bm4b)*Z91_1(e1be4b|m3b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e3,d1,m1,m2,m4)*Z91_1(e1,e4,m3,d1)", &
        Z61,S45,Z91_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be4b,d1b|m1bm2bm4b)*Z91_1(e1be3b|m3b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e4,d1,m1,m2,m4)*Z91_1(e1,e3,m3,d1)", &
        Z61,S45,Z91_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e3be4b,d1b|m1bm2bm4b)*Z91_1(e1be2b|m3b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e3,e4,d1,m1,m2,m4)*Z91_1(e1,e2,m3,d1)", &
        Z61,S45,Z91_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2b,d1b|m1bm3bm4b)*Z91_1(e3be4b|m2b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,d1,m1,m3,m4)*Z91_1(e3,e4,m2,d1)", &
        Z61,S45,Z91_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be3b,d1b|m1bm3bm4b)*Z91_1(e2be4b|m2b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e3,d1,m1,m3,m4)*Z91_1(e2,e4,m2,d1)", &
        Z61,S45,Z91_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be4b,d1b|m1bm3bm4b)*Z91_1(e2be3b|m2b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e4,d1,m1,m3,m4)*Z91_1(e2,e3,m2,d1)", &
        Z61,S45,Z91_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be3b,d1b|m1bm3bm4b)*Z91_1(e1be4b|m2b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e3,d1,m1,m3,m4)*Z91_1(e1,e4,m2,d1)", &
        Z61,S45,Z91_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be4b,d1b|m1bm3bm4b)*Z91_1(e1be3b|m2b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e4,d1,m1,m3,m4)*Z91_1(e1,e3,m2,d1)", &
        Z61,S45,Z91_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e3be4b,d1b|m1bm3bm4b)*Z91_1(e1be2b|m2b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e3,e4,d1,m1,m3,m4)*Z91_1(e1,e2,m2,d1)", &
        Z61,S45,Z91_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2b,d1b|m2bm3bm4b)*Z91_1(e3be4b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,d1,m2,m3,m4)*Z91_1(e3,e4,m1,d1)", &
        Z61,S45,Z91_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be3b,d1b|m2bm3bm4b)*Z91_1(e2be4b|m1b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e3,d1,m2,m3,m4)*Z91_1(e2,e4,m1,d1)", &
        Z61,S45,Z91_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be4b,d1b|m2bm3bm4b)*Z91_1(e2be3b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e4,d1,m2,m3,m4)*Z91_1(e2,e3,m1,d1)", &
        Z61,S45,Z91_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be3b,d1b|m2bm3bm4b)*Z91_1(e1be4b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e3,d1,m2,m3,m4)*Z91_1(e1,e4,m1,d1)", &
        Z61,S45,Z91_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be4b,d1b|m2bm3bm4b)*Z91_1(e1be3b|m1b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e4,d1,m2,m3,m4)*Z91_1(e1,e3,m1,d1)", &
        Z61,S45,Z91_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e3be4b,d1b|m2bm3bm4b)*Z91_1(e1be2b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e3,e4,d1,m2,m3,m4)*Z91_1(e1,e2,m1,d1)", &
        Z61,S45,Z91_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z91_1)
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2b,d1b|m1bm2bm3b)*H4(e3be4b|m4b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,d1,m1,m2,m3)*H4(e3,e4,m4,d1)", &
        Z61,S45,H4,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be3b,d1b|m1bm2bm3b)*H4(e2be4b|m4b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e3,d1,m1,m2,m3)*H4(e2,e4,m4,d1)", &
        Z61,S45,H4,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be4b,d1b|m1bm2bm3b)*H4(e2be3b|m4b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e4,d1,m1,m2,m3)*H4(e2,e3,m4,d1)", &
        Z61,S45,H4,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be3b,d1b|m1bm2bm3b)*H4(e1be4b|m4b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e3,d1,m1,m2,m3)*H4(e1,e4,m4,d1)", &
        Z61,S45,H4,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be4b,d1b|m1bm2bm3b)*H4(e1be3b|m4b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e4,d1,m1,m2,m3)*H4(e1,e3,m4,d1)", &
        Z61,S45,H4,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e3be4b,d1b|m1bm2bm3b)*H4(e1be2b|m4b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e3,e4,d1,m1,m2,m3)*H4(e1,e2,m4,d1)", &
        Z61,S45,H4,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2b,d1b|m1bm2bm4b)*H4(e3be4b|m3b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,d1,m1,m2,m4)*H4(e3,e4,m3,d1)", &
        Z61,S45,H4,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be3b,d1b|m1bm2bm4b)*H4(e2be4b|m3b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e3,d1,m1,m2,m4)*H4(e2,e4,m3,d1)", &
        Z61,S45,H4,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be4b,d1b|m1bm2bm4b)*H4(e2be3b|m3b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e4,d1,m1,m2,m4)*H4(e2,e3,m3,d1)", &
        Z61,S45,H4,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be3b,d1b|m1bm2bm4b)*H4(e1be4b|m3b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e3,d1,m1,m2,m4)*H4(e1,e4,m3,d1)", &
        Z61,S45,H4,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be4b,d1b|m1bm2bm4b)*H4(e1be3b|m3b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e4,d1,m1,m2,m4)*H4(e1,e3,m3,d1)", &
        Z61,S45,H4,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e3be4b,d1b|m1bm2bm4b)*H4(e1be2b|m3b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e3,e4,d1,m1,m2,m4)*H4(e1,e2,m3,d1)", &
        Z61,S45,H4,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2b,d1b|m1bm3bm4b)*H4(e3be4b|m2b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,d1,m1,m3,m4)*H4(e3,e4,m2,d1)", &
        Z61,S45,H4,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be3b,d1b|m1bm3bm4b)*H4(e2be4b|m2b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e3,d1,m1,m3,m4)*H4(e2,e4,m2,d1)", &
        Z61,S45,H4,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be4b,d1b|m1bm3bm4b)*H4(e2be3b|m2b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e4,d1,m1,m3,m4)*H4(e2,e3,m2,d1)", &
        Z61,S45,H4,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be3b,d1b|m1bm3bm4b)*H4(e1be4b|m2b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e3,d1,m1,m3,m4)*H4(e1,e4,m2,d1)", &
        Z61,S45,H4,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be4b,d1b|m1bm3bm4b)*H4(e1be3b|m2b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e4,d1,m1,m3,m4)*H4(e1,e3,m2,d1)", &
        Z61,S45,H4,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e3be4b,d1b|m1bm3bm4b)*H4(e1be2b|m2b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e3,e4,d1,m1,m3,m4)*H4(e1,e2,m2,d1)", &
        Z61,S45,H4,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2b,d1b|m2bm3bm4b)*H4(e3be4b|m1b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,d1,m2,m3,m4)*H4(e3,e4,m1,d1)", &
        Z61,S45,H4,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be3b,d1b|m2bm3bm4b)*H4(e2be4b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e3,d1,m2,m3,m4)*H4(e2,e4,m1,d1)", &
        Z61,S45,H4,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be4b,d1b|m2bm3bm4b)*H4(e2be3b|m1b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e4,d1,m2,m3,m4)*H4(e2,e3,m1,d1)", &
        Z61,S45,H4,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be3b,d1b|m2bm3bm4b)*H4(e1be4b|m1b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e3,d1,m2,m3,m4)*H4(e1,e4,m1,d1)", &
        Z61,S45,H4,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be4b,d1b|m2bm3bm4b)*H4(e1be3b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e4,d1,m2,m3,m4)*H4(e1,e3,m1,d1)", &
        Z61,S45,H4,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e3be4b,d1b|m2bm3bm4b)*H4(e1be2b|m1b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e3,e4,d1,m2,m3,m4)*H4(e1,e2,m1,d1)", &
        Z61,S45,H4,prefactor=(1.0d0,0.0d0))
    
    allocate(tens_id(6), tens_root(6))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z82_1,"Z82_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z82_1,'ZERO')
!   original expression: Z82_1(e1b,l1bl2b|m1bm2bm3b)+=S45(e1b,d1bd2b|m1bm2bm3b)*H24(l1bl2b|d1bd2b)
    ierr=exatns_tensor_contract("Z82_1(e1,l1,l2,m1,m2,m3)+=S45(e1,d1,d2,m1,m2,m3)*H24(l1,l2,d1,d2)", &
        Z82_1,S45,H24,prefactor=(0.5d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be3b|m1b,l1bl2b)*Z82_1(e4b,l1bl2b|m2bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e3,m1,l1,l2)*Z82_1(e4,l1,l2,m2,m3,m4)", &
        Z61,S45,Z82_1,prefactor=(0.5d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be4b|m1b,l1bl2b)*Z82_1(e3b,l1bl2b|m2bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e4,m1,l1,l2)*Z82_1(e3,l1,l2,m2,m3,m4)", &
        Z61,S45,Z82_1,prefactor=(-0.5d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be3be4b|m1b,l1bl2b)*Z82_1(e2b,l1bl2b|m2bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e3,e4,m1,l1,l2)*Z82_1(e2,l1,l2,m2,m3,m4)", &
        Z61,S45,Z82_1,prefactor=(0.5d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be3be4b|m1b,l1bl2b)*Z82_1(e1b,l1bl2b|m2bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e3,e4,m1,l1,l2)*Z82_1(e1,l1,l2,m2,m3,m4)", &
        Z61,S45,Z82_1,prefactor=(-0.5d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be3b|m2b,l1bl2b)*Z82_1(e4b,l1bl2b|m1bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e3,m2,l1,l2)*Z82_1(e4,l1,l2,m1,m3,m4)", &
        Z61,S45,Z82_1,prefactor=(-0.5d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be4b|m2b,l1bl2b)*Z82_1(e3b,l1bl2b|m1bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e4,m2,l1,l2)*Z82_1(e3,l1,l2,m1,m3,m4)", &
        Z61,S45,Z82_1,prefactor=(0.5d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be3be4b|m2b,l1bl2b)*Z82_1(e2b,l1bl2b|m1bm3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e3,e4,m2,l1,l2)*Z82_1(e2,l1,l2,m1,m3,m4)", &
        Z61,S45,Z82_1,prefactor=(-0.5d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be3be4b|m2b,l1bl2b)*Z82_1(e1b,l1bl2b|m1bm3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e3,e4,m2,l1,l2)*Z82_1(e1,l1,l2,m1,m3,m4)", &
        Z61,S45,Z82_1,prefactor=(0.5d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be3b|m3b,l1bl2b)*Z82_1(e4b,l1bl2b|m1bm2bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e3,m3,l1,l2)*Z82_1(e4,l1,l2,m1,m2,m4)", &
        Z61,S45,Z82_1,prefactor=(0.5d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be4b|m3b,l1bl2b)*Z82_1(e3b,l1bl2b|m1bm2bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e4,m3,l1,l2)*Z82_1(e3,l1,l2,m1,m2,m4)", &
        Z61,S45,Z82_1,prefactor=(-0.5d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be3be4b|m3b,l1bl2b)*Z82_1(e2b,l1bl2b|m1bm2bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e3,e4,m3,l1,l2)*Z82_1(e2,l1,l2,m1,m2,m4)", &
        Z61,S45,Z82_1,prefactor=(0.5d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be3be4b|m3b,l1bl2b)*Z82_1(e1b,l1bl2b|m1bm2bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e3,e4,m3,l1,l2)*Z82_1(e1,l1,l2,m1,m2,m4)", &
        Z61,S45,Z82_1,prefactor=(-0.5d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be3b|m4b,l1bl2b)*Z82_1(e4b,l1bl2b|m1bm2bm3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e3,m4,l1,l2)*Z82_1(e4,l1,l2,m1,m2,m3)", &
        Z61,S45,Z82_1,prefactor=(-0.5d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be4b|m4b,l1bl2b)*Z82_1(e3b,l1bl2b|m1bm2bm3b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e4,m4,l1,l2)*Z82_1(e3,l1,l2,m1,m2,m3)", &
        Z61,S45,Z82_1,prefactor=(0.5d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be3be4b|m4b,l1bl2b)*Z82_1(e2b,l1bl2b|m1bm2bm3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e3,e4,m4,l1,l2)*Z82_1(e2,l1,l2,m1,m2,m3)", &
        Z61,S45,Z82_1,prefactor=(-0.5d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be3be4b|m4b,l1bl2b)*Z82_1(e1b,l1bl2b|m1bm2bm3b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e3,e4,m4,l1,l2)*Z82_1(e1,l1,l2,m1,m2,m3)", &
        Z61,S45,Z82_1,prefactor=(0.5d0,0.0d0))
    ierr=exatns_tensor_destroy(Z82_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z81_1,"Z81_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z81_1,'ZERO')
!   original expression: Z81_1(e1b,l1b|m1bm2b)+=H17(e1b,l1b|d1bd2b)*S44(d1bd2b|m1bm2b)
    ierr=exatns_tensor_contract("Z81_1(e1,l1,m1,m2)+=H17(e1,l1,d1,d2)*S44(d1,d2,m1,m2)", &
        Z81_1,H17,S44,prefactor=(0.5d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be3b|m1bm2b,l1b)*Z81_1(e4b,l1b|m3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e3,m1,m2,l1)*Z81_1(e4,l1,m3,m4)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be4b|m1bm2b,l1b)*Z81_1(e3b,l1b|m3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e4,m1,m2,l1)*Z81_1(e3,l1,m3,m4)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be3be4b|m1bm2b,l1b)*Z81_1(e2b,l1b|m3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e3,e4,m1,m2,l1)*Z81_1(e2,l1,m3,m4)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be3be4b|m1bm2b,l1b)*Z81_1(e1b,l1b|m3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e3,e4,m1,m2,l1)*Z81_1(e1,l1,m3,m4)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be3b|m1bm3b,l1b)*Z81_1(e4b,l1b|m2bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e3,m1,m3,l1)*Z81_1(e4,l1,m2,m4)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be4b|m1bm3b,l1b)*Z81_1(e3b,l1b|m2bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e4,m1,m3,l1)*Z81_1(e3,l1,m2,m4)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be3be4b|m1bm3b,l1b)*Z81_1(e2b,l1b|m2bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e3,e4,m1,m3,l1)*Z81_1(e2,l1,m2,m4)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be3be4b|m1bm3b,l1b)*Z81_1(e1b,l1b|m2bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e3,e4,m1,m3,l1)*Z81_1(e1,l1,m2,m4)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be3b|m1bm4b,l1b)*Z81_1(e4b,l1b|m2bm3b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e3,m1,m4,l1)*Z81_1(e4,l1,m2,m3)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be4b|m1bm4b,l1b)*Z81_1(e3b,l1b|m2bm3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e4,m1,m4,l1)*Z81_1(e3,l1,m2,m3)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be3be4b|m1bm4b,l1b)*Z81_1(e2b,l1b|m2bm3b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e3,e4,m1,m4,l1)*Z81_1(e2,l1,m2,m3)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be3be4b|m1bm4b,l1b)*Z81_1(e1b,l1b|m2bm3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e3,e4,m1,m4,l1)*Z81_1(e1,l1,m2,m3)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be3b|m2bm3b,l1b)*Z81_1(e4b,l1b|m1bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e3,m2,m3,l1)*Z81_1(e4,l1,m1,m4)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be4b|m2bm3b,l1b)*Z81_1(e3b,l1b|m1bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e4,m2,m3,l1)*Z81_1(e3,l1,m1,m4)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be3be4b|m2bm3b,l1b)*Z81_1(e2b,l1b|m1bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e3,e4,m2,m3,l1)*Z81_1(e2,l1,m1,m4)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be3be4b|m2bm3b,l1b)*Z81_1(e1b,l1b|m1bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e3,e4,m2,m3,l1)*Z81_1(e1,l1,m1,m4)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be3b|m2bm4b,l1b)*Z81_1(e4b,l1b|m1bm3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e3,m2,m4,l1)*Z81_1(e4,l1,m1,m3)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be4b|m2bm4b,l1b)*Z81_1(e3b,l1b|m1bm3b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e4,m2,m4,l1)*Z81_1(e3,l1,m1,m3)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be3be4b|m2bm4b,l1b)*Z81_1(e2b,l1b|m1bm3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e3,e4,m2,m4,l1)*Z81_1(e2,l1,m1,m3)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be3be4b|m2bm4b,l1b)*Z81_1(e1b,l1b|m1bm3b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e3,e4,m2,m4,l1)*Z81_1(e1,l1,m1,m3)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be3b|m3bm4b,l1b)*Z81_1(e4b,l1b|m1bm2b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e3,m3,m4,l1)*Z81_1(e4,l1,m1,m2)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be4b|m3bm4b,l1b)*Z81_1(e3b,l1b|m1bm2b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e4,m3,m4,l1)*Z81_1(e3,l1,m1,m2)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be3be4b|m3bm4b,l1b)*Z81_1(e2b,l1b|m1bm2b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e3,e4,m3,m4,l1)*Z81_1(e2,l1,m1,m2)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be3be4b|m3bm4b,l1b)*Z81_1(e1b,l1b|m1bm2b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e3,e4,m3,m4,l1)*Z81_1(e1,l1,m1,m2)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z81_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z81_1,"Z81_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z81_1,'ZERO')
!   original expression: Z81_1(e1b,l1b|m1bm2b)+=H26(l1b,l2b|m1bm2b)*S43(e1b|l2b)
    ierr=exatns_tensor_contract("Z81_1(e1,l1,m1,m2)+=H26(l1,l2,m1,m2)*S43(e1,l2)", &
        Z81_1,H26,S43,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be3b|m1bm2b,l1b)*Z81_1(e4b,l1b|m3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e3,m1,m2,l1)*Z81_1(e4,l1,m3,m4)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be4b|m1bm2b,l1b)*Z81_1(e3b,l1b|m3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e4,m1,m2,l1)*Z81_1(e3,l1,m3,m4)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be3be4b|m1bm2b,l1b)*Z81_1(e2b,l1b|m3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e3,e4,m1,m2,l1)*Z81_1(e2,l1,m3,m4)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be3be4b|m1bm2b,l1b)*Z81_1(e1b,l1b|m3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e3,e4,m1,m2,l1)*Z81_1(e1,l1,m3,m4)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be3b|m1bm3b,l1b)*Z81_1(e4b,l1b|m2bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e3,m1,m3,l1)*Z81_1(e4,l1,m2,m4)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be4b|m1bm3b,l1b)*Z81_1(e3b,l1b|m2bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e4,m1,m3,l1)*Z81_1(e3,l1,m2,m4)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be3be4b|m1bm3b,l1b)*Z81_1(e2b,l1b|m2bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e3,e4,m1,m3,l1)*Z81_1(e2,l1,m2,m4)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be3be4b|m1bm3b,l1b)*Z81_1(e1b,l1b|m2bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e3,e4,m1,m3,l1)*Z81_1(e1,l1,m2,m4)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be3b|m1bm4b,l1b)*Z81_1(e4b,l1b|m2bm3b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e3,m1,m4,l1)*Z81_1(e4,l1,m2,m3)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be4b|m1bm4b,l1b)*Z81_1(e3b,l1b|m2bm3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e4,m1,m4,l1)*Z81_1(e3,l1,m2,m3)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be3be4b|m1bm4b,l1b)*Z81_1(e2b,l1b|m2bm3b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e3,e4,m1,m4,l1)*Z81_1(e2,l1,m2,m3)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be3be4b|m1bm4b,l1b)*Z81_1(e1b,l1b|m2bm3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e3,e4,m1,m4,l1)*Z81_1(e1,l1,m2,m3)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be3b|m2bm3b,l1b)*Z81_1(e4b,l1b|m1bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e3,m2,m3,l1)*Z81_1(e4,l1,m1,m4)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be4b|m2bm3b,l1b)*Z81_1(e3b,l1b|m1bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e4,m2,m3,l1)*Z81_1(e3,l1,m1,m4)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be3be4b|m2bm3b,l1b)*Z81_1(e2b,l1b|m1bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e3,e4,m2,m3,l1)*Z81_1(e2,l1,m1,m4)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be3be4b|m2bm3b,l1b)*Z81_1(e1b,l1b|m1bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e3,e4,m2,m3,l1)*Z81_1(e1,l1,m1,m4)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be3b|m2bm4b,l1b)*Z81_1(e4b,l1b|m1bm3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e3,m2,m4,l1)*Z81_1(e4,l1,m1,m3)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be4b|m2bm4b,l1b)*Z81_1(e3b,l1b|m1bm3b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e4,m2,m4,l1)*Z81_1(e3,l1,m1,m3)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be3be4b|m2bm4b,l1b)*Z81_1(e2b,l1b|m1bm3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e3,e4,m2,m4,l1)*Z81_1(e2,l1,m1,m3)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be3be4b|m2bm4b,l1b)*Z81_1(e1b,l1b|m1bm3b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e3,e4,m2,m4,l1)*Z81_1(e1,l1,m1,m3)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be3b|m3bm4b,l1b)*Z81_1(e4b,l1b|m1bm2b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e3,m3,m4,l1)*Z81_1(e4,l1,m1,m2)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be4b|m3bm4b,l1b)*Z81_1(e3b,l1b|m1bm2b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e4,m3,m4,l1)*Z81_1(e3,l1,m1,m2)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be3be4b|m3bm4b,l1b)*Z81_1(e2b,l1b|m1bm2b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e3,e4,m3,m4,l1)*Z81_1(e2,l1,m1,m2)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be3be4b|m3bm4b,l1b)*Z81_1(e1b,l1b|m1bm2b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e3,e4,m3,m4,l1)*Z81_1(e1,l1,m1,m2)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z81_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z81_1,"Z81_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z81_1,'ZERO')
!   original expression: Z81_1(e1b,l1b|m1bm2b)+=H18(e1b,l1b|m1b,d1b)*S43(d1b|m2b)
    ierr=exatns_tensor_contract("Z81_1(e1,l1,m1,m2)+=H18(e1,l1,m1,d1)*S43(d1,m2)", &
        Z81_1,H18,S43,prefactor=(1.0d0,0.0d0))
!   original expression: Z81_1(e1b,l1b|m1bm2b)+=H18(e1b,l1b|m2b,d1b)*S43(d1b|m1b)*-1.
    ierr=exatns_tensor_contract("Z81_1(e1,l1,m1,m2)+=H18(e1,l1,m2,d1)*S43(d1,m1)", &
        Z81_1,H18,S43,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be3b|m1bm2b,l1b)*Z81_1(e4b,l1b|m3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e3,m1,m2,l1)*Z81_1(e4,l1,m3,m4)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be4b|m1bm2b,l1b)*Z81_1(e3b,l1b|m3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e4,m1,m2,l1)*Z81_1(e3,l1,m3,m4)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be3be4b|m1bm2b,l1b)*Z81_1(e2b,l1b|m3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e3,e4,m1,m2,l1)*Z81_1(e2,l1,m3,m4)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be3be4b|m1bm2b,l1b)*Z81_1(e1b,l1b|m3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e3,e4,m1,m2,l1)*Z81_1(e1,l1,m3,m4)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be3b|m1bm3b,l1b)*Z81_1(e4b,l1b|m2bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e3,m1,m3,l1)*Z81_1(e4,l1,m2,m4)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be4b|m1bm3b,l1b)*Z81_1(e3b,l1b|m2bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e4,m1,m3,l1)*Z81_1(e3,l1,m2,m4)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be3be4b|m1bm3b,l1b)*Z81_1(e2b,l1b|m2bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e3,e4,m1,m3,l1)*Z81_1(e2,l1,m2,m4)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be3be4b|m1bm3b,l1b)*Z81_1(e1b,l1b|m2bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e3,e4,m1,m3,l1)*Z81_1(e1,l1,m2,m4)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be3b|m1bm4b,l1b)*Z81_1(e4b,l1b|m2bm3b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e3,m1,m4,l1)*Z81_1(e4,l1,m2,m3)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be4b|m1bm4b,l1b)*Z81_1(e3b,l1b|m2bm3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e4,m1,m4,l1)*Z81_1(e3,l1,m2,m3)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be3be4b|m1bm4b,l1b)*Z81_1(e2b,l1b|m2bm3b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e3,e4,m1,m4,l1)*Z81_1(e2,l1,m2,m3)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be3be4b|m1bm4b,l1b)*Z81_1(e1b,l1b|m2bm3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e3,e4,m1,m4,l1)*Z81_1(e1,l1,m2,m3)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be3b|m2bm3b,l1b)*Z81_1(e4b,l1b|m1bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e3,m2,m3,l1)*Z81_1(e4,l1,m1,m4)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be4b|m2bm3b,l1b)*Z81_1(e3b,l1b|m1bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e4,m2,m3,l1)*Z81_1(e3,l1,m1,m4)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be3be4b|m2bm3b,l1b)*Z81_1(e2b,l1b|m1bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e3,e4,m2,m3,l1)*Z81_1(e2,l1,m1,m4)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be3be4b|m2bm3b,l1b)*Z81_1(e1b,l1b|m1bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e3,e4,m2,m3,l1)*Z81_1(e1,l1,m1,m4)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be3b|m2bm4b,l1b)*Z81_1(e4b,l1b|m1bm3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e3,m2,m4,l1)*Z81_1(e4,l1,m1,m3)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be4b|m2bm4b,l1b)*Z81_1(e3b,l1b|m1bm3b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e4,m2,m4,l1)*Z81_1(e3,l1,m1,m3)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be3be4b|m2bm4b,l1b)*Z81_1(e2b,l1b|m1bm3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e3,e4,m2,m4,l1)*Z81_1(e2,l1,m1,m3)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be3be4b|m2bm4b,l1b)*Z81_1(e1b,l1b|m1bm3b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e3,e4,m2,m4,l1)*Z81_1(e1,l1,m1,m3)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be3b|m3bm4b,l1b)*Z81_1(e4b,l1b|m1bm2b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e3,m3,m4,l1)*Z81_1(e4,l1,m1,m2)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be4b|m3bm4b,l1b)*Z81_1(e3b,l1b|m1bm2b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e4,m3,m4,l1)*Z81_1(e3,l1,m1,m2)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be3be4b|m3bm4b,l1b)*Z81_1(e2b,l1b|m1bm2b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e3,e4,m3,m4,l1)*Z81_1(e2,l1,m1,m2)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be3be4b|m3bm4b,l1b)*Z81_1(e1b,l1b|m1bm2b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e3,e4,m3,m4,l1)*Z81_1(e1,l1,m1,m2)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z81_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z127_2,"Z127_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z127_2,'ZERO')
!   original expression: Z127_2(l1b,l2b|m1bm2b)+=H24(l1b,l2b|d1bd2b)*S44(d1bd2b|m1bm2b)
    ierr=exatns_tensor_contract("Z127_2(l1,l2,m1,m2)+=H24(l1,l2,d1,d2)*S44(d1,d2,m1,m2)", &
        Z127_2,H24,S44,prefactor=(0.5d0,0.0d0))
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z81_1,"Z81_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z81_1,'ZERO')
!   original expression: Z81_1(e1b,l1b|m1bm2b)+=S43(e1b|l2b)*Z127_2(l1b,l2b|m1bm2b)
    ierr=exatns_tensor_contract("Z81_1(e1,l1,m1,m2)+=S43(e1,l2)*Z127_2(l1,l2,m1,m2)", &
        Z81_1,S43,Z127_2,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z127_2)
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be3b|m1bm2b,l1b)*Z81_1(e4b,l1b|m3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e3,m1,m2,l1)*Z81_1(e4,l1,m3,m4)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be4b|m1bm2b,l1b)*Z81_1(e3b,l1b|m3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e4,m1,m2,l1)*Z81_1(e3,l1,m3,m4)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be3be4b|m1bm2b,l1b)*Z81_1(e2b,l1b|m3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e3,e4,m1,m2,l1)*Z81_1(e2,l1,m3,m4)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be3be4b|m1bm2b,l1b)*Z81_1(e1b,l1b|m3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e3,e4,m1,m2,l1)*Z81_1(e1,l1,m3,m4)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be3b|m1bm3b,l1b)*Z81_1(e4b,l1b|m2bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e3,m1,m3,l1)*Z81_1(e4,l1,m2,m4)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be4b|m1bm3b,l1b)*Z81_1(e3b,l1b|m2bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e4,m1,m3,l1)*Z81_1(e3,l1,m2,m4)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be3be4b|m1bm3b,l1b)*Z81_1(e2b,l1b|m2bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e3,e4,m1,m3,l1)*Z81_1(e2,l1,m2,m4)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be3be4b|m1bm3b,l1b)*Z81_1(e1b,l1b|m2bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e3,e4,m1,m3,l1)*Z81_1(e1,l1,m2,m4)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be3b|m1bm4b,l1b)*Z81_1(e4b,l1b|m2bm3b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e3,m1,m4,l1)*Z81_1(e4,l1,m2,m3)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be4b|m1bm4b,l1b)*Z81_1(e3b,l1b|m2bm3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e4,m1,m4,l1)*Z81_1(e3,l1,m2,m3)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be3be4b|m1bm4b,l1b)*Z81_1(e2b,l1b|m2bm3b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e3,e4,m1,m4,l1)*Z81_1(e2,l1,m2,m3)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be3be4b|m1bm4b,l1b)*Z81_1(e1b,l1b|m2bm3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e3,e4,m1,m4,l1)*Z81_1(e1,l1,m2,m3)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be3b|m2bm3b,l1b)*Z81_1(e4b,l1b|m1bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e3,m2,m3,l1)*Z81_1(e4,l1,m1,m4)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be4b|m2bm3b,l1b)*Z81_1(e3b,l1b|m1bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e4,m2,m3,l1)*Z81_1(e3,l1,m1,m4)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be3be4b|m2bm3b,l1b)*Z81_1(e2b,l1b|m1bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e3,e4,m2,m3,l1)*Z81_1(e2,l1,m1,m4)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be3be4b|m2bm3b,l1b)*Z81_1(e1b,l1b|m1bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e3,e4,m2,m3,l1)*Z81_1(e1,l1,m1,m4)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be3b|m2bm4b,l1b)*Z81_1(e4b,l1b|m1bm3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e3,m2,m4,l1)*Z81_1(e4,l1,m1,m3)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be4b|m2bm4b,l1b)*Z81_1(e3b,l1b|m1bm3b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e4,m2,m4,l1)*Z81_1(e3,l1,m1,m3)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be3be4b|m2bm4b,l1b)*Z81_1(e2b,l1b|m1bm3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e3,e4,m2,m4,l1)*Z81_1(e2,l1,m1,m3)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be3be4b|m2bm4b,l1b)*Z81_1(e1b,l1b|m1bm3b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e3,e4,m2,m4,l1)*Z81_1(e1,l1,m1,m3)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be3b|m3bm4b,l1b)*Z81_1(e4b,l1b|m1bm2b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e3,m3,m4,l1)*Z81_1(e4,l1,m1,m2)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be4b|m3bm4b,l1b)*Z81_1(e3b,l1b|m1bm2b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e4,m3,m4,l1)*Z81_1(e3,l1,m1,m2)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be3be4b|m3bm4b,l1b)*Z81_1(e2b,l1b|m1bm2b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e3,e4,m3,m4,l1)*Z81_1(e2,l1,m1,m2)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be3be4b|m3bm4b,l1b)*Z81_1(e1b,l1b|m1bm2b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e3,e4,m3,m4,l1)*Z81_1(e1,l1,m1,m2)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z81_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z127_2,"Z127_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z127_2,'ZERO')
!   original expression: Z127_2(l1b,l2b|m1bm2b)+=H25(l1b,l2b|m1b,d1b)*S43(d1b|m2b)
    ierr=exatns_tensor_contract("Z127_2(l1,l2,m1,m2)+=H25(l1,l2,m1,d1)*S43(d1,m2)", &
        Z127_2,H25,S43,prefactor=(1.0d0,0.0d0))
!   original expression: Z127_2(l1b,l2b|m1bm2b)+=H25(l1b,l2b|m2b,d1b)*S43(d1b|m1b)*-1.
    ierr=exatns_tensor_contract("Z127_2(l1,l2,m1,m2)+=H25(l1,l2,m2,d1)*S43(d1,m1)", &
        Z127_2,H25,S43,prefactor=(-1.0d0,0.0d0))
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z81_1,"Z81_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z81_1,'ZERO')
!   original expression: Z81_1(e1b,l1b|m1bm2b)+=S43(e1b|l2b)*Z127_2(l1b,l2b|m1bm2b)
    ierr=exatns_tensor_contract("Z81_1(e1,l1,m1,m2)+=S43(e1,l2)*Z127_2(l1,l2,m1,m2)", &
        Z81_1,S43,Z127_2,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z127_2)
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be3b|m1bm2b,l1b)*Z81_1(e4b,l1b|m3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e3,m1,m2,l1)*Z81_1(e4,l1,m3,m4)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be4b|m1bm2b,l1b)*Z81_1(e3b,l1b|m3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e4,m1,m2,l1)*Z81_1(e3,l1,m3,m4)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be3be4b|m1bm2b,l1b)*Z81_1(e2b,l1b|m3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e3,e4,m1,m2,l1)*Z81_1(e2,l1,m3,m4)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be3be4b|m1bm2b,l1b)*Z81_1(e1b,l1b|m3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e3,e4,m1,m2,l1)*Z81_1(e1,l1,m3,m4)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be3b|m1bm3b,l1b)*Z81_1(e4b,l1b|m2bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e3,m1,m3,l1)*Z81_1(e4,l1,m2,m4)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be4b|m1bm3b,l1b)*Z81_1(e3b,l1b|m2bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e4,m1,m3,l1)*Z81_1(e3,l1,m2,m4)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be3be4b|m1bm3b,l1b)*Z81_1(e2b,l1b|m2bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e3,e4,m1,m3,l1)*Z81_1(e2,l1,m2,m4)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be3be4b|m1bm3b,l1b)*Z81_1(e1b,l1b|m2bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e3,e4,m1,m3,l1)*Z81_1(e1,l1,m2,m4)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be3b|m1bm4b,l1b)*Z81_1(e4b,l1b|m2bm3b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e3,m1,m4,l1)*Z81_1(e4,l1,m2,m3)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be4b|m1bm4b,l1b)*Z81_1(e3b,l1b|m2bm3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e4,m1,m4,l1)*Z81_1(e3,l1,m2,m3)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be3be4b|m1bm4b,l1b)*Z81_1(e2b,l1b|m2bm3b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e3,e4,m1,m4,l1)*Z81_1(e2,l1,m2,m3)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be3be4b|m1bm4b,l1b)*Z81_1(e1b,l1b|m2bm3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e3,e4,m1,m4,l1)*Z81_1(e1,l1,m2,m3)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be3b|m2bm3b,l1b)*Z81_1(e4b,l1b|m1bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e3,m2,m3,l1)*Z81_1(e4,l1,m1,m4)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be4b|m2bm3b,l1b)*Z81_1(e3b,l1b|m1bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e4,m2,m3,l1)*Z81_1(e3,l1,m1,m4)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be3be4b|m2bm3b,l1b)*Z81_1(e2b,l1b|m1bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e3,e4,m2,m3,l1)*Z81_1(e2,l1,m1,m4)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be3be4b|m2bm3b,l1b)*Z81_1(e1b,l1b|m1bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e3,e4,m2,m3,l1)*Z81_1(e1,l1,m1,m4)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be3b|m2bm4b,l1b)*Z81_1(e4b,l1b|m1bm3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e3,m2,m4,l1)*Z81_1(e4,l1,m1,m3)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be4b|m2bm4b,l1b)*Z81_1(e3b,l1b|m1bm3b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e4,m2,m4,l1)*Z81_1(e3,l1,m1,m3)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be3be4b|m2bm4b,l1b)*Z81_1(e2b,l1b|m1bm3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e3,e4,m2,m4,l1)*Z81_1(e2,l1,m1,m3)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be3be4b|m2bm4b,l1b)*Z81_1(e1b,l1b|m1bm3b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e3,e4,m2,m4,l1)*Z81_1(e1,l1,m1,m3)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be3b|m3bm4b,l1b)*Z81_1(e4b,l1b|m1bm2b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e3,m3,m4,l1)*Z81_1(e4,l1,m1,m2)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be4b|m3bm4b,l1b)*Z81_1(e3b,l1b|m1bm2b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e4,m3,m4,l1)*Z81_1(e3,l1,m1,m2)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be3be4b|m3bm4b,l1b)*Z81_1(e2b,l1b|m1bm2b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e3,e4,m3,m4,l1)*Z81_1(e2,l1,m1,m2)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be3be4b|m3bm4b,l1b)*Z81_1(e1b,l1b|m1bm2b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e3,e4,m3,m4,l1)*Z81_1(e1,l1,m1,m2)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z81_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z165_3,"Z165_3",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z165_3,'ZERO')
!   original expression: Z165_3(l1b,l2b|m1b,d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|m1b)*0.5
    ierr=exatns_tensor_contract("Z165_3(l1,l2,m1,d1)+=H24(l1,l2,d1,d2)*S43(d2,m1)", &
        Z165_3,H24,S43,prefactor=(0.5d0,0.0d0))
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z127_2,"Z127_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z127_2,'ZERO')
!   original expression: Z127_2(l1b,l2b|m1bm2b)+=S43(d1b|m1b)*Z165_3(l1b,l2b|m2b,d1b)
    ierr=exatns_tensor_contract("Z127_2(l1,l2,m1,m2)+=S43(d1,m1)*Z165_3(l1,l2,m2,d1)", &
        Z127_2,S43,Z165_3,prefactor=(1.0d0,0.0d0))
!   original expression: Z127_2(l1b,l2b|m1bm2b)+=S43(d1b|m2b)*Z165_3(l1b,l2b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z127_2(l1,l2,m1,m2)+=S43(d1,m2)*Z165_3(l1,l2,m1,d1)", &
        Z127_2,S43,Z165_3,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z165_3)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z81_1,"Z81_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z81_1,'ZERO')
!   original expression: Z81_1(e1b,l1b|m1bm2b)+=S43(e1b|l2b)*Z127_2(l1b,l2b|m1bm2b)
    ierr=exatns_tensor_contract("Z81_1(e1,l1,m1,m2)+=S43(e1,l2)*Z127_2(l1,l2,m1,m2)", &
        Z81_1,S43,Z127_2,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z127_2)
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be3b|m1bm2b,l1b)*Z81_1(e4b,l1b|m3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e3,m1,m2,l1)*Z81_1(e4,l1,m3,m4)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be4b|m1bm2b,l1b)*Z81_1(e3b,l1b|m3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e4,m1,m2,l1)*Z81_1(e3,l1,m3,m4)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be3be4b|m1bm2b,l1b)*Z81_1(e2b,l1b|m3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e3,e4,m1,m2,l1)*Z81_1(e2,l1,m3,m4)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be3be4b|m1bm2b,l1b)*Z81_1(e1b,l1b|m3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e3,e4,m1,m2,l1)*Z81_1(e1,l1,m3,m4)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be3b|m1bm3b,l1b)*Z81_1(e4b,l1b|m2bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e3,m1,m3,l1)*Z81_1(e4,l1,m2,m4)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be4b|m1bm3b,l1b)*Z81_1(e3b,l1b|m2bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e4,m1,m3,l1)*Z81_1(e3,l1,m2,m4)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be3be4b|m1bm3b,l1b)*Z81_1(e2b,l1b|m2bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e3,e4,m1,m3,l1)*Z81_1(e2,l1,m2,m4)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be3be4b|m1bm3b,l1b)*Z81_1(e1b,l1b|m2bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e3,e4,m1,m3,l1)*Z81_1(e1,l1,m2,m4)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be3b|m1bm4b,l1b)*Z81_1(e4b,l1b|m2bm3b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e3,m1,m4,l1)*Z81_1(e4,l1,m2,m3)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be4b|m1bm4b,l1b)*Z81_1(e3b,l1b|m2bm3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e4,m1,m4,l1)*Z81_1(e3,l1,m2,m3)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be3be4b|m1bm4b,l1b)*Z81_1(e2b,l1b|m2bm3b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e3,e4,m1,m4,l1)*Z81_1(e2,l1,m2,m3)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be3be4b|m1bm4b,l1b)*Z81_1(e1b,l1b|m2bm3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e3,e4,m1,m4,l1)*Z81_1(e1,l1,m2,m3)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be3b|m2bm3b,l1b)*Z81_1(e4b,l1b|m1bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e3,m2,m3,l1)*Z81_1(e4,l1,m1,m4)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be4b|m2bm3b,l1b)*Z81_1(e3b,l1b|m1bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e4,m2,m3,l1)*Z81_1(e3,l1,m1,m4)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be3be4b|m2bm3b,l1b)*Z81_1(e2b,l1b|m1bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e3,e4,m2,m3,l1)*Z81_1(e2,l1,m1,m4)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be3be4b|m2bm3b,l1b)*Z81_1(e1b,l1b|m1bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e3,e4,m2,m3,l1)*Z81_1(e1,l1,m1,m4)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be3b|m2bm4b,l1b)*Z81_1(e4b,l1b|m1bm3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e3,m2,m4,l1)*Z81_1(e4,l1,m1,m3)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be4b|m2bm4b,l1b)*Z81_1(e3b,l1b|m1bm3b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e4,m2,m4,l1)*Z81_1(e3,l1,m1,m3)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be3be4b|m2bm4b,l1b)*Z81_1(e2b,l1b|m1bm3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e3,e4,m2,m4,l1)*Z81_1(e2,l1,m1,m3)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be3be4b|m2bm4b,l1b)*Z81_1(e1b,l1b|m1bm3b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e3,e4,m2,m4,l1)*Z81_1(e1,l1,m1,m3)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be3b|m3bm4b,l1b)*Z81_1(e4b,l1b|m1bm2b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e3,m3,m4,l1)*Z81_1(e4,l1,m1,m2)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be4b|m3bm4b,l1b)*Z81_1(e3b,l1b|m1bm2b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e4,m3,m4,l1)*Z81_1(e3,l1,m1,m2)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be3be4b|m3bm4b,l1b)*Z81_1(e2b,l1b|m1bm2b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e3,e4,m3,m4,l1)*Z81_1(e2,l1,m1,m2)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be3be4b|m3bm4b,l1b)*Z81_1(e1b,l1b|m1bm2b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e3,e4,m3,m4,l1)*Z81_1(e1,l1,m1,m2)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z81_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z136_2,"Z136_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z136_2,'ZERO')
!   original expression: Z136_2(e1b,l1b|m1b,d1b)+=H17(e1b,l1b|d1b,d2b)*S43(d2b|m1b)*0.5
    ierr=exatns_tensor_contract("Z136_2(e1,l1,m1,d1)+=H17(e1,l1,d1,d2)*S43(d2,m1)", &
        Z136_2,H17,S43,prefactor=(0.5d0,0.0d0))
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z81_1,"Z81_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z81_1,'ZERO')
!   original expression: Z81_1(e1b,l1b|m1bm2b)+=S43(d1b|m1b)*Z136_2(e1b,l1b|m2b,d1b)
    ierr=exatns_tensor_contract("Z81_1(e1,l1,m1,m2)+=S43(d1,m1)*Z136_2(e1,l1,m2,d1)", &
        Z81_1,S43,Z136_2,prefactor=(1.0d0,0.0d0))
!   original expression: Z81_1(e1b,l1b|m1bm2b)+=S43(d1b|m2b)*Z136_2(e1b,l1b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z81_1(e1,l1,m1,m2)+=S43(d1,m2)*Z136_2(e1,l1,m1,d1)", &
        Z81_1,S43,Z136_2,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z136_2)
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be3b|m1bm2b,l1b)*Z81_1(e4b,l1b|m3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e3,m1,m2,l1)*Z81_1(e4,l1,m3,m4)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be4b|m1bm2b,l1b)*Z81_1(e3b,l1b|m3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e4,m1,m2,l1)*Z81_1(e3,l1,m3,m4)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be3be4b|m1bm2b,l1b)*Z81_1(e2b,l1b|m3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e3,e4,m1,m2,l1)*Z81_1(e2,l1,m3,m4)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be3be4b|m1bm2b,l1b)*Z81_1(e1b,l1b|m3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e3,e4,m1,m2,l1)*Z81_1(e1,l1,m3,m4)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be3b|m1bm3b,l1b)*Z81_1(e4b,l1b|m2bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e3,m1,m3,l1)*Z81_1(e4,l1,m2,m4)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be4b|m1bm3b,l1b)*Z81_1(e3b,l1b|m2bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e4,m1,m3,l1)*Z81_1(e3,l1,m2,m4)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be3be4b|m1bm3b,l1b)*Z81_1(e2b,l1b|m2bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e3,e4,m1,m3,l1)*Z81_1(e2,l1,m2,m4)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be3be4b|m1bm3b,l1b)*Z81_1(e1b,l1b|m2bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e3,e4,m1,m3,l1)*Z81_1(e1,l1,m2,m4)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be3b|m1bm4b,l1b)*Z81_1(e4b,l1b|m2bm3b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e3,m1,m4,l1)*Z81_1(e4,l1,m2,m3)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be4b|m1bm4b,l1b)*Z81_1(e3b,l1b|m2bm3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e4,m1,m4,l1)*Z81_1(e3,l1,m2,m3)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be3be4b|m1bm4b,l1b)*Z81_1(e2b,l1b|m2bm3b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e3,e4,m1,m4,l1)*Z81_1(e2,l1,m2,m3)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be3be4b|m1bm4b,l1b)*Z81_1(e1b,l1b|m2bm3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e3,e4,m1,m4,l1)*Z81_1(e1,l1,m2,m3)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be3b|m2bm3b,l1b)*Z81_1(e4b,l1b|m1bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e3,m2,m3,l1)*Z81_1(e4,l1,m1,m4)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be4b|m2bm3b,l1b)*Z81_1(e3b,l1b|m1bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e4,m2,m3,l1)*Z81_1(e3,l1,m1,m4)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be3be4b|m2bm3b,l1b)*Z81_1(e2b,l1b|m1bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e3,e4,m2,m3,l1)*Z81_1(e2,l1,m1,m4)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be3be4b|m2bm3b,l1b)*Z81_1(e1b,l1b|m1bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e3,e4,m2,m3,l1)*Z81_1(e1,l1,m1,m4)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be3b|m2bm4b,l1b)*Z81_1(e4b,l1b|m1bm3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e3,m2,m4,l1)*Z81_1(e4,l1,m1,m3)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be4b|m2bm4b,l1b)*Z81_1(e3b,l1b|m1bm3b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e4,m2,m4,l1)*Z81_1(e3,l1,m1,m3)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be3be4b|m2bm4b,l1b)*Z81_1(e2b,l1b|m1bm3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e3,e4,m2,m4,l1)*Z81_1(e2,l1,m1,m3)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be3be4b|m2bm4b,l1b)*Z81_1(e1b,l1b|m1bm3b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e3,e4,m2,m4,l1)*Z81_1(e1,l1,m1,m3)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be3b|m3bm4b,l1b)*Z81_1(e4b,l1b|m1bm2b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e3,m3,m4,l1)*Z81_1(e4,l1,m1,m2)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be4b|m3bm4b,l1b)*Z81_1(e3b,l1b|m1bm2b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e4,m3,m4,l1)*Z81_1(e3,l1,m1,m2)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be3be4b|m3bm4b,l1b)*Z81_1(e2b,l1b|m1bm2b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e3,e4,m3,m4,l1)*Z81_1(e2,l1,m1,m2)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be3be4b|m3bm4b,l1b)*Z81_1(e1b,l1b|m1bm2b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e3,e4,m3,m4,l1)*Z81_1(e1,l1,m1,m2)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z81_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nvir_id/)
    tens_root = (/nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z75_2,"Z75_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z75_2,'ZERO')
!   original expression: Z75_2(l1b|d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|l2b)
    ierr=exatns_tensor_contract("Z75_2(l1,d1)+=H24(l1,l2,d1,d2)*S43(d2,l2)", &
        Z75_2,H24,S43,prefactor=(1.0d0,0.0d0))
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z81_1,"Z81_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z81_1,'ZERO')
!   original expression: Z81_1(e1b,l1b|m1bm2b)+=S44(e1b,d1b|m1bm2b)*Z75_2(l1b|d1b)
    ierr=exatns_tensor_contract("Z81_1(e1,l1,m1,m2)+=S44(e1,d1,m1,m2)*Z75_2(l1,d1)", &
        Z81_1,S44,Z75_2,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z75_2)
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be3b|m1bm2b,l1b)*Z81_1(e4b,l1b|m3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e3,m1,m2,l1)*Z81_1(e4,l1,m3,m4)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be4b|m1bm2b,l1b)*Z81_1(e3b,l1b|m3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e4,m1,m2,l1)*Z81_1(e3,l1,m3,m4)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be3be4b|m1bm2b,l1b)*Z81_1(e2b,l1b|m3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e3,e4,m1,m2,l1)*Z81_1(e2,l1,m3,m4)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be3be4b|m1bm2b,l1b)*Z81_1(e1b,l1b|m3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e3,e4,m1,m2,l1)*Z81_1(e1,l1,m3,m4)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be3b|m1bm3b,l1b)*Z81_1(e4b,l1b|m2bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e3,m1,m3,l1)*Z81_1(e4,l1,m2,m4)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be4b|m1bm3b,l1b)*Z81_1(e3b,l1b|m2bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e4,m1,m3,l1)*Z81_1(e3,l1,m2,m4)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be3be4b|m1bm3b,l1b)*Z81_1(e2b,l1b|m2bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e3,e4,m1,m3,l1)*Z81_1(e2,l1,m2,m4)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be3be4b|m1bm3b,l1b)*Z81_1(e1b,l1b|m2bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e3,e4,m1,m3,l1)*Z81_1(e1,l1,m2,m4)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be3b|m1bm4b,l1b)*Z81_1(e4b,l1b|m2bm3b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e3,m1,m4,l1)*Z81_1(e4,l1,m2,m3)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be4b|m1bm4b,l1b)*Z81_1(e3b,l1b|m2bm3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e4,m1,m4,l1)*Z81_1(e3,l1,m2,m3)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be3be4b|m1bm4b,l1b)*Z81_1(e2b,l1b|m2bm3b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e3,e4,m1,m4,l1)*Z81_1(e2,l1,m2,m3)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be3be4b|m1bm4b,l1b)*Z81_1(e1b,l1b|m2bm3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e3,e4,m1,m4,l1)*Z81_1(e1,l1,m2,m3)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be3b|m2bm3b,l1b)*Z81_1(e4b,l1b|m1bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e3,m2,m3,l1)*Z81_1(e4,l1,m1,m4)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be4b|m2bm3b,l1b)*Z81_1(e3b,l1b|m1bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e4,m2,m3,l1)*Z81_1(e3,l1,m1,m4)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be3be4b|m2bm3b,l1b)*Z81_1(e2b,l1b|m1bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e3,e4,m2,m3,l1)*Z81_1(e2,l1,m1,m4)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be3be4b|m2bm3b,l1b)*Z81_1(e1b,l1b|m1bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e3,e4,m2,m3,l1)*Z81_1(e1,l1,m1,m4)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be3b|m2bm4b,l1b)*Z81_1(e4b,l1b|m1bm3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e3,m2,m4,l1)*Z81_1(e4,l1,m1,m3)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be4b|m2bm4b,l1b)*Z81_1(e3b,l1b|m1bm3b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e4,m2,m4,l1)*Z81_1(e3,l1,m1,m3)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be3be4b|m2bm4b,l1b)*Z81_1(e2b,l1b|m1bm3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e3,e4,m2,m4,l1)*Z81_1(e2,l1,m1,m3)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be3be4b|m2bm4b,l1b)*Z81_1(e1b,l1b|m1bm3b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e3,e4,m2,m4,l1)*Z81_1(e1,l1,m1,m3)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be3b|m3bm4b,l1b)*Z81_1(e4b,l1b|m1bm2b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e3,m3,m4,l1)*Z81_1(e4,l1,m1,m2)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be4b|m3bm4b,l1b)*Z81_1(e3b,l1b|m1bm2b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e4,m3,m4,l1)*Z81_1(e3,l1,m1,m2)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be3be4b|m3bm4b,l1b)*Z81_1(e2b,l1b|m1bm2b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e3,e4,m3,m4,l1)*Z81_1(e2,l1,m1,m2)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be3be4b|m3bm4b,l1b)*Z81_1(e1b,l1b|m1bm2b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e3,e4,m3,m4,l1)*Z81_1(e1,l1,m1,m2)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z81_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nvir_id/)
    tens_root = (/nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z75_2,"Z75_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z75_2,'ZERO')
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z81_1,"Z81_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z81_1,'ZERO')
!   original expression: Z81_1(e1b,l1b|m1bm2b)+=S44(e1b,d1b|m1bm2b)*Z75_2(l1b|d1b)
    ierr=exatns_tensor_contract("Z81_1(e1,l1,m1,m2)+=S44(e1,d1,m1,m2)*Z75_2(l1,d1)", &
        Z81_1,S44,Z75_2,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z75_2)
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be3b|m1bm2b,l1b)*Z81_1(e4b,l1b|m3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e3,m1,m2,l1)*Z81_1(e4,l1,m3,m4)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be4b|m1bm2b,l1b)*Z81_1(e3b,l1b|m3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e4,m1,m2,l1)*Z81_1(e3,l1,m3,m4)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be3be4b|m1bm2b,l1b)*Z81_1(e2b,l1b|m3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e3,e4,m1,m2,l1)*Z81_1(e2,l1,m3,m4)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be3be4b|m1bm2b,l1b)*Z81_1(e1b,l1b|m3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e3,e4,m1,m2,l1)*Z81_1(e1,l1,m3,m4)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be3b|m1bm3b,l1b)*Z81_1(e4b,l1b|m2bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e3,m1,m3,l1)*Z81_1(e4,l1,m2,m4)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be4b|m1bm3b,l1b)*Z81_1(e3b,l1b|m2bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e4,m1,m3,l1)*Z81_1(e3,l1,m2,m4)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be3be4b|m1bm3b,l1b)*Z81_1(e2b,l1b|m2bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e3,e4,m1,m3,l1)*Z81_1(e2,l1,m2,m4)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be3be4b|m1bm3b,l1b)*Z81_1(e1b,l1b|m2bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e3,e4,m1,m3,l1)*Z81_1(e1,l1,m2,m4)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be3b|m1bm4b,l1b)*Z81_1(e4b,l1b|m2bm3b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e3,m1,m4,l1)*Z81_1(e4,l1,m2,m3)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be4b|m1bm4b,l1b)*Z81_1(e3b,l1b|m2bm3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e4,m1,m4,l1)*Z81_1(e3,l1,m2,m3)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be3be4b|m1bm4b,l1b)*Z81_1(e2b,l1b|m2bm3b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e3,e4,m1,m4,l1)*Z81_1(e2,l1,m2,m3)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be3be4b|m1bm4b,l1b)*Z81_1(e1b,l1b|m2bm3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e3,e4,m1,m4,l1)*Z81_1(e1,l1,m2,m3)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be3b|m2bm3b,l1b)*Z81_1(e4b,l1b|m1bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e3,m2,m3,l1)*Z81_1(e4,l1,m1,m4)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be4b|m2bm3b,l1b)*Z81_1(e3b,l1b|m1bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e4,m2,m3,l1)*Z81_1(e3,l1,m1,m4)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be3be4b|m2bm3b,l1b)*Z81_1(e2b,l1b|m1bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e3,e4,m2,m3,l1)*Z81_1(e2,l1,m1,m4)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be3be4b|m2bm3b,l1b)*Z81_1(e1b,l1b|m1bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e3,e4,m2,m3,l1)*Z81_1(e1,l1,m1,m4)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be3b|m2bm4b,l1b)*Z81_1(e4b,l1b|m1bm3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e3,m2,m4,l1)*Z81_1(e4,l1,m1,m3)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be4b|m2bm4b,l1b)*Z81_1(e3b,l1b|m1bm3b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e4,m2,m4,l1)*Z81_1(e3,l1,m1,m3)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be3be4b|m2bm4b,l1b)*Z81_1(e2b,l1b|m1bm3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e3,e4,m2,m4,l1)*Z81_1(e2,l1,m1,m3)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be3be4b|m2bm4b,l1b)*Z81_1(e1b,l1b|m1bm3b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e3,e4,m2,m4,l1)*Z81_1(e1,l1,m1,m3)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be3b|m3bm4b,l1b)*Z81_1(e4b,l1b|m1bm2b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e3,m3,m4,l1)*Z81_1(e4,l1,m1,m2)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be4b|m3bm4b,l1b)*Z81_1(e3b,l1b|m1bm2b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e4,m3,m4,l1)*Z81_1(e3,l1,m1,m2)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be3be4b|m3bm4b,l1b)*Z81_1(e2b,l1b|m1bm2b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e3,e4,m3,m4,l1)*Z81_1(e2,l1,m1,m2)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be3be4b|m3bm4b,l1b)*Z81_1(e1b,l1b|m1bm2b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e3,e4,m3,m4,l1)*Z81_1(e1,l1,m1,m2)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z81_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z81_1,"Z81_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z81_1,'ZERO')
!   original expression: Z81_1(e1b,l1b|m1bm2b)+=S44(e1b,d1b|m1bm2b)*H15(l1b|d1b)
    ierr=exatns_tensor_contract("Z81_1(e1,l1,m1,m2)+=S44(e1,d1,m1,m2)*H15(l1,d1)", &
        Z81_1,S44,H15,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be3b|m1bm2b,l1b)*Z81_1(e4b,l1b|m3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e3,m1,m2,l1)*Z81_1(e4,l1,m3,m4)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be4b|m1bm2b,l1b)*Z81_1(e3b,l1b|m3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e4,m1,m2,l1)*Z81_1(e3,l1,m3,m4)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be3be4b|m1bm2b,l1b)*Z81_1(e2b,l1b|m3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e3,e4,m1,m2,l1)*Z81_1(e2,l1,m3,m4)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be3be4b|m1bm2b,l1b)*Z81_1(e1b,l1b|m3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e3,e4,m1,m2,l1)*Z81_1(e1,l1,m3,m4)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be3b|m1bm3b,l1b)*Z81_1(e4b,l1b|m2bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e3,m1,m3,l1)*Z81_1(e4,l1,m2,m4)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be4b|m1bm3b,l1b)*Z81_1(e3b,l1b|m2bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e4,m1,m3,l1)*Z81_1(e3,l1,m2,m4)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be3be4b|m1bm3b,l1b)*Z81_1(e2b,l1b|m2bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e3,e4,m1,m3,l1)*Z81_1(e2,l1,m2,m4)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be3be4b|m1bm3b,l1b)*Z81_1(e1b,l1b|m2bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e3,e4,m1,m3,l1)*Z81_1(e1,l1,m2,m4)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be3b|m1bm4b,l1b)*Z81_1(e4b,l1b|m2bm3b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e3,m1,m4,l1)*Z81_1(e4,l1,m2,m3)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be4b|m1bm4b,l1b)*Z81_1(e3b,l1b|m2bm3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e4,m1,m4,l1)*Z81_1(e3,l1,m2,m3)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be3be4b|m1bm4b,l1b)*Z81_1(e2b,l1b|m2bm3b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e3,e4,m1,m4,l1)*Z81_1(e2,l1,m2,m3)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be3be4b|m1bm4b,l1b)*Z81_1(e1b,l1b|m2bm3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e3,e4,m1,m4,l1)*Z81_1(e1,l1,m2,m3)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be3b|m2bm3b,l1b)*Z81_1(e4b,l1b|m1bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e3,m2,m3,l1)*Z81_1(e4,l1,m1,m4)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be4b|m2bm3b,l1b)*Z81_1(e3b,l1b|m1bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e4,m2,m3,l1)*Z81_1(e3,l1,m1,m4)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be3be4b|m2bm3b,l1b)*Z81_1(e2b,l1b|m1bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e3,e4,m2,m3,l1)*Z81_1(e2,l1,m1,m4)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be3be4b|m2bm3b,l1b)*Z81_1(e1b,l1b|m1bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e3,e4,m2,m3,l1)*Z81_1(e1,l1,m1,m4)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be3b|m2bm4b,l1b)*Z81_1(e4b,l1b|m1bm3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e3,m2,m4,l1)*Z81_1(e4,l1,m1,m3)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be4b|m2bm4b,l1b)*Z81_1(e3b,l1b|m1bm3b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e4,m2,m4,l1)*Z81_1(e3,l1,m1,m3)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be3be4b|m2bm4b,l1b)*Z81_1(e2b,l1b|m1bm3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e3,e4,m2,m4,l1)*Z81_1(e2,l1,m1,m3)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be3be4b|m2bm4b,l1b)*Z81_1(e1b,l1b|m1bm3b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e3,e4,m2,m4,l1)*Z81_1(e1,l1,m1,m3)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be3b|m3bm4b,l1b)*Z81_1(e4b,l1b|m1bm2b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e3,m3,m4,l1)*Z81_1(e4,l1,m1,m2)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be4b|m3bm4b,l1b)*Z81_1(e3b,l1b|m1bm2b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e4,m3,m4,l1)*Z81_1(e3,l1,m1,m2)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be3be4b|m3bm4b,l1b)*Z81_1(e2b,l1b|m1bm2b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e3,e4,m3,m4,l1)*Z81_1(e2,l1,m1,m2)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be3be4b|m3bm4b,l1b)*Z81_1(e1b,l1b|m1bm2b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e3,e4,m3,m4,l1)*Z81_1(e1,l1,m1,m2)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z81_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z165_2,"Z165_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z165_2,'ZERO')
!   original expression: Z165_2(l1b,l2b|m1b,d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|m1b)*-1.
    ierr=exatns_tensor_contract("Z165_2(l1,l2,m1,d1)+=H24(l1,l2,d1,d2)*S43(d2,m1)", &
        Z165_2,H24,S43,prefactor=(-1.0d0,0.0d0))
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z81_1,"Z81_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z81_1,'ZERO')
!   original expression: Z81_1(e1b,l1b|m1bm2b)+=S44(e1b,d1b|m1b,l2b)*Z165_2(l1b,l2b|m2b,d1b)
    ierr=exatns_tensor_contract("Z81_1(e1,l1,m1,m2)+=S44(e1,d1,m1,l2)*Z165_2(l1,l2,m2,d1)", &
        Z81_1,S44,Z165_2,prefactor=(1.0d0,0.0d0))
!   original expression: Z81_1(e1b,l1b|m1bm2b)+=S44(e1b,d1b|m2b,l2b)*Z165_2(l1b,l2b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z81_1(e1,l1,m1,m2)+=S44(e1,d1,m2,l2)*Z165_2(l1,l2,m1,d1)", &
        Z81_1,S44,Z165_2,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z165_2)
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be3b|m1bm2b,l1b)*Z81_1(e4b,l1b|m3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e3,m1,m2,l1)*Z81_1(e4,l1,m3,m4)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be4b|m1bm2b,l1b)*Z81_1(e3b,l1b|m3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e4,m1,m2,l1)*Z81_1(e3,l1,m3,m4)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be3be4b|m1bm2b,l1b)*Z81_1(e2b,l1b|m3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e3,e4,m1,m2,l1)*Z81_1(e2,l1,m3,m4)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be3be4b|m1bm2b,l1b)*Z81_1(e1b,l1b|m3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e3,e4,m1,m2,l1)*Z81_1(e1,l1,m3,m4)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be3b|m1bm3b,l1b)*Z81_1(e4b,l1b|m2bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e3,m1,m3,l1)*Z81_1(e4,l1,m2,m4)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be4b|m1bm3b,l1b)*Z81_1(e3b,l1b|m2bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e4,m1,m3,l1)*Z81_1(e3,l1,m2,m4)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be3be4b|m1bm3b,l1b)*Z81_1(e2b,l1b|m2bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e3,e4,m1,m3,l1)*Z81_1(e2,l1,m2,m4)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be3be4b|m1bm3b,l1b)*Z81_1(e1b,l1b|m2bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e3,e4,m1,m3,l1)*Z81_1(e1,l1,m2,m4)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be3b|m1bm4b,l1b)*Z81_1(e4b,l1b|m2bm3b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e3,m1,m4,l1)*Z81_1(e4,l1,m2,m3)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be4b|m1bm4b,l1b)*Z81_1(e3b,l1b|m2bm3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e4,m1,m4,l1)*Z81_1(e3,l1,m2,m3)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be3be4b|m1bm4b,l1b)*Z81_1(e2b,l1b|m2bm3b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e3,e4,m1,m4,l1)*Z81_1(e2,l1,m2,m3)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be3be4b|m1bm4b,l1b)*Z81_1(e1b,l1b|m2bm3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e3,e4,m1,m4,l1)*Z81_1(e1,l1,m2,m3)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be3b|m2bm3b,l1b)*Z81_1(e4b,l1b|m1bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e3,m2,m3,l1)*Z81_1(e4,l1,m1,m4)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be4b|m2bm3b,l1b)*Z81_1(e3b,l1b|m1bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e4,m2,m3,l1)*Z81_1(e3,l1,m1,m4)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be3be4b|m2bm3b,l1b)*Z81_1(e2b,l1b|m1bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e3,e4,m2,m3,l1)*Z81_1(e2,l1,m1,m4)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be3be4b|m2bm3b,l1b)*Z81_1(e1b,l1b|m1bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e3,e4,m2,m3,l1)*Z81_1(e1,l1,m1,m4)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be3b|m2bm4b,l1b)*Z81_1(e4b,l1b|m1bm3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e3,m2,m4,l1)*Z81_1(e4,l1,m1,m3)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be4b|m2bm4b,l1b)*Z81_1(e3b,l1b|m1bm3b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e4,m2,m4,l1)*Z81_1(e3,l1,m1,m3)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be3be4b|m2bm4b,l1b)*Z81_1(e2b,l1b|m1bm3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e3,e4,m2,m4,l1)*Z81_1(e2,l1,m1,m3)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be3be4b|m2bm4b,l1b)*Z81_1(e1b,l1b|m1bm3b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e3,e4,m2,m4,l1)*Z81_1(e1,l1,m1,m3)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be3b|m3bm4b,l1b)*Z81_1(e4b,l1b|m1bm2b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e3,m3,m4,l1)*Z81_1(e4,l1,m1,m2)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be4b|m3bm4b,l1b)*Z81_1(e3b,l1b|m1bm2b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e4,m3,m4,l1)*Z81_1(e3,l1,m1,m2)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be3be4b|m3bm4b,l1b)*Z81_1(e2b,l1b|m1bm2b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e3,e4,m3,m4,l1)*Z81_1(e2,l1,m1,m2)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be3be4b|m3bm4b,l1b)*Z81_1(e1b,l1b|m1bm2b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e3,e4,m3,m4,l1)*Z81_1(e1,l1,m1,m2)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z81_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z81_1,"Z81_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z81_1,'ZERO')
!   original expression: Z81_1(e1b,l1b|m1bm2b)+=S44(e1b,d1b|m1b,l2b)*H25(l1b,l2b|m2b,d1b)
    ierr=exatns_tensor_contract("Z81_1(e1,l1,m1,m2)+=S44(e1,d1,m1,l2)*H25(l1,l2,m2,d1)", &
        Z81_1,S44,H25,prefactor=(1.0d0,0.0d0))
!   original expression: Z81_1(e1b,l1b|m1bm2b)+=S44(e1b,d1b|m2b,l2b)*H25(l1b,l2b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z81_1(e1,l1,m1,m2)+=S44(e1,d1,m2,l2)*H25(l1,l2,m1,d1)", &
        Z81_1,S44,H25,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be3b|m1bm2b,l1b)*Z81_1(e4b,l1b|m3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e3,m1,m2,l1)*Z81_1(e4,l1,m3,m4)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be4b|m1bm2b,l1b)*Z81_1(e3b,l1b|m3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e4,m1,m2,l1)*Z81_1(e3,l1,m3,m4)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be3be4b|m1bm2b,l1b)*Z81_1(e2b,l1b|m3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e3,e4,m1,m2,l1)*Z81_1(e2,l1,m3,m4)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be3be4b|m1bm2b,l1b)*Z81_1(e1b,l1b|m3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e3,e4,m1,m2,l1)*Z81_1(e1,l1,m3,m4)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be3b|m1bm3b,l1b)*Z81_1(e4b,l1b|m2bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e3,m1,m3,l1)*Z81_1(e4,l1,m2,m4)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be4b|m1bm3b,l1b)*Z81_1(e3b,l1b|m2bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e4,m1,m3,l1)*Z81_1(e3,l1,m2,m4)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be3be4b|m1bm3b,l1b)*Z81_1(e2b,l1b|m2bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e3,e4,m1,m3,l1)*Z81_1(e2,l1,m2,m4)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be3be4b|m1bm3b,l1b)*Z81_1(e1b,l1b|m2bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e3,e4,m1,m3,l1)*Z81_1(e1,l1,m2,m4)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be3b|m1bm4b,l1b)*Z81_1(e4b,l1b|m2bm3b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e3,m1,m4,l1)*Z81_1(e4,l1,m2,m3)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be4b|m1bm4b,l1b)*Z81_1(e3b,l1b|m2bm3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e4,m1,m4,l1)*Z81_1(e3,l1,m2,m3)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be3be4b|m1bm4b,l1b)*Z81_1(e2b,l1b|m2bm3b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e3,e4,m1,m4,l1)*Z81_1(e2,l1,m2,m3)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be3be4b|m1bm4b,l1b)*Z81_1(e1b,l1b|m2bm3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e3,e4,m1,m4,l1)*Z81_1(e1,l1,m2,m3)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be3b|m2bm3b,l1b)*Z81_1(e4b,l1b|m1bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e3,m2,m3,l1)*Z81_1(e4,l1,m1,m4)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be4b|m2bm3b,l1b)*Z81_1(e3b,l1b|m1bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e4,m2,m3,l1)*Z81_1(e3,l1,m1,m4)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be3be4b|m2bm3b,l1b)*Z81_1(e2b,l1b|m1bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e3,e4,m2,m3,l1)*Z81_1(e2,l1,m1,m4)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be3be4b|m2bm3b,l1b)*Z81_1(e1b,l1b|m1bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e3,e4,m2,m3,l1)*Z81_1(e1,l1,m1,m4)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be3b|m2bm4b,l1b)*Z81_1(e4b,l1b|m1bm3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e3,m2,m4,l1)*Z81_1(e4,l1,m1,m3)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be4b|m2bm4b,l1b)*Z81_1(e3b,l1b|m1bm3b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e4,m2,m4,l1)*Z81_1(e3,l1,m1,m3)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be3be4b|m2bm4b,l1b)*Z81_1(e2b,l1b|m1bm3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e3,e4,m2,m4,l1)*Z81_1(e2,l1,m1,m3)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be3be4b|m2bm4b,l1b)*Z81_1(e1b,l1b|m1bm3b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e3,e4,m2,m4,l1)*Z81_1(e1,l1,m1,m3)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be3b|m3bm4b,l1b)*Z81_1(e4b,l1b|m1bm2b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e3,m3,m4,l1)*Z81_1(e4,l1,m1,m2)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be4b|m3bm4b,l1b)*Z81_1(e3b,l1b|m1bm2b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e4,m3,m4,l1)*Z81_1(e3,l1,m1,m2)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be3be4b|m3bm4b,l1b)*Z81_1(e2b,l1b|m1bm2b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e3,e4,m3,m4,l1)*Z81_1(e2,l1,m1,m2)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be3be4b|m3bm4b,l1b)*Z81_1(e1b,l1b|m1bm2b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e3,e4,m3,m4,l1)*Z81_1(e1,l1,m1,m2)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z81_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z81_1,"Z81_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z81_1,'ZERO')
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be3b|m1bm2b,l1b)*Z81_1(e4b,l1b|m3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e3,m1,m2,l1)*Z81_1(e4,l1,m3,m4)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be4b|m1bm2b,l1b)*Z81_1(e3b,l1b|m3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e4,m1,m2,l1)*Z81_1(e3,l1,m3,m4)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be3be4b|m1bm2b,l1b)*Z81_1(e2b,l1b|m3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e3,e4,m1,m2,l1)*Z81_1(e2,l1,m3,m4)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be3be4b|m1bm2b,l1b)*Z81_1(e1b,l1b|m3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e3,e4,m1,m2,l1)*Z81_1(e1,l1,m3,m4)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be3b|m1bm3b,l1b)*Z81_1(e4b,l1b|m2bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e3,m1,m3,l1)*Z81_1(e4,l1,m2,m4)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be4b|m1bm3b,l1b)*Z81_1(e3b,l1b|m2bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e4,m1,m3,l1)*Z81_1(e3,l1,m2,m4)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be3be4b|m1bm3b,l1b)*Z81_1(e2b,l1b|m2bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e3,e4,m1,m3,l1)*Z81_1(e2,l1,m2,m4)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be3be4b|m1bm3b,l1b)*Z81_1(e1b,l1b|m2bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e3,e4,m1,m3,l1)*Z81_1(e1,l1,m2,m4)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be3b|m1bm4b,l1b)*Z81_1(e4b,l1b|m2bm3b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e3,m1,m4,l1)*Z81_1(e4,l1,m2,m3)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be4b|m1bm4b,l1b)*Z81_1(e3b,l1b|m2bm3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e4,m1,m4,l1)*Z81_1(e3,l1,m2,m3)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be3be4b|m1bm4b,l1b)*Z81_1(e2b,l1b|m2bm3b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e3,e4,m1,m4,l1)*Z81_1(e2,l1,m2,m3)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be3be4b|m1bm4b,l1b)*Z81_1(e1b,l1b|m2bm3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e3,e4,m1,m4,l1)*Z81_1(e1,l1,m2,m3)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be3b|m2bm3b,l1b)*Z81_1(e4b,l1b|m1bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e3,m2,m3,l1)*Z81_1(e4,l1,m1,m4)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be4b|m2bm3b,l1b)*Z81_1(e3b,l1b|m1bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e4,m2,m3,l1)*Z81_1(e3,l1,m1,m4)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be3be4b|m2bm3b,l1b)*Z81_1(e2b,l1b|m1bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e3,e4,m2,m3,l1)*Z81_1(e2,l1,m1,m4)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be3be4b|m2bm3b,l1b)*Z81_1(e1b,l1b|m1bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e3,e4,m2,m3,l1)*Z81_1(e1,l1,m1,m4)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be3b|m2bm4b,l1b)*Z81_1(e4b,l1b|m1bm3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e3,m2,m4,l1)*Z81_1(e4,l1,m1,m3)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be4b|m2bm4b,l1b)*Z81_1(e3b,l1b|m1bm3b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e4,m2,m4,l1)*Z81_1(e3,l1,m1,m3)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be3be4b|m2bm4b,l1b)*Z81_1(e2b,l1b|m1bm3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e3,e4,m2,m4,l1)*Z81_1(e2,l1,m1,m3)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be3be4b|m2bm4b,l1b)*Z81_1(e1b,l1b|m1bm3b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e3,e4,m2,m4,l1)*Z81_1(e1,l1,m1,m3)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be3b|m3bm4b,l1b)*Z81_1(e4b,l1b|m1bm2b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e3,m3,m4,l1)*Z81_1(e4,l1,m1,m2)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be4b|m3bm4b,l1b)*Z81_1(e3b,l1b|m1bm2b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e4,m3,m4,l1)*Z81_1(e3,l1,m1,m2)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be3be4b|m3bm4b,l1b)*Z81_1(e2b,l1b|m1bm2b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e3,e4,m3,m4,l1)*Z81_1(e2,l1,m1,m2)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be3be4b|m3bm4b,l1b)*Z81_1(e1b,l1b|m1bm2b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e3,e4,m3,m4,l1)*Z81_1(e1,l1,m1,m2)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z81_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z81_1,"Z81_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z81_1,'ZERO')
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be3b|m1bm2b,l1b)*Z81_1(e4b,l1b|m3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e3,m1,m2,l1)*Z81_1(e4,l1,m3,m4)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be4b|m1bm2b,l1b)*Z81_1(e3b,l1b|m3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e4,m1,m2,l1)*Z81_1(e3,l1,m3,m4)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be3be4b|m1bm2b,l1b)*Z81_1(e2b,l1b|m3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e3,e4,m1,m2,l1)*Z81_1(e2,l1,m3,m4)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be3be4b|m1bm2b,l1b)*Z81_1(e1b,l1b|m3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e3,e4,m1,m2,l1)*Z81_1(e1,l1,m3,m4)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be3b|m1bm3b,l1b)*Z81_1(e4b,l1b|m2bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e3,m1,m3,l1)*Z81_1(e4,l1,m2,m4)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be4b|m1bm3b,l1b)*Z81_1(e3b,l1b|m2bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e4,m1,m3,l1)*Z81_1(e3,l1,m2,m4)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be3be4b|m1bm3b,l1b)*Z81_1(e2b,l1b|m2bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e3,e4,m1,m3,l1)*Z81_1(e2,l1,m2,m4)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be3be4b|m1bm3b,l1b)*Z81_1(e1b,l1b|m2bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e3,e4,m1,m3,l1)*Z81_1(e1,l1,m2,m4)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be3b|m1bm4b,l1b)*Z81_1(e4b,l1b|m2bm3b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e3,m1,m4,l1)*Z81_1(e4,l1,m2,m3)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be4b|m1bm4b,l1b)*Z81_1(e3b,l1b|m2bm3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e4,m1,m4,l1)*Z81_1(e3,l1,m2,m3)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be3be4b|m1bm4b,l1b)*Z81_1(e2b,l1b|m2bm3b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e3,e4,m1,m4,l1)*Z81_1(e2,l1,m2,m3)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be3be4b|m1bm4b,l1b)*Z81_1(e1b,l1b|m2bm3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e3,e4,m1,m4,l1)*Z81_1(e1,l1,m2,m3)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be3b|m2bm3b,l1b)*Z81_1(e4b,l1b|m1bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e3,m2,m3,l1)*Z81_1(e4,l1,m1,m4)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be4b|m2bm3b,l1b)*Z81_1(e3b,l1b|m1bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e4,m2,m3,l1)*Z81_1(e3,l1,m1,m4)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be3be4b|m2bm3b,l1b)*Z81_1(e2b,l1b|m1bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e3,e4,m2,m3,l1)*Z81_1(e2,l1,m1,m4)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be3be4b|m2bm3b,l1b)*Z81_1(e1b,l1b|m1bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e3,e4,m2,m3,l1)*Z81_1(e1,l1,m1,m4)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be3b|m2bm4b,l1b)*Z81_1(e4b,l1b|m1bm3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e3,m2,m4,l1)*Z81_1(e4,l1,m1,m3)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be4b|m2bm4b,l1b)*Z81_1(e3b,l1b|m1bm3b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e4,m2,m4,l1)*Z81_1(e3,l1,m1,m3)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be3be4b|m2bm4b,l1b)*Z81_1(e2b,l1b|m1bm3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e3,e4,m2,m4,l1)*Z81_1(e2,l1,m1,m3)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be3be4b|m2bm4b,l1b)*Z81_1(e1b,l1b|m1bm3b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e3,e4,m2,m4,l1)*Z81_1(e1,l1,m1,m3)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be3b|m3bm4b,l1b)*Z81_1(e4b,l1b|m1bm2b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e3,m3,m4,l1)*Z81_1(e4,l1,m1,m2)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be4b|m3bm4b,l1b)*Z81_1(e3b,l1b|m1bm2b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e4,m3,m4,l1)*Z81_1(e3,l1,m1,m2)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be3be4b|m3bm4b,l1b)*Z81_1(e2b,l1b|m1bm2b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e3,e4,m3,m4,l1)*Z81_1(e2,l1,m1,m2)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be3be4b|m3bm4b,l1b)*Z81_1(e1b,l1b|m1bm2b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e3,e4,m3,m4,l1)*Z81_1(e1,l1,m1,m2)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z81_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z81_1,"Z81_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z81_1,'ZERO')
!   original expression: Z81_1(e1b,l1b|m1bm2b)+=S45(e1b,d1bd2b|m1bm2b,l2b)*H24(l1b,l2b|d1bd2b)
    ierr=exatns_tensor_contract("Z81_1(e1,l1,m1,m2)+=S45(e1,d1,d2,m1,m2,l2)*H24(l1,l2,d1,d2)", &
        Z81_1,S45,H24,prefactor=(0.5d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be3b|m1bm2b,l1b)*Z81_1(e4b,l1b|m3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e3,m1,m2,l1)*Z81_1(e4,l1,m3,m4)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be4b|m1bm2b,l1b)*Z81_1(e3b,l1b|m3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e4,m1,m2,l1)*Z81_1(e3,l1,m3,m4)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be3be4b|m1bm2b,l1b)*Z81_1(e2b,l1b|m3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e3,e4,m1,m2,l1)*Z81_1(e2,l1,m3,m4)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be3be4b|m1bm2b,l1b)*Z81_1(e1b,l1b|m3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e3,e4,m1,m2,l1)*Z81_1(e1,l1,m3,m4)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be3b|m1bm3b,l1b)*Z81_1(e4b,l1b|m2bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e3,m1,m3,l1)*Z81_1(e4,l1,m2,m4)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be4b|m1bm3b,l1b)*Z81_1(e3b,l1b|m2bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e4,m1,m3,l1)*Z81_1(e3,l1,m2,m4)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be3be4b|m1bm3b,l1b)*Z81_1(e2b,l1b|m2bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e3,e4,m1,m3,l1)*Z81_1(e2,l1,m2,m4)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be3be4b|m1bm3b,l1b)*Z81_1(e1b,l1b|m2bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e3,e4,m1,m3,l1)*Z81_1(e1,l1,m2,m4)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be3b|m1bm4b,l1b)*Z81_1(e4b,l1b|m2bm3b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e3,m1,m4,l1)*Z81_1(e4,l1,m2,m3)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be4b|m1bm4b,l1b)*Z81_1(e3b,l1b|m2bm3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e4,m1,m4,l1)*Z81_1(e3,l1,m2,m3)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be3be4b|m1bm4b,l1b)*Z81_1(e2b,l1b|m2bm3b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e3,e4,m1,m4,l1)*Z81_1(e2,l1,m2,m3)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be3be4b|m1bm4b,l1b)*Z81_1(e1b,l1b|m2bm3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e3,e4,m1,m4,l1)*Z81_1(e1,l1,m2,m3)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be3b|m2bm3b,l1b)*Z81_1(e4b,l1b|m1bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e3,m2,m3,l1)*Z81_1(e4,l1,m1,m4)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be4b|m2bm3b,l1b)*Z81_1(e3b,l1b|m1bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e4,m2,m3,l1)*Z81_1(e3,l1,m1,m4)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be3be4b|m2bm3b,l1b)*Z81_1(e2b,l1b|m1bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e3,e4,m2,m3,l1)*Z81_1(e2,l1,m1,m4)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be3be4b|m2bm3b,l1b)*Z81_1(e1b,l1b|m1bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e3,e4,m2,m3,l1)*Z81_1(e1,l1,m1,m4)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be3b|m2bm4b,l1b)*Z81_1(e4b,l1b|m1bm3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e3,m2,m4,l1)*Z81_1(e4,l1,m1,m3)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be4b|m2bm4b,l1b)*Z81_1(e3b,l1b|m1bm3b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e4,m2,m4,l1)*Z81_1(e3,l1,m1,m3)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be3be4b|m2bm4b,l1b)*Z81_1(e2b,l1b|m1bm3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e3,e4,m2,m4,l1)*Z81_1(e2,l1,m1,m3)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be3be4b|m2bm4b,l1b)*Z81_1(e1b,l1b|m1bm3b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e3,e4,m2,m4,l1)*Z81_1(e1,l1,m1,m3)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be3b|m3bm4b,l1b)*Z81_1(e4b,l1b|m1bm2b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e3,m3,m4,l1)*Z81_1(e4,l1,m1,m2)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be4b|m3bm4b,l1b)*Z81_1(e3b,l1b|m1bm2b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e4,m3,m4,l1)*Z81_1(e3,l1,m1,m2)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be3be4b|m3bm4b,l1b)*Z81_1(e2b,l1b|m1bm2b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e3,e4,m3,m4,l1)*Z81_1(e2,l1,m1,m2)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be3be4b|m3bm4b,l1b)*Z81_1(e1b,l1b|m1bm2b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e3,e4,m3,m4,l1)*Z81_1(e1,l1,m1,m2)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z81_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z81_1,"Z81_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z81_1,'ZERO')
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be3b|m1bm2b,l1b)*Z81_1(e4b,l1b|m3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e3,m1,m2,l1)*Z81_1(e4,l1,m3,m4)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be4b|m1bm2b,l1b)*Z81_1(e3b,l1b|m3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e4,m1,m2,l1)*Z81_1(e3,l1,m3,m4)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be3be4b|m1bm2b,l1b)*Z81_1(e2b,l1b|m3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e3,e4,m1,m2,l1)*Z81_1(e2,l1,m3,m4)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be3be4b|m1bm2b,l1b)*Z81_1(e1b,l1b|m3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e3,e4,m1,m2,l1)*Z81_1(e1,l1,m3,m4)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be3b|m1bm3b,l1b)*Z81_1(e4b,l1b|m2bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e3,m1,m3,l1)*Z81_1(e4,l1,m2,m4)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be4b|m1bm3b,l1b)*Z81_1(e3b,l1b|m2bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e4,m1,m3,l1)*Z81_1(e3,l1,m2,m4)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be3be4b|m1bm3b,l1b)*Z81_1(e2b,l1b|m2bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e3,e4,m1,m3,l1)*Z81_1(e2,l1,m2,m4)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be3be4b|m1bm3b,l1b)*Z81_1(e1b,l1b|m2bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e3,e4,m1,m3,l1)*Z81_1(e1,l1,m2,m4)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be3b|m1bm4b,l1b)*Z81_1(e4b,l1b|m2bm3b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e3,m1,m4,l1)*Z81_1(e4,l1,m2,m3)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be4b|m1bm4b,l1b)*Z81_1(e3b,l1b|m2bm3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e4,m1,m4,l1)*Z81_1(e3,l1,m2,m3)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be3be4b|m1bm4b,l1b)*Z81_1(e2b,l1b|m2bm3b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e3,e4,m1,m4,l1)*Z81_1(e2,l1,m2,m3)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be3be4b|m1bm4b,l1b)*Z81_1(e1b,l1b|m2bm3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e3,e4,m1,m4,l1)*Z81_1(e1,l1,m2,m3)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be3b|m2bm3b,l1b)*Z81_1(e4b,l1b|m1bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e3,m2,m3,l1)*Z81_1(e4,l1,m1,m4)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be4b|m2bm3b,l1b)*Z81_1(e3b,l1b|m1bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e4,m2,m3,l1)*Z81_1(e3,l1,m1,m4)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be3be4b|m2bm3b,l1b)*Z81_1(e2b,l1b|m1bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e3,e4,m2,m3,l1)*Z81_1(e2,l1,m1,m4)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be3be4b|m2bm3b,l1b)*Z81_1(e1b,l1b|m1bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e3,e4,m2,m3,l1)*Z81_1(e1,l1,m1,m4)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be3b|m2bm4b,l1b)*Z81_1(e4b,l1b|m1bm3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e3,m2,m4,l1)*Z81_1(e4,l1,m1,m3)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be4b|m2bm4b,l1b)*Z81_1(e3b,l1b|m1bm3b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e4,m2,m4,l1)*Z81_1(e3,l1,m1,m3)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be3be4b|m2bm4b,l1b)*Z81_1(e2b,l1b|m1bm3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e3,e4,m2,m4,l1)*Z81_1(e2,l1,m1,m3)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be3be4b|m2bm4b,l1b)*Z81_1(e1b,l1b|m1bm3b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e3,e4,m2,m4,l1)*Z81_1(e1,l1,m1,m3)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be3b|m3bm4b,l1b)*Z81_1(e4b,l1b|m1bm2b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e3,m3,m4,l1)*Z81_1(e4,l1,m1,m2)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be4b|m3bm4b,l1b)*Z81_1(e3b,l1b|m1bm2b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e4,m3,m4,l1)*Z81_1(e3,l1,m1,m2)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be3be4b|m3bm4b,l1b)*Z81_1(e2b,l1b|m1bm2b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e3,e4,m3,m4,l1)*Z81_1(e2,l1,m1,m2)", &
        Z61,S45,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be3be4b|m3bm4b,l1b)*Z81_1(e1b,l1b|m1bm2b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e3,e4,m3,m4,l1)*Z81_1(e1,l1,m1,m2)", &
        Z61,S45,Z81_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z81_1)
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be3b|m1bm2b,l1b)*H19(e4b,l1b|m3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e3,m1,m2,l1)*H19(e4,l1,m3,m4)", &
        Z61,S45,H19,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be4b|m1bm2b,l1b)*H19(e3b,l1b|m3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e4,m1,m2,l1)*H19(e3,l1,m3,m4)", &
        Z61,S45,H19,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be3be4b|m1bm2b,l1b)*H19(e2b,l1b|m3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e3,e4,m1,m2,l1)*H19(e2,l1,m3,m4)", &
        Z61,S45,H19,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be3be4b|m1bm2b,l1b)*H19(e1b,l1b|m3bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e3,e4,m1,m2,l1)*H19(e1,l1,m3,m4)", &
        Z61,S45,H19,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be3b|m1bm3b,l1b)*H19(e4b,l1b|m2bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e3,m1,m3,l1)*H19(e4,l1,m2,m4)", &
        Z61,S45,H19,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be4b|m1bm3b,l1b)*H19(e3b,l1b|m2bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e4,m1,m3,l1)*H19(e3,l1,m2,m4)", &
        Z61,S45,H19,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be3be4b|m1bm3b,l1b)*H19(e2b,l1b|m2bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e3,e4,m1,m3,l1)*H19(e2,l1,m2,m4)", &
        Z61,S45,H19,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be3be4b|m1bm3b,l1b)*H19(e1b,l1b|m2bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e3,e4,m1,m3,l1)*H19(e1,l1,m2,m4)", &
        Z61,S45,H19,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be3b|m1bm4b,l1b)*H19(e4b,l1b|m2bm3b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e3,m1,m4,l1)*H19(e4,l1,m2,m3)", &
        Z61,S45,H19,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be4b|m1bm4b,l1b)*H19(e3b,l1b|m2bm3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e4,m1,m4,l1)*H19(e3,l1,m2,m3)", &
        Z61,S45,H19,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be3be4b|m1bm4b,l1b)*H19(e2b,l1b|m2bm3b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e3,e4,m1,m4,l1)*H19(e2,l1,m2,m3)", &
        Z61,S45,H19,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be3be4b|m1bm4b,l1b)*H19(e1b,l1b|m2bm3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e3,e4,m1,m4,l1)*H19(e1,l1,m2,m3)", &
        Z61,S45,H19,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be3b|m2bm3b,l1b)*H19(e4b,l1b|m1bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e3,m2,m3,l1)*H19(e4,l1,m1,m4)", &
        Z61,S45,H19,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be4b|m2bm3b,l1b)*H19(e3b,l1b|m1bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e4,m2,m3,l1)*H19(e3,l1,m1,m4)", &
        Z61,S45,H19,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be3be4b|m2bm3b,l1b)*H19(e2b,l1b|m1bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e3,e4,m2,m3,l1)*H19(e2,l1,m1,m4)", &
        Z61,S45,H19,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be3be4b|m2bm3b,l1b)*H19(e1b,l1b|m1bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e3,e4,m2,m3,l1)*H19(e1,l1,m1,m4)", &
        Z61,S45,H19,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be3b|m2bm4b,l1b)*H19(e4b,l1b|m1bm3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e3,m2,m4,l1)*H19(e4,l1,m1,m3)", &
        Z61,S45,H19,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be4b|m2bm4b,l1b)*H19(e3b,l1b|m1bm3b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e4,m2,m4,l1)*H19(e3,l1,m1,m3)", &
        Z61,S45,H19,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be3be4b|m2bm4b,l1b)*H19(e2b,l1b|m1bm3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e3,e4,m2,m4,l1)*H19(e2,l1,m1,m3)", &
        Z61,S45,H19,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be3be4b|m2bm4b,l1b)*H19(e1b,l1b|m1bm3b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e3,e4,m2,m4,l1)*H19(e1,l1,m1,m3)", &
        Z61,S45,H19,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be3b|m3bm4b,l1b)*H19(e4b,l1b|m1bm2b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e3,m3,m4,l1)*H19(e4,l1,m1,m2)", &
        Z61,S45,H19,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2be4b|m3bm4b,l1b)*H19(e3b,l1b|m1bm2b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,e4,m3,m4,l1)*H19(e3,l1,m1,m2)", &
        Z61,S45,H19,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be3be4b|m3bm4b,l1b)*H19(e2b,l1b|m1bm2b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e3,e4,m3,m4,l1)*H19(e2,l1,m1,m2)", &
        Z61,S45,H19,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be3be4b|m3bm4b,l1b)*H19(e1b,l1b|m1bm2b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e3,e4,m3,m4,l1)*H19(e1,l1,m1,m2)", &
        Z61,S45,H19,prefactor=(-1.0d0,0.0d0))
    
    allocate(tens_id(6), tens_root(6))
    tens_id   = (/nvir_id,nvir_id,nocc_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root,nocc_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z142_1,"Z142_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z142_1,'ZERO')
!   original expression: Z142_1(e1be2b,l1b|m1bm2b,d1b)+=S45(e1be2b,d2b|m1bm2b,l2b)*H24(l1b,l2b|d1b,d2b)*0.5
    ierr=exatns_tensor_contract("Z142_1(e1,e2,l1,m1,m2,d1)+=S45(e1,e2,d2,m1,m2,l2)*H24(l1,l2,d1,d2)", &
        Z142_1,S45,H24,prefactor=(0.5d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2b,d1b|m1bm2b,l1b)*Z142_1(e3be4b,l1b|m3bm4b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,d1,m1,m2,l1)*Z142_1(e3,e4,l1,m3,m4,d1)", &
        Z61,S45,Z142_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be3b,d1b|m1bm2b,l1b)*Z142_1(e2be4b,l1b|m3bm4b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e3,d1,m1,m2,l1)*Z142_1(e2,e4,l1,m3,m4,d1)", &
        Z61,S45,Z142_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be4b,d1b|m1bm2b,l1b)*Z142_1(e2be3b,l1b|m3bm4b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e4,d1,m1,m2,l1)*Z142_1(e2,e3,l1,m3,m4,d1)", &
        Z61,S45,Z142_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be3b,d1b|m1bm2b,l1b)*Z142_1(e1be4b,l1b|m3bm4b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e3,d1,m1,m2,l1)*Z142_1(e1,e4,l1,m3,m4,d1)", &
        Z61,S45,Z142_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be4b,d1b|m1bm2b,l1b)*Z142_1(e1be3b,l1b|m3bm4b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e4,d1,m1,m2,l1)*Z142_1(e1,e3,l1,m3,m4,d1)", &
        Z61,S45,Z142_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e3be4b,d1b|m1bm2b,l1b)*Z142_1(e1be2b,l1b|m3bm4b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e3,e4,d1,m1,m2,l1)*Z142_1(e1,e2,l1,m3,m4,d1)", &
        Z61,S45,Z142_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2b,d1b|m1bm3b,l1b)*Z142_1(e3be4b,l1b|m2bm4b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,d1,m1,m3,l1)*Z142_1(e3,e4,l1,m2,m4,d1)", &
        Z61,S45,Z142_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be3b,d1b|m1bm3b,l1b)*Z142_1(e2be4b,l1b|m2bm4b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e3,d1,m1,m3,l1)*Z142_1(e2,e4,l1,m2,m4,d1)", &
        Z61,S45,Z142_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be4b,d1b|m1bm3b,l1b)*Z142_1(e2be3b,l1b|m2bm4b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e4,d1,m1,m3,l1)*Z142_1(e2,e3,l1,m2,m4,d1)", &
        Z61,S45,Z142_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be3b,d1b|m1bm3b,l1b)*Z142_1(e1be4b,l1b|m2bm4b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e3,d1,m1,m3,l1)*Z142_1(e1,e4,l1,m2,m4,d1)", &
        Z61,S45,Z142_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be4b,d1b|m1bm3b,l1b)*Z142_1(e1be3b,l1b|m2bm4b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e4,d1,m1,m3,l1)*Z142_1(e1,e3,l1,m2,m4,d1)", &
        Z61,S45,Z142_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e3be4b,d1b|m1bm3b,l1b)*Z142_1(e1be2b,l1b|m2bm4b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e3,e4,d1,m1,m3,l1)*Z142_1(e1,e2,l1,m2,m4,d1)", &
        Z61,S45,Z142_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2b,d1b|m1bm4b,l1b)*Z142_1(e3be4b,l1b|m2bm3b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,d1,m1,m4,l1)*Z142_1(e3,e4,l1,m2,m3,d1)", &
        Z61,S45,Z142_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be3b,d1b|m1bm4b,l1b)*Z142_1(e2be4b,l1b|m2bm3b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e3,d1,m1,m4,l1)*Z142_1(e2,e4,l1,m2,m3,d1)", &
        Z61,S45,Z142_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be4b,d1b|m1bm4b,l1b)*Z142_1(e2be3b,l1b|m2bm3b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e4,d1,m1,m4,l1)*Z142_1(e2,e3,l1,m2,m3,d1)", &
        Z61,S45,Z142_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be3b,d1b|m1bm4b,l1b)*Z142_1(e1be4b,l1b|m2bm3b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e3,d1,m1,m4,l1)*Z142_1(e1,e4,l1,m2,m3,d1)", &
        Z61,S45,Z142_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be4b,d1b|m1bm4b,l1b)*Z142_1(e1be3b,l1b|m2bm3b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e4,d1,m1,m4,l1)*Z142_1(e1,e3,l1,m2,m3,d1)", &
        Z61,S45,Z142_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e3be4b,d1b|m1bm4b,l1b)*Z142_1(e1be2b,l1b|m2bm3b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e3,e4,d1,m1,m4,l1)*Z142_1(e1,e2,l1,m2,m3,d1)", &
        Z61,S45,Z142_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2b,d1b|m2bm3b,l1b)*Z142_1(e3be4b,l1b|m1bm4b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,d1,m2,m3,l1)*Z142_1(e3,e4,l1,m1,m4,d1)", &
        Z61,S45,Z142_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be3b,d1b|m2bm3b,l1b)*Z142_1(e2be4b,l1b|m1bm4b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e3,d1,m2,m3,l1)*Z142_1(e2,e4,l1,m1,m4,d1)", &
        Z61,S45,Z142_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be4b,d1b|m2bm3b,l1b)*Z142_1(e2be3b,l1b|m1bm4b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e4,d1,m2,m3,l1)*Z142_1(e2,e3,l1,m1,m4,d1)", &
        Z61,S45,Z142_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be3b,d1b|m2bm3b,l1b)*Z142_1(e1be4b,l1b|m1bm4b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e3,d1,m2,m3,l1)*Z142_1(e1,e4,l1,m1,m4,d1)", &
        Z61,S45,Z142_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be4b,d1b|m2bm3b,l1b)*Z142_1(e1be3b,l1b|m1bm4b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e4,d1,m2,m3,l1)*Z142_1(e1,e3,l1,m1,m4,d1)", &
        Z61,S45,Z142_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e3be4b,d1b|m2bm3b,l1b)*Z142_1(e1be2b,l1b|m1bm4b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e3,e4,d1,m2,m3,l1)*Z142_1(e1,e2,l1,m1,m4,d1)", &
        Z61,S45,Z142_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2b,d1b|m2bm4b,l1b)*Z142_1(e3be4b,l1b|m1bm3b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,d1,m2,m4,l1)*Z142_1(e3,e4,l1,m1,m3,d1)", &
        Z61,S45,Z142_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be3b,d1b|m2bm4b,l1b)*Z142_1(e2be4b,l1b|m1bm3b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e3,d1,m2,m4,l1)*Z142_1(e2,e4,l1,m1,m3,d1)", &
        Z61,S45,Z142_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be4b,d1b|m2bm4b,l1b)*Z142_1(e2be3b,l1b|m1bm3b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e4,d1,m2,m4,l1)*Z142_1(e2,e3,l1,m1,m3,d1)", &
        Z61,S45,Z142_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be3b,d1b|m2bm4b,l1b)*Z142_1(e1be4b,l1b|m1bm3b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e3,d1,m2,m4,l1)*Z142_1(e1,e4,l1,m1,m3,d1)", &
        Z61,S45,Z142_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be4b,d1b|m2bm4b,l1b)*Z142_1(e1be3b,l1b|m1bm3b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e4,d1,m2,m4,l1)*Z142_1(e1,e3,l1,m1,m3,d1)", &
        Z61,S45,Z142_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e3be4b,d1b|m2bm4b,l1b)*Z142_1(e1be2b,l1b|m1bm3b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e3,e4,d1,m2,m4,l1)*Z142_1(e1,e2,l1,m1,m3,d1)", &
        Z61,S45,Z142_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be2b,d1b|m3bm4b,l1b)*Z142_1(e3be4b,l1b|m1bm2b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e2,d1,m3,m4,l1)*Z142_1(e3,e4,l1,m1,m2,d1)", &
        Z61,S45,Z142_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be3b,d1b|m3bm4b,l1b)*Z142_1(e2be4b,l1b|m1bm2b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e3,d1,m3,m4,l1)*Z142_1(e2,e4,l1,m1,m2,d1)", &
        Z61,S45,Z142_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e1be4b,d1b|m3bm4b,l1b)*Z142_1(e2be3b,l1b|m1bm2b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e1,e4,d1,m3,m4,l1)*Z142_1(e2,e3,l1,m1,m2,d1)", &
        Z61,S45,Z142_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be3b,d1b|m3bm4b,l1b)*Z142_1(e1be4b,l1b|m1bm2b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e3,d1,m3,m4,l1)*Z142_1(e1,e4,l1,m1,m2,d1)", &
        Z61,S45,Z142_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e2be4b,d1b|m3bm4b,l1b)*Z142_1(e1be3b,l1b|m1bm2b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e2,e4,d1,m3,m4,l1)*Z142_1(e1,e3,l1,m1,m2,d1)", &
        Z61,S45,Z142_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S45(e3be4b,d1b|m3bm4b,l1b)*Z142_1(e1be2b,l1b|m1bm2b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S45(e3,e4,d1,m3,m4,l1)*Z142_1(e1,e2,l1,m1,m2,d1)", &
        Z61,S45,Z142_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z142_1)
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S46(e1be2b,d1bd2b|m1bm2bm3bm4b)*H3(e3be4b|d1bd2b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S46(e1,e2,d1,d2,m1,m2,m3,m4)*H3(e3,e4,d1,d2)", &
        Z61,S46,H3,prefactor=(0.5d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S46(e1be3b,d1bd2b|m1bm2bm3bm4b)*H3(e2be4b|d1bd2b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S46(e1,e3,d1,d2,m1,m2,m3,m4)*H3(e2,e4,d1,d2)", &
        Z61,S46,H3,prefactor=(-0.5d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S46(e1be4b,d1bd2b|m1bm2bm3bm4b)*H3(e2be3b|d1bd2b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S46(e1,e4,d1,d2,m1,m2,m3,m4)*H3(e2,e3,d1,d2)", &
        Z61,S46,H3,prefactor=(0.5d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S46(e2be3b,d1bd2b|m1bm2bm3bm4b)*H3(e1be4b|d1bd2b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S46(e2,e3,d1,d2,m1,m2,m3,m4)*H3(e1,e4,d1,d2)", &
        Z61,S46,H3,prefactor=(0.5d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S46(e2be4b,d1bd2b|m1bm2bm3bm4b)*H3(e1be3b|d1bd2b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S46(e2,e4,d1,d2,m1,m2,m3,m4)*H3(e1,e3,d1,d2)", &
        Z61,S46,H3,prefactor=(-0.5d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S46(e3be4b,d1bd2b|m1bm2bm3bm4b)*H3(e1be2b|d1bd2b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S46(e3,e4,d1,d2,m1,m2,m3,m4)*H3(e1,e2,d1,d2)", &
        Z61,S46,H3,prefactor=(0.5d0,0.0d0))
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nvir_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root/)
    ierr=exatns_tensor_create(Z72_1,"Z72_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z72_1,'ZERO')
!   original expression: Z72_1(e1b|d1b)+=H17(e1b,l1b|d1b,d2b)*S43(d2b|l1b)
    ierr=exatns_tensor_contract("Z72_1(e1,d1)+=H17(e1,l1,d1,d2)*S43(d2,l1)", &
        Z72_1,H17,S43,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S46(e1be2be3b,d1b|m1bm2bm3bm4b)*Z72_1(e4b|d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S46(e1,e2,e3,d1,m1,m2,m3,m4)*Z72_1(e4,d1)", &
        Z61,S46,Z72_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S46(e1be2be4b,d1b|m1bm2bm3bm4b)*Z72_1(e3b|d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S46(e1,e2,e4,d1,m1,m2,m3,m4)*Z72_1(e3,d1)", &
        Z61,S46,Z72_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S46(e1be3be4b,d1b|m1bm2bm3bm4b)*Z72_1(e2b|d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S46(e1,e3,e4,d1,m1,m2,m3,m4)*Z72_1(e2,d1)", &
        Z61,S46,Z72_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S46(e2be3be4b,d1b|m1bm2bm3bm4b)*Z72_1(e1b|d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S46(e2,e3,e4,d1,m1,m2,m3,m4)*Z72_1(e1,d1)", &
        Z61,S46,Z72_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z72_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nvir_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root/)
    ierr=exatns_tensor_create(Z72_1,"Z72_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z72_1,'ZERO')
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S46(e1be2be3b,d1b|m1bm2bm3bm4b)*Z72_1(e4b|d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S46(e1,e2,e3,d1,m1,m2,m3,m4)*Z72_1(e4,d1)", &
        Z61,S46,Z72_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S46(e1be2be4b,d1b|m1bm2bm3bm4b)*Z72_1(e3b|d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S46(e1,e2,e4,d1,m1,m2,m3,m4)*Z72_1(e3,d1)", &
        Z61,S46,Z72_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S46(e1be3be4b,d1b|m1bm2bm3bm4b)*Z72_1(e2b|d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S46(e1,e3,e4,d1,m1,m2,m3,m4)*Z72_1(e2,d1)", &
        Z61,S46,Z72_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S46(e2be3be4b,d1b|m1bm2bm3bm4b)*Z72_1(e1b|d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S46(e2,e3,e4,d1,m1,m2,m3,m4)*Z72_1(e1,d1)", &
        Z61,S46,Z72_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z72_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nvir_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root/)
    ierr=exatns_tensor_create(Z72_1,"Z72_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z72_1,'ZERO')
!   original expression: Z72_1(e1b|d1b)+=S44(e1b,d2b|l1bl2b)*H24(l1bl2b|d1b,d2b)*-1.
    ierr=exatns_tensor_contract("Z72_1(e1,d1)+=S44(e1,d2,l1,l2)*H24(l1,l2,d1,d2)", &
        Z72_1,S44,H24,prefactor=(-0.5d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S46(e1be2be3b,d1b|m1bm2bm3bm4b)*Z72_1(e4b|d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S46(e1,e2,e3,d1,m1,m2,m3,m4)*Z72_1(e4,d1)", &
        Z61,S46,Z72_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S46(e1be2be4b,d1b|m1bm2bm3bm4b)*Z72_1(e3b|d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S46(e1,e2,e4,d1,m1,m2,m3,m4)*Z72_1(e3,d1)", &
        Z61,S46,Z72_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S46(e1be3be4b,d1b|m1bm2bm3bm4b)*Z72_1(e2b|d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S46(e1,e3,e4,d1,m1,m2,m3,m4)*Z72_1(e2,d1)", &
        Z61,S46,Z72_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S46(e2be3be4b,d1b|m1bm2bm3bm4b)*Z72_1(e1b|d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S46(e2,e3,e4,d1,m1,m2,m3,m4)*Z72_1(e1,d1)", &
        Z61,S46,Z72_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z72_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nvir_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root/)
    ierr=exatns_tensor_create(Z72_1,"Z72_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z72_1,'ZERO')
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S46(e1be2be3b,d1b|m1bm2bm3bm4b)*Z72_1(e4b|d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S46(e1,e2,e3,d1,m1,m2,m3,m4)*Z72_1(e4,d1)", &
        Z61,S46,Z72_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S46(e1be2be4b,d1b|m1bm2bm3bm4b)*Z72_1(e3b|d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S46(e1,e2,e4,d1,m1,m2,m3,m4)*Z72_1(e3,d1)", &
        Z61,S46,Z72_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S46(e1be3be4b,d1b|m1bm2bm3bm4b)*Z72_1(e2b|d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S46(e1,e3,e4,d1,m1,m2,m3,m4)*Z72_1(e2,d1)", &
        Z61,S46,Z72_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S46(e2be3be4b,d1b|m1bm2bm3bm4b)*Z72_1(e1b|d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S46(e2,e3,e4,d1,m1,m2,m3,m4)*Z72_1(e1,d1)", &
        Z61,S46,Z72_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z72_1)
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S46(e1be2be3b,d1b|m1bm2bm3bm4b)*H1(e4b|d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S46(e1,e2,e3,d1,m1,m2,m3,m4)*H1(e4,d1)", &
        Z61,S46,H1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S46(e1be2be4b,d1b|m1bm2bm3bm4b)*H1(e3b|d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S46(e1,e2,e4,d1,m1,m2,m3,m4)*H1(e3,d1)", &
        Z61,S46,H1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S46(e1be3be4b,d1b|m1bm2bm3bm4b)*H1(e2b|d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S46(e1,e3,e4,d1,m1,m2,m3,m4)*H1(e2,d1)", &
        Z61,S46,H1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S46(e2be3be4b,d1b|m1bm2bm3bm4b)*H1(e1b|d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S46(e2,e3,e4,d1,m1,m2,m3,m4)*H1(e1,d1)", &
        Z61,S46,H1,prefactor=(-1.0d0,0.0d0))
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z76_1,"Z76_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z76_1,'ZERO')
!   original expression: Z76_1(l1bl2b|m1bm2b)+=H25(l1bl2b|m1b,d1b)*S43(d1b|m2b)
    ierr=exatns_tensor_contract("Z76_1(l1,l2,m1,m2)+=H25(l1,l2,m1,d1)*S43(d1,m2)", &
        Z76_1,H25,S43,prefactor=(1.0d0,0.0d0))
!   original expression: Z76_1(l1bl2b|m1bm2b)+=H25(l1bl2b|m2b,d1b)*S43(d1b|m1b)*-1.
    ierr=exatns_tensor_contract("Z76_1(l1,l2,m1,m2)+=H25(l1,l2,m2,d1)*S43(d1,m1)", &
        Z76_1,H25,S43,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S46(e1be2be3be4b|m1bm2b,l1bl2b)*Z76_1(l1bl2b|m3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S46(e1,e2,e3,e4,m1,m2,l1,l2)*Z76_1(l1,l2,m3,m4)", &
        Z61,S46,Z76_1,prefactor=(0.5d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S46(e1be2be3be4b|m1bm3b,l1bl2b)*Z76_1(l1bl2b|m2bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S46(e1,e2,e3,e4,m1,m3,l1,l2)*Z76_1(l1,l2,m2,m4)", &
        Z61,S46,Z76_1,prefactor=(-0.5d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S46(e1be2be3be4b|m1bm4b,l1bl2b)*Z76_1(l1bl2b|m2bm3b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S46(e1,e2,e3,e4,m1,m4,l1,l2)*Z76_1(l1,l2,m2,m3)", &
        Z61,S46,Z76_1,prefactor=(0.5d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S46(e1be2be3be4b|m2bm3b,l1bl2b)*Z76_1(l1bl2b|m1bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S46(e1,e2,e3,e4,m2,m3,l1,l2)*Z76_1(l1,l2,m1,m4)", &
        Z61,S46,Z76_1,prefactor=(0.5d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S46(e1be2be3be4b|m2bm4b,l1bl2b)*Z76_1(l1bl2b|m1bm3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S46(e1,e2,e3,e4,m2,m4,l1,l2)*Z76_1(l1,l2,m1,m3)", &
        Z61,S46,Z76_1,prefactor=(-0.5d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S46(e1be2be3be4b|m3bm4b,l1bl2b)*Z76_1(l1bl2b|m1bm2b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S46(e1,e2,e3,e4,m3,m4,l1,l2)*Z76_1(l1,l2,m1,m2)", &
        Z61,S46,Z76_1,prefactor=(0.5d0,0.0d0))
    ierr=exatns_tensor_destroy(Z76_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z129_2,"Z129_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z129_2,'ZERO')
!   original expression: Z129_2(l1bl2b|m1b,d1b)+=H24(l1bl2b|d1b,d2b)*S43(d2b|m1b)*0.5
    ierr=exatns_tensor_contract("Z129_2(l1,l2,m1,d1)+=H24(l1,l2,d1,d2)*S43(d2,m1)", &
        Z129_2,H24,S43,prefactor=(0.5d0,0.0d0))
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z76_1,"Z76_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z76_1,'ZERO')
!   original expression: Z76_1(l1bl2b|m1bm2b)+=S43(d1b|m1b)*Z129_2(l1bl2b|m2b,d1b)
    ierr=exatns_tensor_contract("Z76_1(l1,l2,m1,m2)+=S43(d1,m1)*Z129_2(l1,l2,m2,d1)", &
        Z76_1,S43,Z129_2,prefactor=(1.0d0,0.0d0))
!   original expression: Z76_1(l1bl2b|m1bm2b)+=S43(d1b|m2b)*Z129_2(l1bl2b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z76_1(l1,l2,m1,m2)+=S43(d1,m2)*Z129_2(l1,l2,m1,d1)", &
        Z76_1,S43,Z129_2,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z129_2)
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S46(e1be2be3be4b|m1bm2b,l1bl2b)*Z76_1(l1bl2b|m3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S46(e1,e2,e3,e4,m1,m2,l1,l2)*Z76_1(l1,l2,m3,m4)", &
        Z61,S46,Z76_1,prefactor=(0.5d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S46(e1be2be3be4b|m1bm3b,l1bl2b)*Z76_1(l1bl2b|m2bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S46(e1,e2,e3,e4,m1,m3,l1,l2)*Z76_1(l1,l2,m2,m4)", &
        Z61,S46,Z76_1,prefactor=(-0.5d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S46(e1be2be3be4b|m1bm4b,l1bl2b)*Z76_1(l1bl2b|m2bm3b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S46(e1,e2,e3,e4,m1,m4,l1,l2)*Z76_1(l1,l2,m2,m3)", &
        Z61,S46,Z76_1,prefactor=(0.5d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S46(e1be2be3be4b|m2bm3b,l1bl2b)*Z76_1(l1bl2b|m1bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S46(e1,e2,e3,e4,m2,m3,l1,l2)*Z76_1(l1,l2,m1,m4)", &
        Z61,S46,Z76_1,prefactor=(0.5d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S46(e1be2be3be4b|m2bm4b,l1bl2b)*Z76_1(l1bl2b|m1bm3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S46(e1,e2,e3,e4,m2,m4,l1,l2)*Z76_1(l1,l2,m1,m3)", &
        Z61,S46,Z76_1,prefactor=(-0.5d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S46(e1be2be3be4b|m3bm4b,l1bl2b)*Z76_1(l1bl2b|m1bm2b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S46(e1,e2,e3,e4,m3,m4,l1,l2)*Z76_1(l1,l2,m1,m2)", &
        Z61,S46,Z76_1,prefactor=(0.5d0,0.0d0))
    ierr=exatns_tensor_destroy(Z76_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z76_1,"Z76_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z76_1,'ZERO')
!   original expression: Z76_1(l1bl2b|m1bm2b)+=S44(d1bd2b|m1bm2b)*H24(l1bl2b|d1bd2b)
    ierr=exatns_tensor_contract("Z76_1(l1,l2,m1,m2)+=S44(d1,d2,m1,m2)*H24(l1,l2,d1,d2)", &
        Z76_1,S44,H24,prefactor=(0.5d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S46(e1be2be3be4b|m1bm2b,l1bl2b)*Z76_1(l1bl2b|m3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S46(e1,e2,e3,e4,m1,m2,l1,l2)*Z76_1(l1,l2,m3,m4)", &
        Z61,S46,Z76_1,prefactor=(0.5d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S46(e1be2be3be4b|m1bm3b,l1bl2b)*Z76_1(l1bl2b|m2bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S46(e1,e2,e3,e4,m1,m3,l1,l2)*Z76_1(l1,l2,m2,m4)", &
        Z61,S46,Z76_1,prefactor=(-0.5d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S46(e1be2be3be4b|m1bm4b,l1bl2b)*Z76_1(l1bl2b|m2bm3b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S46(e1,e2,e3,e4,m1,m4,l1,l2)*Z76_1(l1,l2,m2,m3)", &
        Z61,S46,Z76_1,prefactor=(0.5d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S46(e1be2be3be4b|m2bm3b,l1bl2b)*Z76_1(l1bl2b|m1bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S46(e1,e2,e3,e4,m2,m3,l1,l2)*Z76_1(l1,l2,m1,m4)", &
        Z61,S46,Z76_1,prefactor=(0.5d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S46(e1be2be3be4b|m2bm4b,l1bl2b)*Z76_1(l1bl2b|m1bm3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S46(e1,e2,e3,e4,m2,m4,l1,l2)*Z76_1(l1,l2,m1,m3)", &
        Z61,S46,Z76_1,prefactor=(-0.5d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S46(e1be2be3be4b|m3bm4b,l1bl2b)*Z76_1(l1bl2b|m1bm2b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S46(e1,e2,e3,e4,m3,m4,l1,l2)*Z76_1(l1,l2,m1,m2)", &
        Z61,S46,Z76_1,prefactor=(0.5d0,0.0d0))
    ierr=exatns_tensor_destroy(Z76_1)
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S46(e1be2be3be4b|m1bm2b,l1bl2b)*H26(l1bl2b|m3bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S46(e1,e2,e3,e4,m1,m2,l1,l2)*H26(l1,l2,m3,m4)", &
        Z61,S46,H26,prefactor=(0.5d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S46(e1be2be3be4b|m1bm3b,l1bl2b)*H26(l1bl2b|m2bm4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S46(e1,e2,e3,e4,m1,m3,l1,l2)*H26(l1,l2,m2,m4)", &
        Z61,S46,H26,prefactor=(-0.5d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S46(e1be2be3be4b|m1bm4b,l1bl2b)*H26(l1bl2b|m2bm3b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S46(e1,e2,e3,e4,m1,m4,l1,l2)*H26(l1,l2,m2,m3)", &
        Z61,S46,H26,prefactor=(0.5d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S46(e1be2be3be4b|m2bm3b,l1bl2b)*H26(l1bl2b|m1bm4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S46(e1,e2,e3,e4,m2,m3,l1,l2)*H26(l1,l2,m1,m4)", &
        Z61,S46,H26,prefactor=(0.5d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S46(e1be2be3be4b|m2bm4b,l1bl2b)*H26(l1bl2b|m1bm3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S46(e1,e2,e3,e4,m2,m4,l1,l2)*H26(l1,l2,m1,m3)", &
        Z61,S46,H26,prefactor=(-0.5d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S46(e1be2be3be4b|m3bm4b,l1bl2b)*H26(l1bl2b|m1bm2b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S46(e1,e2,e3,e4,m3,m4,l1,l2)*H26(l1,l2,m1,m2)", &
        Z61,S46,H26,prefactor=(0.5d0,0.0d0))
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z74_1,"Z74_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z74_1,'ZERO')
!   original expression: Z74_1(l1b|m1b)+=H25(l1b,l2b|m1b,d1b)*S43(d1b|l2b)*-1.
    ierr=exatns_tensor_contract("Z74_1(l1,m1)+=H25(l1,l2,m1,d1)*S43(d1,l2)", &
        Z74_1,H25,S43,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S46(e1be2be3be4b|m1bm2bm3b,l1b)*Z74_1(l1b|m4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S46(e1,e2,e3,e4,m1,m2,m3,l1)*Z74_1(l1,m4)", &
        Z61,S46,Z74_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S46(e1be2be3be4b|m1bm2bm4b,l1b)*Z74_1(l1b|m3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S46(e1,e2,e3,e4,m1,m2,m4,l1)*Z74_1(l1,m3)", &
        Z61,S46,Z74_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S46(e1be2be3be4b|m1bm3bm4b,l1b)*Z74_1(l1b|m2b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S46(e1,e2,e3,e4,m1,m3,m4,l1)*Z74_1(l1,m2)", &
        Z61,S46,Z74_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S46(e1be2be3be4b|m2bm3bm4b,l1b)*Z74_1(l1b|m1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S46(e1,e2,e3,e4,m2,m3,m4,l1)*Z74_1(l1,m1)", &
        Z61,S46,Z74_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z74_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z74_1,"Z74_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z74_1,'ZERO')
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S46(e1be2be3be4b|m1bm2bm3b,l1b)*Z74_1(l1b|m4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S46(e1,e2,e3,e4,m1,m2,m3,l1)*Z74_1(l1,m4)", &
        Z61,S46,Z74_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S46(e1be2be3be4b|m1bm2bm4b,l1b)*Z74_1(l1b|m3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S46(e1,e2,e3,e4,m1,m2,m4,l1)*Z74_1(l1,m3)", &
        Z61,S46,Z74_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S46(e1be2be3be4b|m1bm3bm4b,l1b)*Z74_1(l1b|m2b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S46(e1,e2,e3,e4,m1,m3,m4,l1)*Z74_1(l1,m2)", &
        Z61,S46,Z74_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S46(e1be2be3be4b|m2bm3bm4b,l1b)*Z74_1(l1b|m1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S46(e1,e2,e3,e4,m2,m3,m4,l1)*Z74_1(l1,m1)", &
        Z61,S46,Z74_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z74_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nvir_id/)
    tens_root = (/nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z75_2,"Z75_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z75_2,'ZERO')
!   original expression: Z75_2(l1b|d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|l2b)*-1.
    ierr=exatns_tensor_contract("Z75_2(l1,d1)+=H24(l1,l2,d1,d2)*S43(d2,l2)", &
        Z75_2,H24,S43,prefactor=(-1.0d0,0.0d0))
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z74_1,"Z74_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z74_1,'ZERO')
!   original expression: Z74_1(l1b|m1b)+=S43(d1b|m1b)*Z75_2(l1b|d1b)
    ierr=exatns_tensor_contract("Z74_1(l1,m1)+=S43(d1,m1)*Z75_2(l1,d1)", &
        Z74_1,S43,Z75_2,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z75_2)
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S46(e1be2be3be4b|m1bm2bm3b,l1b)*Z74_1(l1b|m4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S46(e1,e2,e3,e4,m1,m2,m3,l1)*Z74_1(l1,m4)", &
        Z61,S46,Z74_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S46(e1be2be3be4b|m1bm2bm4b,l1b)*Z74_1(l1b|m3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S46(e1,e2,e3,e4,m1,m2,m4,l1)*Z74_1(l1,m3)", &
        Z61,S46,Z74_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S46(e1be2be3be4b|m1bm3bm4b,l1b)*Z74_1(l1b|m2b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S46(e1,e2,e3,e4,m1,m3,m4,l1)*Z74_1(l1,m2)", &
        Z61,S46,Z74_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S46(e1be2be3be4b|m2bm3bm4b,l1b)*Z74_1(l1b|m1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S46(e1,e2,e3,e4,m2,m3,m4,l1)*Z74_1(l1,m1)", &
        Z61,S46,Z74_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z74_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nvir_id/)
    tens_root = (/nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z75_2,"Z75_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z75_2,'ZERO')
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z74_1,"Z74_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z74_1,'ZERO')
!   original expression: Z74_1(l1b|m1b)+=S43(d1b|m1b)*Z75_2(l1b|d1b)
    ierr=exatns_tensor_contract("Z74_1(l1,m1)+=S43(d1,m1)*Z75_2(l1,d1)", &
        Z74_1,S43,Z75_2,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z75_2)
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S46(e1be2be3be4b|m1bm2bm3b,l1b)*Z74_1(l1b|m4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S46(e1,e2,e3,e4,m1,m2,m3,l1)*Z74_1(l1,m4)", &
        Z61,S46,Z74_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S46(e1be2be3be4b|m1bm2bm4b,l1b)*Z74_1(l1b|m3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S46(e1,e2,e3,e4,m1,m2,m4,l1)*Z74_1(l1,m3)", &
        Z61,S46,Z74_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S46(e1be2be3be4b|m1bm3bm4b,l1b)*Z74_1(l1b|m2b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S46(e1,e2,e3,e4,m1,m3,m4,l1)*Z74_1(l1,m2)", &
        Z61,S46,Z74_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S46(e1be2be3be4b|m2bm3bm4b,l1b)*Z74_1(l1b|m1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S46(e1,e2,e3,e4,m2,m3,m4,l1)*Z74_1(l1,m1)", &
        Z61,S46,Z74_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z74_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z74_1,"Z74_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z74_1,'ZERO')
!   original expression: Z74_1(l1b|m1b)+=S43(d1b|m1b)*H15(l1b|d1b)*-1.
    ierr=exatns_tensor_contract("Z74_1(l1,m1)+=S43(d1,m1)*H15(l1,d1)", &
        Z74_1,S43,H15,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S46(e1be2be3be4b|m1bm2bm3b,l1b)*Z74_1(l1b|m4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S46(e1,e2,e3,e4,m1,m2,m3,l1)*Z74_1(l1,m4)", &
        Z61,S46,Z74_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S46(e1be2be3be4b|m1bm2bm4b,l1b)*Z74_1(l1b|m3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S46(e1,e2,e3,e4,m1,m2,m4,l1)*Z74_1(l1,m3)", &
        Z61,S46,Z74_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S46(e1be2be3be4b|m1bm3bm4b,l1b)*Z74_1(l1b|m2b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S46(e1,e2,e3,e4,m1,m3,m4,l1)*Z74_1(l1,m2)", &
        Z61,S46,Z74_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S46(e1be2be3be4b|m2bm3bm4b,l1b)*Z74_1(l1b|m1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S46(e1,e2,e3,e4,m2,m3,m4,l1)*Z74_1(l1,m1)", &
        Z61,S46,Z74_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z74_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z74_1,"Z74_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z74_1,'ZERO')
!   original expression: Z74_1(l1b|m1b)+=S44(d1bd2b|m1b,l2b)*H24(l1b,l2b|d1bd2b)*-1.
    ierr=exatns_tensor_contract("Z74_1(l1,m1)+=S44(d1,d2,m1,l2)*H24(l1,l2,d1,d2)", &
        Z74_1,S44,H24,prefactor=(-0.5d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S46(e1be2be3be4b|m1bm2bm3b,l1b)*Z74_1(l1b|m4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S46(e1,e2,e3,e4,m1,m2,m3,l1)*Z74_1(l1,m4)", &
        Z61,S46,Z74_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S46(e1be2be3be4b|m1bm2bm4b,l1b)*Z74_1(l1b|m3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S46(e1,e2,e3,e4,m1,m2,m4,l1)*Z74_1(l1,m3)", &
        Z61,S46,Z74_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S46(e1be2be3be4b|m1bm3bm4b,l1b)*Z74_1(l1b|m2b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S46(e1,e2,e3,e4,m1,m3,m4,l1)*Z74_1(l1,m2)", &
        Z61,S46,Z74_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S46(e1be2be3be4b|m2bm3bm4b,l1b)*Z74_1(l1b|m1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S46(e1,e2,e3,e4,m2,m3,m4,l1)*Z74_1(l1,m1)", &
        Z61,S46,Z74_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z74_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z74_1,"Z74_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z74_1,'ZERO')
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S46(e1be2be3be4b|m1bm2bm3b,l1b)*Z74_1(l1b|m4b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S46(e1,e2,e3,e4,m1,m2,m3,l1)*Z74_1(l1,m4)", &
        Z61,S46,Z74_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S46(e1be2be3be4b|m1bm2bm4b,l1b)*Z74_1(l1b|m3b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S46(e1,e2,e3,e4,m1,m2,m4,l1)*Z74_1(l1,m3)", &
        Z61,S46,Z74_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S46(e1be2be3be4b|m1bm3bm4b,l1b)*Z74_1(l1b|m2b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S46(e1,e2,e3,e4,m1,m3,m4,l1)*Z74_1(l1,m2)", &
        Z61,S46,Z74_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S46(e1be2be3be4b|m2bm3bm4b,l1b)*Z74_1(l1b|m1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S46(e1,e2,e3,e4,m2,m3,m4,l1)*Z74_1(l1,m1)", &
        Z61,S46,Z74_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z74_1)
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S46(e1be2be3be4b|m1bm2bm3b,l1b)*H16(l1b|m4b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S46(e1,e2,e3,e4,m1,m2,m3,l1)*H16(l1,m4)", &
        Z61,S46,H16,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S46(e1be2be3be4b|m1bm2bm4b,l1b)*H16(l1b|m3b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S46(e1,e2,e3,e4,m1,m2,m4,l1)*H16(l1,m3)", &
        Z61,S46,H16,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S46(e1be2be3be4b|m1bm3bm4b,l1b)*H16(l1b|m2b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S46(e1,e2,e3,e4,m1,m3,m4,l1)*H16(l1,m2)", &
        Z61,S46,H16,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S46(e1be2be3be4b|m2bm3bm4b,l1b)*H16(l1b|m1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S46(e1,e2,e3,e4,m2,m3,m4,l1)*H16(l1,m1)", &
        Z61,S46,H16,prefactor=(1.0d0,0.0d0))
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z136_1,"Z136_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z136_1,'ZERO')
!   original expression: Z136_1(e1b,l1b|m1b,d1b)+=H17(e1b,l1b|d1b,d2b)*S43(d2b|m1b)*-1.
    ierr=exatns_tensor_contract("Z136_1(e1,l1,m1,d1)+=H17(e1,l1,d1,d2)*S43(d2,m1)", &
        Z136_1,H17,S43,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S46(e1be2be3b,d1b|m1bm2bm3b,l1b)*Z136_1(e4b,l1b|m4b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S46(e1,e2,e3,d1,m1,m2,m3,l1)*Z136_1(e4,l1,m4,d1)", &
        Z61,S46,Z136_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S46(e1be2be4b,d1b|m1bm2bm3b,l1b)*Z136_1(e3b,l1b|m4b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S46(e1,e2,e4,d1,m1,m2,m3,l1)*Z136_1(e3,l1,m4,d1)", &
        Z61,S46,Z136_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S46(e1be3be4b,d1b|m1bm2bm3b,l1b)*Z136_1(e2b,l1b|m4b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S46(e1,e3,e4,d1,m1,m2,m3,l1)*Z136_1(e2,l1,m4,d1)", &
        Z61,S46,Z136_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S46(e2be3be4b,d1b|m1bm2bm3b,l1b)*Z136_1(e1b,l1b|m4b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S46(e2,e3,e4,d1,m1,m2,m3,l1)*Z136_1(e1,l1,m4,d1)", &
        Z61,S46,Z136_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S46(e1be2be3b,d1b|m1bm2bm4b,l1b)*Z136_1(e4b,l1b|m3b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S46(e1,e2,e3,d1,m1,m2,m4,l1)*Z136_1(e4,l1,m3,d1)", &
        Z61,S46,Z136_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S46(e1be2be4b,d1b|m1bm2bm4b,l1b)*Z136_1(e3b,l1b|m3b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S46(e1,e2,e4,d1,m1,m2,m4,l1)*Z136_1(e3,l1,m3,d1)", &
        Z61,S46,Z136_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S46(e1be3be4b,d1b|m1bm2bm4b,l1b)*Z136_1(e2b,l1b|m3b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S46(e1,e3,e4,d1,m1,m2,m4,l1)*Z136_1(e2,l1,m3,d1)", &
        Z61,S46,Z136_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S46(e2be3be4b,d1b|m1bm2bm4b,l1b)*Z136_1(e1b,l1b|m3b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S46(e2,e3,e4,d1,m1,m2,m4,l1)*Z136_1(e1,l1,m3,d1)", &
        Z61,S46,Z136_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S46(e1be2be3b,d1b|m1bm3bm4b,l1b)*Z136_1(e4b,l1b|m2b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S46(e1,e2,e3,d1,m1,m3,m4,l1)*Z136_1(e4,l1,m2,d1)", &
        Z61,S46,Z136_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S46(e1be2be4b,d1b|m1bm3bm4b,l1b)*Z136_1(e3b,l1b|m2b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S46(e1,e2,e4,d1,m1,m3,m4,l1)*Z136_1(e3,l1,m2,d1)", &
        Z61,S46,Z136_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S46(e1be3be4b,d1b|m1bm3bm4b,l1b)*Z136_1(e2b,l1b|m2b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S46(e1,e3,e4,d1,m1,m3,m4,l1)*Z136_1(e2,l1,m2,d1)", &
        Z61,S46,Z136_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S46(e2be3be4b,d1b|m1bm3bm4b,l1b)*Z136_1(e1b,l1b|m2b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S46(e2,e3,e4,d1,m1,m3,m4,l1)*Z136_1(e1,l1,m2,d1)", &
        Z61,S46,Z136_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S46(e1be2be3b,d1b|m2bm3bm4b,l1b)*Z136_1(e4b,l1b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S46(e1,e2,e3,d1,m2,m3,m4,l1)*Z136_1(e4,l1,m1,d1)", &
        Z61,S46,Z136_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S46(e1be2be4b,d1b|m2bm3bm4b,l1b)*Z136_1(e3b,l1b|m1b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S46(e1,e2,e4,d1,m2,m3,m4,l1)*Z136_1(e3,l1,m1,d1)", &
        Z61,S46,Z136_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S46(e1be3be4b,d1b|m2bm3bm4b,l1b)*Z136_1(e2b,l1b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S46(e1,e3,e4,d1,m2,m3,m4,l1)*Z136_1(e2,l1,m1,d1)", &
        Z61,S46,Z136_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S46(e2be3be4b,d1b|m2bm3bm4b,l1b)*Z136_1(e1b,l1b|m1b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S46(e2,e3,e4,d1,m2,m3,m4,l1)*Z136_1(e1,l1,m1,d1)", &
        Z61,S46,Z136_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z136_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z136_1,"Z136_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z136_1,'ZERO')
!   original expression: Z136_1(e1b,l1b|m1b,d1b)+=S44(e1b,d2b|m1b,l2b)*H24(l1b,l2b|d1b,d2b)
    ierr=exatns_tensor_contract("Z136_1(e1,l1,m1,d1)+=S44(e1,d2,m1,l2)*H24(l1,l2,d1,d2)", &
        Z136_1,S44,H24,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S46(e1be2be3b,d1b|m1bm2bm3b,l1b)*Z136_1(e4b,l1b|m4b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S46(e1,e2,e3,d1,m1,m2,m3,l1)*Z136_1(e4,l1,m4,d1)", &
        Z61,S46,Z136_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S46(e1be2be4b,d1b|m1bm2bm3b,l1b)*Z136_1(e3b,l1b|m4b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S46(e1,e2,e4,d1,m1,m2,m3,l1)*Z136_1(e3,l1,m4,d1)", &
        Z61,S46,Z136_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S46(e1be3be4b,d1b|m1bm2bm3b,l1b)*Z136_1(e2b,l1b|m4b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S46(e1,e3,e4,d1,m1,m2,m3,l1)*Z136_1(e2,l1,m4,d1)", &
        Z61,S46,Z136_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S46(e2be3be4b,d1b|m1bm2bm3b,l1b)*Z136_1(e1b,l1b|m4b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S46(e2,e3,e4,d1,m1,m2,m3,l1)*Z136_1(e1,l1,m4,d1)", &
        Z61,S46,Z136_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S46(e1be2be3b,d1b|m1bm2bm4b,l1b)*Z136_1(e4b,l1b|m3b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S46(e1,e2,e3,d1,m1,m2,m4,l1)*Z136_1(e4,l1,m3,d1)", &
        Z61,S46,Z136_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S46(e1be2be4b,d1b|m1bm2bm4b,l1b)*Z136_1(e3b,l1b|m3b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S46(e1,e2,e4,d1,m1,m2,m4,l1)*Z136_1(e3,l1,m3,d1)", &
        Z61,S46,Z136_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S46(e1be3be4b,d1b|m1bm2bm4b,l1b)*Z136_1(e2b,l1b|m3b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S46(e1,e3,e4,d1,m1,m2,m4,l1)*Z136_1(e2,l1,m3,d1)", &
        Z61,S46,Z136_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S46(e2be3be4b,d1b|m1bm2bm4b,l1b)*Z136_1(e1b,l1b|m3b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S46(e2,e3,e4,d1,m1,m2,m4,l1)*Z136_1(e1,l1,m3,d1)", &
        Z61,S46,Z136_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S46(e1be2be3b,d1b|m1bm3bm4b,l1b)*Z136_1(e4b,l1b|m2b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S46(e1,e2,e3,d1,m1,m3,m4,l1)*Z136_1(e4,l1,m2,d1)", &
        Z61,S46,Z136_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S46(e1be2be4b,d1b|m1bm3bm4b,l1b)*Z136_1(e3b,l1b|m2b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S46(e1,e2,e4,d1,m1,m3,m4,l1)*Z136_1(e3,l1,m2,d1)", &
        Z61,S46,Z136_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S46(e1be3be4b,d1b|m1bm3bm4b,l1b)*Z136_1(e2b,l1b|m2b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S46(e1,e3,e4,d1,m1,m3,m4,l1)*Z136_1(e2,l1,m2,d1)", &
        Z61,S46,Z136_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S46(e2be3be4b,d1b|m1bm3bm4b,l1b)*Z136_1(e1b,l1b|m2b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S46(e2,e3,e4,d1,m1,m3,m4,l1)*Z136_1(e1,l1,m2,d1)", &
        Z61,S46,Z136_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S46(e1be2be3b,d1b|m2bm3bm4b,l1b)*Z136_1(e4b,l1b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S46(e1,e2,e3,d1,m2,m3,m4,l1)*Z136_1(e4,l1,m1,d1)", &
        Z61,S46,Z136_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S46(e1be2be4b,d1b|m2bm3bm4b,l1b)*Z136_1(e3b,l1b|m1b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S46(e1,e2,e4,d1,m2,m3,m4,l1)*Z136_1(e3,l1,m1,d1)", &
        Z61,S46,Z136_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S46(e1be3be4b,d1b|m2bm3bm4b,l1b)*Z136_1(e2b,l1b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S46(e1,e3,e4,d1,m2,m3,m4,l1)*Z136_1(e2,l1,m1,d1)", &
        Z61,S46,Z136_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S46(e2be3be4b,d1b|m2bm3bm4b,l1b)*Z136_1(e1b,l1b|m1b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S46(e2,e3,e4,d1,m2,m3,m4,l1)*Z136_1(e1,l1,m1,d1)", &
        Z61,S46,Z136_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z136_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z136_1,"Z136_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z136_1,'ZERO')
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S46(e1be2be3b,d1b|m1bm2bm3b,l1b)*Z136_1(e4b,l1b|m4b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S46(e1,e2,e3,d1,m1,m2,m3,l1)*Z136_1(e4,l1,m4,d1)", &
        Z61,S46,Z136_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S46(e1be2be4b,d1b|m1bm2bm3b,l1b)*Z136_1(e3b,l1b|m4b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S46(e1,e2,e4,d1,m1,m2,m3,l1)*Z136_1(e3,l1,m4,d1)", &
        Z61,S46,Z136_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S46(e1be3be4b,d1b|m1bm2bm3b,l1b)*Z136_1(e2b,l1b|m4b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S46(e1,e3,e4,d1,m1,m2,m3,l1)*Z136_1(e2,l1,m4,d1)", &
        Z61,S46,Z136_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S46(e2be3be4b,d1b|m1bm2bm3b,l1b)*Z136_1(e1b,l1b|m4b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S46(e2,e3,e4,d1,m1,m2,m3,l1)*Z136_1(e1,l1,m4,d1)", &
        Z61,S46,Z136_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S46(e1be2be3b,d1b|m1bm2bm4b,l1b)*Z136_1(e4b,l1b|m3b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S46(e1,e2,e3,d1,m1,m2,m4,l1)*Z136_1(e4,l1,m3,d1)", &
        Z61,S46,Z136_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S46(e1be2be4b,d1b|m1bm2bm4b,l1b)*Z136_1(e3b,l1b|m3b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S46(e1,e2,e4,d1,m1,m2,m4,l1)*Z136_1(e3,l1,m3,d1)", &
        Z61,S46,Z136_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S46(e1be3be4b,d1b|m1bm2bm4b,l1b)*Z136_1(e2b,l1b|m3b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S46(e1,e3,e4,d1,m1,m2,m4,l1)*Z136_1(e2,l1,m3,d1)", &
        Z61,S46,Z136_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S46(e2be3be4b,d1b|m1bm2bm4b,l1b)*Z136_1(e1b,l1b|m3b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S46(e2,e3,e4,d1,m1,m2,m4,l1)*Z136_1(e1,l1,m3,d1)", &
        Z61,S46,Z136_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S46(e1be2be3b,d1b|m1bm3bm4b,l1b)*Z136_1(e4b,l1b|m2b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S46(e1,e2,e3,d1,m1,m3,m4,l1)*Z136_1(e4,l1,m2,d1)", &
        Z61,S46,Z136_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S46(e1be2be4b,d1b|m1bm3bm4b,l1b)*Z136_1(e3b,l1b|m2b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S46(e1,e2,e4,d1,m1,m3,m4,l1)*Z136_1(e3,l1,m2,d1)", &
        Z61,S46,Z136_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S46(e1be3be4b,d1b|m1bm3bm4b,l1b)*Z136_1(e2b,l1b|m2b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S46(e1,e3,e4,d1,m1,m3,m4,l1)*Z136_1(e2,l1,m2,d1)", &
        Z61,S46,Z136_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S46(e2be3be4b,d1b|m1bm3bm4b,l1b)*Z136_1(e1b,l1b|m2b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S46(e2,e3,e4,d1,m1,m3,m4,l1)*Z136_1(e1,l1,m2,d1)", &
        Z61,S46,Z136_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S46(e1be2be3b,d1b|m2bm3bm4b,l1b)*Z136_1(e4b,l1b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S46(e1,e2,e3,d1,m2,m3,m4,l1)*Z136_1(e4,l1,m1,d1)", &
        Z61,S46,Z136_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S46(e1be2be4b,d1b|m2bm3bm4b,l1b)*Z136_1(e3b,l1b|m1b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S46(e1,e2,e4,d1,m2,m3,m4,l1)*Z136_1(e3,l1,m1,d1)", &
        Z61,S46,Z136_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S46(e1be3be4b,d1b|m2bm3bm4b,l1b)*Z136_1(e2b,l1b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S46(e1,e3,e4,d1,m2,m3,m4,l1)*Z136_1(e2,l1,m1,d1)", &
        Z61,S46,Z136_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S46(e2be3be4b,d1b|m2bm3bm4b,l1b)*Z136_1(e1b,l1b|m1b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S46(e2,e3,e4,d1,m2,m3,m4,l1)*Z136_1(e1,l1,m1,d1)", &
        Z61,S46,Z136_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z136_1)
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S46(e1be2be3b,d1b|m1bm2bm3b,l1b)*H18(e4b,l1b|m4b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S46(e1,e2,e3,d1,m1,m2,m3,l1)*H18(e4,l1,m4,d1)", &
        Z61,S46,H18,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S46(e1be2be4b,d1b|m1bm2bm3b,l1b)*H18(e3b,l1b|m4b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S46(e1,e2,e4,d1,m1,m2,m3,l1)*H18(e3,l1,m4,d1)", &
        Z61,S46,H18,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S46(e1be3be4b,d1b|m1bm2bm3b,l1b)*H18(e2b,l1b|m4b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S46(e1,e3,e4,d1,m1,m2,m3,l1)*H18(e2,l1,m4,d1)", &
        Z61,S46,H18,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S46(e2be3be4b,d1b|m1bm2bm3b,l1b)*H18(e1b,l1b|m4b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S46(e2,e3,e4,d1,m1,m2,m3,l1)*H18(e1,l1,m4,d1)", &
        Z61,S46,H18,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S46(e1be2be3b,d1b|m1bm2bm4b,l1b)*H18(e4b,l1b|m3b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S46(e1,e2,e3,d1,m1,m2,m4,l1)*H18(e4,l1,m3,d1)", &
        Z61,S46,H18,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S46(e1be2be4b,d1b|m1bm2bm4b,l1b)*H18(e3b,l1b|m3b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S46(e1,e2,e4,d1,m1,m2,m4,l1)*H18(e3,l1,m3,d1)", &
        Z61,S46,H18,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S46(e1be3be4b,d1b|m1bm2bm4b,l1b)*H18(e2b,l1b|m3b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S46(e1,e3,e4,d1,m1,m2,m4,l1)*H18(e2,l1,m3,d1)", &
        Z61,S46,H18,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S46(e2be3be4b,d1b|m1bm2bm4b,l1b)*H18(e1b,l1b|m3b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S46(e2,e3,e4,d1,m1,m2,m4,l1)*H18(e1,l1,m3,d1)", &
        Z61,S46,H18,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S46(e1be2be3b,d1b|m1bm3bm4b,l1b)*H18(e4b,l1b|m2b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S46(e1,e2,e3,d1,m1,m3,m4,l1)*H18(e4,l1,m2,d1)", &
        Z61,S46,H18,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S46(e1be2be4b,d1b|m1bm3bm4b,l1b)*H18(e3b,l1b|m2b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S46(e1,e2,e4,d1,m1,m3,m4,l1)*H18(e3,l1,m2,d1)", &
        Z61,S46,H18,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S46(e1be3be4b,d1b|m1bm3bm4b,l1b)*H18(e2b,l1b|m2b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S46(e1,e3,e4,d1,m1,m3,m4,l1)*H18(e2,l1,m2,d1)", &
        Z61,S46,H18,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S46(e2be3be4b,d1b|m1bm3bm4b,l1b)*H18(e1b,l1b|m2b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S46(e2,e3,e4,d1,m1,m3,m4,l1)*H18(e1,l1,m2,d1)", &
        Z61,S46,H18,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S46(e1be2be3b,d1b|m2bm3bm4b,l1b)*H18(e4b,l1b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S46(e1,e2,e3,d1,m2,m3,m4,l1)*H18(e4,l1,m1,d1)", &
        Z61,S46,H18,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S46(e1be2be4b,d1b|m2bm3bm4b,l1b)*H18(e3b,l1b|m1b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S46(e1,e2,e4,d1,m2,m3,m4,l1)*H18(e3,l1,m1,d1)", &
        Z61,S46,H18,prefactor=(1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S46(e1be3be4b,d1b|m2bm3bm4b,l1b)*H18(e2b,l1b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S46(e1,e3,e4,d1,m2,m3,m4,l1)*H18(e2,l1,m1,d1)", &
        Z61,S46,H18,prefactor=(-1.0d0,0.0d0))
!   original expression: Z61(e1be2be3be4b|m1bm2bm3bm4b)+=S46(e2be3be4b,d1b|m2bm3bm4b,l1b)*H18(e1b,l1b|m1b,d1b)
    ierr=exatns_tensor_contract("Z61(e1,e2,e3,e4,m1,m2,m3,m4)+=S46(e2,e3,e4,d1,m2,m3,m4,l1)*H18(e1,l1,m1,d1)", &
        Z61,S46,H18,prefactor=(1.0d0,0.0d0))
    
    allocate(tens_id(6), tens_root(6))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z169_3,"Z169_3",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z169_3,'ZERO')
!   original expression: Z169_3(e1b,l1b,l2b|m1bm2b,d1b)+=H24(l1b,l2b|d1b,d2b)*S44(e1b,d2b|m1bm2b)*-0.5
    ierr=exatns_tensor_contract("Z169_3(e1,l1,l2,m1,m2,d1)+=H24(l1,l2,d1,d2)*S44(e1,d2,m1,m2)", &
        Z169_3,H24,S44,prefactor=(-0.5d0,0.0d0))
    ierr=exatns_tensor_destroy(Z169_3)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z165_3,"Z165_3",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z165_3,'ZERO')
!   original expression: Z165_3(l1b,l2b|m1b,d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|m1b)*0.5
    ierr=exatns_tensor_contract("Z165_3(l1,l2,m1,d1)+=H24(l1,l2,d1,d2)*S43(d2,m1)", &
        Z165_3,H24,S43,prefactor=(0.5d0,0.0d0))
    ierr=exatns_tensor_destroy(Z165_3)
    
    allocate(tens_id(6), tens_root(6))
    tens_id   = (/nvir_id,nvir_id,nocc_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root,nocc_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z142_2,"Z142_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z142_2,'ZERO')
!   original expression: Z142_2(e1be2b,l1b|m1bm2b,d1b)+=H17(e1b,l1b|d1b,d2b)*S44(e2b,d2b|m1bm2b)*-1.
    ierr=exatns_tensor_contract("Z142_2(e1,e2,l1,m1,m2,d1)+=H17(e1,l1,d1,d2)*S44(e2,d2,m1,m2)", &
        Z142_2,H17,S44,prefactor=(-1.0d0,0.0d0))
!   original expression: Z142_2(e1be2b,l1b|m1bm2b,d1b)+=H17(e2b,l1b|d1b,d2b)*S44(e1b,d2b|m1bm2b)
    ierr=exatns_tensor_contract("Z142_2(e1,e2,l1,m1,m2,d1)+=H17(e2,l1,d1,d2)*S44(e1,d2,m1,m2)", &
        Z142_2,H17,S44,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z142_2)
    
    allocate(tens_id(6), tens_root(6))
    tens_id   = (/nvir_id,nvir_id,nocc_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root,nocc_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z142_2,"Z142_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z142_2,'ZERO')
!   original expression: Z142_2(e1be2b,l1b|m1bm2b,d1b)+=S45(e1be2b,d2b|m1bm2b,l2b)*H24(l1b,l2b|d1b,d2b)*-1.
    ierr=exatns_tensor_contract("Z142_2(e1,e2,l1,m1,m2,d1)+=S45(e1,e2,d2,m1,m2,l2)*H24(l1,l2,d1,d2)", &
        Z142_2,S45,H24,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z142_2)
    
    allocate(tens_id(6), tens_root(6))
    tens_id   = (/nvir_id,nvir_id,nocc_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root,nocc_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z142_2,"Z142_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z142_2,'ZERO')
    ierr=exatns_tensor_destroy(Z142_2)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z136_2,"Z136_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z136_2,'ZERO')
!   original expression: Z136_2(e1b,l1b|m1b,d1b)+=H17(e1b,l1b|d1b,d2b)*S43(d2b|m1b)*-1.
    ierr=exatns_tensor_contract("Z136_2(e1,l1,m1,d1)+=H17(e1,l1,d1,d2)*S43(d2,m1)", &
        Z136_2,H17,S43,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z136_2)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z136_2,"Z136_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z136_2,'ZERO')
!   original expression: Z136_2(e1b,l1b|m1b,d1b)+=S44(e1b,d2b|m1b,l2b)*H24(l1b,l2b|d1b,d2b)
    ierr=exatns_tensor_contract("Z136_2(e1,l1,m1,d1)+=S44(e1,d2,m1,l2)*H24(l1,l2,d1,d2)", &
        Z136_2,S44,H24,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z136_2)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z136_2,"Z136_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z136_2,'ZERO')
    ierr=exatns_tensor_destroy(Z136_2)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nvir_id/)
    tens_root = (/nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z75_2,"Z75_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z75_2,'ZERO')
!   original expression: Z75_2(l1b|d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|l2b)*-1.
    ierr=exatns_tensor_contract("Z75_2(l1,d1)+=H24(l1,l2,d1,d2)*S43(d2,l2)", &
        Z75_2,H24,S43,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z75_2)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nvir_id/)
    tens_root = (/nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z75_2,"Z75_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z75_2,'ZERO')
    ierr=exatns_tensor_destroy(Z75_2)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z165_2,"Z165_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z165_2,'ZERO')
!   original expression: Z165_2(l1b,l2b|m1b,d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|m1b)
    ierr=exatns_tensor_contract("Z165_2(l1,l2,m1,d1)+=H24(l1,l2,d1,d2)*S43(d2,m1)", &
        Z165_2,H24,S43,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z165_2)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z129_2,"Z129_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z129_2,'ZERO')
!   original expression: Z129_2(l1bl2b|m1b,d1b)+=H24(l1bl2b|d1b,d2b)*S43(d2b|m1b)
    ierr=exatns_tensor_contract("Z129_2(l1,l2,m1,d1)+=H24(l1,l2,d1,d2)*S43(d2,m1)", &
        Z129_2,H24,S43,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z129_2)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z165_3,"Z165_3",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z165_3,'ZERO')
!   original expression: Z165_3(l1b,l2b|m1b,d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|m1b)
    ierr=exatns_tensor_contract("Z165_3(l1,l2,m1,d1)+=H24(l1,l2,d1,d2)*S43(d2,m1)", &
        Z165_3,H24,S43,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z165_3)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z136_2,"Z136_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z136_2,'ZERO')
!   original expression: Z136_2(e1b,l1b|m1b,d1b)+=H17(e1b,l1b|d1b,d2b)*S43(d2b|m1b)
    ierr=exatns_tensor_contract("Z136_2(e1,l1,m1,d1)+=H17(e1,l1,d1,d2)*S43(d2,m1)", &
        Z136_2,H17,S43,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z136_2)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z136_2,"Z136_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z136_2,'ZERO')
!   original expression: Z136_2(e1b,l1b|m1b,d1b)+=S44(e1b,d2b|m1b,l2b)*H24(l1b,l2b|d1b,d2b)*-1.
    ierr=exatns_tensor_contract("Z136_2(e1,l1,m1,d1)+=S44(e1,d2,m1,l2)*H24(l1,l2,d1,d2)", &
        Z136_2,S44,H24,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z136_2)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z136_2,"Z136_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z136_2,'ZERO')
    ierr=exatns_tensor_destroy(Z136_2)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nvir_id/)
    tens_root = (/nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z75_2,"Z75_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z75_2,'ZERO')
!   original expression: Z75_2(l1b|d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|l2b)
    ierr=exatns_tensor_contract("Z75_2(l1,d1)+=H24(l1,l2,d1,d2)*S43(d2,l2)", &
        Z75_2,H24,S43,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z75_2)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nvir_id/)
    tens_root = (/nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z75_2,"Z75_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z75_2,'ZERO')
    ierr=exatns_tensor_destroy(Z75_2)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z165_2,"Z165_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z165_2,'ZERO')
!   original expression: Z165_2(l1b,l2b|m1b,d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|m1b)*-1.
    ierr=exatns_tensor_contract("Z165_2(l1,l2,m1,d1)+=H24(l1,l2,d1,d2)*S43(d2,m1)", &
        Z165_2,H24,S43,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z165_2)
    
    allocate(tens_id(6), tens_root(6))
    tens_id   = (/nvir_id,nvir_id,nvir_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root,nvir_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z95_1,"Z95_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z95_1,'ZERO')
!   original expression: Z95_1(e1be2be3b|m1bm2b,d1b)+=H3(e1be2b|d1b,d2b)*S44(e3b,d2b|m1bm2b)*-1.
    ierr=exatns_tensor_contract("Z95_1(e1,e2,e3,m1,m2,d1)+=H3(e1,e2,d1,d2)*S44(e3,d2,m1,m2)", &
        Z95_1,H3,S44,prefactor=(-1.0d0,0.0d0))
!   original expression: Z95_1(e1be2be3b|m1bm2b,d1b)+=H3(e1be3b|d1b,d2b)*S44(e2b,d2b|m1bm2b)
    ierr=exatns_tensor_contract("Z95_1(e1,e2,e3,m1,m2,d1)+=H3(e1,e3,d1,d2)*S44(e2,d2,m1,m2)", &
        Z95_1,H3,S44,prefactor=(1.0d0,0.0d0))
!   original expression: Z95_1(e1be2be3b|m1bm2b,d1b)+=H3(e2be3b|d1b,d2b)*S44(e1b,d2b|m1bm2b)*-1.
    ierr=exatns_tensor_contract("Z95_1(e1,e2,e3,m1,m2,d1)+=H3(e2,e3,d1,d2)*S44(e1,d2,m1,m2)", &
        Z95_1,H3,S44,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z95_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nvir_id,nvir_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root,nvir_root,nvir_root/)
    ierr=exatns_tensor_create(Z92_2,"Z92_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z92_2,'ZERO')
!   original expression: Z92_2(e1be2b|d1b,d2b)+=H24(l1bl2b|d1b,d2b)*S44(e1be2b|l1bl2b)*-1.
    ierr=exatns_tensor_contract("Z92_2(e1,e2,d1,d2)+=H24(l1,l2,d1,d2)*S44(e1,e2,l1,l2)", &
        Z92_2,H24,S44,prefactor=(-0.5d0,0.0d0))
    
    allocate(tens_id(6), tens_root(6))
    tens_id   = (/nvir_id,nvir_id,nvir_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root,nvir_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z95_1,"Z95_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z95_1,'ZERO')
!   original expression: Z95_1(e1be2be3b|m1bm2b,d1b)+=S44(e1b,d2b|m1bm2b)*Z92_2(e2be3b|d1b,d2b)
    ierr=exatns_tensor_contract("Z95_1(e1,e2,e3,m1,m2,d1)+=S44(e1,d2,m1,m2)*Z92_2(e2,e3,d1,d2)", &
        Z95_1,S44,Z92_2,prefactor=(1.0d0,0.0d0))
!   original expression: Z95_1(e1be2be3b|m1bm2b,d1b)+=S44(e2b,d2b|m1bm2b)*Z92_2(e1be3b|d1b,d2b)*-1.
    ierr=exatns_tensor_contract("Z95_1(e1,e2,e3,m1,m2,d1)+=S44(e2,d2,m1,m2)*Z92_2(e1,e3,d1,d2)", &
        Z95_1,S44,Z92_2,prefactor=(-1.0d0,0.0d0))
!   original expression: Z95_1(e1be2be3b|m1bm2b,d1b)+=S44(e3b,d2b|m1bm2b)*Z92_2(e1be2b|d1b,d2b)
    ierr=exatns_tensor_contract("Z95_1(e1,e2,e3,m1,m2,d1)+=S44(e3,d2,m1,m2)*Z92_2(e1,e2,d1,d2)", &
        Z95_1,S44,Z92_2,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z92_2)
    ierr=exatns_tensor_destroy(Z95_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z129_2,"Z129_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z129_2,'ZERO')
!   original expression: Z129_2(l1bl2b|m1b,d1b)+=H24(l1bl2b|d1b,d2b)*S43(d2b|m1b)*-1.
    ierr=exatns_tensor_contract("Z129_2(l1,l2,m1,d1)+=H24(l1,l2,d1,d2)*S43(d2,m1)", &
        Z129_2,H24,S43,prefactor=(-1.0d0,0.0d0))
    
    allocate(tens_id(6), tens_root(6))
    tens_id   = (/nvir_id,nvir_id,nvir_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root,nvir_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z95_1,"Z95_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z95_1,'ZERO')
!   original expression: Z95_1(e1be2be3b|m1bm2b,d1b)+=S45(e1be2be3b|m1b,l1bl2b)*Z129_2(l1bl2b|m2b,d1b)
    ierr=exatns_tensor_contract("Z95_1(e1,e2,e3,m1,m2,d1)+=S45(e1,e2,e3,m1,l1,l2)*Z129_2(l1,l2,m2,d1)", &
        Z95_1,S45,Z129_2,prefactor=(0.5d0,0.0d0))
!   original expression: Z95_1(e1be2be3b|m1bm2b,d1b)+=S45(e1be2be3b|m2b,l1bl2b)*Z129_2(l1bl2b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z95_1(e1,e2,e3,m1,m2,d1)+=S45(e1,e2,e3,m2,l1,l2)*Z129_2(l1,l2,m1,d1)", &
        Z95_1,S45,Z129_2,prefactor=(-0.5d0,0.0d0))
    ierr=exatns_tensor_destroy(Z129_2)
    ierr=exatns_tensor_destroy(Z95_1)
    
    allocate(tens_id(6), tens_root(6))
    tens_id   = (/nvir_id,nvir_id,nvir_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root,nvir_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z95_1,"Z95_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z95_1,'ZERO')
!   original expression: Z95_1(e1be2be3b|m1bm2b,d1b)+=S45(e1be2be3b|m1b,l1bl2b)*H25(l1bl2b|m2b,d1b)
    ierr=exatns_tensor_contract("Z95_1(e1,e2,e3,m1,m2,d1)+=S45(e1,e2,e3,m1,l1,l2)*H25(l1,l2,m2,d1)", &
        Z95_1,S45,H25,prefactor=(0.5d0,0.0d0))
!   original expression: Z95_1(e1be2be3b|m1bm2b,d1b)+=S45(e1be2be3b|m2b,l1bl2b)*H25(l1bl2b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z95_1(e1,e2,e3,m1,m2,d1)+=S45(e1,e2,e3,m2,l1,l2)*H25(l1,l2,m1,d1)", &
        Z95_1,S45,H25,prefactor=(-0.5d0,0.0d0))
    ierr=exatns_tensor_destroy(Z95_1)
    
    allocate(tens_id(6), tens_root(6))
    tens_id   = (/nvir_id,nvir_id,nvir_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root,nvir_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z95_1,"Z95_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z95_1,'ZERO')
!   original expression: Z95_1(e1be2be3b|m1bm2b,d1b)+=S45(e1be2b,d2b|m1bm2b,l1b)*H17(e3b,l1b|d1b,d2b)
    ierr=exatns_tensor_contract("Z95_1(e1,e2,e3,m1,m2,d1)+=S45(e1,e2,d2,m1,m2,l1)*H17(e3,l1,d1,d2)", &
        Z95_1,S45,H17,prefactor=(1.0d0,0.0d0))
!   original expression: Z95_1(e1be2be3b|m1bm2b,d1b)+=S45(e1be3b,d2b|m1bm2b,l1b)*H17(e2b,l1b|d1b,d2b)*-1.
    ierr=exatns_tensor_contract("Z95_1(e1,e2,e3,m1,m2,d1)+=S45(e1,e3,d2,m1,m2,l1)*H17(e2,l1,d1,d2)", &
        Z95_1,S45,H17,prefactor=(-1.0d0,0.0d0))
!   original expression: Z95_1(e1be2be3b|m1bm2b,d1b)+=S45(e2be3b,d2b|m1bm2b,l1b)*H17(e1b,l1b|d1b,d2b)
    ierr=exatns_tensor_contract("Z95_1(e1,e2,e3,m1,m2,d1)+=S45(e2,e3,d2,m1,m2,l1)*H17(e1,l1,d1,d2)", &
        Z95_1,S45,H17,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z95_1)
    
    allocate(tens_id(6), tens_root(6))
    tens_id   = (/nvir_id,nvir_id,nvir_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root,nvir_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z95_1,"Z95_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z95_1,'ZERO')
    ierr=exatns_tensor_destroy(Z95_1)
    
    allocate(tens_id(6), tens_root(6))
    tens_id   = (/nvir_id,nvir_id,nvir_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root,nvir_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z95_1,"Z95_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z95_1,'ZERO')
!   original expression: Z95_1(e1be2be3b|m1bm2b,d1b)+=S46(e1be2be3b,d2b|m1bm2b,l1bl2b)*H24(l1bl2b|d1b,d2b)*-1.
    ierr=exatns_tensor_contract("Z95_1(e1,e2,e3,m1,m2,d1)+=S46(e1,e2,e3,d2,m1,m2,l1,l2)*H24(l1,l2,d1,d2)", &
        Z95_1,S46,H24,prefactor=(-0.5d0,0.0d0))
    ierr=exatns_tensor_destroy(Z95_1)
    
    allocate(tens_id(6), tens_root(6))
    tens_id   = (/nvir_id,nvir_id,nvir_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root,nvir_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z95_1,"Z95_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z95_1,'ZERO')
    ierr=exatns_tensor_destroy(Z95_1)
    
    allocate(tens_id(6), tens_root(6))
    tens_id   = (/nvir_id,nvir_id,nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nvir_root,nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z86_1,"Z86_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z86_1,'ZERO')
!   original expression: Z86_1(e1be2b,l1b|m1bm2bm3b)+=H18(e1b,l1b|m1b,d1b)*S44(e2b,d1b|m2bm3b)*-1.
    ierr=exatns_tensor_contract("Z86_1(e1,e2,l1,m1,m2,m3)+=H18(e1,l1,m1,d1)*S44(e2,d1,m2,m3)", &
        Z86_1,H18,S44,prefactor=(-1.0d0,0.0d0))
!   original expression: Z86_1(e1be2b,l1b|m1bm2bm3b)+=H18(e2b,l1b|m1b,d1b)*S44(e1b,d1b|m2bm3b)
    ierr=exatns_tensor_contract("Z86_1(e1,e2,l1,m1,m2,m3)+=H18(e2,l1,m1,d1)*S44(e1,d1,m2,m3)", &
        Z86_1,H18,S44,prefactor=(1.0d0,0.0d0))
!   original expression: Z86_1(e1be2b,l1b|m1bm2bm3b)+=H18(e1b,l1b|m2b,d1b)*S44(e2b,d1b|m1bm3b)
    ierr=exatns_tensor_contract("Z86_1(e1,e2,l1,m1,m2,m3)+=H18(e1,l1,m2,d1)*S44(e2,d1,m1,m3)", &
        Z86_1,H18,S44,prefactor=(1.0d0,0.0d0))
!   original expression: Z86_1(e1be2b,l1b|m1bm2bm3b)+=H18(e2b,l1b|m2b,d1b)*S44(e1b,d1b|m1bm3b)*-1.
    ierr=exatns_tensor_contract("Z86_1(e1,e2,l1,m1,m2,m3)+=H18(e2,l1,m2,d1)*S44(e1,d1,m1,m3)", &
        Z86_1,H18,S44,prefactor=(-1.0d0,0.0d0))
!   original expression: Z86_1(e1be2b,l1b|m1bm2bm3b)+=H18(e1b,l1b|m3b,d1b)*S44(e2b,d1b|m1bm2b)*-1.
    ierr=exatns_tensor_contract("Z86_1(e1,e2,l1,m1,m2,m3)+=H18(e1,l1,m3,d1)*S44(e2,d1,m1,m2)", &
        Z86_1,H18,S44,prefactor=(-1.0d0,0.0d0))
!   original expression: Z86_1(e1be2b,l1b|m1bm2bm3b)+=H18(e2b,l1b|m3b,d1b)*S44(e1b,d1b|m1bm2b)
    ierr=exatns_tensor_contract("Z86_1(e1,e2,l1,m1,m2,m3)+=H18(e2,l1,m3,d1)*S44(e1,d1,m1,m2)", &
        Z86_1,H18,S44,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z86_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z165_3,"Z165_3",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z165_3,'ZERO')
!   original expression: Z165_3(l1b,l2b|m1b,d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|m1b)
    ierr=exatns_tensor_contract("Z165_3(l1,l2,m1,d1)+=H24(l1,l2,d1,d2)*S43(d2,m1)", &
        Z165_3,H24,S43,prefactor=(1.0d0,0.0d0))
    
    allocate(tens_id(6), tens_root(6))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z134_2,"Z134_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z134_2,'ZERO')
!   original expression: Z134_2(e1b,l1b,l2b|m1bm2bm3b)+=S44(e1b,d1b|m1bm2b)*Z165_3(l1b,l2b|m3b,d1b)
    ierr=exatns_tensor_contract("Z134_2(e1,l1,l2,m1,m2,m3)+=S44(e1,d1,m1,m2)*Z165_3(l1,l2,m3,d1)", &
        Z134_2,S44,Z165_3,prefactor=(1.0d0,0.0d0))
!   original expression: Z134_2(e1b,l1b,l2b|m1bm2bm3b)+=S44(e1b,d1b|m1bm3b)*Z165_3(l1b,l2b|m2b,d1b)*-1.
    ierr=exatns_tensor_contract("Z134_2(e1,l1,l2,m1,m2,m3)+=S44(e1,d1,m1,m3)*Z165_3(l1,l2,m2,d1)", &
        Z134_2,S44,Z165_3,prefactor=(-1.0d0,0.0d0))
!   original expression: Z134_2(e1b,l1b,l2b|m1bm2bm3b)+=S44(e1b,d1b|m2bm3b)*Z165_3(l1b,l2b|m1b,d1b)
    ierr=exatns_tensor_contract("Z134_2(e1,l1,l2,m1,m2,m3)+=S44(e1,d1,m2,m3)*Z165_3(l1,l2,m1,d1)", &
        Z134_2,S44,Z165_3,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z165_3)
    
    allocate(tens_id(6), tens_root(6))
    tens_id   = (/nvir_id,nvir_id,nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nvir_root,nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z86_1,"Z86_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z86_1,'ZERO')
!   original expression: Z86_1(e1be2b,l1b|m1bm2bm3b)+=S43(e1b|l2b)*Z134_2(e2b,l1b,l2b|m1bm2bm3b)
    ierr=exatns_tensor_contract("Z86_1(e1,e2,l1,m1,m2,m3)+=S43(e1,l2)*Z134_2(e2,l1,l2,m1,m2,m3)", &
        Z86_1,S43,Z134_2,prefactor=(1.0d0,0.0d0))
!   original expression: Z86_1(e1be2b,l1b|m1bm2bm3b)+=S43(e2b|l2b)*Z134_2(e1b,l1b,l2b|m1bm2bm3b)*-1.
    ierr=exatns_tensor_contract("Z86_1(e1,e2,l1,m1,m2,m3)+=S43(e2,l2)*Z134_2(e1,l1,l2,m1,m2,m3)", &
        Z86_1,S43,Z134_2,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z134_2)
    ierr=exatns_tensor_destroy(Z86_1)
    
    allocate(tens_id(6), tens_root(6))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z134_2,"Z134_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z134_2,'ZERO')
!   original expression: Z134_2(e1b,l1b,l2b|m1bm2bm3b)+=S44(e1b,d1b|m1bm2b)*H25(l1b,l2b|m3b,d1b)*-1.
    ierr=exatns_tensor_contract("Z134_2(e1,l1,l2,m1,m2,m3)+=S44(e1,d1,m1,m2)*H25(l1,l2,m3,d1)", &
        Z134_2,S44,H25,prefactor=(-1.0d0,0.0d0))
!   original expression: Z134_2(e1b,l1b,l2b|m1bm2bm3b)+=S44(e1b,d1b|m1bm3b)*H25(l1b,l2b|m2b,d1b)
    ierr=exatns_tensor_contract("Z134_2(e1,l1,l2,m1,m2,m3)+=S44(e1,d1,m1,m3)*H25(l1,l2,m2,d1)", &
        Z134_2,S44,H25,prefactor=(1.0d0,0.0d0))
!   original expression: Z134_2(e1b,l1b,l2b|m1bm2bm3b)+=S44(e1b,d1b|m2bm3b)*H25(l1b,l2b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z134_2(e1,l1,l2,m1,m2,m3)+=S44(e1,d1,m2,m3)*H25(l1,l2,m1,d1)", &
        Z134_2,S44,H25,prefactor=(-1.0d0,0.0d0))
    
    allocate(tens_id(6), tens_root(6))
    tens_id   = (/nvir_id,nvir_id,nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nvir_root,nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z86_1,"Z86_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z86_1,'ZERO')
!   original expression: Z86_1(e1be2b,l1b|m1bm2bm3b)+=S43(e1b|l2b)*Z134_2(e2b,l1b,l2b|m1bm2bm3b)
    ierr=exatns_tensor_contract("Z86_1(e1,e2,l1,m1,m2,m3)+=S43(e1,l2)*Z134_2(e2,l1,l2,m1,m2,m3)", &
        Z86_1,S43,Z134_2,prefactor=(1.0d0,0.0d0))
!   original expression: Z86_1(e1be2b,l1b|m1bm2bm3b)+=S43(e2b|l2b)*Z134_2(e1b,l1b,l2b|m1bm2bm3b)*-1.
    ierr=exatns_tensor_contract("Z86_1(e1,e2,l1,m1,m2,m3)+=S43(e2,l2)*Z134_2(e1,l1,l2,m1,m2,m3)", &
        Z86_1,S43,Z134_2,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z134_2)
    ierr=exatns_tensor_destroy(Z86_1)
    
    allocate(tens_id(6), tens_root(6))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z134_2,"Z134_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z134_2,'ZERO')
!   original expression: Z134_2(e1b,l1b,l2b|m1bm2bm3b)+=S45(e1b,d1bd2b|m1bm2bm3b)*H24(l1b,l2b|d1bd2b)
    ierr=exatns_tensor_contract("Z134_2(e1,l1,l2,m1,m2,m3)+=S45(e1,d1,d2,m1,m2,m3)*H24(l1,l2,d1,d2)", &
        Z134_2,S45,H24,prefactor=(0.5d0,0.0d0))
    
    allocate(tens_id(6), tens_root(6))
    tens_id   = (/nvir_id,nvir_id,nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nvir_root,nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z86_1,"Z86_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z86_1,'ZERO')
!   original expression: Z86_1(e1be2b,l1b|m1bm2bm3b)+=S43(e1b|l2b)*Z134_2(e2b,l1b,l2b|m1bm2bm3b)
    ierr=exatns_tensor_contract("Z86_1(e1,e2,l1,m1,m2,m3)+=S43(e1,l2)*Z134_2(e2,l1,l2,m1,m2,m3)", &
        Z86_1,S43,Z134_2,prefactor=(1.0d0,0.0d0))
!   original expression: Z86_1(e1be2b,l1b|m1bm2bm3b)+=S43(e2b|l2b)*Z134_2(e1b,l1b,l2b|m1bm2bm3b)*-1.
    ierr=exatns_tensor_contract("Z86_1(e1,e2,l1,m1,m2,m3)+=S43(e2,l2)*Z134_2(e1,l1,l2,m1,m2,m3)", &
        Z86_1,S43,Z134_2,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z134_2)
    ierr=exatns_tensor_destroy(Z86_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z136_2,"Z136_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z136_2,'ZERO')
!   original expression: Z136_2(e1b,l1b|m1b,d1b)+=H17(e1b,l1b|d1b,d2b)*S43(d2b|m1b)*-1.
    ierr=exatns_tensor_contract("Z136_2(e1,l1,m1,d1)+=H17(e1,l1,d1,d2)*S43(d2,m1)", &
        Z136_2,H17,S43,prefactor=(-1.0d0,0.0d0))
    
    allocate(tens_id(6), tens_root(6))
    tens_id   = (/nvir_id,nvir_id,nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nvir_root,nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z86_1,"Z86_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z86_1,'ZERO')
!   original expression: Z86_1(e1be2b,l1b|m1bm2bm3b)+=S44(e1b,d1b|m1bm2b)*Z136_2(e2b,l1b|m3b,d1b)
    ierr=exatns_tensor_contract("Z86_1(e1,e2,l1,m1,m2,m3)+=S44(e1,d1,m1,m2)*Z136_2(e2,l1,m3,d1)", &
        Z86_1,S44,Z136_2,prefactor=(1.0d0,0.0d0))
!   original expression: Z86_1(e1be2b,l1b|m1bm2bm3b)+=S44(e2b,d1b|m1bm2b)*Z136_2(e1b,l1b|m3b,d1b)*-1.
    ierr=exatns_tensor_contract("Z86_1(e1,e2,l1,m1,m2,m3)+=S44(e2,d1,m1,m2)*Z136_2(e1,l1,m3,d1)", &
        Z86_1,S44,Z136_2,prefactor=(-1.0d0,0.0d0))
!   original expression: Z86_1(e1be2b,l1b|m1bm2bm3b)+=S44(e1b,d1b|m1bm3b)*Z136_2(e2b,l1b|m2b,d1b)*-1.
    ierr=exatns_tensor_contract("Z86_1(e1,e2,l1,m1,m2,m3)+=S44(e1,d1,m1,m3)*Z136_2(e2,l1,m2,d1)", &
        Z86_1,S44,Z136_2,prefactor=(-1.0d0,0.0d0))
!   original expression: Z86_1(e1be2b,l1b|m1bm2bm3b)+=S44(e2b,d1b|m1bm3b)*Z136_2(e1b,l1b|m2b,d1b)
    ierr=exatns_tensor_contract("Z86_1(e1,e2,l1,m1,m2,m3)+=S44(e2,d1,m1,m3)*Z136_2(e1,l1,m2,d1)", &
        Z86_1,S44,Z136_2,prefactor=(1.0d0,0.0d0))
!   original expression: Z86_1(e1be2b,l1b|m1bm2bm3b)+=S44(e1b,d1b|m2bm3b)*Z136_2(e2b,l1b|m1b,d1b)
    ierr=exatns_tensor_contract("Z86_1(e1,e2,l1,m1,m2,m3)+=S44(e1,d1,m2,m3)*Z136_2(e2,l1,m1,d1)", &
        Z86_1,S44,Z136_2,prefactor=(1.0d0,0.0d0))
!   original expression: Z86_1(e1be2b,l1b|m1bm2bm3b)+=S44(e2b,d1b|m2bm3b)*Z136_2(e1b,l1b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z86_1(e1,e2,l1,m1,m2,m3)+=S44(e2,d1,m2,m3)*Z136_2(e1,l1,m1,d1)", &
        Z86_1,S44,Z136_2,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z136_2)
    ierr=exatns_tensor_destroy(Z86_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z136_2,"Z136_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z136_2,'ZERO')
!   original expression: Z136_2(e1b,l1b|m1b,d1b)+=S44(e1b,d2b|m1b,l2b)*H24(l1b,l2b|d1b,d2b)
    ierr=exatns_tensor_contract("Z136_2(e1,l1,m1,d1)+=S44(e1,d2,m1,l2)*H24(l1,l2,d1,d2)", &
        Z136_2,S44,H24,prefactor=(1.0d0,0.0d0))
    
    allocate(tens_id(6), tens_root(6))
    tens_id   = (/nvir_id,nvir_id,nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nvir_root,nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z86_1,"Z86_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z86_1,'ZERO')
!   original expression: Z86_1(e1be2b,l1b|m1bm2bm3b)+=S44(e1b,d1b|m1bm2b)*Z136_2(e2b,l1b|m3b,d1b)
    ierr=exatns_tensor_contract("Z86_1(e1,e2,l1,m1,m2,m3)+=S44(e1,d1,m1,m2)*Z136_2(e2,l1,m3,d1)", &
        Z86_1,S44,Z136_2,prefactor=(1.0d0,0.0d0))
!   original expression: Z86_1(e1be2b,l1b|m1bm2bm3b)+=S44(e2b,d1b|m1bm2b)*Z136_2(e1b,l1b|m3b,d1b)*-1.
    ierr=exatns_tensor_contract("Z86_1(e1,e2,l1,m1,m2,m3)+=S44(e2,d1,m1,m2)*Z136_2(e1,l1,m3,d1)", &
        Z86_1,S44,Z136_2,prefactor=(-1.0d0,0.0d0))
!   original expression: Z86_1(e1be2b,l1b|m1bm2bm3b)+=S44(e1b,d1b|m1bm3b)*Z136_2(e2b,l1b|m2b,d1b)*-1.
    ierr=exatns_tensor_contract("Z86_1(e1,e2,l1,m1,m2,m3)+=S44(e1,d1,m1,m3)*Z136_2(e2,l1,m2,d1)", &
        Z86_1,S44,Z136_2,prefactor=(-1.0d0,0.0d0))
!   original expression: Z86_1(e1be2b,l1b|m1bm2bm3b)+=S44(e2b,d1b|m1bm3b)*Z136_2(e1b,l1b|m2b,d1b)
    ierr=exatns_tensor_contract("Z86_1(e1,e2,l1,m1,m2,m3)+=S44(e2,d1,m1,m3)*Z136_2(e1,l1,m2,d1)", &
        Z86_1,S44,Z136_2,prefactor=(1.0d0,0.0d0))
!   original expression: Z86_1(e1be2b,l1b|m1bm2bm3b)+=S44(e1b,d1b|m2bm3b)*Z136_2(e2b,l1b|m1b,d1b)
    ierr=exatns_tensor_contract("Z86_1(e1,e2,l1,m1,m2,m3)+=S44(e1,d1,m2,m3)*Z136_2(e2,l1,m1,d1)", &
        Z86_1,S44,Z136_2,prefactor=(1.0d0,0.0d0))
!   original expression: Z86_1(e1be2b,l1b|m1bm2bm3b)+=S44(e2b,d1b|m2bm3b)*Z136_2(e1b,l1b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z86_1(e1,e2,l1,m1,m2,m3)+=S44(e2,d1,m2,m3)*Z136_2(e1,l1,m1,d1)", &
        Z86_1,S44,Z136_2,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z136_2)
    ierr=exatns_tensor_destroy(Z86_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z136_2,"Z136_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z136_2,'ZERO')
    
    allocate(tens_id(6), tens_root(6))
    tens_id   = (/nvir_id,nvir_id,nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nvir_root,nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z86_1,"Z86_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z86_1,'ZERO')
!   original expression: Z86_1(e1be2b,l1b|m1bm2bm3b)+=S44(e1b,d1b|m1bm2b)*Z136_2(e2b,l1b|m3b,d1b)
    ierr=exatns_tensor_contract("Z86_1(e1,e2,l1,m1,m2,m3)+=S44(e1,d1,m1,m2)*Z136_2(e2,l1,m3,d1)", &
        Z86_1,S44,Z136_2,prefactor=(1.0d0,0.0d0))
!   original expression: Z86_1(e1be2b,l1b|m1bm2bm3b)+=S44(e2b,d1b|m1bm2b)*Z136_2(e1b,l1b|m3b,d1b)*-1.
    ierr=exatns_tensor_contract("Z86_1(e1,e2,l1,m1,m2,m3)+=S44(e2,d1,m1,m2)*Z136_2(e1,l1,m3,d1)", &
        Z86_1,S44,Z136_2,prefactor=(-1.0d0,0.0d0))
!   original expression: Z86_1(e1be2b,l1b|m1bm2bm3b)+=S44(e1b,d1b|m1bm3b)*Z136_2(e2b,l1b|m2b,d1b)*-1.
    ierr=exatns_tensor_contract("Z86_1(e1,e2,l1,m1,m2,m3)+=S44(e1,d1,m1,m3)*Z136_2(e2,l1,m2,d1)", &
        Z86_1,S44,Z136_2,prefactor=(-1.0d0,0.0d0))
!   original expression: Z86_1(e1be2b,l1b|m1bm2bm3b)+=S44(e2b,d1b|m1bm3b)*Z136_2(e1b,l1b|m2b,d1b)
    ierr=exatns_tensor_contract("Z86_1(e1,e2,l1,m1,m2,m3)+=S44(e2,d1,m1,m3)*Z136_2(e1,l1,m2,d1)", &
        Z86_1,S44,Z136_2,prefactor=(1.0d0,0.0d0))
!   original expression: Z86_1(e1be2b,l1b|m1bm2bm3b)+=S44(e1b,d1b|m2bm3b)*Z136_2(e2b,l1b|m1b,d1b)
    ierr=exatns_tensor_contract("Z86_1(e1,e2,l1,m1,m2,m3)+=S44(e1,d1,m2,m3)*Z136_2(e2,l1,m1,d1)", &
        Z86_1,S44,Z136_2,prefactor=(1.0d0,0.0d0))
!   original expression: Z86_1(e1be2b,l1b|m1bm2bm3b)+=S44(e2b,d1b|m2bm3b)*Z136_2(e1b,l1b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z86_1(e1,e2,l1,m1,m2,m3)+=S44(e2,d1,m2,m3)*Z136_2(e1,l1,m1,d1)", &
        Z86_1,S44,Z136_2,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z136_2)
    ierr=exatns_tensor_destroy(Z86_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z127_2,"Z127_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z127_2,'ZERO')
!   original expression: Z127_2(l1b,l2b|m1bm2b)+=H24(l1b,l2b|d1bd2b)*S44(d1bd2b|m1bm2b)*-1.
    ierr=exatns_tensor_contract("Z127_2(l1,l2,m1,m2)+=H24(l1,l2,d1,d2)*S44(d1,d2,m1,m2)", &
        Z127_2,H24,S44,prefactor=(-0.5d0,0.0d0))
    
    allocate(tens_id(6), tens_root(6))
    tens_id   = (/nvir_id,nvir_id,nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nvir_root,nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z86_1,"Z86_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z86_1,'ZERO')
!   original expression: Z86_1(e1be2b,l1b|m1bm2bm3b)+=S44(e1be2b|m1b,l2b)*Z127_2(l1b,l2b|m2bm3b)
    ierr=exatns_tensor_contract("Z86_1(e1,e2,l1,m1,m2,m3)+=S44(e1,e2,m1,l2)*Z127_2(l1,l2,m2,m3)", &
        Z86_1,S44,Z127_2,prefactor=(1.0d0,0.0d0))
!   original expression: Z86_1(e1be2b,l1b|m1bm2bm3b)+=S44(e1be2b|m2b,l2b)*Z127_2(l1b,l2b|m1bm3b)*-1.
    ierr=exatns_tensor_contract("Z86_1(e1,e2,l1,m1,m2,m3)+=S44(e1,e2,m2,l2)*Z127_2(l1,l2,m1,m3)", &
        Z86_1,S44,Z127_2,prefactor=(-1.0d0,0.0d0))
!   original expression: Z86_1(e1be2b,l1b|m1bm2bm3b)+=S44(e1be2b|m3b,l2b)*Z127_2(l1b,l2b|m1bm2b)
    ierr=exatns_tensor_contract("Z86_1(e1,e2,l1,m1,m2,m3)+=S44(e1,e2,m3,l2)*Z127_2(l1,l2,m1,m2)", &
        Z86_1,S44,Z127_2,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z127_2)
    ierr=exatns_tensor_destroy(Z86_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z127_2,"Z127_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z127_2,'ZERO')
!   original expression: Z127_2(l1b,l2b|m1bm2b)+=H25(l1b,l2b|m1b,d1b)*S43(d1b|m2b)*-1.
    ierr=exatns_tensor_contract("Z127_2(l1,l2,m1,m2)+=H25(l1,l2,m1,d1)*S43(d1,m2)", &
        Z127_2,H25,S43,prefactor=(-1.0d0,0.0d0))
!   original expression: Z127_2(l1b,l2b|m1bm2b)+=H25(l1b,l2b|m2b,d1b)*S43(d1b|m1b)
    ierr=exatns_tensor_contract("Z127_2(l1,l2,m1,m2)+=H25(l1,l2,m2,d1)*S43(d1,m1)", &
        Z127_2,H25,S43,prefactor=(1.0d0,0.0d0))
    
    allocate(tens_id(6), tens_root(6))
    tens_id   = (/nvir_id,nvir_id,nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nvir_root,nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z86_1,"Z86_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z86_1,'ZERO')
!   original expression: Z86_1(e1be2b,l1b|m1bm2bm3b)+=S44(e1be2b|m1b,l2b)*Z127_2(l1b,l2b|m2bm3b)
    ierr=exatns_tensor_contract("Z86_1(e1,e2,l1,m1,m2,m3)+=S44(e1,e2,m1,l2)*Z127_2(l1,l2,m2,m3)", &
        Z86_1,S44,Z127_2,prefactor=(1.0d0,0.0d0))
!   original expression: Z86_1(e1be2b,l1b|m1bm2bm3b)+=S44(e1be2b|m2b,l2b)*Z127_2(l1b,l2b|m1bm3b)*-1.
    ierr=exatns_tensor_contract("Z86_1(e1,e2,l1,m1,m2,m3)+=S44(e1,e2,m2,l2)*Z127_2(l1,l2,m1,m3)", &
        Z86_1,S44,Z127_2,prefactor=(-1.0d0,0.0d0))
!   original expression: Z86_1(e1be2b,l1b|m1bm2bm3b)+=S44(e1be2b|m3b,l2b)*Z127_2(l1b,l2b|m1bm2b)
    ierr=exatns_tensor_contract("Z86_1(e1,e2,l1,m1,m2,m3)+=S44(e1,e2,m3,l2)*Z127_2(l1,l2,m1,m2)", &
        Z86_1,S44,Z127_2,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z127_2)
    ierr=exatns_tensor_destroy(Z86_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z165_3,"Z165_3",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z165_3,'ZERO')
!   original expression: Z165_3(l1b,l2b|m1b,d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|m1b)*-0.5
    ierr=exatns_tensor_contract("Z165_3(l1,l2,m1,d1)+=H24(l1,l2,d1,d2)*S43(d2,m1)", &
        Z165_3,H24,S43,prefactor=(-0.5d0,0.0d0))
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z127_2,"Z127_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z127_2,'ZERO')
!   original expression: Z127_2(l1b,l2b|m1bm2b)+=S43(d1b|m1b)*Z165_3(l1b,l2b|m2b,d1b)
    ierr=exatns_tensor_contract("Z127_2(l1,l2,m1,m2)+=S43(d1,m1)*Z165_3(l1,l2,m2,d1)", &
        Z127_2,S43,Z165_3,prefactor=(1.0d0,0.0d0))
!   original expression: Z127_2(l1b,l2b|m1bm2b)+=S43(d1b|m2b)*Z165_3(l1b,l2b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z127_2(l1,l2,m1,m2)+=S43(d1,m2)*Z165_3(l1,l2,m1,d1)", &
        Z127_2,S43,Z165_3,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z165_3)
    
    allocate(tens_id(6), tens_root(6))
    tens_id   = (/nvir_id,nvir_id,nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nvir_root,nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z86_1,"Z86_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z86_1,'ZERO')
!   original expression: Z86_1(e1be2b,l1b|m1bm2bm3b)+=S44(e1be2b|m1b,l2b)*Z127_2(l1b,l2b|m2bm3b)
    ierr=exatns_tensor_contract("Z86_1(e1,e2,l1,m1,m2,m3)+=S44(e1,e2,m1,l2)*Z127_2(l1,l2,m2,m3)", &
        Z86_1,S44,Z127_2,prefactor=(1.0d0,0.0d0))
!   original expression: Z86_1(e1be2b,l1b|m1bm2bm3b)+=S44(e1be2b|m2b,l2b)*Z127_2(l1b,l2b|m1bm3b)*-1.
    ierr=exatns_tensor_contract("Z86_1(e1,e2,l1,m1,m2,m3)+=S44(e1,e2,m2,l2)*Z127_2(l1,l2,m1,m3)", &
        Z86_1,S44,Z127_2,prefactor=(-1.0d0,0.0d0))
!   original expression: Z86_1(e1be2b,l1b|m1bm2bm3b)+=S44(e1be2b|m3b,l2b)*Z127_2(l1b,l2b|m1bm2b)
    ierr=exatns_tensor_contract("Z86_1(e1,e2,l1,m1,m2,m3)+=S44(e1,e2,m3,l2)*Z127_2(l1,l2,m1,m2)", &
        Z86_1,S44,Z127_2,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z127_2)
    ierr=exatns_tensor_destroy(Z86_1)
    
    allocate(tens_id(6), tens_root(6))
    tens_id   = (/nvir_id,nvir_id,nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nvir_root,nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z86_1,"Z86_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z86_1,'ZERO')
!   original expression: Z86_1(e1be2b,l1b|m1bm2bm3b)+=S44(e1be2b|m1b,l2b)*H26(l1b,l2b|m2bm3b)*-1.
    ierr=exatns_tensor_contract("Z86_1(e1,e2,l1,m1,m2,m3)+=S44(e1,e2,m1,l2)*H26(l1,l2,m2,m3)", &
        Z86_1,S44,H26,prefactor=(-1.0d0,0.0d0))
!   original expression: Z86_1(e1be2b,l1b|m1bm2bm3b)+=S44(e1be2b|m2b,l2b)*H26(l1b,l2b|m1bm3b)
    ierr=exatns_tensor_contract("Z86_1(e1,e2,l1,m1,m2,m3)+=S44(e1,e2,m2,l2)*H26(l1,l2,m1,m3)", &
        Z86_1,S44,H26,prefactor=(1.0d0,0.0d0))
!   original expression: Z86_1(e1be2b,l1b|m1bm2bm3b)+=S44(e1be2b|m3b,l2b)*H26(l1b,l2b|m1bm2b)*-1.
    ierr=exatns_tensor_contract("Z86_1(e1,e2,l1,m1,m2,m3)+=S44(e1,e2,m3,l2)*H26(l1,l2,m1,m2)", &
        Z86_1,S44,H26,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z86_1)
    
    allocate(tens_id(6), tens_root(6))
    tens_id   = (/nvir_id,nvir_id,nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nvir_root,nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z86_1,"Z86_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z86_1,'ZERO')
!   original expression: Z86_1(e1be2b,l1b|m1bm2bm3b)+=S45(e1b,d1bd2b|m1bm2bm3b)*H17(e2b,l1b|d1bd2b)*-1.
    ierr=exatns_tensor_contract("Z86_1(e1,e2,l1,m1,m2,m3)+=S45(e1,d1,d2,m1,m2,m3)*H17(e2,l1,d1,d2)", &
        Z86_1,S45,H17,prefactor=(-0.5d0,0.0d0))
!   original expression: Z86_1(e1be2b,l1b|m1bm2bm3b)+=S45(e2b,d1bd2b|m1bm2bm3b)*H17(e1b,l1b|d1bd2b)
    ierr=exatns_tensor_contract("Z86_1(e1,e2,l1,m1,m2,m3)+=S45(e2,d1,d2,m1,m2,m3)*H17(e1,l1,d1,d2)", &
        Z86_1,S45,H17,prefactor=(0.5d0,0.0d0))
    ierr=exatns_tensor_destroy(Z86_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nvir_id/)
    tens_root = (/nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z75_2,"Z75_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z75_2,'ZERO')
!   original expression: Z75_2(l1b|d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|l2b)*-1.
    ierr=exatns_tensor_contract("Z75_2(l1,d1)+=H24(l1,l2,d1,d2)*S43(d2,l2)", &
        Z75_2,H24,S43,prefactor=(-1.0d0,0.0d0))
    
    allocate(tens_id(6), tens_root(6))
    tens_id   = (/nvir_id,nvir_id,nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nvir_root,nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z86_1,"Z86_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z86_1,'ZERO')
!   original expression: Z86_1(e1be2b,l1b|m1bm2bm3b)+=S45(e1be2b,d1b|m1bm2bm3b)*Z75_2(l1b|d1b)
    ierr=exatns_tensor_contract("Z86_1(e1,e2,l1,m1,m2,m3)+=S45(e1,e2,d1,m1,m2,m3)*Z75_2(l1,d1)", &
        Z86_1,S45,Z75_2,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z75_2)
    ierr=exatns_tensor_destroy(Z86_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nvir_id/)
    tens_root = (/nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z75_2,"Z75_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z75_2,'ZERO')
    
    allocate(tens_id(6), tens_root(6))
    tens_id   = (/nvir_id,nvir_id,nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nvir_root,nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z86_1,"Z86_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z86_1,'ZERO')
!   original expression: Z86_1(e1be2b,l1b|m1bm2bm3b)+=S45(e1be2b,d1b|m1bm2bm3b)*Z75_2(l1b|d1b)
    ierr=exatns_tensor_contract("Z86_1(e1,e2,l1,m1,m2,m3)+=S45(e1,e2,d1,m1,m2,m3)*Z75_2(l1,d1)", &
        Z86_1,S45,Z75_2,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z75_2)
    ierr=exatns_tensor_destroy(Z86_1)
    
    allocate(tens_id(6), tens_root(6))
    tens_id   = (/nvir_id,nvir_id,nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nvir_root,nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z86_1,"Z86_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z86_1,'ZERO')
!   original expression: Z86_1(e1be2b,l1b|m1bm2bm3b)+=S45(e1be2b,d1b|m1bm2bm3b)*H15(l1b|d1b)*-1.
    ierr=exatns_tensor_contract("Z86_1(e1,e2,l1,m1,m2,m3)+=S45(e1,e2,d1,m1,m2,m3)*H15(l1,d1)", &
        Z86_1,S45,H15,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z86_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z165_2,"Z165_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z165_2,'ZERO')
!   original expression: Z165_2(l1b,l2b|m1b,d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|m1b)
    ierr=exatns_tensor_contract("Z165_2(l1,l2,m1,d1)+=H24(l1,l2,d1,d2)*S43(d2,m1)", &
        Z165_2,H24,S43,prefactor=(1.0d0,0.0d0))
    
    allocate(tens_id(6), tens_root(6))
    tens_id   = (/nvir_id,nvir_id,nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nvir_root,nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z86_1,"Z86_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z86_1,'ZERO')
!   original expression: Z86_1(e1be2b,l1b|m1bm2bm3b)+=S45(e1be2b,d1b|m1bm2b,l2b)*Z165_2(l1b,l2b|m3b,d1b)
    ierr=exatns_tensor_contract("Z86_1(e1,e2,l1,m1,m2,m3)+=S45(e1,e2,d1,m1,m2,l2)*Z165_2(l1,l2,m3,d1)", &
        Z86_1,S45,Z165_2,prefactor=(1.0d0,0.0d0))
!   original expression: Z86_1(e1be2b,l1b|m1bm2bm3b)+=S45(e1be2b,d1b|m1bm3b,l2b)*Z165_2(l1b,l2b|m2b,d1b)*-1.
    ierr=exatns_tensor_contract("Z86_1(e1,e2,l1,m1,m2,m3)+=S45(e1,e2,d1,m1,m3,l2)*Z165_2(l1,l2,m2,d1)", &
        Z86_1,S45,Z165_2,prefactor=(-1.0d0,0.0d0))
!   original expression: Z86_1(e1be2b,l1b|m1bm2bm3b)+=S45(e1be2b,d1b|m2bm3b,l2b)*Z165_2(l1b,l2b|m1b,d1b)
    ierr=exatns_tensor_contract("Z86_1(e1,e2,l1,m1,m2,m3)+=S45(e1,e2,d1,m2,m3,l2)*Z165_2(l1,l2,m1,d1)", &
        Z86_1,S45,Z165_2,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z165_2)
    ierr=exatns_tensor_destroy(Z86_1)
    
    allocate(tens_id(6), tens_root(6))
    tens_id   = (/nvir_id,nvir_id,nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nvir_root,nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z86_1,"Z86_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z86_1,'ZERO')
!   original expression: Z86_1(e1be2b,l1b|m1bm2bm3b)+=S45(e1be2b,d1b|m1bm2b,l2b)*H25(l1b,l2b|m3b,d1b)*-1.
    ierr=exatns_tensor_contract("Z86_1(e1,e2,l1,m1,m2,m3)+=S45(e1,e2,d1,m1,m2,l2)*H25(l1,l2,m3,d1)", &
        Z86_1,S45,H25,prefactor=(-1.0d0,0.0d0))
!   original expression: Z86_1(e1be2b,l1b|m1bm2bm3b)+=S45(e1be2b,d1b|m1bm3b,l2b)*H25(l1b,l2b|m2b,d1b)
    ierr=exatns_tensor_contract("Z86_1(e1,e2,l1,m1,m2,m3)+=S45(e1,e2,d1,m1,m3,l2)*H25(l1,l2,m2,d1)", &
        Z86_1,S45,H25,prefactor=(1.0d0,0.0d0))
!   original expression: Z86_1(e1be2b,l1b|m1bm2bm3b)+=S45(e1be2b,d1b|m2bm3b,l2b)*H25(l1b,l2b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z86_1(e1,e2,l1,m1,m2,m3)+=S45(e1,e2,d1,m2,m3,l2)*H25(l1,l2,m1,d1)", &
        Z86_1,S45,H25,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z86_1)
    
    allocate(tens_id(6), tens_root(6))
    tens_id   = (/nvir_id,nvir_id,nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nvir_root,nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z86_1,"Z86_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z86_1,'ZERO')
    ierr=exatns_tensor_destroy(Z86_1)
    
    allocate(tens_id(6), tens_root(6))
    tens_id   = (/nvir_id,nvir_id,nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nvir_root,nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z86_1,"Z86_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z86_1,'ZERO')
    ierr=exatns_tensor_destroy(Z86_1)
    
    allocate(tens_id(6), tens_root(6))
    tens_id   = (/nvir_id,nvir_id,nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nvir_root,nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z86_1,"Z86_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z86_1,'ZERO')
!   original expression: Z86_1(e1be2b,l1b|m1bm2bm3b)+=S46(e1be2b,d1bd2b|m1bm2bm3b,l2b)*H24(l1b,l2b|d1bd2b)*-1.
    ierr=exatns_tensor_contract("Z86_1(e1,e2,l1,m1,m2,m3)+=S46(e1,e2,d1,d2,m1,m2,m3,l2)*H24(l1,l2,d1,d2)", &
        Z86_1,S46,H24,prefactor=(-0.5d0,0.0d0))
    ierr=exatns_tensor_destroy(Z86_1)
    
    allocate(tens_id(6), tens_root(6))
    tens_id   = (/nvir_id,nvir_id,nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nvir_root,nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z86_1,"Z86_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z86_1,'ZERO')
    ierr=exatns_tensor_destroy(Z86_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nvir_id/)
    tens_root = (/nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z75_2,"Z75_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z75_2,'ZERO')
!   original expression: Z75_2(l1b|d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|l2b)*-1.
    ierr=exatns_tensor_contract("Z75_2(l1,d1)+=H24(l1,l2,d1,d2)*S43(d2,l2)", &
        Z75_2,H24,S43,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z75_2)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nvir_id/)
    tens_root = (/nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z75_2,"Z75_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z75_2,'ZERO')
    ierr=exatns_tensor_destroy(Z75_2)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z165_2,"Z165_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z165_2,'ZERO')
!   original expression: Z165_2(l1b,l2b|m1b,d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|m1b)
    ierr=exatns_tensor_contract("Z165_2(l1,l2,m1,d1)+=H24(l1,l2,d1,d2)*S43(d2,m1)", &
        Z165_2,H24,S43,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z165_2)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nvir_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z91_1,"Z91_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z91_1,'ZERO')
!   original expression: Z91_1(e1be2b|m1b,d1b)+=H3(e1be2b|d1b,d2b)*S43(d2b|m1b)
    ierr=exatns_tensor_contract("Z91_1(e1,e2,m1,d1)+=H3(e1,e2,d1,d2)*S43(d2,m1)", &
        Z91_1,H3,S43,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z91_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nvir_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z91_1,"Z91_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z91_1,'ZERO')
!   original expression: Z91_1(e1be2b|m1b,d1b)+=H17(e1b,l1b|d1b,d2b)*S44(e2b,d2b|m1b,l1b)
    ierr=exatns_tensor_contract("Z91_1(e1,e2,m1,d1)+=H17(e1,l1,d1,d2)*S44(e2,d2,m1,l1)", &
        Z91_1,H17,S44,prefactor=(1.0d0,0.0d0))
!   original expression: Z91_1(e1be2b|m1b,d1b)+=H17(e2b,l1b|d1b,d2b)*S44(e1b,d2b|m1b,l1b)*-1.
    ierr=exatns_tensor_contract("Z91_1(e1,e2,m1,d1)+=H17(e2,l1,d1,d2)*S44(e1,d2,m1,l1)", &
        Z91_1,H17,S44,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z91_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nvir_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z91_1,"Z91_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z91_1,'ZERO')
    ierr=exatns_tensor_destroy(Z91_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z129_2,"Z129_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z129_2,'ZERO')
!   original expression: Z129_2(l1bl2b|m1b,d1b)+=H24(l1bl2b|d1b,d2b)*S43(d2b|m1b)
    ierr=exatns_tensor_contract("Z129_2(l1,l2,m1,d1)+=H24(l1,l2,d1,d2)*S43(d2,m1)", &
        Z129_2,H24,S43,prefactor=(1.0d0,0.0d0))
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nvir_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z91_1,"Z91_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z91_1,'ZERO')
!   original expression: Z91_1(e1be2b|m1b,d1b)+=S44(e1be2b|l1bl2b)*Z129_2(l1bl2b|m1b,d1b)
    ierr=exatns_tensor_contract("Z91_1(e1,e2,m1,d1)+=S44(e1,e2,l1,l2)*Z129_2(l1,l2,m1,d1)", &
        Z91_1,S44,Z129_2,prefactor=(0.5d0,0.0d0))
    ierr=exatns_tensor_destroy(Z129_2)
    ierr=exatns_tensor_destroy(Z91_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nvir_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z91_1,"Z91_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z91_1,'ZERO')
!   original expression: Z91_1(e1be2b|m1b,d1b)+=S44(e1be2b|l1bl2b)*H25(l1bl2b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z91_1(e1,e2,m1,d1)+=S44(e1,e2,l1,l2)*H25(l1,l2,m1,d1)", &
        Z91_1,S44,H25,prefactor=(-0.5d0,0.0d0))
    ierr=exatns_tensor_destroy(Z91_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nvir_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z91_1,"Z91_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z91_1,'ZERO')
!   original expression: Z91_1(e1be2b|m1b,d1b)+=S45(e1be2b,d2b|m1b,l1bl2b)*H24(l1bl2b|d1b,d2b)
    ierr=exatns_tensor_contract("Z91_1(e1,e2,m1,d1)+=S45(e1,e2,d2,m1,l1,l2)*H24(l1,l2,d1,d2)", &
        Z91_1,S45,H24,prefactor=(0.5d0,0.0d0))
    ierr=exatns_tensor_destroy(Z91_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nvir_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z91_1,"Z91_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z91_1,'ZERO')
    ierr=exatns_tensor_destroy(Z91_1)
    
    allocate(tens_id(6), tens_root(6))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z82_1,"Z82_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z82_1,'ZERO')
!   original expression: Z82_1(e1b,l1bl2b|m1bm2bm3b)+=S45(e1b,d1bd2b|m1bm2bm3b)*H24(l1bl2b|d1bd2b)
    ierr=exatns_tensor_contract("Z82_1(e1,l1,l2,m1,m2,m3)+=S45(e1,d1,d2,m1,m2,m3)*H24(l1,l2,d1,d2)", &
        Z82_1,S45,H24,prefactor=(0.5d0,0.0d0))
    ierr=exatns_tensor_destroy(Z82_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z81_1,"Z81_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z81_1,'ZERO')
!   original expression: Z81_1(e1b,l1b|m1bm2b)+=H17(e1b,l1b|d1bd2b)*S44(d1bd2b|m1bm2b)
    ierr=exatns_tensor_contract("Z81_1(e1,l1,m1,m2)+=H17(e1,l1,d1,d2)*S44(d1,d2,m1,m2)", &
        Z81_1,H17,S44,prefactor=(0.5d0,0.0d0))
    ierr=exatns_tensor_destroy(Z81_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z81_1,"Z81_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z81_1,'ZERO')
!   original expression: Z81_1(e1b,l1b|m1bm2b)+=H26(l1b,l2b|m1bm2b)*S43(e1b|l2b)
    ierr=exatns_tensor_contract("Z81_1(e1,l1,m1,m2)+=H26(l1,l2,m1,m2)*S43(e1,l2)", &
        Z81_1,H26,S43,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z81_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z81_1,"Z81_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z81_1,'ZERO')
!   original expression: Z81_1(e1b,l1b|m1bm2b)+=H18(e1b,l1b|m1b,d1b)*S43(d1b|m2b)
    ierr=exatns_tensor_contract("Z81_1(e1,l1,m1,m2)+=H18(e1,l1,m1,d1)*S43(d1,m2)", &
        Z81_1,H18,S43,prefactor=(1.0d0,0.0d0))
!   original expression: Z81_1(e1b,l1b|m1bm2b)+=H18(e1b,l1b|m2b,d1b)*S43(d1b|m1b)*-1.
    ierr=exatns_tensor_contract("Z81_1(e1,l1,m1,m2)+=H18(e1,l1,m2,d1)*S43(d1,m1)", &
        Z81_1,H18,S43,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z81_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z127_2,"Z127_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z127_2,'ZERO')
!   original expression: Z127_2(l1b,l2b|m1bm2b)+=H24(l1b,l2b|d1bd2b)*S44(d1bd2b|m1bm2b)
    ierr=exatns_tensor_contract("Z127_2(l1,l2,m1,m2)+=H24(l1,l2,d1,d2)*S44(d1,d2,m1,m2)", &
        Z127_2,H24,S44,prefactor=(0.5d0,0.0d0))
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z81_1,"Z81_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z81_1,'ZERO')
!   original expression: Z81_1(e1b,l1b|m1bm2b)+=S43(e1b|l2b)*Z127_2(l1b,l2b|m1bm2b)
    ierr=exatns_tensor_contract("Z81_1(e1,l1,m1,m2)+=S43(e1,l2)*Z127_2(l1,l2,m1,m2)", &
        Z81_1,S43,Z127_2,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z127_2)
    ierr=exatns_tensor_destroy(Z81_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z127_2,"Z127_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z127_2,'ZERO')
!   original expression: Z127_2(l1b,l2b|m1bm2b)+=H25(l1b,l2b|m1b,d1b)*S43(d1b|m2b)
    ierr=exatns_tensor_contract("Z127_2(l1,l2,m1,m2)+=H25(l1,l2,m1,d1)*S43(d1,m2)", &
        Z127_2,H25,S43,prefactor=(1.0d0,0.0d0))
!   original expression: Z127_2(l1b,l2b|m1bm2b)+=H25(l1b,l2b|m2b,d1b)*S43(d1b|m1b)*-1.
    ierr=exatns_tensor_contract("Z127_2(l1,l2,m1,m2)+=H25(l1,l2,m2,d1)*S43(d1,m1)", &
        Z127_2,H25,S43,prefactor=(-1.0d0,0.0d0))
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z81_1,"Z81_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z81_1,'ZERO')
!   original expression: Z81_1(e1b,l1b|m1bm2b)+=S43(e1b|l2b)*Z127_2(l1b,l2b|m1bm2b)
    ierr=exatns_tensor_contract("Z81_1(e1,l1,m1,m2)+=S43(e1,l2)*Z127_2(l1,l2,m1,m2)", &
        Z81_1,S43,Z127_2,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z127_2)
    ierr=exatns_tensor_destroy(Z81_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z165_3,"Z165_3",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z165_3,'ZERO')
!   original expression: Z165_3(l1b,l2b|m1b,d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|m1b)*0.5
    ierr=exatns_tensor_contract("Z165_3(l1,l2,m1,d1)+=H24(l1,l2,d1,d2)*S43(d2,m1)", &
        Z165_3,H24,S43,prefactor=(0.5d0,0.0d0))
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z127_2,"Z127_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z127_2,'ZERO')
!   original expression: Z127_2(l1b,l2b|m1bm2b)+=S43(d1b|m1b)*Z165_3(l1b,l2b|m2b,d1b)
    ierr=exatns_tensor_contract("Z127_2(l1,l2,m1,m2)+=S43(d1,m1)*Z165_3(l1,l2,m2,d1)", &
        Z127_2,S43,Z165_3,prefactor=(1.0d0,0.0d0))
!   original expression: Z127_2(l1b,l2b|m1bm2b)+=S43(d1b|m2b)*Z165_3(l1b,l2b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z127_2(l1,l2,m1,m2)+=S43(d1,m2)*Z165_3(l1,l2,m1,d1)", &
        Z127_2,S43,Z165_3,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z165_3)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z81_1,"Z81_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z81_1,'ZERO')
!   original expression: Z81_1(e1b,l1b|m1bm2b)+=S43(e1b|l2b)*Z127_2(l1b,l2b|m1bm2b)
    ierr=exatns_tensor_contract("Z81_1(e1,l1,m1,m2)+=S43(e1,l2)*Z127_2(l1,l2,m1,m2)", &
        Z81_1,S43,Z127_2,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z127_2)
    ierr=exatns_tensor_destroy(Z81_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z136_2,"Z136_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z136_2,'ZERO')
!   original expression: Z136_2(e1b,l1b|m1b,d1b)+=H17(e1b,l1b|d1b,d2b)*S43(d2b|m1b)*0.5
    ierr=exatns_tensor_contract("Z136_2(e1,l1,m1,d1)+=H17(e1,l1,d1,d2)*S43(d2,m1)", &
        Z136_2,H17,S43,prefactor=(0.5d0,0.0d0))
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z81_1,"Z81_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z81_1,'ZERO')
!   original expression: Z81_1(e1b,l1b|m1bm2b)+=S43(d1b|m1b)*Z136_2(e1b,l1b|m2b,d1b)
    ierr=exatns_tensor_contract("Z81_1(e1,l1,m1,m2)+=S43(d1,m1)*Z136_2(e1,l1,m2,d1)", &
        Z81_1,S43,Z136_2,prefactor=(1.0d0,0.0d0))
!   original expression: Z81_1(e1b,l1b|m1bm2b)+=S43(d1b|m2b)*Z136_2(e1b,l1b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z81_1(e1,l1,m1,m2)+=S43(d1,m2)*Z136_2(e1,l1,m1,d1)", &
        Z81_1,S43,Z136_2,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z136_2)
    ierr=exatns_tensor_destroy(Z81_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nvir_id/)
    tens_root = (/nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z75_2,"Z75_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z75_2,'ZERO')
!   original expression: Z75_2(l1b|d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|l2b)
    ierr=exatns_tensor_contract("Z75_2(l1,d1)+=H24(l1,l2,d1,d2)*S43(d2,l2)", &
        Z75_2,H24,S43,prefactor=(1.0d0,0.0d0))
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z81_1,"Z81_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z81_1,'ZERO')
!   original expression: Z81_1(e1b,l1b|m1bm2b)+=S44(e1b,d1b|m1bm2b)*Z75_2(l1b|d1b)
    ierr=exatns_tensor_contract("Z81_1(e1,l1,m1,m2)+=S44(e1,d1,m1,m2)*Z75_2(l1,d1)", &
        Z81_1,S44,Z75_2,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z75_2)
    ierr=exatns_tensor_destroy(Z81_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nvir_id/)
    tens_root = (/nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z75_2,"Z75_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z75_2,'ZERO')
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z81_1,"Z81_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z81_1,'ZERO')
!   original expression: Z81_1(e1b,l1b|m1bm2b)+=S44(e1b,d1b|m1bm2b)*Z75_2(l1b|d1b)
    ierr=exatns_tensor_contract("Z81_1(e1,l1,m1,m2)+=S44(e1,d1,m1,m2)*Z75_2(l1,d1)", &
        Z81_1,S44,Z75_2,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z75_2)
    ierr=exatns_tensor_destroy(Z81_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z81_1,"Z81_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z81_1,'ZERO')
!   original expression: Z81_1(e1b,l1b|m1bm2b)+=S44(e1b,d1b|m1bm2b)*H15(l1b|d1b)
    ierr=exatns_tensor_contract("Z81_1(e1,l1,m1,m2)+=S44(e1,d1,m1,m2)*H15(l1,d1)", &
        Z81_1,S44,H15,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z81_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z165_2,"Z165_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z165_2,'ZERO')
!   original expression: Z165_2(l1b,l2b|m1b,d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|m1b)*-1.
    ierr=exatns_tensor_contract("Z165_2(l1,l2,m1,d1)+=H24(l1,l2,d1,d2)*S43(d2,m1)", &
        Z165_2,H24,S43,prefactor=(-1.0d0,0.0d0))
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z81_1,"Z81_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z81_1,'ZERO')
!   original expression: Z81_1(e1b,l1b|m1bm2b)+=S44(e1b,d1b|m1b,l2b)*Z165_2(l1b,l2b|m2b,d1b)
    ierr=exatns_tensor_contract("Z81_1(e1,l1,m1,m2)+=S44(e1,d1,m1,l2)*Z165_2(l1,l2,m2,d1)", &
        Z81_1,S44,Z165_2,prefactor=(1.0d0,0.0d0))
!   original expression: Z81_1(e1b,l1b|m1bm2b)+=S44(e1b,d1b|m2b,l2b)*Z165_2(l1b,l2b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z81_1(e1,l1,m1,m2)+=S44(e1,d1,m2,l2)*Z165_2(l1,l2,m1,d1)", &
        Z81_1,S44,Z165_2,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z165_2)
    ierr=exatns_tensor_destroy(Z81_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z81_1,"Z81_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z81_1,'ZERO')
!   original expression: Z81_1(e1b,l1b|m1bm2b)+=S44(e1b,d1b|m1b,l2b)*H25(l1b,l2b|m2b,d1b)
    ierr=exatns_tensor_contract("Z81_1(e1,l1,m1,m2)+=S44(e1,d1,m1,l2)*H25(l1,l2,m2,d1)", &
        Z81_1,S44,H25,prefactor=(1.0d0,0.0d0))
!   original expression: Z81_1(e1b,l1b|m1bm2b)+=S44(e1b,d1b|m2b,l2b)*H25(l1b,l2b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z81_1(e1,l1,m1,m2)+=S44(e1,d1,m2,l2)*H25(l1,l2,m1,d1)", &
        Z81_1,S44,H25,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z81_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z81_1,"Z81_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z81_1,'ZERO')
    ierr=exatns_tensor_destroy(Z81_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z81_1,"Z81_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z81_1,'ZERO')
    ierr=exatns_tensor_destroy(Z81_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z81_1,"Z81_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z81_1,'ZERO')
!   original expression: Z81_1(e1b,l1b|m1bm2b)+=S45(e1b,d1bd2b|m1bm2b,l2b)*H24(l1b,l2b|d1bd2b)
    ierr=exatns_tensor_contract("Z81_1(e1,l1,m1,m2)+=S45(e1,d1,d2,m1,m2,l2)*H24(l1,l2,d1,d2)", &
        Z81_1,S45,H24,prefactor=(0.5d0,0.0d0))
    ierr=exatns_tensor_destroy(Z81_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z81_1,"Z81_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z81_1,'ZERO')
    ierr=exatns_tensor_destroy(Z81_1)
    
    allocate(tens_id(6), tens_root(6))
    tens_id   = (/nvir_id,nvir_id,nocc_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root,nocc_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z142_1,"Z142_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z142_1,'ZERO')
!   original expression: Z142_1(e1be2b,l1b|m1bm2b,d1b)+=S45(e1be2b,d2b|m1bm2b,l2b)*H24(l1b,l2b|d1b,d2b)
    ierr=exatns_tensor_contract("Z142_1(e1,e2,l1,m1,m2,d1)+=S45(e1,e2,d2,m1,m2,l2)*H24(l1,l2,d1,d2)", &
        Z142_1,S45,H24,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z142_1)
    
    allocate(tens_id(6), tens_root(6))
    tens_id   = (/nvir_id,nvir_id,nocc_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root,nocc_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z142_1,"Z142_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z142_1,'ZERO')
    ierr=exatns_tensor_destroy(Z142_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nvir_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root/)
    ierr=exatns_tensor_create(Z72_1,"Z72_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z72_1,'ZERO')
!   original expression: Z72_1(e1b|d1b)+=H17(e1b,l1b|d1b,d2b)*S43(d2b|l1b)
    ierr=exatns_tensor_contract("Z72_1(e1,d1)+=H17(e1,l1,d1,d2)*S43(d2,l1)", &
        Z72_1,H17,S43,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z72_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nvir_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root/)
    ierr=exatns_tensor_create(Z72_1,"Z72_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z72_1,'ZERO')
    ierr=exatns_tensor_destroy(Z72_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nvir_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root/)
    ierr=exatns_tensor_create(Z72_1,"Z72_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z72_1,'ZERO')
!   original expression: Z72_1(e1b|d1b)+=S44(e1b,d2b|l1bl2b)*H24(l1bl2b|d1b,d2b)*-1.
    ierr=exatns_tensor_contract("Z72_1(e1,d1)+=S44(e1,d2,l1,l2)*H24(l1,l2,d1,d2)", &
        Z72_1,S44,H24,prefactor=(-0.5d0,0.0d0))
    ierr=exatns_tensor_destroy(Z72_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nvir_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root/)
    ierr=exatns_tensor_create(Z72_1,"Z72_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z72_1,'ZERO')
    ierr=exatns_tensor_destroy(Z72_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z76_1,"Z76_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z76_1,'ZERO')
!   original expression: Z76_1(l1bl2b|m1bm2b)+=H25(l1bl2b|m1b,d1b)*S43(d1b|m2b)
    ierr=exatns_tensor_contract("Z76_1(l1,l2,m1,m2)+=H25(l1,l2,m1,d1)*S43(d1,m2)", &
        Z76_1,H25,S43,prefactor=(1.0d0,0.0d0))
!   original expression: Z76_1(l1bl2b|m1bm2b)+=H25(l1bl2b|m2b,d1b)*S43(d1b|m1b)*-1.
    ierr=exatns_tensor_contract("Z76_1(l1,l2,m1,m2)+=H25(l1,l2,m2,d1)*S43(d1,m1)", &
        Z76_1,H25,S43,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z76_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z129_2,"Z129_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z129_2,'ZERO')
!   original expression: Z129_2(l1bl2b|m1b,d1b)+=H24(l1bl2b|d1b,d2b)*S43(d2b|m1b)*0.5
    ierr=exatns_tensor_contract("Z129_2(l1,l2,m1,d1)+=H24(l1,l2,d1,d2)*S43(d2,m1)", &
        Z129_2,H24,S43,prefactor=(0.5d0,0.0d0))
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z76_1,"Z76_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z76_1,'ZERO')
!   original expression: Z76_1(l1bl2b|m1bm2b)+=S43(d1b|m1b)*Z129_2(l1bl2b|m2b,d1b)
    ierr=exatns_tensor_contract("Z76_1(l1,l2,m1,m2)+=S43(d1,m1)*Z129_2(l1,l2,m2,d1)", &
        Z76_1,S43,Z129_2,prefactor=(1.0d0,0.0d0))
!   original expression: Z76_1(l1bl2b|m1bm2b)+=S43(d1b|m2b)*Z129_2(l1bl2b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z76_1(l1,l2,m1,m2)+=S43(d1,m2)*Z129_2(l1,l2,m1,d1)", &
        Z76_1,S43,Z129_2,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z129_2)
    ierr=exatns_tensor_destroy(Z76_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z76_1,"Z76_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z76_1,'ZERO')
!   original expression: Z76_1(l1bl2b|m1bm2b)+=S44(d1bd2b|m1bm2b)*H24(l1bl2b|d1bd2b)
    ierr=exatns_tensor_contract("Z76_1(l1,l2,m1,m2)+=S44(d1,d2,m1,m2)*H24(l1,l2,d1,d2)", &
        Z76_1,S44,H24,prefactor=(0.5d0,0.0d0))
    ierr=exatns_tensor_destroy(Z76_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z74_1,"Z74_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z74_1,'ZERO')
!   original expression: Z74_1(l1b|m1b)+=H25(l1b,l2b|m1b,d1b)*S43(d1b|l2b)*-1.
    ierr=exatns_tensor_contract("Z74_1(l1,m1)+=H25(l1,l2,m1,d1)*S43(d1,l2)", &
        Z74_1,H25,S43,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z74_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z74_1,"Z74_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z74_1,'ZERO')
    ierr=exatns_tensor_destroy(Z74_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nvir_id/)
    tens_root = (/nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z75_2,"Z75_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z75_2,'ZERO')
!   original expression: Z75_2(l1b|d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|l2b)*-1.
    ierr=exatns_tensor_contract("Z75_2(l1,d1)+=H24(l1,l2,d1,d2)*S43(d2,l2)", &
        Z75_2,H24,S43,prefactor=(-1.0d0,0.0d0))
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z74_1,"Z74_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z74_1,'ZERO')
!   original expression: Z74_1(l1b|m1b)+=S43(d1b|m1b)*Z75_2(l1b|d1b)
    ierr=exatns_tensor_contract("Z74_1(l1,m1)+=S43(d1,m1)*Z75_2(l1,d1)", &
        Z74_1,S43,Z75_2,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z75_2)
    ierr=exatns_tensor_destroy(Z74_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nvir_id/)
    tens_root = (/nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z75_2,"Z75_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z75_2,'ZERO')
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z74_1,"Z74_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z74_1,'ZERO')
!   original expression: Z74_1(l1b|m1b)+=S43(d1b|m1b)*Z75_2(l1b|d1b)
    ierr=exatns_tensor_contract("Z74_1(l1,m1)+=S43(d1,m1)*Z75_2(l1,d1)", &
        Z74_1,S43,Z75_2,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z75_2)
    ierr=exatns_tensor_destroy(Z74_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z74_1,"Z74_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z74_1,'ZERO')
!   original expression: Z74_1(l1b|m1b)+=S43(d1b|m1b)*H15(l1b|d1b)*-1.
    ierr=exatns_tensor_contract("Z74_1(l1,m1)+=S43(d1,m1)*H15(l1,d1)", &
        Z74_1,S43,H15,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z74_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z74_1,"Z74_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z74_1,'ZERO')
!   original expression: Z74_1(l1b|m1b)+=S44(d1bd2b|m1b,l2b)*H24(l1b,l2b|d1bd2b)*-1.
    ierr=exatns_tensor_contract("Z74_1(l1,m1)+=S44(d1,d2,m1,l2)*H24(l1,l2,d1,d2)", &
        Z74_1,S44,H24,prefactor=(-0.5d0,0.0d0))
    ierr=exatns_tensor_destroy(Z74_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z74_1,"Z74_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z74_1,'ZERO')
    ierr=exatns_tensor_destroy(Z74_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z136_1,"Z136_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z136_1,'ZERO')
!   original expression: Z136_1(e1b,l1b|m1b,d1b)+=H17(e1b,l1b|d1b,d2b)*S43(d2b|m1b)*-1.
    ierr=exatns_tensor_contract("Z136_1(e1,l1,m1,d1)+=H17(e1,l1,d1,d2)*S43(d2,m1)", &
        Z136_1,H17,S43,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z136_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z136_1,"Z136_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z136_1,'ZERO')
!   original expression: Z136_1(e1b,l1b|m1b,d1b)+=S44(e1b,d2b|m1b,l2b)*H24(l1b,l2b|d1b,d2b)
    ierr=exatns_tensor_contract("Z136_1(e1,l1,m1,d1)+=S44(e1,d2,m1,l2)*H24(l1,l2,d1,d2)", &
        Z136_1,S44,H24,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z136_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z136_1,"Z136_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z136_1,'ZERO')
    ierr=exatns_tensor_destroy(Z136_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z165_3,"Z165_3",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z165_3,'ZERO')
!   original expression: Z165_3(l1b,l2b|m1b,d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|m1b)*0.5
    ierr=exatns_tensor_contract("Z165_3(l1,l2,m1,d1)+=H24(l1,l2,d1,d2)*S43(d2,m1)", &
        Z165_3,H24,S43,prefactor=(0.5d0,0.0d0))
    ierr=exatns_tensor_destroy(Z165_3)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z136_2,"Z136_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z136_2,'ZERO')
!   original expression: Z136_2(e1b,l1b|m1b,d1b)+=H17(e1b,l1b|d1b,d2b)*S43(d2b|m1b)
    ierr=exatns_tensor_contract("Z136_2(e1,l1,m1,d1)+=H17(e1,l1,d1,d2)*S43(d2,m1)", &
        Z136_2,H17,S43,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z136_2)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z136_2,"Z136_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z136_2,'ZERO')
!   original expression: Z136_2(e1b,l1b|m1b,d1b)+=S44(e1b,d2b|m1b,l2b)*H24(l1b,l2b|d1b,d2b)*-1.
    ierr=exatns_tensor_contract("Z136_2(e1,l1,m1,d1)+=S44(e1,d2,m1,l2)*H24(l1,l2,d1,d2)", &
        Z136_2,S44,H24,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z136_2)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z136_2,"Z136_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z136_2,'ZERO')
    ierr=exatns_tensor_destroy(Z136_2)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nvir_id/)
    tens_root = (/nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z75_2,"Z75_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z75_2,'ZERO')
!   original expression: Z75_2(l1b|d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|l2b)
    ierr=exatns_tensor_contract("Z75_2(l1,d1)+=H24(l1,l2,d1,d2)*S43(d2,l2)", &
        Z75_2,H24,S43,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z75_2)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nvir_id/)
    tens_root = (/nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z75_2,"Z75_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z75_2,'ZERO')
    ierr=exatns_tensor_destroy(Z75_2)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z165_2,"Z165_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z165_2,'ZERO')
!   original expression: Z165_2(l1b,l2b|m1b,d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|m1b)*-1.
    ierr=exatns_tensor_contract("Z165_2(l1,l2,m1,d1)+=H24(l1,l2,d1,d2)*S43(d2,m1)", &
        Z165_2,H24,S43,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z165_2)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nvir_id/)
    tens_root = (/nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z75_2,"Z75_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z75_2,'ZERO')
!   original expression: Z75_2(l1b|d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|l2b)*-1.
    ierr=exatns_tensor_contract("Z75_2(l1,d1)+=H24(l1,l2,d1,d2)*S43(d2,l2)", &
        Z75_2,H24,S43,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z75_2)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nvir_id/)
    tens_root = (/nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z75_2,"Z75_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z75_2,'ZERO')
    ierr=exatns_tensor_destroy(Z75_2)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z165_2,"Z165_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z165_2,'ZERO')
!   original expression: Z165_2(l1b,l2b|m1b,d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|m1b)
    ierr=exatns_tensor_contract("Z165_2(l1,l2,m1,d1)+=H24(l1,l2,d1,d2)*S43(d2,m1)", &
        Z165_2,H24,S43,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z165_2)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nvir_id,nvir_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root,nvir_root,nvir_root/)
    ierr=exatns_tensor_create(Z92_2,"Z92_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z92_2,'ZERO')
!   original expression: Z92_2(e1be2b|d1b,d2b)+=H24(l1bl2b|d1b,d2b)*S44(e1be2b|l1bl2b)*0.5
    ierr=exatns_tensor_contract("Z92_2(e1,e2,d1,d2)+=H24(l1,l2,d1,d2)*S44(e1,e2,l1,l2)", &
        Z92_2,H24,S44,prefactor=(0.25d0,0.0d0))
    ierr=exatns_tensor_destroy(Z92_2)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z129_2,"Z129_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z129_2,'ZERO')
!   original expression: Z129_2(l1bl2b|m1b,d1b)+=H24(l1bl2b|d1b,d2b)*S43(d2b|m1b)
    ierr=exatns_tensor_contract("Z129_2(l1,l2,m1,d1)+=H24(l1,l2,d1,d2)*S43(d2,m1)", &
        Z129_2,H24,S43,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z129_2)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z165_3,"Z165_3",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z165_3,'ZERO')
!   original expression: Z165_3(l1b,l2b|m1b,d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|m1b)
    ierr=exatns_tensor_contract("Z165_3(l1,l2,m1,d1)+=H24(l1,l2,d1,d2)*S43(d2,m1)", &
        Z165_3,H24,S43,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z165_3)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z136_2,"Z136_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z136_2,'ZERO')
!   original expression: Z136_2(e1b,l1b|m1b,d1b)+=H17(e1b,l1b|d1b,d2b)*S43(d2b|m1b)
    ierr=exatns_tensor_contract("Z136_2(e1,l1,m1,d1)+=H17(e1,l1,d1,d2)*S43(d2,m1)", &
        Z136_2,H17,S43,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z136_2)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z136_2,"Z136_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z136_2,'ZERO')
!   original expression: Z136_2(e1b,l1b|m1b,d1b)+=S44(e1b,d2b|m1b,l2b)*H24(l1b,l2b|d1b,d2b)*-1.
    ierr=exatns_tensor_contract("Z136_2(e1,l1,m1,d1)+=S44(e1,d2,m1,l2)*H24(l1,l2,d1,d2)", &
        Z136_2,S44,H24,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z136_2)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z136_2,"Z136_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z136_2,'ZERO')
    ierr=exatns_tensor_destroy(Z136_2)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z127_2,"Z127_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z127_2,'ZERO')
!   original expression: Z127_2(l1b,l2b|m1bm2b)+=H24(l1b,l2b|d1bd2b)*S44(d1bd2b|m1bm2b)*0.5
    ierr=exatns_tensor_contract("Z127_2(l1,l2,m1,m2)+=H24(l1,l2,d1,d2)*S44(d1,d2,m1,m2)", &
        Z127_2,H24,S44,prefactor=(0.25d0,0.0d0))
    ierr=exatns_tensor_destroy(Z127_2)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z127_2,"Z127_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z127_2,'ZERO')
!   original expression: Z127_2(l1b,l2b|m1bm2b)+=H25(l1b,l2b|m1b,d1b)*S43(d1b|m2b)*0.5
    ierr=exatns_tensor_contract("Z127_2(l1,l2,m1,m2)+=H25(l1,l2,m1,d1)*S43(d1,m2)", &
        Z127_2,H25,S43,prefactor=(0.5d0,0.0d0))
!   original expression: Z127_2(l1b,l2b|m1bm2b)+=H25(l1b,l2b|m2b,d1b)*S43(d1b|m1b)*-0.5
    ierr=exatns_tensor_contract("Z127_2(l1,l2,m1,m2)+=H25(l1,l2,m2,d1)*S43(d1,m1)", &
        Z127_2,H25,S43,prefactor=(-0.5d0,0.0d0))
    ierr=exatns_tensor_destroy(Z127_2)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z165_3,"Z165_3",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z165_3,'ZERO')
!   original expression: Z165_3(l1b,l2b|m1b,d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|m1b)*0.25
    ierr=exatns_tensor_contract("Z165_3(l1,l2,m1,d1)+=H24(l1,l2,d1,d2)*S43(d2,m1)", &
        Z165_3,H24,S43,prefactor=(0.25d0,0.0d0))
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z127_2,"Z127_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z127_2,'ZERO')
!   original expression: Z127_2(l1b,l2b|m1bm2b)+=S43(d1b|m1b)*Z165_3(l1b,l2b|m2b,d1b)
    ierr=exatns_tensor_contract("Z127_2(l1,l2,m1,m2)+=S43(d1,m1)*Z165_3(l1,l2,m2,d1)", &
        Z127_2,S43,Z165_3,prefactor=(1.0d0,0.0d0))
!   original expression: Z127_2(l1b,l2b|m1bm2b)+=S43(d1b|m2b)*Z165_3(l1b,l2b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z127_2(l1,l2,m1,m2)+=S43(d1,m2)*Z165_3(l1,l2,m1,d1)", &
        Z127_2,S43,Z165_3,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z165_3)
    ierr=exatns_tensor_destroy(Z127_2)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nvir_id/)
    tens_root = (/nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z75_2,"Z75_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z75_2,'ZERO')
!   original expression: Z75_2(l1b|d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|l2b)
    ierr=exatns_tensor_contract("Z75_2(l1,d1)+=H24(l1,l2,d1,d2)*S43(d2,l2)", &
        Z75_2,H24,S43,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z75_2)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nvir_id/)
    tens_root = (/nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z75_2,"Z75_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z75_2,'ZERO')
    ierr=exatns_tensor_destroy(Z75_2)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z165_2,"Z165_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z165_2,'ZERO')
!   original expression: Z165_2(l1b,l2b|m1b,d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|m1b)*-1.
    ierr=exatns_tensor_contract("Z165_2(l1,l2,m1,d1)+=H24(l1,l2,d1,d2)*S43(d2,m1)", &
        Z165_2,H24,S43,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z165_2)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nvir_id/)
    tens_root = (/nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z75_2,"Z75_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z75_2,'ZERO')
!   original expression: Z75_2(l1b|d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|l2b)*-1.
    ierr=exatns_tensor_contract("Z75_2(l1,d1)+=H24(l1,l2,d1,d2)*S43(d2,l2)", &
        Z75_2,H24,S43,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z75_2)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nvir_id/)
    tens_root = (/nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z75_2,"Z75_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z75_2,'ZERO')
    ierr=exatns_tensor_destroy(Z75_2)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z165_2,"Z165_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z165_2,'ZERO')
!   original expression: Z165_2(l1b,l2b|m1b,d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|m1b)
    ierr=exatns_tensor_contract("Z165_2(l1,l2,m1,d1)+=H24(l1,l2,d1,d2)*S43(d2,m1)", &
        Z165_2,H24,S43,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z165_2)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nvir_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z91_1,"Z91_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z91_1,'ZERO')
!   original expression: Z91_1(e1be2b|m1b,d1b)+=H3(e1be2b|d1b,d2b)*S43(d2b|m1b)
    ierr=exatns_tensor_contract("Z91_1(e1,e2,m1,d1)+=H3(e1,e2,d1,d2)*S43(d2,m1)", &
        Z91_1,H3,S43,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z91_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nvir_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z91_1,"Z91_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z91_1,'ZERO')
!   original expression: Z91_1(e1be2b|m1b,d1b)+=H17(e1b,l1b|d1b,d2b)*S44(e2b,d2b|m1b,l1b)
    ierr=exatns_tensor_contract("Z91_1(e1,e2,m1,d1)+=H17(e1,l1,d1,d2)*S44(e2,d2,m1,l1)", &
        Z91_1,H17,S44,prefactor=(1.0d0,0.0d0))
!   original expression: Z91_1(e1be2b|m1b,d1b)+=H17(e2b,l1b|d1b,d2b)*S44(e1b,d2b|m1b,l1b)*-1.
    ierr=exatns_tensor_contract("Z91_1(e1,e2,m1,d1)+=H17(e2,l1,d1,d2)*S44(e1,d2,m1,l1)", &
        Z91_1,H17,S44,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z91_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nvir_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z91_1,"Z91_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z91_1,'ZERO')
    ierr=exatns_tensor_destroy(Z91_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z129_2,"Z129_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z129_2,'ZERO')
!   original expression: Z129_2(l1bl2b|m1b,d1b)+=H24(l1bl2b|d1b,d2b)*S43(d2b|m1b)
    ierr=exatns_tensor_contract("Z129_2(l1,l2,m1,d1)+=H24(l1,l2,d1,d2)*S43(d2,m1)", &
        Z129_2,H24,S43,prefactor=(1.0d0,0.0d0))
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nvir_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z91_1,"Z91_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z91_1,'ZERO')
!   original expression: Z91_1(e1be2b|m1b,d1b)+=S44(e1be2b|l1bl2b)*Z129_2(l1bl2b|m1b,d1b)
    ierr=exatns_tensor_contract("Z91_1(e1,e2,m1,d1)+=S44(e1,e2,l1,l2)*Z129_2(l1,l2,m1,d1)", &
        Z91_1,S44,Z129_2,prefactor=(0.5d0,0.0d0))
    ierr=exatns_tensor_destroy(Z129_2)
    ierr=exatns_tensor_destroy(Z91_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nvir_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z91_1,"Z91_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z91_1,'ZERO')
!   original expression: Z91_1(e1be2b|m1b,d1b)+=S44(e1be2b|l1bl2b)*H25(l1bl2b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z91_1(e1,e2,m1,d1)+=S44(e1,e2,l1,l2)*H25(l1,l2,m1,d1)", &
        Z91_1,S44,H25,prefactor=(-0.5d0,0.0d0))
    ierr=exatns_tensor_destroy(Z91_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nvir_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z91_1,"Z91_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z91_1,'ZERO')
!   original expression: Z91_1(e1be2b|m1b,d1b)+=S45(e1be2b,d2b|m1b,l1bl2b)*H24(l1bl2b|d1b,d2b)
    ierr=exatns_tensor_contract("Z91_1(e1,e2,m1,d1)+=S45(e1,e2,d2,m1,l1,l2)*H24(l1,l2,d1,d2)", &
        Z91_1,S45,H24,prefactor=(0.5d0,0.0d0))
    ierr=exatns_tensor_destroy(Z91_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nvir_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z91_1,"Z91_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z91_1,'ZERO')
    ierr=exatns_tensor_destroy(Z91_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z81_1,"Z81_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z81_1,'ZERO')
!   original expression: Z81_1(e1b,l1b|m1bm2b)+=H17(e1b,l1b|d1bd2b)*S44(d1bd2b|m1bm2b)
    ierr=exatns_tensor_contract("Z81_1(e1,l1,m1,m2)+=H17(e1,l1,d1,d2)*S44(d1,d2,m1,m2)", &
        Z81_1,H17,S44,prefactor=(0.5d0,0.0d0))
    ierr=exatns_tensor_destroy(Z81_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z81_1,"Z81_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z81_1,'ZERO')
!   original expression: Z81_1(e1b,l1b|m1bm2b)+=H26(l1b,l2b|m1bm2b)*S43(e1b|l2b)
    ierr=exatns_tensor_contract("Z81_1(e1,l1,m1,m2)+=H26(l1,l2,m1,m2)*S43(e1,l2)", &
        Z81_1,H26,S43,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z81_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z81_1,"Z81_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z81_1,'ZERO')
!   original expression: Z81_1(e1b,l1b|m1bm2b)+=H18(e1b,l1b|m1b,d1b)*S43(d1b|m2b)
    ierr=exatns_tensor_contract("Z81_1(e1,l1,m1,m2)+=H18(e1,l1,m1,d1)*S43(d1,m2)", &
        Z81_1,H18,S43,prefactor=(1.0d0,0.0d0))
!   original expression: Z81_1(e1b,l1b|m1bm2b)+=H18(e1b,l1b|m2b,d1b)*S43(d1b|m1b)*-1.
    ierr=exatns_tensor_contract("Z81_1(e1,l1,m1,m2)+=H18(e1,l1,m2,d1)*S43(d1,m1)", &
        Z81_1,H18,S43,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z81_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z127_2,"Z127_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z127_2,'ZERO')
!   original expression: Z127_2(l1b,l2b|m1bm2b)+=H24(l1b,l2b|d1bd2b)*S44(d1bd2b|m1bm2b)
    ierr=exatns_tensor_contract("Z127_2(l1,l2,m1,m2)+=H24(l1,l2,d1,d2)*S44(d1,d2,m1,m2)", &
        Z127_2,H24,S44,prefactor=(0.5d0,0.0d0))
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z81_1,"Z81_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z81_1,'ZERO')
!   original expression: Z81_1(e1b,l1b|m1bm2b)+=S43(e1b|l2b)*Z127_2(l1b,l2b|m1bm2b)
    ierr=exatns_tensor_contract("Z81_1(e1,l1,m1,m2)+=S43(e1,l2)*Z127_2(l1,l2,m1,m2)", &
        Z81_1,S43,Z127_2,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z127_2)
    ierr=exatns_tensor_destroy(Z81_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z127_2,"Z127_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z127_2,'ZERO')
!   original expression: Z127_2(l1b,l2b|m1bm2b)+=H25(l1b,l2b|m1b,d1b)*S43(d1b|m2b)
    ierr=exatns_tensor_contract("Z127_2(l1,l2,m1,m2)+=H25(l1,l2,m1,d1)*S43(d1,m2)", &
        Z127_2,H25,S43,prefactor=(1.0d0,0.0d0))
!   original expression: Z127_2(l1b,l2b|m1bm2b)+=H25(l1b,l2b|m2b,d1b)*S43(d1b|m1b)*-1.
    ierr=exatns_tensor_contract("Z127_2(l1,l2,m1,m2)+=H25(l1,l2,m2,d1)*S43(d1,m1)", &
        Z127_2,H25,S43,prefactor=(-1.0d0,0.0d0))
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z81_1,"Z81_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z81_1,'ZERO')
!   original expression: Z81_1(e1b,l1b|m1bm2b)+=S43(e1b|l2b)*Z127_2(l1b,l2b|m1bm2b)
    ierr=exatns_tensor_contract("Z81_1(e1,l1,m1,m2)+=S43(e1,l2)*Z127_2(l1,l2,m1,m2)", &
        Z81_1,S43,Z127_2,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z127_2)
    ierr=exatns_tensor_destroy(Z81_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z165_3,"Z165_3",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z165_3,'ZERO')
!   original expression: Z165_3(l1b,l2b|m1b,d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|m1b)*0.5
    ierr=exatns_tensor_contract("Z165_3(l1,l2,m1,d1)+=H24(l1,l2,d1,d2)*S43(d2,m1)", &
        Z165_3,H24,S43,prefactor=(0.5d0,0.0d0))
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z127_2,"Z127_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z127_2,'ZERO')
!   original expression: Z127_2(l1b,l2b|m1bm2b)+=S43(d1b|m1b)*Z165_3(l1b,l2b|m2b,d1b)
    ierr=exatns_tensor_contract("Z127_2(l1,l2,m1,m2)+=S43(d1,m1)*Z165_3(l1,l2,m2,d1)", &
        Z127_2,S43,Z165_3,prefactor=(1.0d0,0.0d0))
!   original expression: Z127_2(l1b,l2b|m1bm2b)+=S43(d1b|m2b)*Z165_3(l1b,l2b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z127_2(l1,l2,m1,m2)+=S43(d1,m2)*Z165_3(l1,l2,m1,d1)", &
        Z127_2,S43,Z165_3,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z165_3)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z81_1,"Z81_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z81_1,'ZERO')
!   original expression: Z81_1(e1b,l1b|m1bm2b)+=S43(e1b|l2b)*Z127_2(l1b,l2b|m1bm2b)
    ierr=exatns_tensor_contract("Z81_1(e1,l1,m1,m2)+=S43(e1,l2)*Z127_2(l1,l2,m1,m2)", &
        Z81_1,S43,Z127_2,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z127_2)
    ierr=exatns_tensor_destroy(Z81_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z136_2,"Z136_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z136_2,'ZERO')
!   original expression: Z136_2(e1b,l1b|m1b,d1b)+=H17(e1b,l1b|d1b,d2b)*S43(d2b|m1b)*0.5
    ierr=exatns_tensor_contract("Z136_2(e1,l1,m1,d1)+=H17(e1,l1,d1,d2)*S43(d2,m1)", &
        Z136_2,H17,S43,prefactor=(0.5d0,0.0d0))
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z81_1,"Z81_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z81_1,'ZERO')
!   original expression: Z81_1(e1b,l1b|m1bm2b)+=S43(d1b|m1b)*Z136_2(e1b,l1b|m2b,d1b)
    ierr=exatns_tensor_contract("Z81_1(e1,l1,m1,m2)+=S43(d1,m1)*Z136_2(e1,l1,m2,d1)", &
        Z81_1,S43,Z136_2,prefactor=(1.0d0,0.0d0))
!   original expression: Z81_1(e1b,l1b|m1bm2b)+=S43(d1b|m2b)*Z136_2(e1b,l1b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z81_1(e1,l1,m1,m2)+=S43(d1,m2)*Z136_2(e1,l1,m1,d1)", &
        Z81_1,S43,Z136_2,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z136_2)
    ierr=exatns_tensor_destroy(Z81_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nvir_id/)
    tens_root = (/nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z75_2,"Z75_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z75_2,'ZERO')
!   original expression: Z75_2(l1b|d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|l2b)
    ierr=exatns_tensor_contract("Z75_2(l1,d1)+=H24(l1,l2,d1,d2)*S43(d2,l2)", &
        Z75_2,H24,S43,prefactor=(1.0d0,0.0d0))
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z81_1,"Z81_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z81_1,'ZERO')
!   original expression: Z81_1(e1b,l1b|m1bm2b)+=S44(e1b,d1b|m1bm2b)*Z75_2(l1b|d1b)
    ierr=exatns_tensor_contract("Z81_1(e1,l1,m1,m2)+=S44(e1,d1,m1,m2)*Z75_2(l1,d1)", &
        Z81_1,S44,Z75_2,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z75_2)
    ierr=exatns_tensor_destroy(Z81_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nvir_id/)
    tens_root = (/nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z75_2,"Z75_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z75_2,'ZERO')
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z81_1,"Z81_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z81_1,'ZERO')
!   original expression: Z81_1(e1b,l1b|m1bm2b)+=S44(e1b,d1b|m1bm2b)*Z75_2(l1b|d1b)
    ierr=exatns_tensor_contract("Z81_1(e1,l1,m1,m2)+=S44(e1,d1,m1,m2)*Z75_2(l1,d1)", &
        Z81_1,S44,Z75_2,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z75_2)
    ierr=exatns_tensor_destroy(Z81_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z81_1,"Z81_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z81_1,'ZERO')
!   original expression: Z81_1(e1b,l1b|m1bm2b)+=S44(e1b,d1b|m1bm2b)*H15(l1b|d1b)
    ierr=exatns_tensor_contract("Z81_1(e1,l1,m1,m2)+=S44(e1,d1,m1,m2)*H15(l1,d1)", &
        Z81_1,S44,H15,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z81_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z165_2,"Z165_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z165_2,'ZERO')
!   original expression: Z165_2(l1b,l2b|m1b,d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|m1b)*-1.
    ierr=exatns_tensor_contract("Z165_2(l1,l2,m1,d1)+=H24(l1,l2,d1,d2)*S43(d2,m1)", &
        Z165_2,H24,S43,prefactor=(-1.0d0,0.0d0))
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z81_1,"Z81_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z81_1,'ZERO')
!   original expression: Z81_1(e1b,l1b|m1bm2b)+=S44(e1b,d1b|m1b,l2b)*Z165_2(l1b,l2b|m2b,d1b)
    ierr=exatns_tensor_contract("Z81_1(e1,l1,m1,m2)+=S44(e1,d1,m1,l2)*Z165_2(l1,l2,m2,d1)", &
        Z81_1,S44,Z165_2,prefactor=(1.0d0,0.0d0))
!   original expression: Z81_1(e1b,l1b|m1bm2b)+=S44(e1b,d1b|m2b,l2b)*Z165_2(l1b,l2b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z81_1(e1,l1,m1,m2)+=S44(e1,d1,m2,l2)*Z165_2(l1,l2,m1,d1)", &
        Z81_1,S44,Z165_2,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z165_2)
    ierr=exatns_tensor_destroy(Z81_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z81_1,"Z81_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z81_1,'ZERO')
!   original expression: Z81_1(e1b,l1b|m1bm2b)+=S44(e1b,d1b|m1b,l2b)*H25(l1b,l2b|m2b,d1b)
    ierr=exatns_tensor_contract("Z81_1(e1,l1,m1,m2)+=S44(e1,d1,m1,l2)*H25(l1,l2,m2,d1)", &
        Z81_1,S44,H25,prefactor=(1.0d0,0.0d0))
!   original expression: Z81_1(e1b,l1b|m1bm2b)+=S44(e1b,d1b|m2b,l2b)*H25(l1b,l2b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z81_1(e1,l1,m1,m2)+=S44(e1,d1,m2,l2)*H25(l1,l2,m1,d1)", &
        Z81_1,S44,H25,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z81_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z81_1,"Z81_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z81_1,'ZERO')
    ierr=exatns_tensor_destroy(Z81_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z81_1,"Z81_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z81_1,'ZERO')
    ierr=exatns_tensor_destroy(Z81_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z81_1,"Z81_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z81_1,'ZERO')
!   original expression: Z81_1(e1b,l1b|m1bm2b)+=S45(e1b,d1bd2b|m1bm2b,l2b)*H24(l1b,l2b|d1bd2b)
    ierr=exatns_tensor_contract("Z81_1(e1,l1,m1,m2)+=S45(e1,d1,d2,m1,m2,l2)*H24(l1,l2,d1,d2)", &
        Z81_1,S45,H24,prefactor=(0.5d0,0.0d0))
    ierr=exatns_tensor_destroy(Z81_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z81_1,"Z81_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z81_1,'ZERO')
    ierr=exatns_tensor_destroy(Z81_1)
    
    allocate(tens_id(6), tens_root(6))
    tens_id   = (/nvir_id,nvir_id,nocc_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root,nocc_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z142_1,"Z142_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z142_1,'ZERO')
!   original expression: Z142_1(e1be2b,l1b|m1bm2b,d1b)+=S45(e1be2b,d2b|m1bm2b,l2b)*H24(l1b,l2b|d1b,d2b)
    ierr=exatns_tensor_contract("Z142_1(e1,e2,l1,m1,m2,d1)+=S45(e1,e2,d2,m1,m2,l2)*H24(l1,l2,d1,d2)", &
        Z142_1,S45,H24,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z142_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nvir_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root/)
    ierr=exatns_tensor_create(Z72_1,"Z72_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z72_1,'ZERO')
!   original expression: Z72_1(e1b|d1b)+=H17(e1b,l1b|d1b,d2b)*S43(d2b|l1b)
    ierr=exatns_tensor_contract("Z72_1(e1,d1)+=H17(e1,l1,d1,d2)*S43(d2,l1)", &
        Z72_1,H17,S43,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z72_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nvir_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root/)
    ierr=exatns_tensor_create(Z72_1,"Z72_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z72_1,'ZERO')
    ierr=exatns_tensor_destroy(Z72_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nvir_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root/)
    ierr=exatns_tensor_create(Z72_1,"Z72_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z72_1,'ZERO')
!   original expression: Z72_1(e1b|d1b)+=S44(e1b,d2b|l1bl2b)*H24(l1bl2b|d1b,d2b)*-1.
    ierr=exatns_tensor_contract("Z72_1(e1,d1)+=S44(e1,d2,l1,l2)*H24(l1,l2,d1,d2)", &
        Z72_1,S44,H24,prefactor=(-0.5d0,0.0d0))
    ierr=exatns_tensor_destroy(Z72_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nvir_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root/)
    ierr=exatns_tensor_create(Z72_1,"Z72_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z72_1,'ZERO')
    ierr=exatns_tensor_destroy(Z72_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z76_1,"Z76_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z76_1,'ZERO')
!   original expression: Z76_1(l1bl2b|m1bm2b)+=H25(l1bl2b|m1b,d1b)*S43(d1b|m2b)
    ierr=exatns_tensor_contract("Z76_1(l1,l2,m1,m2)+=H25(l1,l2,m1,d1)*S43(d1,m2)", &
        Z76_1,H25,S43,prefactor=(1.0d0,0.0d0))
!   original expression: Z76_1(l1bl2b|m1bm2b)+=H25(l1bl2b|m2b,d1b)*S43(d1b|m1b)*-1.
    ierr=exatns_tensor_contract("Z76_1(l1,l2,m1,m2)+=H25(l1,l2,m2,d1)*S43(d1,m1)", &
        Z76_1,H25,S43,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z76_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z129_2,"Z129_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z129_2,'ZERO')
!   original expression: Z129_2(l1bl2b|m1b,d1b)+=H24(l1bl2b|d1b,d2b)*S43(d2b|m1b)*0.5
    ierr=exatns_tensor_contract("Z129_2(l1,l2,m1,d1)+=H24(l1,l2,d1,d2)*S43(d2,m1)", &
        Z129_2,H24,S43,prefactor=(0.5d0,0.0d0))
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z76_1,"Z76_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z76_1,'ZERO')
!   original expression: Z76_1(l1bl2b|m1bm2b)+=S43(d1b|m1b)*Z129_2(l1bl2b|m2b,d1b)
    ierr=exatns_tensor_contract("Z76_1(l1,l2,m1,m2)+=S43(d1,m1)*Z129_2(l1,l2,m2,d1)", &
        Z76_1,S43,Z129_2,prefactor=(1.0d0,0.0d0))
!   original expression: Z76_1(l1bl2b|m1bm2b)+=S43(d1b|m2b)*Z129_2(l1bl2b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z76_1(l1,l2,m1,m2)+=S43(d1,m2)*Z129_2(l1,l2,m1,d1)", &
        Z76_1,S43,Z129_2,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z129_2)
    ierr=exatns_tensor_destroy(Z76_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z76_1,"Z76_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z76_1,'ZERO')
!   original expression: Z76_1(l1bl2b|m1bm2b)+=S44(d1bd2b|m1bm2b)*H24(l1bl2b|d1bd2b)
    ierr=exatns_tensor_contract("Z76_1(l1,l2,m1,m2)+=S44(d1,d2,m1,m2)*H24(l1,l2,d1,d2)", &
        Z76_1,S44,H24,prefactor=(0.5d0,0.0d0))
    ierr=exatns_tensor_destroy(Z76_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z74_1,"Z74_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z74_1,'ZERO')
!   original expression: Z74_1(l1b|m1b)+=H25(l1b,l2b|m1b,d1b)*S43(d1b|l2b)*-1.
    ierr=exatns_tensor_contract("Z74_1(l1,m1)+=H25(l1,l2,m1,d1)*S43(d1,l2)", &
        Z74_1,H25,S43,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z74_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z74_1,"Z74_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z74_1,'ZERO')
    ierr=exatns_tensor_destroy(Z74_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nvir_id/)
    tens_root = (/nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z75_2,"Z75_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z75_2,'ZERO')
!   original expression: Z75_2(l1b|d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|l2b)*-1.
    ierr=exatns_tensor_contract("Z75_2(l1,d1)+=H24(l1,l2,d1,d2)*S43(d2,l2)", &
        Z75_2,H24,S43,prefactor=(-1.0d0,0.0d0))
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z74_1,"Z74_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z74_1,'ZERO')
!   original expression: Z74_1(l1b|m1b)+=S43(d1b|m1b)*Z75_2(l1b|d1b)
    ierr=exatns_tensor_contract("Z74_1(l1,m1)+=S43(d1,m1)*Z75_2(l1,d1)", &
        Z74_1,S43,Z75_2,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z75_2)
    ierr=exatns_tensor_destroy(Z74_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nvir_id/)
    tens_root = (/nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z75_2,"Z75_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z75_2,'ZERO')
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z74_1,"Z74_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z74_1,'ZERO')
!   original expression: Z74_1(l1b|m1b)+=S43(d1b|m1b)*Z75_2(l1b|d1b)
    ierr=exatns_tensor_contract("Z74_1(l1,m1)+=S43(d1,m1)*Z75_2(l1,d1)", &
        Z74_1,S43,Z75_2,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z75_2)
    ierr=exatns_tensor_destroy(Z74_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z74_1,"Z74_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z74_1,'ZERO')
!   original expression: Z74_1(l1b|m1b)+=S43(d1b|m1b)*H15(l1b|d1b)*-1.
    ierr=exatns_tensor_contract("Z74_1(l1,m1)+=S43(d1,m1)*H15(l1,d1)", &
        Z74_1,S43,H15,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z74_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z74_1,"Z74_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z74_1,'ZERO')
!   original expression: Z74_1(l1b|m1b)+=S44(d1bd2b|m1b,l2b)*H24(l1b,l2b|d1bd2b)*-1.
    ierr=exatns_tensor_contract("Z74_1(l1,m1)+=S44(d1,d2,m1,l2)*H24(l1,l2,d1,d2)", &
        Z74_1,S44,H24,prefactor=(-0.5d0,0.0d0))
    ierr=exatns_tensor_destroy(Z74_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z74_1,"Z74_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z74_1,'ZERO')
    ierr=exatns_tensor_destroy(Z74_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z136_1,"Z136_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z136_1,'ZERO')
!   original expression: Z136_1(e1b,l1b|m1b,d1b)+=H17(e1b,l1b|d1b,d2b)*S43(d2b|m1b)*-1.
    ierr=exatns_tensor_contract("Z136_1(e1,l1,m1,d1)+=H17(e1,l1,d1,d2)*S43(d2,m1)", &
        Z136_1,H17,S43,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z136_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z136_1,"Z136_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z136_1,'ZERO')
!   original expression: Z136_1(e1b,l1b|m1b,d1b)+=S44(e1b,d2b|m1b,l2b)*H24(l1b,l2b|d1b,d2b)
    ierr=exatns_tensor_contract("Z136_1(e1,l1,m1,d1)+=S44(e1,d2,m1,l2)*H24(l1,l2,d1,d2)", &
        Z136_1,S44,H24,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z136_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z136_1,"Z136_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z136_1,'ZERO')
    ierr=exatns_tensor_destroy(Z136_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nvir_id/)
    tens_root = (/nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z75_2,"Z75_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z75_2,'ZERO')
!   original expression: Z75_2(l1b|d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|l2b)*-1.
    ierr=exatns_tensor_contract("Z75_2(l1,d1)+=H24(l1,l2,d1,d2)*S43(d2,l2)", &
        Z75_2,H24,S43,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z75_2)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nvir_id/)
    tens_root = (/nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z75_2,"Z75_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z75_2,'ZERO')
    ierr=exatns_tensor_destroy(Z75_2)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z165_2,"Z165_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z165_2,'ZERO')
!   original expression: Z165_2(l1b,l2b|m1b,d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|m1b)
    ierr=exatns_tensor_contract("Z165_2(l1,l2,m1,d1)+=H24(l1,l2,d1,d2)*S43(d2,m1)", &
        Z165_2,H24,S43,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z165_2)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nvir_id/)
    tens_root = (/nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z75_2,"Z75_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z75_2,'ZERO')
!   original expression: Z75_2(l1b|d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|l2b)*-1.
    ierr=exatns_tensor_contract("Z75_2(l1,d1)+=H24(l1,l2,d1,d2)*S43(d2,l2)", &
        Z75_2,H24,S43,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z75_2)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nvir_id/)
    tens_root = (/nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z75_2,"Z75_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z75_2,'ZERO')
    ierr=exatns_tensor_destroy(Z75_2)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z165_2,"Z165_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z165_2,'ZERO')
!   original expression: Z165_2(l1b,l2b|m1b,d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|m1b)
    ierr=exatns_tensor_contract("Z165_2(l1,l2,m1,d1)+=H24(l1,l2,d1,d2)*S43(d2,m1)", &
        Z165_2,H24,S43,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z165_2)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nvir_id/)
    tens_root = (/nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z75_2,"Z75_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z75_2,'ZERO')
!   original expression: Z75_2(l1b|d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|l2b)*-1.
    ierr=exatns_tensor_contract("Z75_2(l1,d1)+=H24(l1,l2,d1,d2)*S43(d2,l2)", &
        Z75_2,H24,S43,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z75_2)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nvir_id/)
    tens_root = (/nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z75_2,"Z75_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z75_2,'ZERO')
    ierr=exatns_tensor_destroy(Z75_2)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z165_2,"Z165_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z165_2,'ZERO')
!   original expression: Z165_2(l1b,l2b|m1b,d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|m1b)
    ierr=exatns_tensor_contract("Z165_2(l1,l2,m1,d1)+=H24(l1,l2,d1,d2)*S43(d2,m1)", &
        Z165_2,H24,S43,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z165_2)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nvir_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root/)
    ierr=exatns_tensor_create(Z72_1,"Z72_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z72_1,'ZERO')
!   original expression: Z72_1(e1b|d1b)+=H17(e1b,l1b|d1b,d2b)*S43(d2b|l1b)
    ierr=exatns_tensor_contract("Z72_1(e1,d1)+=H17(e1,l1,d1,d2)*S43(d2,l1)", &
        Z72_1,H17,S43,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z72_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nvir_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root/)
    ierr=exatns_tensor_create(Z72_1,"Z72_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z72_1,'ZERO')
    ierr=exatns_tensor_destroy(Z72_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nvir_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root/)
    ierr=exatns_tensor_create(Z72_1,"Z72_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z72_1,'ZERO')
!   original expression: Z72_1(e1b|d1b)+=S44(e1b,d2b|l1bl2b)*H24(l1bl2b|d1b,d2b)*-1.
    ierr=exatns_tensor_contract("Z72_1(e1,d1)+=S44(e1,d2,l1,l2)*H24(l1,l2,d1,d2)", &
        Z72_1,S44,H24,prefactor=(-0.5d0,0.0d0))
    ierr=exatns_tensor_destroy(Z72_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nvir_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root/)
    ierr=exatns_tensor_create(Z72_1,"Z72_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z72_1,'ZERO')
    ierr=exatns_tensor_destroy(Z72_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z74_1,"Z74_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z74_1,'ZERO')
!   original expression: Z74_1(l1b|m1b)+=H25(l1b,l2b|m1b,d1b)*S43(d1b|l2b)*-1.
    ierr=exatns_tensor_contract("Z74_1(l1,m1)+=H25(l1,l2,m1,d1)*S43(d1,l2)", &
        Z74_1,H25,S43,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z74_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z74_1,"Z74_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z74_1,'ZERO')
    ierr=exatns_tensor_destroy(Z74_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nvir_id/)
    tens_root = (/nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z75_2,"Z75_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z75_2,'ZERO')
!   original expression: Z75_2(l1b|d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|l2b)*-1.
    ierr=exatns_tensor_contract("Z75_2(l1,d1)+=H24(l1,l2,d1,d2)*S43(d2,l2)", &
        Z75_2,H24,S43,prefactor=(-1.0d0,0.0d0))
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z74_1,"Z74_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z74_1,'ZERO')
!   original expression: Z74_1(l1b|m1b)+=S43(d1b|m1b)*Z75_2(l1b|d1b)
    ierr=exatns_tensor_contract("Z74_1(l1,m1)+=S43(d1,m1)*Z75_2(l1,d1)", &
        Z74_1,S43,Z75_2,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z75_2)
    ierr=exatns_tensor_destroy(Z74_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nvir_id/)
    tens_root = (/nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z75_2,"Z75_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z75_2,'ZERO')
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z74_1,"Z74_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z74_1,'ZERO')
!   original expression: Z74_1(l1b|m1b)+=S43(d1b|m1b)*Z75_2(l1b|d1b)
    ierr=exatns_tensor_contract("Z74_1(l1,m1)+=S43(d1,m1)*Z75_2(l1,d1)", &
        Z74_1,S43,Z75_2,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z75_2)
    ierr=exatns_tensor_destroy(Z74_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z74_1,"Z74_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z74_1,'ZERO')
!   original expression: Z74_1(l1b|m1b)+=S43(d1b|m1b)*H15(l1b|d1b)*-1.
    ierr=exatns_tensor_contract("Z74_1(l1,m1)+=S43(d1,m1)*H15(l1,d1)", &
        Z74_1,S43,H15,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z74_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z74_1,"Z74_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z74_1,'ZERO')
!   original expression: Z74_1(l1b|m1b)+=S44(d1bd2b|m1b,l2b)*H24(l1b,l2b|d1bd2b)*-1.
    ierr=exatns_tensor_contract("Z74_1(l1,m1)+=S44(d1,d2,m1,l2)*H24(l1,l2,d1,d2)", &
        Z74_1,S44,H24,prefactor=(-0.5d0,0.0d0))
    ierr=exatns_tensor_destroy(Z74_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z74_1,"Z74_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z74_1,'ZERO')
    ierr=exatns_tensor_destroy(Z74_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z136_1,"Z136_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z136_1,'ZERO')
!   original expression: Z136_1(e1b,l1b|m1b,d1b)+=H17(e1b,l1b|d1b,d2b)*S43(d2b|m1b)*-1.
    ierr=exatns_tensor_contract("Z136_1(e1,l1,m1,d1)+=H17(e1,l1,d1,d2)*S43(d2,m1)", &
        Z136_1,H17,S43,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z136_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z136_1,"Z136_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z136_1,'ZERO')
!   original expression: Z136_1(e1b,l1b|m1b,d1b)+=S44(e1b,d2b|m1b,l2b)*H24(l1b,l2b|d1b,d2b)
    ierr=exatns_tensor_contract("Z136_1(e1,l1,m1,d1)+=S44(e1,d2,m1,l2)*H24(l1,l2,d1,d2)", &
        Z136_1,S44,H24,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z136_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z136_1,"Z136_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z136_1,'ZERO')
    ierr=exatns_tensor_destroy(Z136_1)



    ierr=exatns_tensor_destroy(one_tensor)
end subroutine generic_exatensor_codegen_call
