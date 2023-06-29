!   
!    Outputting ExaTensor-based Fortran code generated with :
!      Codegen, a toolset to process tensor contraction DSLs (SIAL etc)
!      Andre Gomes (CNRS UMR8523, Lille) and Dmitry Lyakh (OLCF/Oak Ridge, NVIDIA)
!   
subroutine generic_exatensor_codegen_call(nocc_id,nvir_id,nocc_root,nvir_root, &
    S23, &
    H13, &
    H3, &
    H2, &
    H14, &
    H1, &
    H9, &
    H10, &
    Z26, &
    Z27)


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
    type(tens_rcrsv_t), intent(inout) :: S23    !       VVOO
    type(tens_rcrsv_t), intent(inout) :: H13    !       OOVV
    type(tens_rcrsv_t), intent(inout) :: H3    !       VVOO
    type(tens_rcrsv_t), intent(inout) :: H2    !       VVVV
    type(tens_rcrsv_t), intent(inout) :: H14    !       OOOO
    type(tens_rcrsv_t), intent(inout) :: H1    !       VV
    type(tens_rcrsv_t), intent(inout) :: H9    !       OO
    type(tens_rcrsv_t), intent(inout) :: H10    !       VOOV
    type(tens_rcrsv_t), intent(inout) :: Z26    !       UnitTensor
    type(tens_rcrsv_t), intent(inout) :: Z27    !       VVOO
    type(tens_rcrsv_t) :: Z33_1    !       OOOO
    type(tens_rcrsv_t) :: Z30_1    !       VV
    type(tens_rcrsv_t) :: Z32_1    !       OO
    type(tens_rcrsv_t) :: Z37_1    !       VOOV


! always define one_tensor to use in additions via calls to contraction
    ierr=exatns_tensor_create(one_tensor,"autokern_one_tensor",EXA_DATA_KIND_C8)
    ierr=exatns_tensor_init(one_tensor,ONE)
!   original expression: Z26(|)+=S23(d1bd2b|l1bl2b)*H13(l1bl2b|d1bd2b)
    ierr=exatns_tensor_contract("Z26()+=S23(d1,d2,l1,l2)*H13(l1,l2,d1,d2)", &
        Z26,S23,H13,prefactor=(0.25d0,0.0d0))
!   original expression: Z27(e1be2b|m1bm2b)+=H3(e1be2b|m1bm2b)
    ierr=exatns_tensor_contract("Z27(e1,e2,m1,m2)+=H3(e1,e2,m1,m2)*K()", &
        Z27,H3,one_tensor,prefactor=(1.0d0,0.0d0))
!   original expression: Z27(e1be2b|m1bm2b)+=H2(e1be2b|d1bd2b)*S23(d1bd2b|m1bm2b)
    ierr=exatns_tensor_contract("Z27(e1,e2,m1,m2)+=H2(e1,e2,d1,d2)*S23(d1,d2,m1,m2)", &
        Z27,H2,S23,prefactor=(0.5d0,0.0d0))
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z33_1,"Z33_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z33_1,'ZERO')
!   original expression: Z33_1(l1bl2b|m1bm2b)+=S23(d1bd2b|m1bm2b)*H13(l1bl2b|d1bd2b)
    ierr=exatns_tensor_contract("Z33_1(l1,l2,m1,m2)+=S23(d1,d2,m1,m2)*H13(l1,l2,d1,d2)", &
        Z33_1,S23,H13,prefactor=(0.5d0,0.0d0))
!   original expression: Z27(e1be2b|m1bm2b)+=S23(e1be2b|l1bl2b)*Z33_1(l1bl2b|m1bm2b)
    ierr=exatns_tensor_contract("Z27(e1,e2,m1,m2)+=S23(e1,e2,l1,l2)*Z33_1(l1,l2,m1,m2)", &
        Z27,S23,Z33_1,prefactor=(0.5d0,0.0d0))
    ierr=exatns_tensor_destroy(Z33_1)
!   original expression: Z27(e1be2b|m1bm2b)+=S23(e1be2b|l1bl2b)*H14(l1bl2b|m1bm2b)
    ierr=exatns_tensor_contract("Z27(e1,e2,m1,m2)+=S23(e1,e2,l1,l2)*H14(l1,l2,m1,m2)", &
        Z27,S23,H14,prefactor=(0.5d0,0.0d0))
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nvir_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root/)
    ierr=exatns_tensor_create(Z30_1,"Z30_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z30_1,'ZERO')
!   original expression: Z30_1(e1b|d1b)+=S23(e1b,d2b|l1bl2b)*H13(l1bl2b|d1b,d2b)*-1.
    ierr=exatns_tensor_contract("Z30_1(e1,d1)+=S23(e1,d2,l1,l2)*H13(l1,l2,d1,d2)", &
        Z30_1,S23,H13,prefactor=(-0.5d0,0.0d0))
!   original expression: Z27(e1be2b|m1bm2b)+=S23(e1b,d1b|m1bm2b)*Z30_1(e2b|d1b)
    ierr=exatns_tensor_contract("Z27(e1,e2,m1,m2)+=S23(e1,d1,m1,m2)*Z30_1(e2,d1)", &
        Z27,S23,Z30_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z27(e1be2b|m1bm2b)+=S23(e2b,d1b|m1bm2b)*Z30_1(e1b|d1b)*-1.
    ierr=exatns_tensor_contract("Z27(e1,e2,m1,m2)+=S23(e2,d1,m1,m2)*Z30_1(e1,d1)", &
        Z27,S23,Z30_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z30_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nvir_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root/)
    ierr=exatns_tensor_create(Z30_1,"Z30_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z30_1,'ZERO')
!   original expression: Z27(e1be2b|m1bm2b)+=S23(e1b,d1b|m1bm2b)*Z30_1(e2b|d1b)
    ierr=exatns_tensor_contract("Z27(e1,e2,m1,m2)+=S23(e1,d1,m1,m2)*Z30_1(e2,d1)", &
        Z27,S23,Z30_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z27(e1be2b|m1bm2b)+=S23(e2b,d1b|m1bm2b)*Z30_1(e1b|d1b)*-1.
    ierr=exatns_tensor_contract("Z27(e1,e2,m1,m2)+=S23(e2,d1,m1,m2)*Z30_1(e1,d1)", &
        Z27,S23,Z30_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z30_1)
!   original expression: Z27(e1be2b|m1bm2b)+=S23(e1b,d1b|m1bm2b)*H1(e2b|d1b)
    ierr=exatns_tensor_contract("Z27(e1,e2,m1,m2)+=S23(e1,d1,m1,m2)*H1(e2,d1)", &
        Z27,S23,H1,prefactor=(1.0d0,0.0d0))
!   original expression: Z27(e1be2b|m1bm2b)+=S23(e2b,d1b|m1bm2b)*H1(e1b|d1b)*-1.
    ierr=exatns_tensor_contract("Z27(e1,e2,m1,m2)+=S23(e2,d1,m1,m2)*H1(e1,d1)", &
        Z27,S23,H1,prefactor=(-1.0d0,0.0d0))
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z32_1,"Z32_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z32_1,'ZERO')
!   original expression: Z32_1(l1b|m1b)+=S23(d1bd2b|m1b,l2b)*H13(l1b,l2b|d1bd2b)*-1.
    ierr=exatns_tensor_contract("Z32_1(l1,m1)+=S23(d1,d2,m1,l2)*H13(l1,l2,d1,d2)", &
        Z32_1,S23,H13,prefactor=(-0.5d0,0.0d0))
!   original expression: Z27(e1be2b|m1bm2b)+=S23(e1be2b|m1b,l1b)*Z32_1(l1b|m2b)
    ierr=exatns_tensor_contract("Z27(e1,e2,m1,m2)+=S23(e1,e2,m1,l1)*Z32_1(l1,m2)", &
        Z27,S23,Z32_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z27(e1be2b|m1bm2b)+=S23(e1be2b|m2b,l1b)*Z32_1(l1b|m1b)*-1.
    ierr=exatns_tensor_contract("Z27(e1,e2,m1,m2)+=S23(e1,e2,m2,l1)*Z32_1(l1,m1)", &
        Z27,S23,Z32_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z32_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z32_1,"Z32_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z32_1,'ZERO')
!   original expression: Z27(e1be2b|m1bm2b)+=S23(e1be2b|m1b,l1b)*Z32_1(l1b|m2b)
    ierr=exatns_tensor_contract("Z27(e1,e2,m1,m2)+=S23(e1,e2,m1,l1)*Z32_1(l1,m2)", &
        Z27,S23,Z32_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z27(e1be2b|m1bm2b)+=S23(e1be2b|m2b,l1b)*Z32_1(l1b|m1b)*-1.
    ierr=exatns_tensor_contract("Z27(e1,e2,m1,m2)+=S23(e1,e2,m2,l1)*Z32_1(l1,m1)", &
        Z27,S23,Z32_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z32_1)
!   original expression: Z27(e1be2b|m1bm2b)+=S23(e1be2b|m1b,l1b)*H9(l1b|m2b)*-1.
    ierr=exatns_tensor_contract("Z27(e1,e2,m1,m2)+=S23(e1,e2,m1,l1)*H9(l1,m2)", &
        Z27,S23,H9,prefactor=(-1.0d0,0.0d0))
!   original expression: Z27(e1be2b|m1bm2b)+=S23(e1be2b|m2b,l1b)*H9(l1b|m1b)
    ierr=exatns_tensor_contract("Z27(e1,e2,m1,m2)+=S23(e1,e2,m2,l1)*H9(l1,m1)", &
        Z27,S23,H9,prefactor=(1.0d0,0.0d0))
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z37_1,"Z37_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z37_1,'ZERO')
!   original expression: Z37_1(e1b,l1b|m1b,d1b)+=S23(e1b,d2b|m1b,l2b)*H13(l1b,l2b|d1b,d2b)*0.5
    ierr=exatns_tensor_contract("Z37_1(e1,l1,m1,d1)+=S23(e1,d2,m1,l2)*H13(l1,l2,d1,d2)", &
        Z37_1,S23,H13,prefactor=(0.5d0,0.0d0))
!   original expression: Z27(e1be2b|m1bm2b)+=S23(e1b,d1b|m1b,l1b)*Z37_1(e2b,l1b|m2b,d1b)
    ierr=exatns_tensor_contract("Z27(e1,e2,m1,m2)+=S23(e1,d1,m1,l1)*Z37_1(e2,l1,m2,d1)", &
        Z27,S23,Z37_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z27(e1be2b|m1bm2b)+=S23(e2b,d1b|m1b,l1b)*Z37_1(e1b,l1b|m2b,d1b)*-1.
    ierr=exatns_tensor_contract("Z27(e1,e2,m1,m2)+=S23(e2,d1,m1,l1)*Z37_1(e1,l1,m2,d1)", &
        Z27,S23,Z37_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z27(e1be2b|m1bm2b)+=S23(e1b,d1b|m2b,l1b)*Z37_1(e2b,l1b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z27(e1,e2,m1,m2)+=S23(e1,d1,m2,l1)*Z37_1(e2,l1,m1,d1)", &
        Z27,S23,Z37_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z27(e1be2b|m1bm2b)+=S23(e2b,d1b|m2b,l1b)*Z37_1(e1b,l1b|m1b,d1b)
    ierr=exatns_tensor_contract("Z27(e1,e2,m1,m2)+=S23(e2,d1,m2,l1)*Z37_1(e1,l1,m1,d1)", &
        Z27,S23,Z37_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z37_1)
!   original expression: Z27(e1be2b|m1bm2b)+=S23(e1b,d1b|m1b,l1b)*H10(e2b,l1b|m2b,d1b)
    ierr=exatns_tensor_contract("Z27(e1,e2,m1,m2)+=S23(e1,d1,m1,l1)*H10(e2,l1,m2,d1)", &
        Z27,S23,H10,prefactor=(1.0d0,0.0d0))
!   original expression: Z27(e1be2b|m1bm2b)+=S23(e2b,d1b|m1b,l1b)*H10(e1b,l1b|m2b,d1b)*-1.
    ierr=exatns_tensor_contract("Z27(e1,e2,m1,m2)+=S23(e2,d1,m1,l1)*H10(e1,l1,m2,d1)", &
        Z27,S23,H10,prefactor=(-1.0d0,0.0d0))
!   original expression: Z27(e1be2b|m1bm2b)+=S23(e1b,d1b|m2b,l1b)*H10(e2b,l1b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z27(e1,e2,m1,m2)+=S23(e1,d1,m2,l1)*H10(e2,l1,m1,d1)", &
        Z27,S23,H10,prefactor=(-1.0d0,0.0d0))
!   original expression: Z27(e1be2b|m1bm2b)+=S23(e2b,d1b|m2b,l1b)*H10(e1b,l1b|m1b,d1b)
    ierr=exatns_tensor_contract("Z27(e1,e2,m1,m2)+=S23(e2,d1,m2,l1)*H10(e1,l1,m1,d1)", &
        Z27,S23,H10,prefactor=(1.0d0,0.0d0))
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nvir_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root/)
    ierr=exatns_tensor_create(Z30_1,"Z30_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z30_1,'ZERO')
!   original expression: Z30_1(e1b|d1b)+=S23(e1b,d2b|l1bl2b)*H13(l1bl2b|d1b,d2b)*-1.
    ierr=exatns_tensor_contract("Z30_1(e1,d1)+=S23(e1,d2,l1,l2)*H13(l1,l2,d1,d2)", &
        Z30_1,S23,H13,prefactor=(-0.5d0,0.0d0))
    ierr=exatns_tensor_destroy(Z30_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nvir_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root/)
    ierr=exatns_tensor_create(Z30_1,"Z30_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z30_1,'ZERO')
    ierr=exatns_tensor_destroy(Z30_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z32_1,"Z32_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z32_1,'ZERO')
!   original expression: Z32_1(l1b|m1b)+=S23(d1bd2b|m1b,l2b)*H13(l1b,l2b|d1bd2b)*-1.
    ierr=exatns_tensor_contract("Z32_1(l1,m1)+=S23(d1,d2,m1,l2)*H13(l1,l2,d1,d2)", &
        Z32_1,S23,H13,prefactor=(-0.5d0,0.0d0))
    ierr=exatns_tensor_destroy(Z32_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z32_1,"Z32_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z32_1,'ZERO')
    ierr=exatns_tensor_destroy(Z32_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z37_1,"Z37_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z37_1,'ZERO')
!   original expression: Z37_1(e1b,l1b|m1b,d1b)+=S23(e1b,d2b|m1b,l2b)*H13(l1b,l2b|d1b,d2b)
    ierr=exatns_tensor_contract("Z37_1(e1,l1,m1,d1)+=S23(e1,d2,m1,l2)*H13(l1,l2,d1,d2)", &
        Z37_1,S23,H13,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z37_1)



    ierr=exatns_tensor_destroy(one_tensor)
end subroutine generic_exatensor_codegen_call
