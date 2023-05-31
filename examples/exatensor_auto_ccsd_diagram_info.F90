!   
!    Outputting ExaTensor-based Fortran code generated with :
!      Codegen, a toolset to process tensor contraction DSLs (SIAL etc)
!      Andre Gomes (CNRS UMR8523, Lille) and Dmitry Lyakh (OLCF/Oak Ridge, NVIDIA)
!   
subroutine generic_exatensor_codegen_call(nocc_id,nvir_id,nocc_root,nvir_root, &
    H24, &
    S43, &
    H15, &
    H36, &
    S45, &
    H40, &
    H27, &
    S44, &
    S46, &
    S47, &
    H2, &
    H1, &
    H17, &
    H29, &
    H18, &
    H30, &
    H25, &
    H37, &
    H16, &
    H7, &
    H6, &
    H20, &
    H33, &
    H22, &
    H34, &
    H38, &
    H41, &
    H28, &
    H5, &
    H3, &
    H19, &
    H4, &
    H26, &
    H11, &
    H8, &
    H32, &
    H23, &
    H9, &
    H10, &
    H21, &
    H39, &
    H31, &
    H14, &
    H12, &
    H35, &
    H13, &
    H42, &
    Z48, &
    Z49, &
    Z51, &
    Z50, &
    Z52, &
    Z53)


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
    type(tens_rcrsv_t), intent(inout) :: H36    !       OOVV
    type(tens_rcrsv_t), intent(inout) :: S45    !       VO
    type(tens_rcrsv_t), intent(inout) :: H40    !       OOVV
    type(tens_rcrsv_t), intent(inout) :: H27    !       OV
    type(tens_rcrsv_t), intent(inout) :: S44    !       VVOO
    type(tens_rcrsv_t), intent(inout) :: S46    !       VVOO
    type(tens_rcrsv_t), intent(inout) :: S47    !       VVOO
    type(tens_rcrsv_t), intent(inout) :: H2    !       VO
    type(tens_rcrsv_t), intent(inout) :: H1    !       VV
    type(tens_rcrsv_t), intent(inout) :: H17    !       VOVV
    type(tens_rcrsv_t), intent(inout) :: H29    !       VOVV
    type(tens_rcrsv_t), intent(inout) :: H18    !       VOOV
    type(tens_rcrsv_t), intent(inout) :: H30    !       VOOV
    type(tens_rcrsv_t), intent(inout) :: H25    !       OOOV
    type(tens_rcrsv_t), intent(inout) :: H37    !       OOOV
    type(tens_rcrsv_t), intent(inout) :: H16    !       OO
    type(tens_rcrsv_t), intent(inout) :: H7    !       VO
    type(tens_rcrsv_t), intent(inout) :: H6    !       VV
    type(tens_rcrsv_t), intent(inout) :: H20    !       VOVV
    type(tens_rcrsv_t), intent(inout) :: H33    !       VOVV
    type(tens_rcrsv_t), intent(inout) :: H22    !       VOOV
    type(tens_rcrsv_t), intent(inout) :: H34    !       VOOV
    type(tens_rcrsv_t), intent(inout) :: H38    !       OOOV
    type(tens_rcrsv_t), intent(inout) :: H41    !       OOOV
    type(tens_rcrsv_t), intent(inout) :: H28    !       OO
    type(tens_rcrsv_t), intent(inout) :: H5    !       VVOO
    type(tens_rcrsv_t), intent(inout) :: H3    !       VVVV
    type(tens_rcrsv_t), intent(inout) :: H19    !       VOOO
    type(tens_rcrsv_t), intent(inout) :: H4    !       VVOV
    type(tens_rcrsv_t), intent(inout) :: H26    !       OOOO
    type(tens_rcrsv_t), intent(inout) :: H11    !       VVOO
    type(tens_rcrsv_t), intent(inout) :: H8    !       VVVV
    type(tens_rcrsv_t), intent(inout) :: H32    !       VOOO
    type(tens_rcrsv_t), intent(inout) :: H23    !       VOOO
    type(tens_rcrsv_t), intent(inout) :: H9    !       VVOV
    type(tens_rcrsv_t), intent(inout) :: H10    !       VVOV
    type(tens_rcrsv_t), intent(inout) :: H21    !       VOOV
    type(tens_rcrsv_t), intent(inout) :: H39    !       OOOO
    type(tens_rcrsv_t), intent(inout) :: H31    !       VOOV
    type(tens_rcrsv_t), intent(inout) :: H14    !       VVOO
    type(tens_rcrsv_t), intent(inout) :: H12    !       VVVV
    type(tens_rcrsv_t), intent(inout) :: H35    !       VOOO
    type(tens_rcrsv_t), intent(inout) :: H13    !       VVOV
    type(tens_rcrsv_t), intent(inout) :: H42    !       OOOO
    type(tens_rcrsv_t), intent(inout) :: Z48    !       UnitTensor
    type(tens_rcrsv_t), intent(inout) :: Z49    !       VO
    type(tens_rcrsv_t), intent(inout) :: Z51    !       VO
    type(tens_rcrsv_t), intent(inout) :: Z50    !       VVOO
    type(tens_rcrsv_t), intent(inout) :: Z52    !       VVOO
    type(tens_rcrsv_t), intent(inout) :: Z53    !       VVOO
    type(tens_rcrsv_t) :: Z57_1    !       OV
    type(tens_rcrsv_t) :: Z60_1    !       OV
    type(tens_rcrsv_t) :: Z56_1    !       OO
    type(tens_rcrsv_t) :: Z57_2    !       OV
    type(tens_rcrsv_t) :: Z54_1    !       VV
    type(tens_rcrsv_t) :: Z72_1    !       OOOV
    type(tens_rcrsv_t) :: Z74_1    !       OOOV
    type(tens_rcrsv_t) :: Z59_1    !       OO
    type(tens_rcrsv_t) :: Z60_2    !       OV
    type(tens_rcrsv_t) :: Z55_1    !       VV
    type(tens_rcrsv_t) :: Z75_1    !       OOOV
    type(tens_rcrsv_t) :: Z76_1    !       OOOV
    type(tens_rcrsv_t) :: Z63_1    !       VOOO
    type(tens_rcrsv_t) :: Z70_2    !       OOOO
    type(tens_rcrsv_t) :: Z83_3    !       OOOV
    type(tens_rcrsv_t) :: Z77_2    !       VOOV
    type(tens_rcrsv_t) :: Z83_2    !       OOOV
    type(tens_rcrsv_t) :: Z84_2    !       OOOV
    type(tens_rcrsv_t) :: Z65_1    !       VVOV
    type(tens_rcrsv_t) :: Z58_1    !       OOOO
    type(tens_rcrsv_t) :: Z72_2    !       OOOV
    type(tens_rcrsv_t) :: Z77_1    !       VOOV
    type(tens_rcrsv_t) :: Z78_1    !       VOOV
    type(tens_rcrsv_t) :: Z66_1    !       VOOO
    type(tens_rcrsv_t) :: Z80_2    !       VOOV
    type(tens_rcrsv_t) :: Z85_2    !       OOOV
    type(tens_rcrsv_t) :: Z64_1    !       VOOO
    type(tens_rcrsv_t) :: Z71_2    !       OOOO
    type(tens_rcrsv_t) :: Z84_3    !       OOOV
    type(tens_rcrsv_t) :: Z78_2    !       VOOV
    type(tens_rcrsv_t) :: Z86_2    !       OOOV
    type(tens_rcrsv_t) :: Z68_1    !       VVOV
    type(tens_rcrsv_t) :: Z61_1    !       OOOO
    type(tens_rcrsv_t) :: Z74_2    !       OOOV
    type(tens_rcrsv_t) :: Z81_1    !       VOOV
    type(tens_rcrsv_t) :: Z82_1    !       VOOV
    type(tens_rcrsv_t) :: Z80_1    !       VOOV
    type(tens_rcrsv_t) :: Z79_1    !       VOOV
    type(tens_rcrsv_t) :: Z67_1    !       VOOO
    type(tens_rcrsv_t) :: Z73_2    !       OOOO
    type(tens_rcrsv_t) :: Z86_3    !       OOOV
    type(tens_rcrsv_t) :: Z82_2    !       VOOV
    type(tens_rcrsv_t) :: Z69_1    !       VVOV
    type(tens_rcrsv_t) :: Z62_1    !       OOOO
    type(tens_rcrsv_t) :: Z76_2    !       OOOV


! always define one_tensor to use in additions via calls to contraction
    ierr=exatns_tensor_create(one_tensor,"autokern_one_tensor",EXA_DATA_KIND_C8)
    ierr=exatns_tensor_init(one_tensor,ONE)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nvir_id/)
    tens_root = (/nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z57_1,"Z57_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z57_1,'ZERO')
!   original expression: Z57_1(l1b|d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|l2b)*0.5
    ierr=exatns_tensor_contract("Z57_1(l1b,d1b)+=H24(l1b,l2b,d1b,d2b)*S43(d2b,l2b)", &
        Z57_1,H24,S43,prefactor=(0.5d0,0.0d0))
!   original expression: Z48(|)+=S43(d1b|l1b)*Z57_1(l1b|d1b)
    ierr=exatns_tensor_contract("Z48()+=S43(d1b,l1b)*Z57_1(l1b,d1b)", &
        Z48,S43,Z57_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z57_1)
!   original expression: Z48(|)+=S43(d1b|l1b)*H15(l1b|d1b)
    ierr=exatns_tensor_contract("Z48()+=S43(d1b,l1b)*H15(l1b,d1b)", &
        Z48,S43,H15,prefactor=(1.0d0,0.0d0))
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nvir_id/)
    tens_root = (/nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z60_1,"Z60_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z60_1,'ZERO')
!   original expression: Z60_1(l1a|d1a)+=H36(l1b,l1a|d1b,d1a)*S43(d1b|l1b)
    ierr=exatns_tensor_contract("Z60_1(l1a,d1a)+=H36(l1b,l1a,d1b,d1a)*S43(d1b,l1b)", &
        Z60_1,H36,S43,prefactor=(1.0d0,0.0d0))
!   original expression: Z48(|)+=S45(d1a|l1a)*Z60_1(l1a|d1a)
    ierr=exatns_tensor_contract("Z48()+=S45(d1a,l1a)*Z60_1(l1a,d1a)", &
        Z48,S45,Z60_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z60_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nvir_id/)
    tens_root = (/nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z60_1,"Z60_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z60_1,'ZERO')
!   original expression: Z60_1(l1a|d1a)+=H40(l1a,l2a|d1a,d2a)*S45(d2a|l2a)*0.5
    ierr=exatns_tensor_contract("Z60_1(l1a,d1a)+=H40(l1a,l2a,d1a,d2a)*S45(d2a,l2a)", &
        Z60_1,H40,S45,prefactor=(0.5d0,0.0d0))
!   original expression: Z48(|)+=S45(d1a|l1a)*Z60_1(l1a|d1a)
    ierr=exatns_tensor_contract("Z48()+=S45(d1a,l1a)*Z60_1(l1a,d1a)", &
        Z48,S45,Z60_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z60_1)
!   original expression: Z48(|)+=S45(d1a|l1a)*H27(l1a|d1a)
    ierr=exatns_tensor_contract("Z48()+=S45(d1a,l1a)*H27(l1a,d1a)", &
        Z48,S45,H27,prefactor=(1.0d0,0.0d0))
!   original expression: Z48(|)+=S44(d1bd2b|l1bl2b)*H24(l1bl2b|d1bd2b)
    ierr=exatns_tensor_contract("Z48()+=S44(d1b,d2b,l1b,l2b)*H24(l1b,l2b,d1b,d2b)", &
        Z48,S44,H24,prefactor=(0.25d0,0.0d0))
!   original expression: Z48(|)+=S46(d1ad1b|l1al1b)*H36(l1al1b|d1ad1b)
    ierr=exatns_tensor_contract("Z48()+=S46(d1a,d1b,l1a,l1b)*H36(l1a,l1b,d1a,d1b)", &
        Z48,S46,H36,prefactor=(0.25d0,0.0d0))
!   original expression: Z48(|)+=S47(d1ad2a|l1al2a)*H40(l1al2a|d1ad2a)
    ierr=exatns_tensor_contract("Z48()+=S47(d1a,d2a,l1a,l2a)*H40(l1a,l2a,d1a,d2a)", &
        Z48,S47,H40,prefactor=(0.25d0,0.0d0))
!   original expression: Z49(e1b|m1b)+=H2(e1b|m1b)
    ierr=exatns_tensor_contract("Z49(e1b,m1b)+=H2(e1b,m1b)*K()", &
        Z49,H2,one_tensor,prefactor=(1.0d0,0.0d0))
!   original expression: Z49(e1b|m1b)+=H1(e1b|d1b)*S43(d1b|m1b)
    ierr=exatns_tensor_contract("Z49(e1b,m1b)+=H1(e1b,d1b)*S43(d1b,m1b)", &
        Z49,H1,S43,prefactor=(1.0d0,0.0d0))
!   original expression: Z49(e1b|m1b)+=H17(e1b,l1b|d1bd2b)*S44(d1bd2b|m1b,l1b)
    ierr=exatns_tensor_contract("Z49(e1b,m1b)+=H17(e1b,l1b,d1b,d2b)*S44(d1b,d2b,m1b,l1b)", &
        Z49,H17,S44,prefactor=(0.5d0,0.0d0))
!   original expression: Z49(e1b|m1b)+=H29(e1b,l1a|d1ad1b)*S46(d1ad1b|m1b,l1a)
    ierr=exatns_tensor_contract("Z49(e1b,m1b)+=H29(e1b,l1a,d1a,d1b)*S46(d1a,d1b,m1b,l1a)", &
        Z49,H29,S46,prefactor=(0.5d0,0.0d0))
!   original expression: Z49(e1b|m1b)+=H18(e1b,l1b|m1b,d1b)*S43(d1b|l1b)
    ierr=exatns_tensor_contract("Z49(e1b,m1b)+=H18(e1b,l1b,m1b,d1b)*S43(d1b,l1b)", &
        Z49,H18,S43,prefactor=(1.0d0,0.0d0))
!   original expression: Z49(e1b|m1b)+=H30(e1b,l1a|m1b,d1a)*S45(d1a|l1a)
    ierr=exatns_tensor_contract("Z49(e1b,m1b)+=H30(e1b,l1a,m1b,d1a)*S45(d1a,l1a)", &
        Z49,H30,S45,prefactor=(1.0d0,0.0d0))
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z56_1,"Z56_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z56_1,'ZERO')
!   original expression: Z56_1(l1b|m1b)+=H25(l1b,l2b|m1b,d1b)*S43(d1b|l2b)*-1.
    ierr=exatns_tensor_contract("Z56_1(l1b,m1b)+=H25(l1b,l2b,m1b,d1b)*S43(d1b,l2b)", &
        Z56_1,H25,S43,prefactor=(-1.0d0,0.0d0))
!   original expression: Z49(e1b|m1b)+=S43(e1b|l1b)*Z56_1(l1b|m1b)
    ierr=exatns_tensor_contract("Z49(e1b,m1b)+=S43(e1b,l1b)*Z56_1(l1b,m1b)", &
        Z49,S43,Z56_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z56_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z56_1,"Z56_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z56_1,'ZERO')
!   original expression: Z56_1(l1b|m1b)+=H37(l1b,l1a|m1b,d1a)*S45(d1a|l1a)*-1.
    ierr=exatns_tensor_contract("Z56_1(l1b,m1b)+=H37(l1b,l1a,m1b,d1a)*S45(d1a,l1a)", &
        Z56_1,H37,S45,prefactor=(-1.0d0,0.0d0))
!   original expression: Z49(e1b|m1b)+=S43(e1b|l1b)*Z56_1(l1b|m1b)
    ierr=exatns_tensor_contract("Z49(e1b,m1b)+=S43(e1b,l1b)*Z56_1(l1b,m1b)", &
        Z49,S43,Z56_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z56_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nvir_id/)
    tens_root = (/nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z57_2,"Z57_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z57_2,'ZERO')
!   original expression: Z57_2(l1b|d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|l2b)*-1.
    ierr=exatns_tensor_contract("Z57_2(l1b,d1b)+=H24(l1b,l2b,d1b,d2b)*S43(d2b,l2b)", &
        Z57_2,H24,S43,prefactor=(-1.0d0,0.0d0))
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z56_1,"Z56_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z56_1,'ZERO')
!   original expression: Z56_1(l1b|m1b)+=S43(d1b|m1b)*Z57_2(l1b|d1b)
    ierr=exatns_tensor_contract("Z56_1(l1b,m1b)+=S43(d1b,m1b)*Z57_2(l1b,d1b)", &
        Z56_1,S43,Z57_2,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z57_2)
!   original expression: Z49(e1b|m1b)+=S43(e1b|l1b)*Z56_1(l1b|m1b)
    ierr=exatns_tensor_contract("Z49(e1b,m1b)+=S43(e1b,l1b)*Z56_1(l1b,m1b)", &
        Z49,S43,Z56_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z56_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nvir_id/)
    tens_root = (/nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z57_2,"Z57_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z57_2,'ZERO')
!   original expression: Z57_2(l1b|d1b)+=H36(l1b,l1a|d1b,d1a)*S45(d1a|l1a)*-1.
    ierr=exatns_tensor_contract("Z57_2(l1b,d1b)+=H36(l1b,l1a,d1b,d1a)*S45(d1a,l1a)", &
        Z57_2,H36,S45,prefactor=(-1.0d0,0.0d0))
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z56_1,"Z56_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z56_1,'ZERO')
!   original expression: Z56_1(l1b|m1b)+=S43(d1b|m1b)*Z57_2(l1b|d1b)
    ierr=exatns_tensor_contract("Z56_1(l1b,m1b)+=S43(d1b,m1b)*Z57_2(l1b,d1b)", &
        Z56_1,S43,Z57_2,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z57_2)
!   original expression: Z49(e1b|m1b)+=S43(e1b|l1b)*Z56_1(l1b|m1b)
    ierr=exatns_tensor_contract("Z49(e1b,m1b)+=S43(e1b,l1b)*Z56_1(l1b,m1b)", &
        Z49,S43,Z56_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z56_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z56_1,"Z56_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z56_1,'ZERO')
!   original expression: Z56_1(l1b|m1b)+=S43(d1b|m1b)*H15(l1b|d1b)*-1.
    ierr=exatns_tensor_contract("Z56_1(l1b,m1b)+=S43(d1b,m1b)*H15(l1b,d1b)", &
        Z56_1,S43,H15,prefactor=(-1.0d0,0.0d0))
!   original expression: Z49(e1b|m1b)+=S43(e1b|l1b)*Z56_1(l1b|m1b)
    ierr=exatns_tensor_contract("Z49(e1b,m1b)+=S43(e1b,l1b)*Z56_1(l1b,m1b)", &
        Z49,S43,Z56_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z56_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z56_1,"Z56_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z56_1,'ZERO')
!   original expression: Z56_1(l1b|m1b)+=S44(d1bd2b|m1b,l2b)*H24(l1b,l2b|d1bd2b)*-1.
    ierr=exatns_tensor_contract("Z56_1(l1b,m1b)+=S44(d1b,d2b,m1b,l2b)*H24(l1b,l2b,d1b,d2b)", &
        Z56_1,S44,H24,prefactor=(-0.5d0,0.0d0))
!   original expression: Z49(e1b|m1b)+=S43(e1b|l1b)*Z56_1(l1b|m1b)
    ierr=exatns_tensor_contract("Z49(e1b,m1b)+=S43(e1b,l1b)*Z56_1(l1b,m1b)", &
        Z49,S43,Z56_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z56_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z56_1,"Z56_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z56_1,'ZERO')
!   original expression: Z56_1(l1b|m1b)+=S46(d1ad1b|m1b,l1a)*H36(l1b,l1a|d1ad1b)*-1.
    ierr=exatns_tensor_contract("Z56_1(l1b,m1b)+=S46(d1a,d1b,m1b,l1a)*H36(l1b,l1a,d1a,d1b)", &
        Z56_1,S46,H36,prefactor=(-0.5d0,0.0d0))
!   original expression: Z49(e1b|m1b)+=S43(e1b|l1b)*Z56_1(l1b|m1b)
    ierr=exatns_tensor_contract("Z49(e1b,m1b)+=S43(e1b,l1b)*Z56_1(l1b,m1b)", &
        Z49,S43,Z56_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z56_1)
!   original expression: Z49(e1b|m1b)+=S43(e1b|l1b)*H16(l1b|m1b)*-1.
    ierr=exatns_tensor_contract("Z49(e1b,m1b)+=S43(e1b,l1b)*H16(l1b,m1b)", &
        Z49,S43,H16,prefactor=(-1.0d0,0.0d0))
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nvir_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root/)
    ierr=exatns_tensor_create(Z54_1,"Z54_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z54_1,'ZERO')
!   original expression: Z54_1(e1b|d1b)+=H17(e1b,l1b|d1b,d2b)*S43(d2b|l1b)
    ierr=exatns_tensor_contract("Z54_1(e1b,d1b)+=H17(e1b,l1b,d1b,d2b)*S43(d2b,l1b)", &
        Z54_1,H17,S43,prefactor=(1.0d0,0.0d0))
!   original expression: Z49(e1b|m1b)+=S43(d1b|m1b)*Z54_1(e1b|d1b)
    ierr=exatns_tensor_contract("Z49(e1b,m1b)+=S43(d1b,m1b)*Z54_1(e1b,d1b)", &
        Z49,S43,Z54_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z54_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nvir_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root/)
    ierr=exatns_tensor_create(Z54_1,"Z54_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z54_1,'ZERO')
!   original expression: Z54_1(e1b|d1b)+=H29(e1b,l1a|d1b,d1a)*S45(d1a|l1a)
    ierr=exatns_tensor_contract("Z54_1(e1b,d1b)+=H29(e1b,l1a,d1b,d1a)*S45(d1a,l1a)", &
        Z54_1,H29,S45,prefactor=(1.0d0,0.0d0))
!   original expression: Z49(e1b|m1b)+=S43(d1b|m1b)*Z54_1(e1b|d1b)
    ierr=exatns_tensor_contract("Z49(e1b,m1b)+=S43(d1b,m1b)*Z54_1(e1b,d1b)", &
        Z49,S43,Z54_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z54_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z72_1,"Z72_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z72_1,'ZERO')
!   original expression: Z72_1(l1bl2b|m1b,d1b)+=H24(l1bl2b|d1b,d2b)*S43(d2b|m1b)
    ierr=exatns_tensor_contract("Z72_1(l1b,l2b,m1b,d1b)+=H24(l1b,l2b,d1b,d2b)*S43(d2b,m1b)", &
        Z72_1,H24,S43,prefactor=(1.0d0,0.0d0))
!   original expression: Z49(e1b|m1b)+=S44(e1b,d1b|l1bl2b)*Z72_1(l1bl2b|m1b,d1b)
    ierr=exatns_tensor_contract("Z49(e1b,m1b)+=S44(e1b,d1b,l1b,l2b)*Z72_1(l1b,l2b,m1b,d1b)", &
        Z49,S44,Z72_1,prefactor=(0.5d0,0.0d0))
    ierr=exatns_tensor_destroy(Z72_1)
!   original expression: Z49(e1b|m1b)+=S44(e1b,d1b|l1bl2b)*H25(l1bl2b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z49(e1b,m1b)+=S44(e1b,d1b,l1b,l2b)*H25(l1b,l2b,m1b,d1b)", &
        Z49,S44,H25,prefactor=(-0.5d0,0.0d0))
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z74_1,"Z74_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z74_1,'ZERO')
!   original expression: Z74_1(l1al1b|m1b,d1a)+=H36(l1al1b|d1b,d1a)*S43(d1b|m1b)*-1.
    ierr=exatns_tensor_contract("Z74_1(l1a,l1b,m1b,d1a)+=H36(l1a,l1b,d1b,d1a)*S43(d1b,m1b)", &
        Z74_1,H36,S43,prefactor=(-1.0d0,0.0d0))
!   original expression: Z49(e1b|m1b)+=S46(e1b,d1a|l1al1b)*Z74_1(l1al1b|m1b,d1a)
    ierr=exatns_tensor_contract("Z49(e1b,m1b)+=S46(e1b,d1a,l1a,l1b)*Z74_1(l1a,l1b,m1b,d1a)", &
        Z49,S46,Z74_1,prefactor=(0.5d0,0.0d0))
    ierr=exatns_tensor_destroy(Z74_1)
!   original expression: Z49(e1b|m1b)+=S46(e1b,d1a|l1al1b)*H37(l1al1b|m1b,d1a)*-1.
    ierr=exatns_tensor_contract("Z49(e1b,m1b)+=S46(e1b,d1a,l1a,l1b)*H37(l1a,l1b,m1b,d1a)", &
        Z49,S46,H37,prefactor=(-0.5d0,0.0d0))
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nvir_id/)
    tens_root = (/nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z57_1,"Z57_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z57_1,'ZERO')
!   original expression: Z57_1(l1b|d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|l2b)
    ierr=exatns_tensor_contract("Z57_1(l1b,d1b)+=H24(l1b,l2b,d1b,d2b)*S43(d2b,l2b)", &
        Z57_1,H24,S43,prefactor=(1.0d0,0.0d0))
!   original expression: Z49(e1b|m1b)+=S44(e1b,d1b|m1b,l1b)*Z57_1(l1b|d1b)
    ierr=exatns_tensor_contract("Z49(e1b,m1b)+=S44(e1b,d1b,m1b,l1b)*Z57_1(l1b,d1b)", &
        Z49,S44,Z57_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z57_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nvir_id/)
    tens_root = (/nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z57_1,"Z57_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z57_1,'ZERO')
!   original expression: Z57_1(l1b|d1b)+=H36(l1b,l1a|d1b,d1a)*S45(d1a|l1a)
    ierr=exatns_tensor_contract("Z57_1(l1b,d1b)+=H36(l1b,l1a,d1b,d1a)*S45(d1a,l1a)", &
        Z57_1,H36,S45,prefactor=(1.0d0,0.0d0))
!   original expression: Z49(e1b|m1b)+=S44(e1b,d1b|m1b,l1b)*Z57_1(l1b|d1b)
    ierr=exatns_tensor_contract("Z49(e1b,m1b)+=S44(e1b,d1b,m1b,l1b)*Z57_1(l1b,d1b)", &
        Z49,S44,Z57_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z57_1)
!   original expression: Z49(e1b|m1b)+=S44(e1b,d1b|m1b,l1b)*H15(l1b|d1b)
    ierr=exatns_tensor_contract("Z49(e1b,m1b)+=S44(e1b,d1b,m1b,l1b)*H15(l1b,d1b)", &
        Z49,S44,H15,prefactor=(1.0d0,0.0d0))
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nvir_id/)
    tens_root = (/nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z60_1,"Z60_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z60_1,'ZERO')
!   original expression: Z60_1(l1a|d1a)+=H36(l1b,l1a|d1b,d1a)*S43(d1b|l1b)
    ierr=exatns_tensor_contract("Z60_1(l1a,d1a)+=H36(l1b,l1a,d1b,d1a)*S43(d1b,l1b)", &
        Z60_1,H36,S43,prefactor=(1.0d0,0.0d0))
!   original expression: Z49(e1b|m1b)+=S46(e1b,d1a|m1b,l1a)*Z60_1(l1a|d1a)
    ierr=exatns_tensor_contract("Z49(e1b,m1b)+=S46(e1b,d1a,m1b,l1a)*Z60_1(l1a,d1a)", &
        Z49,S46,Z60_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z60_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nvir_id/)
    tens_root = (/nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z60_1,"Z60_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z60_1,'ZERO')
!   original expression: Z60_1(l1a|d1a)+=H40(l1a,l2a|d1a,d2a)*S45(d2a|l2a)
    ierr=exatns_tensor_contract("Z60_1(l1a,d1a)+=H40(l1a,l2a,d1a,d2a)*S45(d2a,l2a)", &
        Z60_1,H40,S45,prefactor=(1.0d0,0.0d0))
!   original expression: Z49(e1b|m1b)+=S46(e1b,d1a|m1b,l1a)*Z60_1(l1a|d1a)
    ierr=exatns_tensor_contract("Z49(e1b,m1b)+=S46(e1b,d1a,m1b,l1a)*Z60_1(l1a,d1a)", &
        Z49,S46,Z60_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z60_1)
!   original expression: Z49(e1b|m1b)+=S46(e1b,d1a|m1b,l1a)*H27(l1a|d1a)
    ierr=exatns_tensor_contract("Z49(e1b,m1b)+=S46(e1b,d1a,m1b,l1a)*H27(l1a,d1a)", &
        Z49,S46,H27,prefactor=(1.0d0,0.0d0))
!   original expression: Z51(e1a|m1a)+=H7(e1a|m1a)
    ierr=exatns_tensor_contract("Z51(e1a,m1a)+=H7(e1a,m1a)*K()", &
        Z51,H7,one_tensor,prefactor=(1.0d0,0.0d0))
!   original expression: Z51(e1a|m1a)+=H6(e1a|d1a)*S45(d1a|m1a)
    ierr=exatns_tensor_contract("Z51(e1a,m1a)+=H6(e1a,d1a)*S45(d1a,m1a)", &
        Z51,H6,S45,prefactor=(1.0d0,0.0d0))
!   original expression: Z51(e1a|m1a)+=H20(e1a,l1b|d1ad1b)*S46(d1ad1b|m1a,l1b)
    ierr=exatns_tensor_contract("Z51(e1a,m1a)+=H20(e1a,l1b,d1a,d1b)*S46(d1a,d1b,m1a,l1b)", &
        Z51,H20,S46,prefactor=(0.5d0,0.0d0))
!   original expression: Z51(e1a|m1a)+=H33(e1a,l1a|d1ad2a)*S47(d1ad2a|m1a,l1a)
    ierr=exatns_tensor_contract("Z51(e1a,m1a)+=H33(e1a,l1a,d1a,d2a)*S47(d1a,d2a,m1a,l1a)", &
        Z51,H33,S47,prefactor=(0.5d0,0.0d0))
!   original expression: Z51(e1a|m1a)+=H22(e1a,l1b|m1a,d1b)*S43(d1b|l1b)
    ierr=exatns_tensor_contract("Z51(e1a,m1a)+=H22(e1a,l1b,m1a,d1b)*S43(d1b,l1b)", &
        Z51,H22,S43,prefactor=(1.0d0,0.0d0))
!   original expression: Z51(e1a|m1a)+=H34(e1a,l1a|m1a,d1a)*S45(d1a|l1a)
    ierr=exatns_tensor_contract("Z51(e1a,m1a)+=H34(e1a,l1a,m1a,d1a)*S45(d1a,l1a)", &
        Z51,H34,S45,prefactor=(1.0d0,0.0d0))
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z59_1,"Z59_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z59_1,'ZERO')
!   original expression: Z59_1(l1a|m1a)+=H38(l1b,l1a|m1a,d1b)*S43(d1b|l1b)
    ierr=exatns_tensor_contract("Z59_1(l1a,m1a)+=H38(l1b,l1a,m1a,d1b)*S43(d1b,l1b)", &
        Z59_1,H38,S43,prefactor=(1.0d0,0.0d0))
!   original expression: Z51(e1a|m1a)+=S45(e1a|l1a)*Z59_1(l1a|m1a)
    ierr=exatns_tensor_contract("Z51(e1a,m1a)+=S45(e1a,l1a)*Z59_1(l1a,m1a)", &
        Z51,S45,Z59_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z59_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z59_1,"Z59_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z59_1,'ZERO')
!   original expression: Z59_1(l1a|m1a)+=H41(l1a,l2a|m1a,d1a)*S45(d1a|l2a)*-1.
    ierr=exatns_tensor_contract("Z59_1(l1a,m1a)+=H41(l1a,l2a,m1a,d1a)*S45(d1a,l2a)", &
        Z59_1,H41,S45,prefactor=(-1.0d0,0.0d0))
!   original expression: Z51(e1a|m1a)+=S45(e1a|l1a)*Z59_1(l1a|m1a)
    ierr=exatns_tensor_contract("Z51(e1a,m1a)+=S45(e1a,l1a)*Z59_1(l1a,m1a)", &
        Z51,S45,Z59_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z59_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nvir_id/)
    tens_root = (/nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z60_2,"Z60_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z60_2,'ZERO')
!   original expression: Z60_2(l1a|d1a)+=H36(l1b,l1a|d1b,d1a)*S43(d1b|l1b)*-1.
    ierr=exatns_tensor_contract("Z60_2(l1a,d1a)+=H36(l1b,l1a,d1b,d1a)*S43(d1b,l1b)", &
        Z60_2,H36,S43,prefactor=(-1.0d0,0.0d0))
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z59_1,"Z59_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z59_1,'ZERO')
!   original expression: Z59_1(l1a|m1a)+=S45(d1a|m1a)*Z60_2(l1a|d1a)
    ierr=exatns_tensor_contract("Z59_1(l1a,m1a)+=S45(d1a,m1a)*Z60_2(l1a,d1a)", &
        Z59_1,S45,Z60_2,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z60_2)
!   original expression: Z51(e1a|m1a)+=S45(e1a|l1a)*Z59_1(l1a|m1a)
    ierr=exatns_tensor_contract("Z51(e1a,m1a)+=S45(e1a,l1a)*Z59_1(l1a,m1a)", &
        Z51,S45,Z59_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z59_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nvir_id/)
    tens_root = (/nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z60_2,"Z60_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z60_2,'ZERO')
!   original expression: Z60_2(l1a|d1a)+=H40(l1a,l2a|d1a,d2a)*S45(d2a|l2a)*-1.
    ierr=exatns_tensor_contract("Z60_2(l1a,d1a)+=H40(l1a,l2a,d1a,d2a)*S45(d2a,l2a)", &
        Z60_2,H40,S45,prefactor=(-1.0d0,0.0d0))
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z59_1,"Z59_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z59_1,'ZERO')
!   original expression: Z59_1(l1a|m1a)+=S45(d1a|m1a)*Z60_2(l1a|d1a)
    ierr=exatns_tensor_contract("Z59_1(l1a,m1a)+=S45(d1a,m1a)*Z60_2(l1a,d1a)", &
        Z59_1,S45,Z60_2,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z60_2)
!   original expression: Z51(e1a|m1a)+=S45(e1a|l1a)*Z59_1(l1a|m1a)
    ierr=exatns_tensor_contract("Z51(e1a,m1a)+=S45(e1a,l1a)*Z59_1(l1a,m1a)", &
        Z51,S45,Z59_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z59_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z59_1,"Z59_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z59_1,'ZERO')
!   original expression: Z59_1(l1a|m1a)+=S45(d1a|m1a)*H27(l1a|d1a)*-1.
    ierr=exatns_tensor_contract("Z59_1(l1a,m1a)+=S45(d1a,m1a)*H27(l1a,d1a)", &
        Z59_1,S45,H27,prefactor=(-1.0d0,0.0d0))
!   original expression: Z51(e1a|m1a)+=S45(e1a|l1a)*Z59_1(l1a|m1a)
    ierr=exatns_tensor_contract("Z51(e1a,m1a)+=S45(e1a,l1a)*Z59_1(l1a,m1a)", &
        Z51,S45,Z59_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z59_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z59_1,"Z59_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z59_1,'ZERO')
!   original expression: Z59_1(l1a|m1a)+=S46(d1ad1b|m1a,l1b)*H36(l1b,l1a|d1ad1b)
    ierr=exatns_tensor_contract("Z59_1(l1a,m1a)+=S46(d1a,d1b,m1a,l1b)*H36(l1b,l1a,d1a,d1b)", &
        Z59_1,S46,H36,prefactor=(0.5d0,0.0d0))
!   original expression: Z51(e1a|m1a)+=S45(e1a|l1a)*Z59_1(l1a|m1a)
    ierr=exatns_tensor_contract("Z51(e1a,m1a)+=S45(e1a,l1a)*Z59_1(l1a,m1a)", &
        Z51,S45,Z59_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z59_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z59_1,"Z59_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z59_1,'ZERO')
!   original expression: Z59_1(l1a|m1a)+=S47(d1ad2a|m1a,l2a)*H40(l1a,l2a|d1ad2a)*-1.
    ierr=exatns_tensor_contract("Z59_1(l1a,m1a)+=S47(d1a,d2a,m1a,l2a)*H40(l1a,l2a,d1a,d2a)", &
        Z59_1,S47,H40,prefactor=(-0.5d0,0.0d0))
!   original expression: Z51(e1a|m1a)+=S45(e1a|l1a)*Z59_1(l1a|m1a)
    ierr=exatns_tensor_contract("Z51(e1a,m1a)+=S45(e1a,l1a)*Z59_1(l1a,m1a)", &
        Z51,S45,Z59_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z59_1)
!   original expression: Z51(e1a|m1a)+=S45(e1a|l1a)*H28(l1a|m1a)*-1.
    ierr=exatns_tensor_contract("Z51(e1a,m1a)+=S45(e1a,l1a)*H28(l1a,m1a)", &
        Z51,S45,H28,prefactor=(-1.0d0,0.0d0))
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nvir_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root/)
    ierr=exatns_tensor_create(Z55_1,"Z55_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z55_1,'ZERO')
!   original expression: Z55_1(e1a|d1a)+=H20(e1a,l1b|d1b,d1a)*S43(d1b|l1b)*-1.
    ierr=exatns_tensor_contract("Z55_1(e1a,d1a)+=H20(e1a,l1b,d1b,d1a)*S43(d1b,l1b)", &
        Z55_1,H20,S43,prefactor=(-1.0d0,0.0d0))
!   original expression: Z51(e1a|m1a)+=S45(d1a|m1a)*Z55_1(e1a|d1a)
    ierr=exatns_tensor_contract("Z51(e1a,m1a)+=S45(d1a,m1a)*Z55_1(e1a,d1a)", &
        Z51,S45,Z55_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z55_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nvir_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root/)
    ierr=exatns_tensor_create(Z55_1,"Z55_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z55_1,'ZERO')
!   original expression: Z55_1(e1a|d1a)+=H33(e1a,l1a|d1a,d2a)*S45(d2a|l1a)
    ierr=exatns_tensor_contract("Z55_1(e1a,d1a)+=H33(e1a,l1a,d1a,d2a)*S45(d2a,l1a)", &
        Z55_1,H33,S45,prefactor=(1.0d0,0.0d0))
!   original expression: Z51(e1a|m1a)+=S45(d1a|m1a)*Z55_1(e1a|d1a)
    ierr=exatns_tensor_contract("Z51(e1a,m1a)+=S45(d1a,m1a)*Z55_1(e1a,d1a)", &
        Z51,S45,Z55_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z55_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z75_1,"Z75_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z75_1,'ZERO')
!   original expression: Z75_1(l1al1b|m1a,d1b)+=H36(l1al1b|d1b,d1a)*S45(d1a|m1a)
    ierr=exatns_tensor_contract("Z75_1(l1a,l1b,m1a,d1b)+=H36(l1a,l1b,d1b,d1a)*S45(d1a,m1a)", &
        Z75_1,H36,S45,prefactor=(1.0d0,0.0d0))
!   original expression: Z51(e1a|m1a)+=S46(e1a,d1b|l1al1b)*Z75_1(l1al1b|m1a,d1b)
    ierr=exatns_tensor_contract("Z51(e1a,m1a)+=S46(e1a,d1b,l1a,l1b)*Z75_1(l1a,l1b,m1a,d1b)", &
        Z51,S46,Z75_1,prefactor=(0.5d0,0.0d0))
    ierr=exatns_tensor_destroy(Z75_1)
!   original expression: Z51(e1a|m1a)+=S46(e1a,d1b|l1al1b)*H38(l1al1b|m1a,d1b)*-1.
    ierr=exatns_tensor_contract("Z51(e1a,m1a)+=S46(e1a,d1b,l1a,l1b)*H38(l1a,l1b,m1a,d1b)", &
        Z51,S46,H38,prefactor=(-0.5d0,0.0d0))
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z76_1,"Z76_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z76_1,'ZERO')
!   original expression: Z76_1(l1al2a|m1a,d1a)+=H40(l1al2a|d1a,d2a)*S45(d2a|m1a)
    ierr=exatns_tensor_contract("Z76_1(l1a,l2a,m1a,d1a)+=H40(l1a,l2a,d1a,d2a)*S45(d2a,m1a)", &
        Z76_1,H40,S45,prefactor=(1.0d0,0.0d0))
!   original expression: Z51(e1a|m1a)+=S47(e1a,d1a|l1al2a)*Z76_1(l1al2a|m1a,d1a)
    ierr=exatns_tensor_contract("Z51(e1a,m1a)+=S47(e1a,d1a,l1a,l2a)*Z76_1(l1a,l2a,m1a,d1a)", &
        Z51,S47,Z76_1,prefactor=(0.5d0,0.0d0))
    ierr=exatns_tensor_destroy(Z76_1)
!   original expression: Z51(e1a|m1a)+=S47(e1a,d1a|l1al2a)*H41(l1al2a|m1a,d1a)*-1.
    ierr=exatns_tensor_contract("Z51(e1a,m1a)+=S47(e1a,d1a,l1a,l2a)*H41(l1a,l2a,m1a,d1a)", &
        Z51,S47,H41,prefactor=(-0.5d0,0.0d0))
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nvir_id/)
    tens_root = (/nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z57_1,"Z57_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z57_1,'ZERO')
!   original expression: Z57_1(l1b|d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|l2b)
    ierr=exatns_tensor_contract("Z57_1(l1b,d1b)+=H24(l1b,l2b,d1b,d2b)*S43(d2b,l2b)", &
        Z57_1,H24,S43,prefactor=(1.0d0,0.0d0))
!   original expression: Z51(e1a|m1a)+=S46(e1a,d1b|m1a,l1b)*Z57_1(l1b|d1b)
    ierr=exatns_tensor_contract("Z51(e1a,m1a)+=S46(e1a,d1b,m1a,l1b)*Z57_1(l1b,d1b)", &
        Z51,S46,Z57_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z57_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nvir_id/)
    tens_root = (/nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z57_1,"Z57_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z57_1,'ZERO')
!   original expression: Z57_1(l1b|d1b)+=H36(l1b,l1a|d1b,d1a)*S45(d1a|l1a)
    ierr=exatns_tensor_contract("Z57_1(l1b,d1b)+=H36(l1b,l1a,d1b,d1a)*S45(d1a,l1a)", &
        Z57_1,H36,S45,prefactor=(1.0d0,0.0d0))
!   original expression: Z51(e1a|m1a)+=S46(e1a,d1b|m1a,l1b)*Z57_1(l1b|d1b)
    ierr=exatns_tensor_contract("Z51(e1a,m1a)+=S46(e1a,d1b,m1a,l1b)*Z57_1(l1b,d1b)", &
        Z51,S46,Z57_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z57_1)
!   original expression: Z51(e1a|m1a)+=S46(e1a,d1b|m1a,l1b)*H15(l1b|d1b)
    ierr=exatns_tensor_contract("Z51(e1a,m1a)+=S46(e1a,d1b,m1a,l1b)*H15(l1b,d1b)", &
        Z51,S46,H15,prefactor=(1.0d0,0.0d0))
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nvir_id/)
    tens_root = (/nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z60_1,"Z60_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z60_1,'ZERO')
!   original expression: Z60_1(l1a|d1a)+=H36(l1b,l1a|d1b,d1a)*S43(d1b|l1b)
    ierr=exatns_tensor_contract("Z60_1(l1a,d1a)+=H36(l1b,l1a,d1b,d1a)*S43(d1b,l1b)", &
        Z60_1,H36,S43,prefactor=(1.0d0,0.0d0))
!   original expression: Z51(e1a|m1a)+=S47(e1a,d1a|m1a,l1a)*Z60_1(l1a|d1a)
    ierr=exatns_tensor_contract("Z51(e1a,m1a)+=S47(e1a,d1a,m1a,l1a)*Z60_1(l1a,d1a)", &
        Z51,S47,Z60_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z60_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nvir_id/)
    tens_root = (/nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z60_1,"Z60_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z60_1,'ZERO')
!   original expression: Z60_1(l1a|d1a)+=H40(l1a,l2a|d1a,d2a)*S45(d2a|l2a)
    ierr=exatns_tensor_contract("Z60_1(l1a,d1a)+=H40(l1a,l2a,d1a,d2a)*S45(d2a,l2a)", &
        Z60_1,H40,S45,prefactor=(1.0d0,0.0d0))
!   original expression: Z51(e1a|m1a)+=S47(e1a,d1a|m1a,l1a)*Z60_1(l1a|d1a)
    ierr=exatns_tensor_contract("Z51(e1a,m1a)+=S47(e1a,d1a,m1a,l1a)*Z60_1(l1a,d1a)", &
        Z51,S47,Z60_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z60_1)
!   original expression: Z51(e1a|m1a)+=S47(e1a,d1a|m1a,l1a)*H27(l1a|d1a)
    ierr=exatns_tensor_contract("Z51(e1a,m1a)+=S47(e1a,d1a,m1a,l1a)*H27(l1a,d1a)", &
        Z51,S47,H27,prefactor=(1.0d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=H5(e1be2b|m1bm2b)
    ierr=exatns_tensor_contract("Z50(e1b,e2b,m1b,m2b)+=H5(e1b,e2b,m1b,m2b)*K()", &
        Z50,H5,one_tensor,prefactor=(1.0d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=H3(e1be2b|d1bd2b)*S44(d1bd2b|m1bm2b)
    ierr=exatns_tensor_contract("Z50(e1b,e2b,m1b,m2b)+=H3(e1b,e2b,d1b,d2b)*S44(d1b,d2b,m1b,m2b)", &
        Z50,H3,S44,prefactor=(0.5d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=H19(e1b,l1b|m1bm2b)*S43(e2b|l1b)*-1.
    ierr=exatns_tensor_contract("Z50(e1b,e2b,m1b,m2b)+=H19(e1b,l1b,m1b,m2b)*S43(e2b,l1b)", &
        Z50,H19,S43,prefactor=(-1.0d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=H19(e2b,l1b|m1bm2b)*S43(e1b|l1b)
    ierr=exatns_tensor_contract("Z50(e1b,e2b,m1b,m2b)+=H19(e2b,l1b,m1b,m2b)*S43(e1b,l1b)", &
        Z50,H19,S43,prefactor=(1.0d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=H4(e1be2b|m1b,d1b)*S43(d1b|m2b)
    ierr=exatns_tensor_contract("Z50(e1b,e2b,m1b,m2b)+=H4(e1b,e2b,m1b,d1b)*S43(d1b,m2b)", &
        Z50,H4,S43,prefactor=(1.0d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=H4(e1be2b|m2b,d1b)*S43(d1b|m1b)*-1.
    ierr=exatns_tensor_contract("Z50(e1b,e2b,m1b,m2b)+=H4(e1b,e2b,m2b,d1b)*S43(d1b,m1b)", &
        Z50,H4,S43,prefactor=(-1.0d0,0.0d0))
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z63_1,"Z63_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z63_1,'ZERO')
!   original expression: Z63_1(e1b,l1b|m1bm2b)+=H17(e1b,l1b|d1bd2b)*S44(d1bd2b|m1bm2b)
    ierr=exatns_tensor_contract("Z63_1(e1b,l1b,m1b,m2b)+=H17(e1b,l1b,d1b,d2b)*S44(d1b,d2b,m1b,m2b)", &
        Z63_1,H17,S44,prefactor=(0.5d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S43(e1b|l1b)*Z63_1(e2b,l1b|m1bm2b)
    ierr=exatns_tensor_contract("Z50(e1b,e2b,m1b,m2b)+=S43(e1b,l1b)*Z63_1(e2b,l1b,m1b,m2b)", &
        Z50,S43,Z63_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S43(e2b|l1b)*Z63_1(e1b,l1b|m1bm2b)*-1.
    ierr=exatns_tensor_contract("Z50(e1b,e2b,m1b,m2b)+=S43(e2b,l1b)*Z63_1(e1b,l1b,m1b,m2b)", &
        Z50,S43,Z63_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z63_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z63_1,"Z63_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z63_1,'ZERO')
!   original expression: Z63_1(e1b,l1b|m1bm2b)+=H26(l1b,l2b|m1bm2b)*S43(e1b|l2b)*0.5
    ierr=exatns_tensor_contract("Z63_1(e1b,l1b,m1b,m2b)+=H26(l1b,l2b,m1b,m2b)*S43(e1b,l2b)", &
        Z63_1,H26,S43,prefactor=(0.5d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S43(e1b|l1b)*Z63_1(e2b,l1b|m1bm2b)
    ierr=exatns_tensor_contract("Z50(e1b,e2b,m1b,m2b)+=S43(e1b,l1b)*Z63_1(e2b,l1b,m1b,m2b)", &
        Z50,S43,Z63_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S43(e2b|l1b)*Z63_1(e1b,l1b|m1bm2b)*-1.
    ierr=exatns_tensor_contract("Z50(e1b,e2b,m1b,m2b)+=S43(e2b,l1b)*Z63_1(e1b,l1b,m1b,m2b)", &
        Z50,S43,Z63_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z63_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z63_1,"Z63_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z63_1,'ZERO')
!   original expression: Z63_1(e1b,l1b|m1bm2b)+=H18(e1b,l1b|m1b,d1b)*S43(d1b|m2b)
    ierr=exatns_tensor_contract("Z63_1(e1b,l1b,m1b,m2b)+=H18(e1b,l1b,m1b,d1b)*S43(d1b,m2b)", &
        Z63_1,H18,S43,prefactor=(1.0d0,0.0d0))
!   original expression: Z63_1(e1b,l1b|m1bm2b)+=H18(e1b,l1b|m2b,d1b)*S43(d1b|m1b)*-1.
    ierr=exatns_tensor_contract("Z63_1(e1b,l1b,m1b,m2b)+=H18(e1b,l1b,m2b,d1b)*S43(d1b,m1b)", &
        Z63_1,H18,S43,prefactor=(-1.0d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S43(e1b|l1b)*Z63_1(e2b,l1b|m1bm2b)
    ierr=exatns_tensor_contract("Z50(e1b,e2b,m1b,m2b)+=S43(e1b,l1b)*Z63_1(e2b,l1b,m1b,m2b)", &
        Z50,S43,Z63_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S43(e2b|l1b)*Z63_1(e1b,l1b|m1bm2b)*-1.
    ierr=exatns_tensor_contract("Z50(e1b,e2b,m1b,m2b)+=S43(e2b,l1b)*Z63_1(e1b,l1b,m1b,m2b)", &
        Z50,S43,Z63_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z63_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z70_2,"Z70_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z70_2,'ZERO')
!   original expression: Z70_2(l1b,l2b|m1bm2b)+=H24(l1b,l2b|d1bd2b)*S44(d1bd2b|m1bm2b)*0.5
    ierr=exatns_tensor_contract("Z70_2(l1b,l2b,m1b,m2b)+=H24(l1b,l2b,d1b,d2b)*S44(d1b,d2b,m1b,m2b)", &
        Z70_2,H24,S44,prefactor=(0.25d0,0.0d0))
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z63_1,"Z63_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z63_1,'ZERO')
!   original expression: Z63_1(e1b,l1b|m1bm2b)+=S43(e1b|l2b)*Z70_2(l1b,l2b|m1bm2b)
    ierr=exatns_tensor_contract("Z63_1(e1b,l1b,m1b,m2b)+=S43(e1b,l2b)*Z70_2(l1b,l2b,m1b,m2b)", &
        Z63_1,S43,Z70_2,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z70_2)
!   original expression: Z50(e1be2b|m1bm2b)+=S43(e1b|l1b)*Z63_1(e2b,l1b|m1bm2b)
    ierr=exatns_tensor_contract("Z50(e1b,e2b,m1b,m2b)+=S43(e1b,l1b)*Z63_1(e2b,l1b,m1b,m2b)", &
        Z50,S43,Z63_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S43(e2b|l1b)*Z63_1(e1b,l1b|m1bm2b)*-1.
    ierr=exatns_tensor_contract("Z50(e1b,e2b,m1b,m2b)+=S43(e2b,l1b)*Z63_1(e1b,l1b,m1b,m2b)", &
        Z50,S43,Z63_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z63_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z70_2,"Z70_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z70_2,'ZERO')
!   original expression: Z70_2(l1b,l2b|m1bm2b)+=H25(l1b,l2b|m1b,d1b)*S43(d1b|m2b)*0.5
    ierr=exatns_tensor_contract("Z70_2(l1b,l2b,m1b,m2b)+=H25(l1b,l2b,m1b,d1b)*S43(d1b,m2b)", &
        Z70_2,H25,S43,prefactor=(0.5d0,0.0d0))
!   original expression: Z70_2(l1b,l2b|m1bm2b)+=H25(l1b,l2b|m2b,d1b)*S43(d1b|m1b)*-0.5
    ierr=exatns_tensor_contract("Z70_2(l1b,l2b,m1b,m2b)+=H25(l1b,l2b,m2b,d1b)*S43(d1b,m1b)", &
        Z70_2,H25,S43,prefactor=(-0.5d0,0.0d0))
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z63_1,"Z63_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z63_1,'ZERO')
!   original expression: Z63_1(e1b,l1b|m1bm2b)+=S43(e1b|l2b)*Z70_2(l1b,l2b|m1bm2b)
    ierr=exatns_tensor_contract("Z63_1(e1b,l1b,m1b,m2b)+=S43(e1b,l2b)*Z70_2(l1b,l2b,m1b,m2b)", &
        Z63_1,S43,Z70_2,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z70_2)
!   original expression: Z50(e1be2b|m1bm2b)+=S43(e1b|l1b)*Z63_1(e2b,l1b|m1bm2b)
    ierr=exatns_tensor_contract("Z50(e1b,e2b,m1b,m2b)+=S43(e1b,l1b)*Z63_1(e2b,l1b,m1b,m2b)", &
        Z50,S43,Z63_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S43(e2b|l1b)*Z63_1(e1b,l1b|m1bm2b)*-1.
    ierr=exatns_tensor_contract("Z50(e1b,e2b,m1b,m2b)+=S43(e2b,l1b)*Z63_1(e1b,l1b,m1b,m2b)", &
        Z50,S43,Z63_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z63_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z83_3,"Z83_3",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z83_3,'ZERO')
!   original expression: Z83_3(l1b,l2b|m1b,d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|m1b)*0.25
    ierr=exatns_tensor_contract("Z83_3(l1b,l2b,m1b,d1b)+=H24(l1b,l2b,d1b,d2b)*S43(d2b,m1b)", &
        Z83_3,H24,S43,prefactor=(0.25d0,0.0d0))
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z70_2,"Z70_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z70_2,'ZERO')
!   original expression: Z70_2(l1b,l2b|m1bm2b)+=S43(d1b|m1b)*Z83_3(l1b,l2b|m2b,d1b)
    ierr=exatns_tensor_contract("Z70_2(l1b,l2b,m1b,m2b)+=S43(d1b,m1b)*Z83_3(l1b,l2b,m2b,d1b)", &
        Z70_2,S43,Z83_3,prefactor=(1.0d0,0.0d0))
!   original expression: Z70_2(l1b,l2b|m1bm2b)+=S43(d1b|m2b)*Z83_3(l1b,l2b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z70_2(l1b,l2b,m1b,m2b)+=S43(d1b,m2b)*Z83_3(l1b,l2b,m1b,d1b)", &
        Z70_2,S43,Z83_3,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z83_3)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z63_1,"Z63_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z63_1,'ZERO')
!   original expression: Z63_1(e1b,l1b|m1bm2b)+=S43(e1b|l2b)*Z70_2(l1b,l2b|m1bm2b)
    ierr=exatns_tensor_contract("Z63_1(e1b,l1b,m1b,m2b)+=S43(e1b,l2b)*Z70_2(l1b,l2b,m1b,m2b)", &
        Z63_1,S43,Z70_2,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z70_2)
!   original expression: Z50(e1be2b|m1bm2b)+=S43(e1b|l1b)*Z63_1(e2b,l1b|m1bm2b)
    ierr=exatns_tensor_contract("Z50(e1b,e2b,m1b,m2b)+=S43(e1b,l1b)*Z63_1(e2b,l1b,m1b,m2b)", &
        Z50,S43,Z63_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S43(e2b|l1b)*Z63_1(e1b,l1b|m1bm2b)*-1.
    ierr=exatns_tensor_contract("Z50(e1b,e2b,m1b,m2b)+=S43(e2b,l1b)*Z63_1(e1b,l1b,m1b,m2b)", &
        Z50,S43,Z63_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z63_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z77_2,"Z77_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z77_2,'ZERO')
!   original expression: Z77_2(e1b,l1b|m1b,d1b)+=H17(e1b,l1b|d1b,d2b)*S43(d2b|m1b)*0.5
    ierr=exatns_tensor_contract("Z77_2(e1b,l1b,m1b,d1b)+=H17(e1b,l1b,d1b,d2b)*S43(d2b,m1b)", &
        Z77_2,H17,S43,prefactor=(0.5d0,0.0d0))
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z63_1,"Z63_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z63_1,'ZERO')
!   original expression: Z63_1(e1b,l1b|m1bm2b)+=S43(d1b|m1b)*Z77_2(e1b,l1b|m2b,d1b)
    ierr=exatns_tensor_contract("Z63_1(e1b,l1b,m1b,m2b)+=S43(d1b,m1b)*Z77_2(e1b,l1b,m2b,d1b)", &
        Z63_1,S43,Z77_2,prefactor=(1.0d0,0.0d0))
!   original expression: Z63_1(e1b,l1b|m1bm2b)+=S43(d1b|m2b)*Z77_2(e1b,l1b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z63_1(e1b,l1b,m1b,m2b)+=S43(d1b,m2b)*Z77_2(e1b,l1b,m1b,d1b)", &
        Z63_1,S43,Z77_2,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z77_2)
!   original expression: Z50(e1be2b|m1bm2b)+=S43(e1b|l1b)*Z63_1(e2b,l1b|m1bm2b)
    ierr=exatns_tensor_contract("Z50(e1b,e2b,m1b,m2b)+=S43(e1b,l1b)*Z63_1(e2b,l1b,m1b,m2b)", &
        Z50,S43,Z63_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S43(e2b|l1b)*Z63_1(e1b,l1b|m1bm2b)*-1.
    ierr=exatns_tensor_contract("Z50(e1b,e2b,m1b,m2b)+=S43(e2b,l1b)*Z63_1(e1b,l1b,m1b,m2b)", &
        Z50,S43,Z63_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z63_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nvir_id/)
    tens_root = (/nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z57_2,"Z57_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z57_2,'ZERO')
!   original expression: Z57_2(l1b|d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|l2b)
    ierr=exatns_tensor_contract("Z57_2(l1b,d1b)+=H24(l1b,l2b,d1b,d2b)*S43(d2b,l2b)", &
        Z57_2,H24,S43,prefactor=(1.0d0,0.0d0))
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z63_1,"Z63_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z63_1,'ZERO')
!   original expression: Z63_1(e1b,l1b|m1bm2b)+=S44(e1b,d1b|m1bm2b)*Z57_2(l1b|d1b)
    ierr=exatns_tensor_contract("Z63_1(e1b,l1b,m1b,m2b)+=S44(e1b,d1b,m1b,m2b)*Z57_2(l1b,d1b)", &
        Z63_1,S44,Z57_2,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z57_2)
!   original expression: Z50(e1be2b|m1bm2b)+=S43(e1b|l1b)*Z63_1(e2b,l1b|m1bm2b)
    ierr=exatns_tensor_contract("Z50(e1b,e2b,m1b,m2b)+=S43(e1b,l1b)*Z63_1(e2b,l1b,m1b,m2b)", &
        Z50,S43,Z63_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S43(e2b|l1b)*Z63_1(e1b,l1b|m1bm2b)*-1.
    ierr=exatns_tensor_contract("Z50(e1b,e2b,m1b,m2b)+=S43(e2b,l1b)*Z63_1(e1b,l1b,m1b,m2b)", &
        Z50,S43,Z63_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z63_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nvir_id/)
    tens_root = (/nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z57_2,"Z57_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z57_2,'ZERO')
!   original expression: Z57_2(l1b|d1b)+=H36(l1b,l1a|d1b,d1a)*S45(d1a|l1a)
    ierr=exatns_tensor_contract("Z57_2(l1b,d1b)+=H36(l1b,l1a,d1b,d1a)*S45(d1a,l1a)", &
        Z57_2,H36,S45,prefactor=(1.0d0,0.0d0))
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z63_1,"Z63_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z63_1,'ZERO')
!   original expression: Z63_1(e1b,l1b|m1bm2b)+=S44(e1b,d1b|m1bm2b)*Z57_2(l1b|d1b)
    ierr=exatns_tensor_contract("Z63_1(e1b,l1b,m1b,m2b)+=S44(e1b,d1b,m1b,m2b)*Z57_2(l1b,d1b)", &
        Z63_1,S44,Z57_2,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z57_2)
!   original expression: Z50(e1be2b|m1bm2b)+=S43(e1b|l1b)*Z63_1(e2b,l1b|m1bm2b)
    ierr=exatns_tensor_contract("Z50(e1b,e2b,m1b,m2b)+=S43(e1b,l1b)*Z63_1(e2b,l1b,m1b,m2b)", &
        Z50,S43,Z63_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S43(e2b|l1b)*Z63_1(e1b,l1b|m1bm2b)*-1.
    ierr=exatns_tensor_contract("Z50(e1b,e2b,m1b,m2b)+=S43(e2b,l1b)*Z63_1(e1b,l1b,m1b,m2b)", &
        Z50,S43,Z63_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z63_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z63_1,"Z63_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z63_1,'ZERO')
!   original expression: Z63_1(e1b,l1b|m1bm2b)+=S44(e1b,d1b|m1bm2b)*H15(l1b|d1b)
    ierr=exatns_tensor_contract("Z63_1(e1b,l1b,m1b,m2b)+=S44(e1b,d1b,m1b,m2b)*H15(l1b,d1b)", &
        Z63_1,S44,H15,prefactor=(1.0d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S43(e1b|l1b)*Z63_1(e2b,l1b|m1bm2b)
    ierr=exatns_tensor_contract("Z50(e1b,e2b,m1b,m2b)+=S43(e1b,l1b)*Z63_1(e2b,l1b,m1b,m2b)", &
        Z50,S43,Z63_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S43(e2b|l1b)*Z63_1(e1b,l1b|m1bm2b)*-1.
    ierr=exatns_tensor_contract("Z50(e1b,e2b,m1b,m2b)+=S43(e2b,l1b)*Z63_1(e1b,l1b,m1b,m2b)", &
        Z50,S43,Z63_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z63_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z83_2,"Z83_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z83_2,'ZERO')
!   original expression: Z83_2(l1b,l2b|m1b,d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|m1b)*-1.
    ierr=exatns_tensor_contract("Z83_2(l1b,l2b,m1b,d1b)+=H24(l1b,l2b,d1b,d2b)*S43(d2b,m1b)", &
        Z83_2,H24,S43,prefactor=(-1.0d0,0.0d0))
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z63_1,"Z63_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z63_1,'ZERO')
!   original expression: Z63_1(e1b,l1b|m1bm2b)+=S44(e1b,d1b|m1b,l2b)*Z83_2(l1b,l2b|m2b,d1b)
    ierr=exatns_tensor_contract("Z63_1(e1b,l1b,m1b,m2b)+=S44(e1b,d1b,m1b,l2b)*Z83_2(l1b,l2b,m2b,d1b)", &
        Z63_1,S44,Z83_2,prefactor=(1.0d0,0.0d0))
!   original expression: Z63_1(e1b,l1b|m1bm2b)+=S44(e1b,d1b|m2b,l2b)*Z83_2(l1b,l2b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z63_1(e1b,l1b,m1b,m2b)+=S44(e1b,d1b,m2b,l2b)*Z83_2(l1b,l2b,m1b,d1b)", &
        Z63_1,S44,Z83_2,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z83_2)
!   original expression: Z50(e1be2b|m1bm2b)+=S43(e1b|l1b)*Z63_1(e2b,l1b|m1bm2b)
    ierr=exatns_tensor_contract("Z50(e1b,e2b,m1b,m2b)+=S43(e1b,l1b)*Z63_1(e2b,l1b,m1b,m2b)", &
        Z50,S43,Z63_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S43(e2b|l1b)*Z63_1(e1b,l1b|m1bm2b)*-1.
    ierr=exatns_tensor_contract("Z50(e1b,e2b,m1b,m2b)+=S43(e2b,l1b)*Z63_1(e1b,l1b,m1b,m2b)", &
        Z50,S43,Z63_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z63_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z63_1,"Z63_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z63_1,'ZERO')
!   original expression: Z63_1(e1b,l1b|m1bm2b)+=S44(e1b,d1b|m1b,l2b)*H25(l1b,l2b|m2b,d1b)
    ierr=exatns_tensor_contract("Z63_1(e1b,l1b,m1b,m2b)+=S44(e1b,d1b,m1b,l2b)*H25(l1b,l2b,m2b,d1b)", &
        Z63_1,S44,H25,prefactor=(1.0d0,0.0d0))
!   original expression: Z63_1(e1b,l1b|m1bm2b)+=S44(e1b,d1b|m2b,l2b)*H25(l1b,l2b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z63_1(e1b,l1b,m1b,m2b)+=S44(e1b,d1b,m2b,l2b)*H25(l1b,l2b,m1b,d1b)", &
        Z63_1,S44,H25,prefactor=(-1.0d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S43(e1b|l1b)*Z63_1(e2b,l1b|m1bm2b)
    ierr=exatns_tensor_contract("Z50(e1b,e2b,m1b,m2b)+=S43(e1b,l1b)*Z63_1(e2b,l1b,m1b,m2b)", &
        Z50,S43,Z63_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S43(e2b|l1b)*Z63_1(e1b,l1b|m1bm2b)*-1.
    ierr=exatns_tensor_contract("Z50(e1b,e2b,m1b,m2b)+=S43(e2b,l1b)*Z63_1(e1b,l1b,m1b,m2b)", &
        Z50,S43,Z63_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z63_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z84_2,"Z84_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z84_2,'ZERO')
!   original expression: Z84_2(l1b,l1a|m1b,d1a)+=H36(l1b,l1a|d1b,d1a)*S43(d1b|m1b)
    ierr=exatns_tensor_contract("Z84_2(l1b,l1a,m1b,d1a)+=H36(l1b,l1a,d1b,d1a)*S43(d1b,m1b)", &
        Z84_2,H36,S43,prefactor=(1.0d0,0.0d0))
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z63_1,"Z63_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z63_1,'ZERO')
!   original expression: Z63_1(e1b,l1b|m1bm2b)+=S46(e1b,d1a|m1b,l1a)*Z84_2(l1b,l1a|m2b,d1a)
    ierr=exatns_tensor_contract("Z63_1(e1b,l1b,m1b,m2b)+=S46(e1b,d1a,m1b,l1a)*Z84_2(l1b,l1a,m2b,d1a)", &
        Z63_1,S46,Z84_2,prefactor=(1.0d0,0.0d0))
!   original expression: Z63_1(e1b,l1b|m1bm2b)+=S46(e1b,d1a|m2b,l1a)*Z84_2(l1b,l1a|m1b,d1a)*-1.
    ierr=exatns_tensor_contract("Z63_1(e1b,l1b,m1b,m2b)+=S46(e1b,d1a,m2b,l1a)*Z84_2(l1b,l1a,m1b,d1a)", &
        Z63_1,S46,Z84_2,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z84_2)
!   original expression: Z50(e1be2b|m1bm2b)+=S43(e1b|l1b)*Z63_1(e2b,l1b|m1bm2b)
    ierr=exatns_tensor_contract("Z50(e1b,e2b,m1b,m2b)+=S43(e1b,l1b)*Z63_1(e2b,l1b,m1b,m2b)", &
        Z50,S43,Z63_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S43(e2b|l1b)*Z63_1(e1b,l1b|m1bm2b)*-1.
    ierr=exatns_tensor_contract("Z50(e1b,e2b,m1b,m2b)+=S43(e2b,l1b)*Z63_1(e1b,l1b,m1b,m2b)", &
        Z50,S43,Z63_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z63_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z63_1,"Z63_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z63_1,'ZERO')
!   original expression: Z63_1(e1b,l1b|m1bm2b)+=S46(e1b,d1a|m1b,l1a)*H37(l1b,l1a|m2b,d1a)
    ierr=exatns_tensor_contract("Z63_1(e1b,l1b,m1b,m2b)+=S46(e1b,d1a,m1b,l1a)*H37(l1b,l1a,m2b,d1a)", &
        Z63_1,S46,H37,prefactor=(1.0d0,0.0d0))
!   original expression: Z63_1(e1b,l1b|m1bm2b)+=S46(e1b,d1a|m2b,l1a)*H37(l1b,l1a|m1b,d1a)*-1.
    ierr=exatns_tensor_contract("Z63_1(e1b,l1b,m1b,m2b)+=S46(e1b,d1a,m2b,l1a)*H37(l1b,l1a,m1b,d1a)", &
        Z63_1,S46,H37,prefactor=(-1.0d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S43(e1b|l1b)*Z63_1(e2b,l1b|m1bm2b)
    ierr=exatns_tensor_contract("Z50(e1b,e2b,m1b,m2b)+=S43(e1b,l1b)*Z63_1(e2b,l1b,m1b,m2b)", &
        Z50,S43,Z63_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S43(e2b|l1b)*Z63_1(e1b,l1b|m1bm2b)*-1.
    ierr=exatns_tensor_contract("Z50(e1b,e2b,m1b,m2b)+=S43(e2b,l1b)*Z63_1(e1b,l1b,m1b,m2b)", &
        Z50,S43,Z63_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z63_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nvir_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z65_1,"Z65_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z65_1,'ZERO')
!   original expression: Z65_1(e1be2b|m1b,d1b)+=H3(e1be2b|d1b,d2b)*S43(d2b|m1b)*0.5
    ierr=exatns_tensor_contract("Z65_1(e1b,e2b,m1b,d1b)+=H3(e1b,e2b,d1b,d2b)*S43(d2b,m1b)", &
        Z65_1,H3,S43,prefactor=(0.5d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S43(d1b|m1b)*Z65_1(e1be2b|m2b,d1b)
    ierr=exatns_tensor_contract("Z50(e1b,e2b,m1b,m2b)+=S43(d1b,m1b)*Z65_1(e1b,e2b,m2b,d1b)", &
        Z50,S43,Z65_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S43(d1b|m2b)*Z65_1(e1be2b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z50(e1b,e2b,m1b,m2b)+=S43(d1b,m2b)*Z65_1(e1b,e2b,m1b,d1b)", &
        Z50,S43,Z65_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z65_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z58_1,"Z58_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z58_1,'ZERO')
!   original expression: Z58_1(l1bl2b|m1bm2b)+=H25(l1bl2b|m1b,d1b)*S43(d1b|m2b)
    ierr=exatns_tensor_contract("Z58_1(l1b,l2b,m1b,m2b)+=H25(l1b,l2b,m1b,d1b)*S43(d1b,m2b)", &
        Z58_1,H25,S43,prefactor=(1.0d0,0.0d0))
!   original expression: Z58_1(l1bl2b|m1bm2b)+=H25(l1bl2b|m2b,d1b)*S43(d1b|m1b)*-1.
    ierr=exatns_tensor_contract("Z58_1(l1b,l2b,m1b,m2b)+=H25(l1b,l2b,m2b,d1b)*S43(d1b,m1b)", &
        Z58_1,H25,S43,prefactor=(-1.0d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S44(e1be2b|l1bl2b)*Z58_1(l1bl2b|m1bm2b)
    ierr=exatns_tensor_contract("Z50(e1b,e2b,m1b,m2b)+=S44(e1b,e2b,l1b,l2b)*Z58_1(l1b,l2b,m1b,m2b)", &
        Z50,S44,Z58_1,prefactor=(0.5d0,0.0d0))
    ierr=exatns_tensor_destroy(Z58_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z72_2,"Z72_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z72_2,'ZERO')
!   original expression: Z72_2(l1bl2b|m1b,d1b)+=H24(l1bl2b|d1b,d2b)*S43(d2b|m1b)*0.5
    ierr=exatns_tensor_contract("Z72_2(l1b,l2b,m1b,d1b)+=H24(l1b,l2b,d1b,d2b)*S43(d2b,m1b)", &
        Z72_2,H24,S43,prefactor=(0.5d0,0.0d0))
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z58_1,"Z58_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z58_1,'ZERO')
!   original expression: Z58_1(l1bl2b|m1bm2b)+=S43(d1b|m1b)*Z72_2(l1bl2b|m2b,d1b)
    ierr=exatns_tensor_contract("Z58_1(l1b,l2b,m1b,m2b)+=S43(d1b,m1b)*Z72_2(l1b,l2b,m2b,d1b)", &
        Z58_1,S43,Z72_2,prefactor=(1.0d0,0.0d0))
!   original expression: Z58_1(l1bl2b|m1bm2b)+=S43(d1b|m2b)*Z72_2(l1bl2b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z58_1(l1b,l2b,m1b,m2b)+=S43(d1b,m2b)*Z72_2(l1b,l2b,m1b,d1b)", &
        Z58_1,S43,Z72_2,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z72_2)
!   original expression: Z50(e1be2b|m1bm2b)+=S44(e1be2b|l1bl2b)*Z58_1(l1bl2b|m1bm2b)
    ierr=exatns_tensor_contract("Z50(e1b,e2b,m1b,m2b)+=S44(e1b,e2b,l1b,l2b)*Z58_1(l1b,l2b,m1b,m2b)", &
        Z50,S44,Z58_1,prefactor=(0.5d0,0.0d0))
    ierr=exatns_tensor_destroy(Z58_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z58_1,"Z58_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z58_1,'ZERO')
!   original expression: Z58_1(l1bl2b|m1bm2b)+=S44(d1bd2b|m1bm2b)*H24(l1bl2b|d1bd2b)
    ierr=exatns_tensor_contract("Z58_1(l1b,l2b,m1b,m2b)+=S44(d1b,d2b,m1b,m2b)*H24(l1b,l2b,d1b,d2b)", &
        Z58_1,S44,H24,prefactor=(0.5d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S44(e1be2b|l1bl2b)*Z58_1(l1bl2b|m1bm2b)
    ierr=exatns_tensor_contract("Z50(e1b,e2b,m1b,m2b)+=S44(e1b,e2b,l1b,l2b)*Z58_1(l1b,l2b,m1b,m2b)", &
        Z50,S44,Z58_1,prefactor=(0.5d0,0.0d0))
    ierr=exatns_tensor_destroy(Z58_1)
!   original expression: Z50(e1be2b|m1bm2b)+=S44(e1be2b|l1bl2b)*H26(l1bl2b|m1bm2b)
    ierr=exatns_tensor_contract("Z50(e1b,e2b,m1b,m2b)+=S44(e1b,e2b,l1b,l2b)*H26(l1b,l2b,m1b,m2b)", &
        Z50,S44,H26,prefactor=(0.5d0,0.0d0))
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nvir_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root/)
    ierr=exatns_tensor_create(Z54_1,"Z54_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z54_1,'ZERO')
!   original expression: Z54_1(e1b|d1b)+=H17(e1b,l1b|d1b,d2b)*S43(d2b|l1b)
    ierr=exatns_tensor_contract("Z54_1(e1b,d1b)+=H17(e1b,l1b,d1b,d2b)*S43(d2b,l1b)", &
        Z54_1,H17,S43,prefactor=(1.0d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S44(e1b,d1b|m1bm2b)*Z54_1(e2b|d1b)
    ierr=exatns_tensor_contract("Z50(e1b,e2b,m1b,m2b)+=S44(e1b,d1b,m1b,m2b)*Z54_1(e2b,d1b)", &
        Z50,S44,Z54_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S44(e2b,d1b|m1bm2b)*Z54_1(e1b|d1b)*-1.
    ierr=exatns_tensor_contract("Z50(e1b,e2b,m1b,m2b)+=S44(e2b,d1b,m1b,m2b)*Z54_1(e1b,d1b)", &
        Z50,S44,Z54_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z54_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nvir_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root/)
    ierr=exatns_tensor_create(Z54_1,"Z54_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z54_1,'ZERO')
!   original expression: Z54_1(e1b|d1b)+=H29(e1b,l1a|d1b,d1a)*S45(d1a|l1a)
    ierr=exatns_tensor_contract("Z54_1(e1b,d1b)+=H29(e1b,l1a,d1b,d1a)*S45(d1a,l1a)", &
        Z54_1,H29,S45,prefactor=(1.0d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S44(e1b,d1b|m1bm2b)*Z54_1(e2b|d1b)
    ierr=exatns_tensor_contract("Z50(e1b,e2b,m1b,m2b)+=S44(e1b,d1b,m1b,m2b)*Z54_1(e2b,d1b)", &
        Z50,S44,Z54_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S44(e2b,d1b|m1bm2b)*Z54_1(e1b|d1b)*-1.
    ierr=exatns_tensor_contract("Z50(e1b,e2b,m1b,m2b)+=S44(e2b,d1b,m1b,m2b)*Z54_1(e1b,d1b)", &
        Z50,S44,Z54_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z54_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nvir_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root/)
    ierr=exatns_tensor_create(Z54_1,"Z54_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z54_1,'ZERO')
!   original expression: Z54_1(e1b|d1b)+=S44(e1b,d2b|l1bl2b)*H24(l1bl2b|d1b,d2b)*-1.
    ierr=exatns_tensor_contract("Z54_1(e1b,d1b)+=S44(e1b,d2b,l1b,l2b)*H24(l1b,l2b,d1b,d2b)", &
        Z54_1,S44,H24,prefactor=(-0.5d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S44(e1b,d1b|m1bm2b)*Z54_1(e2b|d1b)
    ierr=exatns_tensor_contract("Z50(e1b,e2b,m1b,m2b)+=S44(e1b,d1b,m1b,m2b)*Z54_1(e2b,d1b)", &
        Z50,S44,Z54_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S44(e2b,d1b|m1bm2b)*Z54_1(e1b|d1b)*-1.
    ierr=exatns_tensor_contract("Z50(e1b,e2b,m1b,m2b)+=S44(e2b,d1b,m1b,m2b)*Z54_1(e1b,d1b)", &
        Z50,S44,Z54_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z54_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nvir_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root/)
    ierr=exatns_tensor_create(Z54_1,"Z54_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z54_1,'ZERO')
!   original expression: Z54_1(e1b|d1b)+=S46(e1b,d1a|l1al1b)*H36(l1al1b|d1b,d1a)*-1.
    ierr=exatns_tensor_contract("Z54_1(e1b,d1b)+=S46(e1b,d1a,l1a,l1b)*H36(l1a,l1b,d1b,d1a)", &
        Z54_1,S46,H36,prefactor=(-0.5d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S44(e1b,d1b|m1bm2b)*Z54_1(e2b|d1b)
    ierr=exatns_tensor_contract("Z50(e1b,e2b,m1b,m2b)+=S44(e1b,d1b,m1b,m2b)*Z54_1(e2b,d1b)", &
        Z50,S44,Z54_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S44(e2b,d1b|m1bm2b)*Z54_1(e1b|d1b)*-1.
    ierr=exatns_tensor_contract("Z50(e1b,e2b,m1b,m2b)+=S44(e2b,d1b,m1b,m2b)*Z54_1(e1b,d1b)", &
        Z50,S44,Z54_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z54_1)
!   original expression: Z50(e1be2b|m1bm2b)+=S44(e1b,d1b|m1bm2b)*H1(e2b|d1b)
    ierr=exatns_tensor_contract("Z50(e1b,e2b,m1b,m2b)+=S44(e1b,d1b,m1b,m2b)*H1(e2b,d1b)", &
        Z50,S44,H1,prefactor=(1.0d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S44(e2b,d1b|m1bm2b)*H1(e1b|d1b)*-1.
    ierr=exatns_tensor_contract("Z50(e1b,e2b,m1b,m2b)+=S44(e2b,d1b,m1b,m2b)*H1(e1b,d1b)", &
        Z50,S44,H1,prefactor=(-1.0d0,0.0d0))
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z56_1,"Z56_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z56_1,'ZERO')
!   original expression: Z56_1(l1b|m1b)+=H25(l1b,l2b|m1b,d1b)*S43(d1b|l2b)*-1.
    ierr=exatns_tensor_contract("Z56_1(l1b,m1b)+=H25(l1b,l2b,m1b,d1b)*S43(d1b,l2b)", &
        Z56_1,H25,S43,prefactor=(-1.0d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S44(e1be2b|m1b,l1b)*Z56_1(l1b|m2b)
    ierr=exatns_tensor_contract("Z50(e1b,e2b,m1b,m2b)+=S44(e1b,e2b,m1b,l1b)*Z56_1(l1b,m2b)", &
        Z50,S44,Z56_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S44(e1be2b|m2b,l1b)*Z56_1(l1b|m1b)*-1.
    ierr=exatns_tensor_contract("Z50(e1b,e2b,m1b,m2b)+=S44(e1b,e2b,m2b,l1b)*Z56_1(l1b,m1b)", &
        Z50,S44,Z56_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z56_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z56_1,"Z56_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z56_1,'ZERO')
!   original expression: Z56_1(l1b|m1b)+=H37(l1b,l1a|m1b,d1a)*S45(d1a|l1a)*-1.
    ierr=exatns_tensor_contract("Z56_1(l1b,m1b)+=H37(l1b,l1a,m1b,d1a)*S45(d1a,l1a)", &
        Z56_1,H37,S45,prefactor=(-1.0d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S44(e1be2b|m1b,l1b)*Z56_1(l1b|m2b)
    ierr=exatns_tensor_contract("Z50(e1b,e2b,m1b,m2b)+=S44(e1b,e2b,m1b,l1b)*Z56_1(l1b,m2b)", &
        Z50,S44,Z56_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S44(e1be2b|m2b,l1b)*Z56_1(l1b|m1b)*-1.
    ierr=exatns_tensor_contract("Z50(e1b,e2b,m1b,m2b)+=S44(e1b,e2b,m2b,l1b)*Z56_1(l1b,m1b)", &
        Z50,S44,Z56_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z56_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nvir_id/)
    tens_root = (/nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z57_2,"Z57_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z57_2,'ZERO')
!   original expression: Z57_2(l1b|d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|l2b)*-1.
    ierr=exatns_tensor_contract("Z57_2(l1b,d1b)+=H24(l1b,l2b,d1b,d2b)*S43(d2b,l2b)", &
        Z57_2,H24,S43,prefactor=(-1.0d0,0.0d0))
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z56_1,"Z56_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z56_1,'ZERO')
!   original expression: Z56_1(l1b|m1b)+=S43(d1b|m1b)*Z57_2(l1b|d1b)
    ierr=exatns_tensor_contract("Z56_1(l1b,m1b)+=S43(d1b,m1b)*Z57_2(l1b,d1b)", &
        Z56_1,S43,Z57_2,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z57_2)
!   original expression: Z50(e1be2b|m1bm2b)+=S44(e1be2b|m1b,l1b)*Z56_1(l1b|m2b)
    ierr=exatns_tensor_contract("Z50(e1b,e2b,m1b,m2b)+=S44(e1b,e2b,m1b,l1b)*Z56_1(l1b,m2b)", &
        Z50,S44,Z56_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S44(e1be2b|m2b,l1b)*Z56_1(l1b|m1b)*-1.
    ierr=exatns_tensor_contract("Z50(e1b,e2b,m1b,m2b)+=S44(e1b,e2b,m2b,l1b)*Z56_1(l1b,m1b)", &
        Z50,S44,Z56_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z56_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nvir_id/)
    tens_root = (/nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z57_2,"Z57_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z57_2,'ZERO')
!   original expression: Z57_2(l1b|d1b)+=H36(l1b,l1a|d1b,d1a)*S45(d1a|l1a)*-1.
    ierr=exatns_tensor_contract("Z57_2(l1b,d1b)+=H36(l1b,l1a,d1b,d1a)*S45(d1a,l1a)", &
        Z57_2,H36,S45,prefactor=(-1.0d0,0.0d0))
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z56_1,"Z56_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z56_1,'ZERO')
!   original expression: Z56_1(l1b|m1b)+=S43(d1b|m1b)*Z57_2(l1b|d1b)
    ierr=exatns_tensor_contract("Z56_1(l1b,m1b)+=S43(d1b,m1b)*Z57_2(l1b,d1b)", &
        Z56_1,S43,Z57_2,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z57_2)
!   original expression: Z50(e1be2b|m1bm2b)+=S44(e1be2b|m1b,l1b)*Z56_1(l1b|m2b)
    ierr=exatns_tensor_contract("Z50(e1b,e2b,m1b,m2b)+=S44(e1b,e2b,m1b,l1b)*Z56_1(l1b,m2b)", &
        Z50,S44,Z56_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S44(e1be2b|m2b,l1b)*Z56_1(l1b|m1b)*-1.
    ierr=exatns_tensor_contract("Z50(e1b,e2b,m1b,m2b)+=S44(e1b,e2b,m2b,l1b)*Z56_1(l1b,m1b)", &
        Z50,S44,Z56_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z56_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z56_1,"Z56_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z56_1,'ZERO')
!   original expression: Z56_1(l1b|m1b)+=S43(d1b|m1b)*H15(l1b|d1b)*-1.
    ierr=exatns_tensor_contract("Z56_1(l1b,m1b)+=S43(d1b,m1b)*H15(l1b,d1b)", &
        Z56_1,S43,H15,prefactor=(-1.0d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S44(e1be2b|m1b,l1b)*Z56_1(l1b|m2b)
    ierr=exatns_tensor_contract("Z50(e1b,e2b,m1b,m2b)+=S44(e1b,e2b,m1b,l1b)*Z56_1(l1b,m2b)", &
        Z50,S44,Z56_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S44(e1be2b|m2b,l1b)*Z56_1(l1b|m1b)*-1.
    ierr=exatns_tensor_contract("Z50(e1b,e2b,m1b,m2b)+=S44(e1b,e2b,m2b,l1b)*Z56_1(l1b,m1b)", &
        Z50,S44,Z56_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z56_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z56_1,"Z56_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z56_1,'ZERO')
!   original expression: Z56_1(l1b|m1b)+=S44(d1bd2b|m1b,l2b)*H24(l1b,l2b|d1bd2b)*-1.
    ierr=exatns_tensor_contract("Z56_1(l1b,m1b)+=S44(d1b,d2b,m1b,l2b)*H24(l1b,l2b,d1b,d2b)", &
        Z56_1,S44,H24,prefactor=(-0.5d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S44(e1be2b|m1b,l1b)*Z56_1(l1b|m2b)
    ierr=exatns_tensor_contract("Z50(e1b,e2b,m1b,m2b)+=S44(e1b,e2b,m1b,l1b)*Z56_1(l1b,m2b)", &
        Z50,S44,Z56_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S44(e1be2b|m2b,l1b)*Z56_1(l1b|m1b)*-1.
    ierr=exatns_tensor_contract("Z50(e1b,e2b,m1b,m2b)+=S44(e1b,e2b,m2b,l1b)*Z56_1(l1b,m1b)", &
        Z50,S44,Z56_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z56_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z56_1,"Z56_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z56_1,'ZERO')
!   original expression: Z56_1(l1b|m1b)+=S46(d1ad1b|m1b,l1a)*H36(l1b,l1a|d1ad1b)*-1.
    ierr=exatns_tensor_contract("Z56_1(l1b,m1b)+=S46(d1a,d1b,m1b,l1a)*H36(l1b,l1a,d1a,d1b)", &
        Z56_1,S46,H36,prefactor=(-0.5d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S44(e1be2b|m1b,l1b)*Z56_1(l1b|m2b)
    ierr=exatns_tensor_contract("Z50(e1b,e2b,m1b,m2b)+=S44(e1b,e2b,m1b,l1b)*Z56_1(l1b,m2b)", &
        Z50,S44,Z56_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S44(e1be2b|m2b,l1b)*Z56_1(l1b|m1b)*-1.
    ierr=exatns_tensor_contract("Z50(e1b,e2b,m1b,m2b)+=S44(e1b,e2b,m2b,l1b)*Z56_1(l1b,m1b)", &
        Z50,S44,Z56_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z56_1)
!   original expression: Z50(e1be2b|m1bm2b)+=S44(e1be2b|m1b,l1b)*H16(l1b|m2b)*-1.
    ierr=exatns_tensor_contract("Z50(e1b,e2b,m1b,m2b)+=S44(e1b,e2b,m1b,l1b)*H16(l1b,m2b)", &
        Z50,S44,H16,prefactor=(-1.0d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S44(e1be2b|m2b,l1b)*H16(l1b|m1b)
    ierr=exatns_tensor_contract("Z50(e1b,e2b,m1b,m2b)+=S44(e1b,e2b,m2b,l1b)*H16(l1b,m1b)", &
        Z50,S44,H16,prefactor=(1.0d0,0.0d0))
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z77_1,"Z77_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z77_1,'ZERO')
!   original expression: Z77_1(e1b,l1b|m1b,d1b)+=H17(e1b,l1b|d1b,d2b)*S43(d2b|m1b)*-1.
    ierr=exatns_tensor_contract("Z77_1(e1b,l1b,m1b,d1b)+=H17(e1b,l1b,d1b,d2b)*S43(d2b,m1b)", &
        Z77_1,H17,S43,prefactor=(-1.0d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S44(e1b,d1b|m1b,l1b)*Z77_1(e2b,l1b|m2b,d1b)
    ierr=exatns_tensor_contract("Z50(e1b,e2b,m1b,m2b)+=S44(e1b,d1b,m1b,l1b)*Z77_1(e2b,l1b,m2b,d1b)", &
        Z50,S44,Z77_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S44(e2b,d1b|m1b,l1b)*Z77_1(e1b,l1b|m2b,d1b)*-1.
    ierr=exatns_tensor_contract("Z50(e1b,e2b,m1b,m2b)+=S44(e2b,d1b,m1b,l1b)*Z77_1(e1b,l1b,m2b,d1b)", &
        Z50,S44,Z77_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S44(e1b,d1b|m2b,l1b)*Z77_1(e2b,l1b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z50(e1b,e2b,m1b,m2b)+=S44(e1b,d1b,m2b,l1b)*Z77_1(e2b,l1b,m1b,d1b)", &
        Z50,S44,Z77_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S44(e2b,d1b|m2b,l1b)*Z77_1(e1b,l1b|m1b,d1b)
    ierr=exatns_tensor_contract("Z50(e1b,e2b,m1b,m2b)+=S44(e2b,d1b,m2b,l1b)*Z77_1(e1b,l1b,m1b,d1b)", &
        Z50,S44,Z77_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z77_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z77_1,"Z77_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z77_1,'ZERO')
!   original expression: Z77_1(e1b,l1b|m1b,d1b)+=S44(e1b,d2b|m1b,l2b)*H24(l1b,l2b|d1b,d2b)*0.5
    ierr=exatns_tensor_contract("Z77_1(e1b,l1b,m1b,d1b)+=S44(e1b,d2b,m1b,l2b)*H24(l1b,l2b,d1b,d2b)", &
        Z77_1,S44,H24,prefactor=(0.5d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S44(e1b,d1b|m1b,l1b)*Z77_1(e2b,l1b|m2b,d1b)
    ierr=exatns_tensor_contract("Z50(e1b,e2b,m1b,m2b)+=S44(e1b,d1b,m1b,l1b)*Z77_1(e2b,l1b,m2b,d1b)", &
        Z50,S44,Z77_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S44(e2b,d1b|m1b,l1b)*Z77_1(e1b,l1b|m2b,d1b)*-1.
    ierr=exatns_tensor_contract("Z50(e1b,e2b,m1b,m2b)+=S44(e2b,d1b,m1b,l1b)*Z77_1(e1b,l1b,m2b,d1b)", &
        Z50,S44,Z77_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S44(e1b,d1b|m2b,l1b)*Z77_1(e2b,l1b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z50(e1b,e2b,m1b,m2b)+=S44(e1b,d1b,m2b,l1b)*Z77_1(e2b,l1b,m1b,d1b)", &
        Z50,S44,Z77_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S44(e2b,d1b|m2b,l1b)*Z77_1(e1b,l1b|m1b,d1b)
    ierr=exatns_tensor_contract("Z50(e1b,e2b,m1b,m2b)+=S44(e2b,d1b,m2b,l1b)*Z77_1(e1b,l1b,m1b,d1b)", &
        Z50,S44,Z77_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z77_1)
!   original expression: Z50(e1be2b|m1bm2b)+=S44(e1b,d1b|m1b,l1b)*H18(e2b,l1b|m2b,d1b)
    ierr=exatns_tensor_contract("Z50(e1b,e2b,m1b,m2b)+=S44(e1b,d1b,m1b,l1b)*H18(e2b,l1b,m2b,d1b)", &
        Z50,S44,H18,prefactor=(1.0d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S44(e2b,d1b|m1b,l1b)*H18(e1b,l1b|m2b,d1b)*-1.
    ierr=exatns_tensor_contract("Z50(e1b,e2b,m1b,m2b)+=S44(e2b,d1b,m1b,l1b)*H18(e1b,l1b,m2b,d1b)", &
        Z50,S44,H18,prefactor=(-1.0d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S44(e1b,d1b|m2b,l1b)*H18(e2b,l1b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z50(e1b,e2b,m1b,m2b)+=S44(e1b,d1b,m2b,l1b)*H18(e2b,l1b,m1b,d1b)", &
        Z50,S44,H18,prefactor=(-1.0d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S44(e2b,d1b|m2b,l1b)*H18(e1b,l1b|m1b,d1b)
    ierr=exatns_tensor_contract("Z50(e1b,e2b,m1b,m2b)+=S44(e2b,d1b,m2b,l1b)*H18(e1b,l1b,m1b,d1b)", &
        Z50,S44,H18,prefactor=(1.0d0,0.0d0))
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z78_1,"Z78_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z78_1,'ZERO')
!   original expression: Z78_1(e1b,l1a|m1b,d1a)+=H29(e1b,l1a|d1b,d1a)*S43(d1b|m1b)
    ierr=exatns_tensor_contract("Z78_1(e1b,l1a,m1b,d1a)+=H29(e1b,l1a,d1b,d1a)*S43(d1b,m1b)", &
        Z78_1,H29,S43,prefactor=(1.0d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S46(e1b,d1a|m1b,l1a)*Z78_1(e2b,l1a|m2b,d1a)
    ierr=exatns_tensor_contract("Z50(e1b,e2b,m1b,m2b)+=S46(e1b,d1a,m1b,l1a)*Z78_1(e2b,l1a,m2b,d1a)", &
        Z50,S46,Z78_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S46(e2b,d1a|m1b,l1a)*Z78_1(e1b,l1a|m2b,d1a)*-1.
    ierr=exatns_tensor_contract("Z50(e1b,e2b,m1b,m2b)+=S46(e2b,d1a,m1b,l1a)*Z78_1(e1b,l1a,m2b,d1a)", &
        Z50,S46,Z78_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S46(e1b,d1a|m2b,l1a)*Z78_1(e2b,l1a|m1b,d1a)*-1.
    ierr=exatns_tensor_contract("Z50(e1b,e2b,m1b,m2b)+=S46(e1b,d1a,m2b,l1a)*Z78_1(e2b,l1a,m1b,d1a)", &
        Z50,S46,Z78_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S46(e2b,d1a|m2b,l1a)*Z78_1(e1b,l1a|m1b,d1a)
    ierr=exatns_tensor_contract("Z50(e1b,e2b,m1b,m2b)+=S46(e2b,d1a,m2b,l1a)*Z78_1(e1b,l1a,m1b,d1a)", &
        Z50,S46,Z78_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z78_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z78_1,"Z78_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z78_1,'ZERO')
!   original expression: Z78_1(e1b,l1a|m1b,d1a)+=S44(e1b,d1b|m1b,l1b)*H36(l1b,l1a|d1b,d1a)
    ierr=exatns_tensor_contract("Z78_1(e1b,l1a,m1b,d1a)+=S44(e1b,d1b,m1b,l1b)*H36(l1b,l1a,d1b,d1a)", &
        Z78_1,S44,H36,prefactor=(1.0d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S46(e1b,d1a|m1b,l1a)*Z78_1(e2b,l1a|m2b,d1a)
    ierr=exatns_tensor_contract("Z50(e1b,e2b,m1b,m2b)+=S46(e1b,d1a,m1b,l1a)*Z78_1(e2b,l1a,m2b,d1a)", &
        Z50,S46,Z78_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S46(e2b,d1a|m1b,l1a)*Z78_1(e1b,l1a|m2b,d1a)*-1.
    ierr=exatns_tensor_contract("Z50(e1b,e2b,m1b,m2b)+=S46(e2b,d1a,m1b,l1a)*Z78_1(e1b,l1a,m2b,d1a)", &
        Z50,S46,Z78_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S46(e1b,d1a|m2b,l1a)*Z78_1(e2b,l1a|m1b,d1a)*-1.
    ierr=exatns_tensor_contract("Z50(e1b,e2b,m1b,m2b)+=S46(e1b,d1a,m2b,l1a)*Z78_1(e2b,l1a,m1b,d1a)", &
        Z50,S46,Z78_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S46(e2b,d1a|m2b,l1a)*Z78_1(e1b,l1a|m1b,d1a)
    ierr=exatns_tensor_contract("Z50(e1b,e2b,m1b,m2b)+=S46(e2b,d1a,m2b,l1a)*Z78_1(e1b,l1a,m1b,d1a)", &
        Z50,S46,Z78_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z78_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z78_1,"Z78_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z78_1,'ZERO')
!   original expression: Z78_1(e1b,l1a|m1b,d1a)+=S46(e1b,d2a|m1b,l2a)*H40(l1a,l2a|d1a,d2a)*0.5
    ierr=exatns_tensor_contract("Z78_1(e1b,l1a,m1b,d1a)+=S46(e1b,d2a,m1b,l2a)*H40(l1a,l2a,d1a,d2a)", &
        Z78_1,S46,H40,prefactor=(0.5d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S46(e1b,d1a|m1b,l1a)*Z78_1(e2b,l1a|m2b,d1a)
    ierr=exatns_tensor_contract("Z50(e1b,e2b,m1b,m2b)+=S46(e1b,d1a,m1b,l1a)*Z78_1(e2b,l1a,m2b,d1a)", &
        Z50,S46,Z78_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S46(e2b,d1a|m1b,l1a)*Z78_1(e1b,l1a|m2b,d1a)*-1.
    ierr=exatns_tensor_contract("Z50(e1b,e2b,m1b,m2b)+=S46(e2b,d1a,m1b,l1a)*Z78_1(e1b,l1a,m2b,d1a)", &
        Z50,S46,Z78_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S46(e1b,d1a|m2b,l1a)*Z78_1(e2b,l1a|m1b,d1a)*-1.
    ierr=exatns_tensor_contract("Z50(e1b,e2b,m1b,m2b)+=S46(e1b,d1a,m2b,l1a)*Z78_1(e2b,l1a,m1b,d1a)", &
        Z50,S46,Z78_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S46(e2b,d1a|m2b,l1a)*Z78_1(e1b,l1a|m1b,d1a)
    ierr=exatns_tensor_contract("Z50(e1b,e2b,m1b,m2b)+=S46(e2b,d1a,m2b,l1a)*Z78_1(e1b,l1a,m1b,d1a)", &
        Z50,S46,Z78_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z78_1)
!   original expression: Z50(e1be2b|m1bm2b)+=S46(e1b,d1a|m1b,l1a)*H30(e2b,l1a|m2b,d1a)
    ierr=exatns_tensor_contract("Z50(e1b,e2b,m1b,m2b)+=S46(e1b,d1a,m1b,l1a)*H30(e2b,l1a,m2b,d1a)", &
        Z50,S46,H30,prefactor=(1.0d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S46(e2b,d1a|m1b,l1a)*H30(e1b,l1a|m2b,d1a)*-1.
    ierr=exatns_tensor_contract("Z50(e1b,e2b,m1b,m2b)+=S46(e2b,d1a,m1b,l1a)*H30(e1b,l1a,m2b,d1a)", &
        Z50,S46,H30,prefactor=(-1.0d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S46(e1b,d1a|m2b,l1a)*H30(e2b,l1a|m1b,d1a)*-1.
    ierr=exatns_tensor_contract("Z50(e1b,e2b,m1b,m2b)+=S46(e1b,d1a,m2b,l1a)*H30(e2b,l1a,m1b,d1a)", &
        Z50,S46,H30,prefactor=(-1.0d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S46(e2b,d1a|m2b,l1a)*H30(e1b,l1a|m1b,d1a)
    ierr=exatns_tensor_contract("Z50(e1b,e2b,m1b,m2b)+=S46(e2b,d1a,m2b,l1a)*H30(e1b,l1a,m1b,d1a)", &
        Z50,S46,H30,prefactor=(1.0d0,0.0d0))
!   original expression: Z52(e1ae1b|m1am1b)+=H11(e1ae1b|m1am1b)
    ierr=exatns_tensor_contract("Z52(e1a,e1b,m1a,m1b)+=H11(e1a,e1b,m1a,m1b)*K()", &
        Z52,H11,one_tensor,prefactor=(1.0d0,0.0d0))
!   original expression: Z52(e1ae1b|m1am1b)+=H8(e1ae1b|d1ad1b)*S46(d1ad1b|m1am1b)
    ierr=exatns_tensor_contract("Z52(e1a,e1b,m1a,m1b)+=H8(e1a,e1b,d1a,d1b)*S46(d1a,d1b,m1a,m1b)", &
        Z52,H8,S46,prefactor=(0.5d0,0.0d0))
!   original expression: Z52(e1ae1b|m1am1b)+=H32(e1b,l1a|m1am1b)*S45(e1a|l1a)
    ierr=exatns_tensor_contract("Z52(e1a,e1b,m1a,m1b)+=H32(e1b,l1a,m1a,m1b)*S45(e1a,l1a)", &
        Z52,H32,S45,prefactor=(1.0d0,0.0d0))
!   original expression: Z52(e1ae1b|m1am1b)+=H23(e1a,l1b|m1am1b)*S43(e1b|l1b)*-1.
    ierr=exatns_tensor_contract("Z52(e1a,e1b,m1a,m1b)+=H23(e1a,l1b,m1a,m1b)*S43(e1b,l1b)", &
        Z52,H23,S43,prefactor=(-1.0d0,0.0d0))
!   original expression: Z52(e1ae1b|m1am1b)+=H9(e1ae1b|m1b,d1a)*S45(d1a|m1a)*-1.
    ierr=exatns_tensor_contract("Z52(e1a,e1b,m1a,m1b)+=H9(e1a,e1b,m1b,d1a)*S45(d1a,m1a)", &
        Z52,H9,S45,prefactor=(-1.0d0,0.0d0))
!   original expression: Z52(e1ae1b|m1am1b)+=H10(e1ae1b|m1a,d1b)*S43(d1b|m1b)
    ierr=exatns_tensor_contract("Z52(e1a,e1b,m1a,m1b)+=H10(e1a,e1b,m1a,d1b)*S43(d1b,m1b)", &
        Z52,H10,S43,prefactor=(1.0d0,0.0d0))
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z66_1,"Z66_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z66_1,'ZERO')
!   original expression: Z66_1(e1a,l1b|m1am1b)+=H20(e1a,l1b|d1ad1b)*S46(d1ad1b|m1am1b)*-1.
    ierr=exatns_tensor_contract("Z66_1(e1a,l1b,m1a,m1b)+=H20(e1a,l1b,d1a,d1b)*S46(d1a,d1b,m1a,m1b)", &
        Z66_1,H20,S46,prefactor=(-0.5d0,0.0d0))
!   original expression: Z52(e1ae1b|m1am1b)+=S43(e1b|l1b)*Z66_1(e1a,l1b|m1am1b)
    ierr=exatns_tensor_contract("Z52(e1a,e1b,m1a,m1b)+=S43(e1b,l1b)*Z66_1(e1a,l1b,m1a,m1b)", &
        Z52,S43,Z66_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z66_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z66_1,"Z66_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z66_1,'ZERO')
!   original expression: Z66_1(e1a,l1b|m1am1b)+=H21(e1a,l1b|m1b,d1a)*S45(d1a|m1a)
    ierr=exatns_tensor_contract("Z66_1(e1a,l1b,m1a,m1b)+=H21(e1a,l1b,m1b,d1a)*S45(d1a,m1a)", &
        Z66_1,H21,S45,prefactor=(1.0d0,0.0d0))
!   original expression: Z52(e1ae1b|m1am1b)+=S43(e1b|l1b)*Z66_1(e1a,l1b|m1am1b)
    ierr=exatns_tensor_contract("Z52(e1a,e1b,m1a,m1b)+=S43(e1b,l1b)*Z66_1(e1a,l1b,m1a,m1b)", &
        Z52,S43,Z66_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z66_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z66_1,"Z66_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z66_1,'ZERO')
!   original expression: Z66_1(e1a,l1b|m1am1b)+=H22(e1a,l1b|m1a,d1b)*S43(d1b|m1b)*-1.
    ierr=exatns_tensor_contract("Z66_1(e1a,l1b,m1a,m1b)+=H22(e1a,l1b,m1a,d1b)*S43(d1b,m1b)", &
        Z66_1,H22,S43,prefactor=(-1.0d0,0.0d0))
!   original expression: Z52(e1ae1b|m1am1b)+=S43(e1b|l1b)*Z66_1(e1a,l1b|m1am1b)
    ierr=exatns_tensor_contract("Z52(e1a,e1b,m1a,m1b)+=S43(e1b,l1b)*Z66_1(e1a,l1b,m1a,m1b)", &
        Z52,S43,Z66_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z66_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z80_2,"Z80_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z80_2,'ZERO')
!   original expression: Z80_2(e1a,l1b|m1b,d1a)+=H20(e1a,l1b|d1b,d1a)*S43(d1b|m1b)
    ierr=exatns_tensor_contract("Z80_2(e1a,l1b,m1b,d1a)+=H20(e1a,l1b,d1b,d1a)*S43(d1b,m1b)", &
        Z80_2,H20,S43,prefactor=(1.0d0,0.0d0))
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z66_1,"Z66_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z66_1,'ZERO')
!   original expression: Z66_1(e1a,l1b|m1am1b)+=S45(d1a|m1a)*Z80_2(e1a,l1b|m1b,d1a)
    ierr=exatns_tensor_contract("Z66_1(e1a,l1b,m1a,m1b)+=S45(d1a,m1a)*Z80_2(e1a,l1b,m1b,d1a)", &
        Z66_1,S45,Z80_2,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z80_2)
!   original expression: Z52(e1ae1b|m1am1b)+=S43(e1b|l1b)*Z66_1(e1a,l1b|m1am1b)
    ierr=exatns_tensor_contract("Z52(e1a,e1b,m1a,m1b)+=S43(e1b,l1b)*Z66_1(e1a,l1b,m1a,m1b)", &
        Z52,S43,Z66_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z66_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nvir_id/)
    tens_root = (/nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z57_2,"Z57_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z57_2,'ZERO')
!   original expression: Z57_2(l1b|d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|l2b)*-1.
    ierr=exatns_tensor_contract("Z57_2(l1b,d1b)+=H24(l1b,l2b,d1b,d2b)*S43(d2b,l2b)", &
        Z57_2,H24,S43,prefactor=(-1.0d0,0.0d0))
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z66_1,"Z66_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z66_1,'ZERO')
!   original expression: Z66_1(e1a,l1b|m1am1b)+=S46(e1a,d1b|m1am1b)*Z57_2(l1b|d1b)
    ierr=exatns_tensor_contract("Z66_1(e1a,l1b,m1a,m1b)+=S46(e1a,d1b,m1a,m1b)*Z57_2(l1b,d1b)", &
        Z66_1,S46,Z57_2,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z57_2)
!   original expression: Z52(e1ae1b|m1am1b)+=S43(e1b|l1b)*Z66_1(e1a,l1b|m1am1b)
    ierr=exatns_tensor_contract("Z52(e1a,e1b,m1a,m1b)+=S43(e1b,l1b)*Z66_1(e1a,l1b,m1a,m1b)", &
        Z52,S43,Z66_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z66_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nvir_id/)
    tens_root = (/nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z57_2,"Z57_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z57_2,'ZERO')
!   original expression: Z57_2(l1b|d1b)+=H36(l1b,l1a|d1b,d1a)*S45(d1a|l1a)*-1.
    ierr=exatns_tensor_contract("Z57_2(l1b,d1b)+=H36(l1b,l1a,d1b,d1a)*S45(d1a,l1a)", &
        Z57_2,H36,S45,prefactor=(-1.0d0,0.0d0))
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z66_1,"Z66_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z66_1,'ZERO')
!   original expression: Z66_1(e1a,l1b|m1am1b)+=S46(e1a,d1b|m1am1b)*Z57_2(l1b|d1b)
    ierr=exatns_tensor_contract("Z66_1(e1a,l1b,m1a,m1b)+=S46(e1a,d1b,m1a,m1b)*Z57_2(l1b,d1b)", &
        Z66_1,S46,Z57_2,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z57_2)
!   original expression: Z52(e1ae1b|m1am1b)+=S43(e1b|l1b)*Z66_1(e1a,l1b|m1am1b)
    ierr=exatns_tensor_contract("Z52(e1a,e1b,m1a,m1b)+=S43(e1b,l1b)*Z66_1(e1a,l1b,m1a,m1b)", &
        Z52,S43,Z66_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z66_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z66_1,"Z66_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z66_1,'ZERO')
!   original expression: Z66_1(e1a,l1b|m1am1b)+=S46(e1a,d1b|m1am1b)*H15(l1b|d1b)*-1.
    ierr=exatns_tensor_contract("Z66_1(e1a,l1b,m1a,m1b)+=S46(e1a,d1b,m1a,m1b)*H15(l1b,d1b)", &
        Z66_1,S46,H15,prefactor=(-1.0d0,0.0d0))
!   original expression: Z52(e1ae1b|m1am1b)+=S43(e1b|l1b)*Z66_1(e1a,l1b|m1am1b)
    ierr=exatns_tensor_contract("Z52(e1a,e1b,m1a,m1b)+=S43(e1b,l1b)*Z66_1(e1a,l1b,m1a,m1b)", &
        Z52,S43,Z66_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z66_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z85_2,"Z85_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z85_2,'ZERO')
!   original expression: Z85_2(l1b,l1a|m1a,d1b)+=H36(l1b,l1a|d1b,d1a)*S45(d1a|m1a)*-1.
    ierr=exatns_tensor_contract("Z85_2(l1b,l1a,m1a,d1b)+=H36(l1b,l1a,d1b,d1a)*S45(d1a,m1a)", &
        Z85_2,H36,S45,prefactor=(-1.0d0,0.0d0))
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z66_1,"Z66_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z66_1,'ZERO')
!   original expression: Z66_1(e1a,l1b|m1am1b)+=S46(e1a,d1b|m1b,l1a)*Z85_2(l1b,l1a|m1a,d1b)
    ierr=exatns_tensor_contract("Z66_1(e1a,l1b,m1a,m1b)+=S46(e1a,d1b,m1b,l1a)*Z85_2(l1b,l1a,m1a,d1b)", &
        Z66_1,S46,Z85_2,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z85_2)
!   original expression: Z52(e1ae1b|m1am1b)+=S43(e1b|l1b)*Z66_1(e1a,l1b|m1am1b)
    ierr=exatns_tensor_contract("Z52(e1a,e1b,m1a,m1b)+=S43(e1b,l1b)*Z66_1(e1a,l1b,m1a,m1b)", &
        Z52,S43,Z66_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z66_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z66_1,"Z66_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z66_1,'ZERO')
!   original expression: Z66_1(e1a,l1b|m1am1b)+=S46(e1a,d1b|m1b,l1a)*H38(l1b,l1a|m1a,d1b)
    ierr=exatns_tensor_contract("Z66_1(e1a,l1b,m1a,m1b)+=S46(e1a,d1b,m1b,l1a)*H38(l1b,l1a,m1a,d1b)", &
        Z66_1,S46,H38,prefactor=(1.0d0,0.0d0))
!   original expression: Z52(e1ae1b|m1am1b)+=S43(e1b|l1b)*Z66_1(e1a,l1b|m1am1b)
    ierr=exatns_tensor_contract("Z52(e1a,e1b,m1a,m1b)+=S43(e1b,l1b)*Z66_1(e1a,l1b,m1a,m1b)", &
        Z52,S43,Z66_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z66_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z83_2,"Z83_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z83_2,'ZERO')
!   original expression: Z83_2(l1b,l2b|m1b,d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|m1b)
    ierr=exatns_tensor_contract("Z83_2(l1b,l2b,m1b,d1b)+=H24(l1b,l2b,d1b,d2b)*S43(d2b,m1b)", &
        Z83_2,H24,S43,prefactor=(1.0d0,0.0d0))
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z66_1,"Z66_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z66_1,'ZERO')
!   original expression: Z66_1(e1a,l1b|m1am1b)+=S46(e1a,d1b|m1a,l2b)*Z83_2(l1b,l2b|m1b,d1b)
    ierr=exatns_tensor_contract("Z66_1(e1a,l1b,m1a,m1b)+=S46(e1a,d1b,m1a,l2b)*Z83_2(l1b,l2b,m1b,d1b)", &
        Z66_1,S46,Z83_2,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z83_2)
!   original expression: Z52(e1ae1b|m1am1b)+=S43(e1b|l1b)*Z66_1(e1a,l1b|m1am1b)
    ierr=exatns_tensor_contract("Z52(e1a,e1b,m1a,m1b)+=S43(e1b,l1b)*Z66_1(e1a,l1b,m1a,m1b)", &
        Z52,S43,Z66_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z66_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z66_1,"Z66_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z66_1,'ZERO')
!   original expression: Z66_1(e1a,l1b|m1am1b)+=S46(e1a,d1b|m1a,l2b)*H25(l1b,l2b|m1b,d1b)*-1.
    ierr=exatns_tensor_contract("Z66_1(e1a,l1b,m1a,m1b)+=S46(e1a,d1b,m1a,l2b)*H25(l1b,l2b,m1b,d1b)", &
        Z66_1,S46,H25,prefactor=(-1.0d0,0.0d0))
!   original expression: Z52(e1ae1b|m1am1b)+=S43(e1b|l1b)*Z66_1(e1a,l1b|m1am1b)
    ierr=exatns_tensor_contract("Z52(e1a,e1b,m1a,m1b)+=S43(e1b,l1b)*Z66_1(e1a,l1b,m1a,m1b)", &
        Z52,S43,Z66_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z66_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z84_2,"Z84_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z84_2,'ZERO')
!   original expression: Z84_2(l1b,l1a|m1b,d1a)+=H36(l1b,l1a|d1b,d1a)*S43(d1b|m1b)*-1.
    ierr=exatns_tensor_contract("Z84_2(l1b,l1a,m1b,d1a)+=H36(l1b,l1a,d1b,d1a)*S43(d1b,m1b)", &
        Z84_2,H36,S43,prefactor=(-1.0d0,0.0d0))
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z66_1,"Z66_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z66_1,'ZERO')
!   original expression: Z66_1(e1a,l1b|m1am1b)+=S47(e1a,d1a|m1a,l1a)*Z84_2(l1b,l1a|m1b,d1a)
    ierr=exatns_tensor_contract("Z66_1(e1a,l1b,m1a,m1b)+=S47(e1a,d1a,m1a,l1a)*Z84_2(l1b,l1a,m1b,d1a)", &
        Z66_1,S47,Z84_2,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z84_2)
!   original expression: Z52(e1ae1b|m1am1b)+=S43(e1b|l1b)*Z66_1(e1a,l1b|m1am1b)
    ierr=exatns_tensor_contract("Z52(e1a,e1b,m1a,m1b)+=S43(e1b,l1b)*Z66_1(e1a,l1b,m1a,m1b)", &
        Z52,S43,Z66_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z66_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z66_1,"Z66_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z66_1,'ZERO')
!   original expression: Z66_1(e1a,l1b|m1am1b)+=S47(e1a,d1a|m1a,l1a)*H37(l1b,l1a|m1b,d1a)*-1.
    ierr=exatns_tensor_contract("Z66_1(e1a,l1b,m1a,m1b)+=S47(e1a,d1a,m1a,l1a)*H37(l1b,l1a,m1b,d1a)", &
        Z66_1,S47,H37,prefactor=(-1.0d0,0.0d0))
!   original expression: Z52(e1ae1b|m1am1b)+=S43(e1b|l1b)*Z66_1(e1a,l1b|m1am1b)
    ierr=exatns_tensor_contract("Z52(e1a,e1b,m1a,m1b)+=S43(e1b,l1b)*Z66_1(e1a,l1b,m1a,m1b)", &
        Z52,S43,Z66_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z66_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z64_1,"Z64_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z64_1,'ZERO')
!   original expression: Z64_1(e1b,l1a|m1am1b)+=H29(e1b,l1a|d1ad1b)*S46(d1ad1b|m1am1b)
    ierr=exatns_tensor_contract("Z64_1(e1b,l1a,m1a,m1b)+=H29(e1b,l1a,d1a,d1b)*S46(d1a,d1b,m1a,m1b)", &
        Z64_1,H29,S46,prefactor=(0.5d0,0.0d0))
!   original expression: Z52(e1ae1b|m1am1b)+=S45(e1a|l1a)*Z64_1(e1b,l1a|m1am1b)
    ierr=exatns_tensor_contract("Z52(e1a,e1b,m1a,m1b)+=S45(e1a,l1a)*Z64_1(e1b,l1a,m1a,m1b)", &
        Z52,S45,Z64_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z64_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z64_1,"Z64_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z64_1,'ZERO')
!   original expression: Z64_1(e1b,l1a|m1am1b)+=H39(l1b,l1a|m1am1b)*S43(e1b|l1b)*-1.
    ierr=exatns_tensor_contract("Z64_1(e1b,l1a,m1a,m1b)+=H39(l1b,l1a,m1a,m1b)*S43(e1b,l1b)", &
        Z64_1,H39,S43,prefactor=(-1.0d0,0.0d0))
!   original expression: Z52(e1ae1b|m1am1b)+=S45(e1a|l1a)*Z64_1(e1b,l1a|m1am1b)
    ierr=exatns_tensor_contract("Z52(e1a,e1b,m1a,m1b)+=S45(e1a,l1a)*Z64_1(e1b,l1a,m1a,m1b)", &
        Z52,S45,Z64_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z64_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z64_1,"Z64_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z64_1,'ZERO')
!   original expression: Z64_1(e1b,l1a|m1am1b)+=H30(e1b,l1a|m1b,d1a)*S45(d1a|m1a)*-1.
    ierr=exatns_tensor_contract("Z64_1(e1b,l1a,m1a,m1b)+=H30(e1b,l1a,m1b,d1a)*S45(d1a,m1a)", &
        Z64_1,H30,S45,prefactor=(-1.0d0,0.0d0))
!   original expression: Z52(e1ae1b|m1am1b)+=S45(e1a|l1a)*Z64_1(e1b,l1a|m1am1b)
    ierr=exatns_tensor_contract("Z52(e1a,e1b,m1a,m1b)+=S45(e1a,l1a)*Z64_1(e1b,l1a,m1a,m1b)", &
        Z52,S45,Z64_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z64_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z64_1,"Z64_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z64_1,'ZERO')
!   original expression: Z64_1(e1b,l1a|m1am1b)+=H31(e1b,l1a|m1a,d1b)*S43(d1b|m1b)
    ierr=exatns_tensor_contract("Z64_1(e1b,l1a,m1a,m1b)+=H31(e1b,l1a,m1a,d1b)*S43(d1b,m1b)", &
        Z64_1,H31,S43,prefactor=(1.0d0,0.0d0))
!   original expression: Z52(e1ae1b|m1am1b)+=S45(e1a|l1a)*Z64_1(e1b,l1a|m1am1b)
    ierr=exatns_tensor_contract("Z52(e1a,e1b,m1a,m1b)+=S45(e1a,l1a)*Z64_1(e1b,l1a,m1a,m1b)", &
        Z52,S45,Z64_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z64_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z71_2,"Z71_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z71_2,'ZERO')
!   original expression: Z71_2(l1b,l1a|m1am1b)+=H37(l1b,l1a|m1b,d1a)*S45(d1a|m1a)
    ierr=exatns_tensor_contract("Z71_2(l1b,l1a,m1a,m1b)+=H37(l1b,l1a,m1b,d1a)*S45(d1a,m1a)", &
        Z71_2,H37,S45,prefactor=(1.0d0,0.0d0))
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z64_1,"Z64_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z64_1,'ZERO')
!   original expression: Z64_1(e1b,l1a|m1am1b)+=S43(e1b|l1b)*Z71_2(l1b,l1a|m1am1b)
    ierr=exatns_tensor_contract("Z64_1(e1b,l1a,m1a,m1b)+=S43(e1b,l1b)*Z71_2(l1b,l1a,m1a,m1b)", &
        Z64_1,S43,Z71_2,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z71_2)
!   original expression: Z52(e1ae1b|m1am1b)+=S45(e1a|l1a)*Z64_1(e1b,l1a|m1am1b)
    ierr=exatns_tensor_contract("Z52(e1a,e1b,m1a,m1b)+=S45(e1a,l1a)*Z64_1(e1b,l1a,m1a,m1b)", &
        Z52,S45,Z64_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z64_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z71_2,"Z71_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z71_2,'ZERO')
!   original expression: Z71_2(l1b,l1a|m1am1b)+=H38(l1b,l1a|m1a,d1b)*S43(d1b|m1b)*-1.
    ierr=exatns_tensor_contract("Z71_2(l1b,l1a,m1a,m1b)+=H38(l1b,l1a,m1a,d1b)*S43(d1b,m1b)", &
        Z71_2,H38,S43,prefactor=(-1.0d0,0.0d0))
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z64_1,"Z64_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z64_1,'ZERO')
!   original expression: Z64_1(e1b,l1a|m1am1b)+=S43(e1b|l1b)*Z71_2(l1b,l1a|m1am1b)
    ierr=exatns_tensor_contract("Z64_1(e1b,l1a,m1a,m1b)+=S43(e1b,l1b)*Z71_2(l1b,l1a,m1a,m1b)", &
        Z64_1,S43,Z71_2,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z71_2)
!   original expression: Z52(e1ae1b|m1am1b)+=S45(e1a|l1a)*Z64_1(e1b,l1a|m1am1b)
    ierr=exatns_tensor_contract("Z52(e1a,e1b,m1a,m1b)+=S45(e1a,l1a)*Z64_1(e1b,l1a,m1a,m1b)", &
        Z52,S45,Z64_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z64_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z84_3,"Z84_3",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z84_3,'ZERO')
!   original expression: Z84_3(l1b,l1a|m1b,d1a)+=H36(l1b,l1a|d1b,d1a)*S43(d1b|m1b)
    ierr=exatns_tensor_contract("Z84_3(l1b,l1a,m1b,d1a)+=H36(l1b,l1a,d1b,d1a)*S43(d1b,m1b)", &
        Z84_3,H36,S43,prefactor=(1.0d0,0.0d0))
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z71_2,"Z71_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z71_2,'ZERO')
!   original expression: Z71_2(l1b,l1a|m1am1b)+=S45(d1a|m1a)*Z84_3(l1b,l1a|m1b,d1a)
    ierr=exatns_tensor_contract("Z71_2(l1b,l1a,m1a,m1b)+=S45(d1a,m1a)*Z84_3(l1b,l1a,m1b,d1a)", &
        Z71_2,S45,Z84_3,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z84_3)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z64_1,"Z64_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z64_1,'ZERO')
!   original expression: Z64_1(e1b,l1a|m1am1b)+=S43(e1b|l1b)*Z71_2(l1b,l1a|m1am1b)
    ierr=exatns_tensor_contract("Z64_1(e1b,l1a,m1a,m1b)+=S43(e1b,l1b)*Z71_2(l1b,l1a,m1a,m1b)", &
        Z64_1,S43,Z71_2,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z71_2)
!   original expression: Z52(e1ae1b|m1am1b)+=S45(e1a|l1a)*Z64_1(e1b,l1a|m1am1b)
    ierr=exatns_tensor_contract("Z52(e1a,e1b,m1a,m1b)+=S45(e1a,l1a)*Z64_1(e1b,l1a,m1a,m1b)", &
        Z52,S45,Z64_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z64_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z71_2,"Z71_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z71_2,'ZERO')
!   original expression: Z71_2(l1b,l1a|m1am1b)+=S46(d1ad1b|m1am1b)*H36(l1b,l1a|d1ad1b)*-1.
    ierr=exatns_tensor_contract("Z71_2(l1b,l1a,m1a,m1b)+=S46(d1a,d1b,m1a,m1b)*H36(l1b,l1a,d1a,d1b)", &
        Z71_2,S46,H36,prefactor=(-0.5d0,0.0d0))
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z64_1,"Z64_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z64_1,'ZERO')
!   original expression: Z64_1(e1b,l1a|m1am1b)+=S43(e1b|l1b)*Z71_2(l1b,l1a|m1am1b)
    ierr=exatns_tensor_contract("Z64_1(e1b,l1a,m1a,m1b)+=S43(e1b,l1b)*Z71_2(l1b,l1a,m1a,m1b)", &
        Z64_1,S43,Z71_2,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z71_2)
!   original expression: Z52(e1ae1b|m1am1b)+=S45(e1a|l1a)*Z64_1(e1b,l1a|m1am1b)
    ierr=exatns_tensor_contract("Z52(e1a,e1b,m1a,m1b)+=S45(e1a,l1a)*Z64_1(e1b,l1a,m1a,m1b)", &
        Z52,S45,Z64_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z64_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z78_2,"Z78_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z78_2,'ZERO')
!   original expression: Z78_2(e1b,l1a|m1b,d1a)+=H29(e1b,l1a|d1b,d1a)*S43(d1b|m1b)*-1.
    ierr=exatns_tensor_contract("Z78_2(e1b,l1a,m1b,d1a)+=H29(e1b,l1a,d1b,d1a)*S43(d1b,m1b)", &
        Z78_2,H29,S43,prefactor=(-1.0d0,0.0d0))
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z64_1,"Z64_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z64_1,'ZERO')
!   original expression: Z64_1(e1b,l1a|m1am1b)+=S45(d1a|m1a)*Z78_2(e1b,l1a|m1b,d1a)
    ierr=exatns_tensor_contract("Z64_1(e1b,l1a,m1a,m1b)+=S45(d1a,m1a)*Z78_2(e1b,l1a,m1b,d1a)", &
        Z64_1,S45,Z78_2,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z78_2)
!   original expression: Z52(e1ae1b|m1am1b)+=S45(e1a|l1a)*Z64_1(e1b,l1a|m1am1b)
    ierr=exatns_tensor_contract("Z52(e1a,e1b,m1a,m1b)+=S45(e1a,l1a)*Z64_1(e1b,l1a,m1a,m1b)", &
        Z52,S45,Z64_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z64_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nvir_id/)
    tens_root = (/nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z60_2,"Z60_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z60_2,'ZERO')
!   original expression: Z60_2(l1a|d1a)+=H36(l1b,l1a|d1b,d1a)*S43(d1b|l1b)
    ierr=exatns_tensor_contract("Z60_2(l1a,d1a)+=H36(l1b,l1a,d1b,d1a)*S43(d1b,l1b)", &
        Z60_2,H36,S43,prefactor=(1.0d0,0.0d0))
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z64_1,"Z64_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z64_1,'ZERO')
!   original expression: Z64_1(e1b,l1a|m1am1b)+=S46(e1b,d1a|m1am1b)*Z60_2(l1a|d1a)
    ierr=exatns_tensor_contract("Z64_1(e1b,l1a,m1a,m1b)+=S46(e1b,d1a,m1a,m1b)*Z60_2(l1a,d1a)", &
        Z64_1,S46,Z60_2,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z60_2)
!   original expression: Z52(e1ae1b|m1am1b)+=S45(e1a|l1a)*Z64_1(e1b,l1a|m1am1b)
    ierr=exatns_tensor_contract("Z52(e1a,e1b,m1a,m1b)+=S45(e1a,l1a)*Z64_1(e1b,l1a,m1a,m1b)", &
        Z52,S45,Z64_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z64_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nvir_id/)
    tens_root = (/nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z60_2,"Z60_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z60_2,'ZERO')
!   original expression: Z60_2(l1a|d1a)+=H40(l1a,l2a|d1a,d2a)*S45(d2a|l2a)
    ierr=exatns_tensor_contract("Z60_2(l1a,d1a)+=H40(l1a,l2a,d1a,d2a)*S45(d2a,l2a)", &
        Z60_2,H40,S45,prefactor=(1.0d0,0.0d0))
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z64_1,"Z64_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z64_1,'ZERO')
!   original expression: Z64_1(e1b,l1a|m1am1b)+=S46(e1b,d1a|m1am1b)*Z60_2(l1a|d1a)
    ierr=exatns_tensor_contract("Z64_1(e1b,l1a,m1a,m1b)+=S46(e1b,d1a,m1a,m1b)*Z60_2(l1a,d1a)", &
        Z64_1,S46,Z60_2,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z60_2)
!   original expression: Z52(e1ae1b|m1am1b)+=S45(e1a|l1a)*Z64_1(e1b,l1a|m1am1b)
    ierr=exatns_tensor_contract("Z52(e1a,e1b,m1a,m1b)+=S45(e1a,l1a)*Z64_1(e1b,l1a,m1a,m1b)", &
        Z52,S45,Z64_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z64_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z64_1,"Z64_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z64_1,'ZERO')
!   original expression: Z64_1(e1b,l1a|m1am1b)+=S46(e1b,d1a|m1am1b)*H27(l1a|d1a)
    ierr=exatns_tensor_contract("Z64_1(e1b,l1a,m1a,m1b)+=S46(e1b,d1a,m1a,m1b)*H27(l1a,d1a)", &
        Z64_1,S46,H27,prefactor=(1.0d0,0.0d0))
!   original expression: Z52(e1ae1b|m1am1b)+=S45(e1a|l1a)*Z64_1(e1b,l1a|m1am1b)
    ierr=exatns_tensor_contract("Z52(e1a,e1b,m1a,m1b)+=S45(e1a,l1a)*Z64_1(e1b,l1a,m1a,m1b)", &
        Z52,S45,Z64_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z64_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z85_2,"Z85_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z85_2,'ZERO')
!   original expression: Z85_2(l1b,l1a|m1a,d1b)+=H36(l1b,l1a|d1b,d1a)*S45(d1a|m1a)*-1.
    ierr=exatns_tensor_contract("Z85_2(l1b,l1a,m1a,d1b)+=H36(l1b,l1a,d1b,d1a)*S45(d1a,m1a)", &
        Z85_2,H36,S45,prefactor=(-1.0d0,0.0d0))
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z64_1,"Z64_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z64_1,'ZERO')
!   original expression: Z64_1(e1b,l1a|m1am1b)+=S44(e1b,d1b|m1b,l1b)*Z85_2(l1b,l1a|m1a,d1b)
    ierr=exatns_tensor_contract("Z64_1(e1b,l1a,m1a,m1b)+=S44(e1b,d1b,m1b,l1b)*Z85_2(l1b,l1a,m1a,d1b)", &
        Z64_1,S44,Z85_2,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z85_2)
!   original expression: Z52(e1ae1b|m1am1b)+=S45(e1a|l1a)*Z64_1(e1b,l1a|m1am1b)
    ierr=exatns_tensor_contract("Z52(e1a,e1b,m1a,m1b)+=S45(e1a,l1a)*Z64_1(e1b,l1a,m1a,m1b)", &
        Z52,S45,Z64_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z64_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z64_1,"Z64_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z64_1,'ZERO')
!   original expression: Z64_1(e1b,l1a|m1am1b)+=S44(e1b,d1b|m1b,l1b)*H38(l1b,l1a|m1a,d1b)
    ierr=exatns_tensor_contract("Z64_1(e1b,l1a,m1a,m1b)+=S44(e1b,d1b,m1b,l1b)*H38(l1b,l1a,m1a,d1b)", &
        Z64_1,S44,H38,prefactor=(1.0d0,0.0d0))
!   original expression: Z52(e1ae1b|m1am1b)+=S45(e1a|l1a)*Z64_1(e1b,l1a|m1am1b)
    ierr=exatns_tensor_contract("Z52(e1a,e1b,m1a,m1b)+=S45(e1a,l1a)*Z64_1(e1b,l1a,m1a,m1b)", &
        Z52,S45,Z64_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z64_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z86_2,"Z86_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z86_2,'ZERO')
!   original expression: Z86_2(l1a,l2a|m1a,d1a)+=H40(l1a,l2a|d1a,d2a)*S45(d2a|m1a)
    ierr=exatns_tensor_contract("Z86_2(l1a,l2a,m1a,d1a)+=H40(l1a,l2a,d1a,d2a)*S45(d2a,m1a)", &
        Z86_2,H40,S45,prefactor=(1.0d0,0.0d0))
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z64_1,"Z64_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z64_1,'ZERO')
!   original expression: Z64_1(e1b,l1a|m1am1b)+=S46(e1b,d1a|m1b,l2a)*Z86_2(l1a,l2a|m1a,d1a)
    ierr=exatns_tensor_contract("Z64_1(e1b,l1a,m1a,m1b)+=S46(e1b,d1a,m1b,l2a)*Z86_2(l1a,l2a,m1a,d1a)", &
        Z64_1,S46,Z86_2,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z86_2)
!   original expression: Z52(e1ae1b|m1am1b)+=S45(e1a|l1a)*Z64_1(e1b,l1a|m1am1b)
    ierr=exatns_tensor_contract("Z52(e1a,e1b,m1a,m1b)+=S45(e1a,l1a)*Z64_1(e1b,l1a,m1a,m1b)", &
        Z52,S45,Z64_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z64_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z64_1,"Z64_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z64_1,'ZERO')
!   original expression: Z64_1(e1b,l1a|m1am1b)+=S46(e1b,d1a|m1b,l2a)*H41(l1a,l2a|m1a,d1a)*-1.
    ierr=exatns_tensor_contract("Z64_1(e1b,l1a,m1a,m1b)+=S46(e1b,d1a,m1b,l2a)*H41(l1a,l2a,m1a,d1a)", &
        Z64_1,S46,H41,prefactor=(-1.0d0,0.0d0))
!   original expression: Z52(e1ae1b|m1am1b)+=S45(e1a|l1a)*Z64_1(e1b,l1a|m1am1b)
    ierr=exatns_tensor_contract("Z52(e1a,e1b,m1a,m1b)+=S45(e1a,l1a)*Z64_1(e1b,l1a,m1a,m1b)", &
        Z52,S45,Z64_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z64_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z84_2,"Z84_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z84_2,'ZERO')
!   original expression: Z84_2(l1b,l1a|m1b,d1a)+=H36(l1b,l1a|d1b,d1a)*S43(d1b|m1b)*-1.
    ierr=exatns_tensor_contract("Z84_2(l1b,l1a,m1b,d1a)+=H36(l1b,l1a,d1b,d1a)*S43(d1b,m1b)", &
        Z84_2,H36,S43,prefactor=(-1.0d0,0.0d0))
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z64_1,"Z64_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z64_1,'ZERO')
!   original expression: Z64_1(e1b,l1a|m1am1b)+=S46(e1b,d1a|m1a,l1b)*Z84_2(l1b,l1a|m1b,d1a)
    ierr=exatns_tensor_contract("Z64_1(e1b,l1a,m1a,m1b)+=S46(e1b,d1a,m1a,l1b)*Z84_2(l1b,l1a,m1b,d1a)", &
        Z64_1,S46,Z84_2,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z84_2)
!   original expression: Z52(e1ae1b|m1am1b)+=S45(e1a|l1a)*Z64_1(e1b,l1a|m1am1b)
    ierr=exatns_tensor_contract("Z52(e1a,e1b,m1a,m1b)+=S45(e1a,l1a)*Z64_1(e1b,l1a,m1a,m1b)", &
        Z52,S45,Z64_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z64_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z64_1,"Z64_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z64_1,'ZERO')
!   original expression: Z64_1(e1b,l1a|m1am1b)+=S46(e1b,d1a|m1a,l1b)*H37(l1b,l1a|m1b,d1a)*-1.
    ierr=exatns_tensor_contract("Z64_1(e1b,l1a,m1a,m1b)+=S46(e1b,d1a,m1a,l1b)*H37(l1b,l1a,m1b,d1a)", &
        Z64_1,S46,H37,prefactor=(-1.0d0,0.0d0))
!   original expression: Z52(e1ae1b|m1am1b)+=S45(e1a|l1a)*Z64_1(e1b,l1a|m1am1b)
    ierr=exatns_tensor_contract("Z52(e1a,e1b,m1a,m1b)+=S45(e1a,l1a)*Z64_1(e1b,l1a,m1a,m1b)", &
        Z52,S45,Z64_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z64_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nvir_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z68_1,"Z68_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z68_1,'ZERO')
!   original expression: Z68_1(e1ae1b|m1b,d1a)+=H8(e1ae1b|d1b,d1a)*S43(d1b|m1b)*-1.
    ierr=exatns_tensor_contract("Z68_1(e1a,e1b,m1b,d1a)+=H8(e1a,e1b,d1b,d1a)*S43(d1b,m1b)", &
        Z68_1,H8,S43,prefactor=(-1.0d0,0.0d0))
!   original expression: Z52(e1ae1b|m1am1b)+=S45(d1a|m1a)*Z68_1(e1ae1b|m1b,d1a)
    ierr=exatns_tensor_contract("Z52(e1a,e1b,m1a,m1b)+=S45(d1a,m1a)*Z68_1(e1a,e1b,m1b,d1a)", &
        Z52,S45,Z68_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z68_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z61_1,"Z61_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z61_1,'ZERO')
!   original expression: Z61_1(l1al1b|m1am1b)+=H37(l1al1b|m1b,d1a)*S45(d1a|m1a)*-1.
    ierr=exatns_tensor_contract("Z61_1(l1a,l1b,m1a,m1b)+=H37(l1a,l1b,m1b,d1a)*S45(d1a,m1a)", &
        Z61_1,H37,S45,prefactor=(-1.0d0,0.0d0))
!   original expression: Z52(e1ae1b|m1am1b)+=S46(e1ae1b|l1al1b)*Z61_1(l1al1b|m1am1b)
    ierr=exatns_tensor_contract("Z52(e1a,e1b,m1a,m1b)+=S46(e1a,e1b,l1a,l1b)*Z61_1(l1a,l1b,m1a,m1b)", &
        Z52,S46,Z61_1,prefactor=(0.5d0,0.0d0))
    ierr=exatns_tensor_destroy(Z61_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z61_1,"Z61_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z61_1,'ZERO')
!   original expression: Z61_1(l1al1b|m1am1b)+=H38(l1al1b|m1a,d1b)*S43(d1b|m1b)
    ierr=exatns_tensor_contract("Z61_1(l1a,l1b,m1a,m1b)+=H38(l1a,l1b,m1a,d1b)*S43(d1b,m1b)", &
        Z61_1,H38,S43,prefactor=(1.0d0,0.0d0))
!   original expression: Z52(e1ae1b|m1am1b)+=S46(e1ae1b|l1al1b)*Z61_1(l1al1b|m1am1b)
    ierr=exatns_tensor_contract("Z52(e1a,e1b,m1a,m1b)+=S46(e1a,e1b,l1a,l1b)*Z61_1(l1a,l1b,m1a,m1b)", &
        Z52,S46,Z61_1,prefactor=(0.5d0,0.0d0))
    ierr=exatns_tensor_destroy(Z61_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z74_2,"Z74_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z74_2,'ZERO')
!   original expression: Z74_2(l1al1b|m1b,d1a)+=H36(l1al1b|d1b,d1a)*S43(d1b|m1b)*-1.
    ierr=exatns_tensor_contract("Z74_2(l1a,l1b,m1b,d1a)+=H36(l1a,l1b,d1b,d1a)*S43(d1b,m1b)", &
        Z74_2,H36,S43,prefactor=(-1.0d0,0.0d0))
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z61_1,"Z61_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z61_1,'ZERO')
!   original expression: Z61_1(l1al1b|m1am1b)+=S45(d1a|m1a)*Z74_2(l1al1b|m1b,d1a)
    ierr=exatns_tensor_contract("Z61_1(l1a,l1b,m1a,m1b)+=S45(d1a,m1a)*Z74_2(l1a,l1b,m1b,d1a)", &
        Z61_1,S45,Z74_2,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z74_2)
!   original expression: Z52(e1ae1b|m1am1b)+=S46(e1ae1b|l1al1b)*Z61_1(l1al1b|m1am1b)
    ierr=exatns_tensor_contract("Z52(e1a,e1b,m1a,m1b)+=S46(e1a,e1b,l1a,l1b)*Z61_1(l1a,l1b,m1a,m1b)", &
        Z52,S46,Z61_1,prefactor=(0.5d0,0.0d0))
    ierr=exatns_tensor_destroy(Z61_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z61_1,"Z61_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z61_1,'ZERO')
!   original expression: Z61_1(l1al1b|m1am1b)+=S46(d1ad1b|m1am1b)*H36(l1al1b|d1ad1b)
    ierr=exatns_tensor_contract("Z61_1(l1a,l1b,m1a,m1b)+=S46(d1a,d1b,m1a,m1b)*H36(l1a,l1b,d1a,d1b)", &
        Z61_1,S46,H36,prefactor=(0.5d0,0.0d0))
!   original expression: Z52(e1ae1b|m1am1b)+=S46(e1ae1b|l1al1b)*Z61_1(l1al1b|m1am1b)
    ierr=exatns_tensor_contract("Z52(e1a,e1b,m1a,m1b)+=S46(e1a,e1b,l1a,l1b)*Z61_1(l1a,l1b,m1a,m1b)", &
        Z52,S46,Z61_1,prefactor=(0.5d0,0.0d0))
    ierr=exatns_tensor_destroy(Z61_1)
!   original expression: Z52(e1ae1b|m1am1b)+=S46(e1ae1b|l1al1b)*H39(l1al1b|m1am1b)
    ierr=exatns_tensor_contract("Z52(e1a,e1b,m1a,m1b)+=S46(e1a,e1b,l1a,l1b)*H39(l1a,l1b,m1a,m1b)", &
        Z52,S46,H39,prefactor=(0.5d0,0.0d0))
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nvir_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root/)
    ierr=exatns_tensor_create(Z55_1,"Z55_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z55_1,'ZERO')
!   original expression: Z55_1(e1a|d1a)+=H20(e1a,l1b|d1b,d1a)*S43(d1b|l1b)
    ierr=exatns_tensor_contract("Z55_1(e1a,d1a)+=H20(e1a,l1b,d1b,d1a)*S43(d1b,l1b)", &
        Z55_1,H20,S43,prefactor=(1.0d0,0.0d0))
!   original expression: Z52(e1ae1b|m1am1b)+=S46(e1b,d1a|m1am1b)*Z55_1(e1a|d1a)
    ierr=exatns_tensor_contract("Z52(e1a,e1b,m1a,m1b)+=S46(e1b,d1a,m1a,m1b)*Z55_1(e1a,d1a)", &
        Z52,S46,Z55_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z55_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nvir_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root/)
    ierr=exatns_tensor_create(Z55_1,"Z55_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z55_1,'ZERO')
!   original expression: Z55_1(e1a|d1a)+=H33(e1a,l1a|d1a,d2a)*S45(d2a|l1a)*-1.
    ierr=exatns_tensor_contract("Z55_1(e1a,d1a)+=H33(e1a,l1a,d1a,d2a)*S45(d2a,l1a)", &
        Z55_1,H33,S45,prefactor=(-1.0d0,0.0d0))
!   original expression: Z52(e1ae1b|m1am1b)+=S46(e1b,d1a|m1am1b)*Z55_1(e1a|d1a)
    ierr=exatns_tensor_contract("Z52(e1a,e1b,m1a,m1b)+=S46(e1b,d1a,m1a,m1b)*Z55_1(e1a,d1a)", &
        Z52,S46,Z55_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z55_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nvir_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root/)
    ierr=exatns_tensor_create(Z55_1,"Z55_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z55_1,'ZERO')
!   original expression: Z55_1(e1a|d1a)+=S46(e1a,d1b|l1al1b)*H36(l1al1b|d1b,d1a)*-1.
    ierr=exatns_tensor_contract("Z55_1(e1a,d1a)+=S46(e1a,d1b,l1a,l1b)*H36(l1a,l1b,d1b,d1a)", &
        Z55_1,S46,H36,prefactor=(-0.5d0,0.0d0))
!   original expression: Z52(e1ae1b|m1am1b)+=S46(e1b,d1a|m1am1b)*Z55_1(e1a|d1a)
    ierr=exatns_tensor_contract("Z52(e1a,e1b,m1a,m1b)+=S46(e1b,d1a,m1a,m1b)*Z55_1(e1a,d1a)", &
        Z52,S46,Z55_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z55_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nvir_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root/)
    ierr=exatns_tensor_create(Z55_1,"Z55_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z55_1,'ZERO')
!   original expression: Z55_1(e1a|d1a)+=S47(e1a,d2a|l1al2a)*H40(l1al2a|d1a,d2a)
    ierr=exatns_tensor_contract("Z55_1(e1a,d1a)+=S47(e1a,d2a,l1a,l2a)*H40(l1a,l2a,d1a,d2a)", &
        Z55_1,S47,H40,prefactor=(0.5d0,0.0d0))
!   original expression: Z52(e1ae1b|m1am1b)+=S46(e1b,d1a|m1am1b)*Z55_1(e1a|d1a)
    ierr=exatns_tensor_contract("Z52(e1a,e1b,m1a,m1b)+=S46(e1b,d1a,m1a,m1b)*Z55_1(e1a,d1a)", &
        Z52,S46,Z55_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z55_1)
!   original expression: Z52(e1ae1b|m1am1b)+=S46(e1b,d1a|m1am1b)*H6(e1a|d1a)*-1.
    ierr=exatns_tensor_contract("Z52(e1a,e1b,m1a,m1b)+=S46(e1b,d1a,m1a,m1b)*H6(e1a,d1a)", &
        Z52,S46,H6,prefactor=(-1.0d0,0.0d0))
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nvir_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root/)
    ierr=exatns_tensor_create(Z54_1,"Z54_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z54_1,'ZERO')
!   original expression: Z54_1(e1b|d1b)+=H17(e1b,l1b|d1b,d2b)*S43(d2b|l1b)
    ierr=exatns_tensor_contract("Z54_1(e1b,d1b)+=H17(e1b,l1b,d1b,d2b)*S43(d2b,l1b)", &
        Z54_1,H17,S43,prefactor=(1.0d0,0.0d0))
!   original expression: Z52(e1ae1b|m1am1b)+=S46(e1a,d1b|m1am1b)*Z54_1(e1b|d1b)
    ierr=exatns_tensor_contract("Z52(e1a,e1b,m1a,m1b)+=S46(e1a,d1b,m1a,m1b)*Z54_1(e1b,d1b)", &
        Z52,S46,Z54_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z54_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nvir_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root/)
    ierr=exatns_tensor_create(Z54_1,"Z54_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z54_1,'ZERO')
!   original expression: Z54_1(e1b|d1b)+=H29(e1b,l1a|d1b,d1a)*S45(d1a|l1a)
    ierr=exatns_tensor_contract("Z54_1(e1b,d1b)+=H29(e1b,l1a,d1b,d1a)*S45(d1a,l1a)", &
        Z54_1,H29,S45,prefactor=(1.0d0,0.0d0))
!   original expression: Z52(e1ae1b|m1am1b)+=S46(e1a,d1b|m1am1b)*Z54_1(e1b|d1b)
    ierr=exatns_tensor_contract("Z52(e1a,e1b,m1a,m1b)+=S46(e1a,d1b,m1a,m1b)*Z54_1(e1b,d1b)", &
        Z52,S46,Z54_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z54_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nvir_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root/)
    ierr=exatns_tensor_create(Z54_1,"Z54_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z54_1,'ZERO')
!   original expression: Z54_1(e1b|d1b)+=S44(e1b,d2b|l1bl2b)*H24(l1bl2b|d1b,d2b)*-1.
    ierr=exatns_tensor_contract("Z54_1(e1b,d1b)+=S44(e1b,d2b,l1b,l2b)*H24(l1b,l2b,d1b,d2b)", &
        Z54_1,S44,H24,prefactor=(-0.5d0,0.0d0))
!   original expression: Z52(e1ae1b|m1am1b)+=S46(e1a,d1b|m1am1b)*Z54_1(e1b|d1b)
    ierr=exatns_tensor_contract("Z52(e1a,e1b,m1a,m1b)+=S46(e1a,d1b,m1a,m1b)*Z54_1(e1b,d1b)", &
        Z52,S46,Z54_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z54_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nvir_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root/)
    ierr=exatns_tensor_create(Z54_1,"Z54_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z54_1,'ZERO')
!   original expression: Z54_1(e1b|d1b)+=S46(e1b,d1a|l1al1b)*H36(l1al1b|d1b,d1a)*-1.
    ierr=exatns_tensor_contract("Z54_1(e1b,d1b)+=S46(e1b,d1a,l1a,l1b)*H36(l1a,l1b,d1b,d1a)", &
        Z54_1,S46,H36,prefactor=(-0.5d0,0.0d0))
!   original expression: Z52(e1ae1b|m1am1b)+=S46(e1a,d1b|m1am1b)*Z54_1(e1b|d1b)
    ierr=exatns_tensor_contract("Z52(e1a,e1b,m1a,m1b)+=S46(e1a,d1b,m1a,m1b)*Z54_1(e1b,d1b)", &
        Z52,S46,Z54_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z54_1)
!   original expression: Z52(e1ae1b|m1am1b)+=S46(e1a,d1b|m1am1b)*H1(e1b|d1b)
    ierr=exatns_tensor_contract("Z52(e1a,e1b,m1a,m1b)+=S46(e1a,d1b,m1a,m1b)*H1(e1b,d1b)", &
        Z52,S46,H1,prefactor=(1.0d0,0.0d0))
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z59_1,"Z59_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z59_1,'ZERO')
!   original expression: Z59_1(l1a|m1a)+=H38(l1b,l1a|m1a,d1b)*S43(d1b|l1b)*-1.
    ierr=exatns_tensor_contract("Z59_1(l1a,m1a)+=H38(l1b,l1a,m1a,d1b)*S43(d1b,l1b)", &
        Z59_1,H38,S43,prefactor=(-1.0d0,0.0d0))
!   original expression: Z52(e1ae1b|m1am1b)+=S46(e1ae1b|m1b,l1a)*Z59_1(l1a|m1a)
    ierr=exatns_tensor_contract("Z52(e1a,e1b,m1a,m1b)+=S46(e1a,e1b,m1b,l1a)*Z59_1(l1a,m1a)", &
        Z52,S46,Z59_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z59_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z59_1,"Z59_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z59_1,'ZERO')
!   original expression: Z59_1(l1a|m1a)+=H41(l1a,l2a|m1a,d1a)*S45(d1a|l2a)
    ierr=exatns_tensor_contract("Z59_1(l1a,m1a)+=H41(l1a,l2a,m1a,d1a)*S45(d1a,l2a)", &
        Z59_1,H41,S45,prefactor=(1.0d0,0.0d0))
!   original expression: Z52(e1ae1b|m1am1b)+=S46(e1ae1b|m1b,l1a)*Z59_1(l1a|m1a)
    ierr=exatns_tensor_contract("Z52(e1a,e1b,m1a,m1b)+=S46(e1a,e1b,m1b,l1a)*Z59_1(l1a,m1a)", &
        Z52,S46,Z59_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z59_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nvir_id/)
    tens_root = (/nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z60_2,"Z60_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z60_2,'ZERO')
!   original expression: Z60_2(l1a|d1a)+=H36(l1b,l1a|d1b,d1a)*S43(d1b|l1b)
    ierr=exatns_tensor_contract("Z60_2(l1a,d1a)+=H36(l1b,l1a,d1b,d1a)*S43(d1b,l1b)", &
        Z60_2,H36,S43,prefactor=(1.0d0,0.0d0))
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z59_1,"Z59_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z59_1,'ZERO')
!   original expression: Z59_1(l1a|m1a)+=S45(d1a|m1a)*Z60_2(l1a|d1a)
    ierr=exatns_tensor_contract("Z59_1(l1a,m1a)+=S45(d1a,m1a)*Z60_2(l1a,d1a)", &
        Z59_1,S45,Z60_2,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z60_2)
!   original expression: Z52(e1ae1b|m1am1b)+=S46(e1ae1b|m1b,l1a)*Z59_1(l1a|m1a)
    ierr=exatns_tensor_contract("Z52(e1a,e1b,m1a,m1b)+=S46(e1a,e1b,m1b,l1a)*Z59_1(l1a,m1a)", &
        Z52,S46,Z59_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z59_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nvir_id/)
    tens_root = (/nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z60_2,"Z60_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z60_2,'ZERO')
!   original expression: Z60_2(l1a|d1a)+=H40(l1a,l2a|d1a,d2a)*S45(d2a|l2a)
    ierr=exatns_tensor_contract("Z60_2(l1a,d1a)+=H40(l1a,l2a,d1a,d2a)*S45(d2a,l2a)", &
        Z60_2,H40,S45,prefactor=(1.0d0,0.0d0))
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z59_1,"Z59_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z59_1,'ZERO')
!   original expression: Z59_1(l1a|m1a)+=S45(d1a|m1a)*Z60_2(l1a|d1a)
    ierr=exatns_tensor_contract("Z59_1(l1a,m1a)+=S45(d1a,m1a)*Z60_2(l1a,d1a)", &
        Z59_1,S45,Z60_2,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z60_2)
!   original expression: Z52(e1ae1b|m1am1b)+=S46(e1ae1b|m1b,l1a)*Z59_1(l1a|m1a)
    ierr=exatns_tensor_contract("Z52(e1a,e1b,m1a,m1b)+=S46(e1a,e1b,m1b,l1a)*Z59_1(l1a,m1a)", &
        Z52,S46,Z59_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z59_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z59_1,"Z59_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z59_1,'ZERO')
!   original expression: Z59_1(l1a|m1a)+=S45(d1a|m1a)*H27(l1a|d1a)
    ierr=exatns_tensor_contract("Z59_1(l1a,m1a)+=S45(d1a,m1a)*H27(l1a,d1a)", &
        Z59_1,S45,H27,prefactor=(1.0d0,0.0d0))
!   original expression: Z52(e1ae1b|m1am1b)+=S46(e1ae1b|m1b,l1a)*Z59_1(l1a|m1a)
    ierr=exatns_tensor_contract("Z52(e1a,e1b,m1a,m1b)+=S46(e1a,e1b,m1b,l1a)*Z59_1(l1a,m1a)", &
        Z52,S46,Z59_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z59_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z59_1,"Z59_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z59_1,'ZERO')
!   original expression: Z59_1(l1a|m1a)+=S46(d1ad1b|m1a,l1b)*H36(l1b,l1a|d1ad1b)*-1.
    ierr=exatns_tensor_contract("Z59_1(l1a,m1a)+=S46(d1a,d1b,m1a,l1b)*H36(l1b,l1a,d1a,d1b)", &
        Z59_1,S46,H36,prefactor=(-0.5d0,0.0d0))
!   original expression: Z52(e1ae1b|m1am1b)+=S46(e1ae1b|m1b,l1a)*Z59_1(l1a|m1a)
    ierr=exatns_tensor_contract("Z52(e1a,e1b,m1a,m1b)+=S46(e1a,e1b,m1b,l1a)*Z59_1(l1a,m1a)", &
        Z52,S46,Z59_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z59_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z59_1,"Z59_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z59_1,'ZERO')
!   original expression: Z59_1(l1a|m1a)+=S47(d1ad2a|m1a,l2a)*H40(l1a,l2a|d1ad2a)
    ierr=exatns_tensor_contract("Z59_1(l1a,m1a)+=S47(d1a,d2a,m1a,l2a)*H40(l1a,l2a,d1a,d2a)", &
        Z59_1,S47,H40,prefactor=(0.5d0,0.0d0))
!   original expression: Z52(e1ae1b|m1am1b)+=S46(e1ae1b|m1b,l1a)*Z59_1(l1a|m1a)
    ierr=exatns_tensor_contract("Z52(e1a,e1b,m1a,m1b)+=S46(e1a,e1b,m1b,l1a)*Z59_1(l1a,m1a)", &
        Z52,S46,Z59_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z59_1)
!   original expression: Z52(e1ae1b|m1am1b)+=S46(e1ae1b|m1b,l1a)*H28(l1a|m1a)
    ierr=exatns_tensor_contract("Z52(e1a,e1b,m1a,m1b)+=S46(e1a,e1b,m1b,l1a)*H28(l1a,m1a)", &
        Z52,S46,H28,prefactor=(1.0d0,0.0d0))
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z56_1,"Z56_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z56_1,'ZERO')
!   original expression: Z56_1(l1b|m1b)+=H25(l1b,l2b|m1b,d1b)*S43(d1b|l2b)*-1.
    ierr=exatns_tensor_contract("Z56_1(l1b,m1b)+=H25(l1b,l2b,m1b,d1b)*S43(d1b,l2b)", &
        Z56_1,H25,S43,prefactor=(-1.0d0,0.0d0))
!   original expression: Z52(e1ae1b|m1am1b)+=S46(e1ae1b|m1a,l1b)*Z56_1(l1b|m1b)
    ierr=exatns_tensor_contract("Z52(e1a,e1b,m1a,m1b)+=S46(e1a,e1b,m1a,l1b)*Z56_1(l1b,m1b)", &
        Z52,S46,Z56_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z56_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z56_1,"Z56_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z56_1,'ZERO')
!   original expression: Z56_1(l1b|m1b)+=H37(l1b,l1a|m1b,d1a)*S45(d1a|l1a)*-1.
    ierr=exatns_tensor_contract("Z56_1(l1b,m1b)+=H37(l1b,l1a,m1b,d1a)*S45(d1a,l1a)", &
        Z56_1,H37,S45,prefactor=(-1.0d0,0.0d0))
!   original expression: Z52(e1ae1b|m1am1b)+=S46(e1ae1b|m1a,l1b)*Z56_1(l1b|m1b)
    ierr=exatns_tensor_contract("Z52(e1a,e1b,m1a,m1b)+=S46(e1a,e1b,m1a,l1b)*Z56_1(l1b,m1b)", &
        Z52,S46,Z56_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z56_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nvir_id/)
    tens_root = (/nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z57_2,"Z57_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z57_2,'ZERO')
!   original expression: Z57_2(l1b|d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|l2b)*-1.
    ierr=exatns_tensor_contract("Z57_2(l1b,d1b)+=H24(l1b,l2b,d1b,d2b)*S43(d2b,l2b)", &
        Z57_2,H24,S43,prefactor=(-1.0d0,0.0d0))
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z56_1,"Z56_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z56_1,'ZERO')
!   original expression: Z56_1(l1b|m1b)+=S43(d1b|m1b)*Z57_2(l1b|d1b)
    ierr=exatns_tensor_contract("Z56_1(l1b,m1b)+=S43(d1b,m1b)*Z57_2(l1b,d1b)", &
        Z56_1,S43,Z57_2,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z57_2)
!   original expression: Z52(e1ae1b|m1am1b)+=S46(e1ae1b|m1a,l1b)*Z56_1(l1b|m1b)
    ierr=exatns_tensor_contract("Z52(e1a,e1b,m1a,m1b)+=S46(e1a,e1b,m1a,l1b)*Z56_1(l1b,m1b)", &
        Z52,S46,Z56_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z56_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nvir_id/)
    tens_root = (/nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z57_2,"Z57_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z57_2,'ZERO')
!   original expression: Z57_2(l1b|d1b)+=H36(l1b,l1a|d1b,d1a)*S45(d1a|l1a)*-1.
    ierr=exatns_tensor_contract("Z57_2(l1b,d1b)+=H36(l1b,l1a,d1b,d1a)*S45(d1a,l1a)", &
        Z57_2,H36,S45,prefactor=(-1.0d0,0.0d0))
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z56_1,"Z56_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z56_1,'ZERO')
!   original expression: Z56_1(l1b|m1b)+=S43(d1b|m1b)*Z57_2(l1b|d1b)
    ierr=exatns_tensor_contract("Z56_1(l1b,m1b)+=S43(d1b,m1b)*Z57_2(l1b,d1b)", &
        Z56_1,S43,Z57_2,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z57_2)
!   original expression: Z52(e1ae1b|m1am1b)+=S46(e1ae1b|m1a,l1b)*Z56_1(l1b|m1b)
    ierr=exatns_tensor_contract("Z52(e1a,e1b,m1a,m1b)+=S46(e1a,e1b,m1a,l1b)*Z56_1(l1b,m1b)", &
        Z52,S46,Z56_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z56_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z56_1,"Z56_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z56_1,'ZERO')
!   original expression: Z56_1(l1b|m1b)+=S43(d1b|m1b)*H15(l1b|d1b)*-1.
    ierr=exatns_tensor_contract("Z56_1(l1b,m1b)+=S43(d1b,m1b)*H15(l1b,d1b)", &
        Z56_1,S43,H15,prefactor=(-1.0d0,0.0d0))
!   original expression: Z52(e1ae1b|m1am1b)+=S46(e1ae1b|m1a,l1b)*Z56_1(l1b|m1b)
    ierr=exatns_tensor_contract("Z52(e1a,e1b,m1a,m1b)+=S46(e1a,e1b,m1a,l1b)*Z56_1(l1b,m1b)", &
        Z52,S46,Z56_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z56_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z56_1,"Z56_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z56_1,'ZERO')
!   original expression: Z56_1(l1b|m1b)+=S44(d1bd2b|m1b,l2b)*H24(l1b,l2b|d1bd2b)*-1.
    ierr=exatns_tensor_contract("Z56_1(l1b,m1b)+=S44(d1b,d2b,m1b,l2b)*H24(l1b,l2b,d1b,d2b)", &
        Z56_1,S44,H24,prefactor=(-0.5d0,0.0d0))
!   original expression: Z52(e1ae1b|m1am1b)+=S46(e1ae1b|m1a,l1b)*Z56_1(l1b|m1b)
    ierr=exatns_tensor_contract("Z52(e1a,e1b,m1a,m1b)+=S46(e1a,e1b,m1a,l1b)*Z56_1(l1b,m1b)", &
        Z52,S46,Z56_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z56_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z56_1,"Z56_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z56_1,'ZERO')
!   original expression: Z56_1(l1b|m1b)+=S46(d1ad1b|m1b,l1a)*H36(l1b,l1a|d1ad1b)*-1.
    ierr=exatns_tensor_contract("Z56_1(l1b,m1b)+=S46(d1a,d1b,m1b,l1a)*H36(l1b,l1a,d1a,d1b)", &
        Z56_1,S46,H36,prefactor=(-0.5d0,0.0d0))
!   original expression: Z52(e1ae1b|m1am1b)+=S46(e1ae1b|m1a,l1b)*Z56_1(l1b|m1b)
    ierr=exatns_tensor_contract("Z52(e1a,e1b,m1a,m1b)+=S46(e1a,e1b,m1a,l1b)*Z56_1(l1b,m1b)", &
        Z52,S46,Z56_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z56_1)
!   original expression: Z52(e1ae1b|m1am1b)+=S46(e1ae1b|m1a,l1b)*H16(l1b|m1b)*-1.
    ierr=exatns_tensor_contract("Z52(e1a,e1b,m1a,m1b)+=S46(e1a,e1b,m1a,l1b)*H16(l1b,m1b)", &
        Z52,S46,H16,prefactor=(-1.0d0,0.0d0))
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z81_1,"Z81_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z81_1,'ZERO')
!   original expression: Z81_1(e1a,l1b|m1a,d1b)+=H20(e1a,l1b|d1b,d1a)*S45(d1a|m1a)*-1.
    ierr=exatns_tensor_contract("Z81_1(e1a,l1b,m1a,d1b)+=H20(e1a,l1b,d1b,d1a)*S45(d1a,m1a)", &
        Z81_1,H20,S45,prefactor=(-1.0d0,0.0d0))
!   original expression: Z52(e1ae1b|m1am1b)+=S44(e1b,d1b|m1b,l1b)*Z81_1(e1a,l1b|m1a,d1b)
    ierr=exatns_tensor_contract("Z52(e1a,e1b,m1a,m1b)+=S44(e1b,d1b,m1b,l1b)*Z81_1(e1a,l1b,m1a,d1b)", &
        Z52,S44,Z81_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z81_1)
!   original expression: Z52(e1ae1b|m1am1b)+=S44(e1b,d1b|m1b,l1b)*H22(e1a,l1b|m1a,d1b)
    ierr=exatns_tensor_contract("Z52(e1a,e1b,m1a,m1b)+=S44(e1b,d1b,m1b,l1b)*H22(e1a,l1b,m1a,d1b)", &
        Z52,S44,H22,prefactor=(1.0d0,0.0d0))
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z82_1,"Z82_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z82_1,'ZERO')
!   original expression: Z82_1(e1a,l1a|m1a,d1a)+=H33(e1a,l1a|d1a,d2a)*S45(d2a|m1a)*-1.
    ierr=exatns_tensor_contract("Z82_1(e1a,l1a,m1a,d1a)+=H33(e1a,l1a,d1a,d2a)*S45(d2a,m1a)", &
        Z82_1,H33,S45,prefactor=(-1.0d0,0.0d0))
!   original expression: Z52(e1ae1b|m1am1b)+=S46(e1b,d1a|m1b,l1a)*Z82_1(e1a,l1a|m1a,d1a)
    ierr=exatns_tensor_contract("Z52(e1a,e1b,m1a,m1b)+=S46(e1b,d1a,m1b,l1a)*Z82_1(e1a,l1a,m1a,d1a)", &
        Z52,S46,Z82_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z82_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z82_1,"Z82_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z82_1,'ZERO')
!   original expression: Z82_1(e1a,l1a|m1a,d1a)+=S46(e1a,d1b|m1a,l1b)*H36(l1b,l1a|d1b,d1a)
    ierr=exatns_tensor_contract("Z82_1(e1a,l1a,m1a,d1a)+=S46(e1a,d1b,m1a,l1b)*H36(l1b,l1a,d1b,d1a)", &
        Z82_1,S46,H36,prefactor=(1.0d0,0.0d0))
!   original expression: Z52(e1ae1b|m1am1b)+=S46(e1b,d1a|m1b,l1a)*Z82_1(e1a,l1a|m1a,d1a)
    ierr=exatns_tensor_contract("Z52(e1a,e1b,m1a,m1b)+=S46(e1b,d1a,m1b,l1a)*Z82_1(e1a,l1a,m1a,d1a)", &
        Z52,S46,Z82_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z82_1)
!   original expression: Z52(e1ae1b|m1am1b)+=S46(e1b,d1a|m1b,l1a)*H34(e1a,l1a|m1a,d1a)
    ierr=exatns_tensor_contract("Z52(e1a,e1b,m1a,m1b)+=S46(e1b,d1a,m1b,l1a)*H34(e1a,l1a,m1a,d1a)", &
        Z52,S46,H34,prefactor=(1.0d0,0.0d0))
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z80_1,"Z80_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z80_1,'ZERO')
!   original expression: Z80_1(e1a,l1b|m1b,d1a)+=H20(e1a,l1b|d1b,d1a)*S43(d1b|m1b)*-1.
    ierr=exatns_tensor_contract("Z80_1(e1a,l1b,m1b,d1a)+=H20(e1a,l1b,d1b,d1a)*S43(d1b,m1b)", &
        Z80_1,H20,S43,prefactor=(-1.0d0,0.0d0))
!   original expression: Z52(e1ae1b|m1am1b)+=S46(e1b,d1a|m1a,l1b)*Z80_1(e1a,l1b|m1b,d1a)
    ierr=exatns_tensor_contract("Z52(e1a,e1b,m1a,m1b)+=S46(e1b,d1a,m1a,l1b)*Z80_1(e1a,l1b,m1b,d1a)", &
        Z52,S46,Z80_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z80_1)
!   original expression: Z52(e1ae1b|m1am1b)+=S46(e1b,d1a|m1a,l1b)*H21(e1a,l1b|m1b,d1a)*-1.
    ierr=exatns_tensor_contract("Z52(e1a,e1b,m1a,m1b)+=S46(e1b,d1a,m1a,l1b)*H21(e1a,l1b,m1b,d1a)", &
        Z52,S46,H21,prefactor=(-1.0d0,0.0d0))
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z79_1,"Z79_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z79_1,'ZERO')
!   original expression: Z79_1(e1b,l1a|m1a,d1b)+=H29(e1b,l1a|d1b,d1a)*S45(d1a|m1a)
    ierr=exatns_tensor_contract("Z79_1(e1b,l1a,m1a,d1b)+=H29(e1b,l1a,d1b,d1a)*S45(d1a,m1a)", &
        Z79_1,H29,S45,prefactor=(1.0d0,0.0d0))
!   original expression: Z52(e1ae1b|m1am1b)+=S46(e1a,d1b|m1b,l1a)*Z79_1(e1b,l1a|m1a,d1b)
    ierr=exatns_tensor_contract("Z52(e1a,e1b,m1a,m1b)+=S46(e1a,d1b,m1b,l1a)*Z79_1(e1b,l1a,m1a,d1b)", &
        Z52,S46,Z79_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z79_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z79_1,"Z79_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z79_1,'ZERO')
!   original expression: Z79_1(e1b,l1a|m1a,d1b)+=S46(e1b,d1a|m1a,l1b)*H36(l1b,l1a|d1b,d1a)
    ierr=exatns_tensor_contract("Z79_1(e1b,l1a,m1a,d1b)+=S46(e1b,d1a,m1a,l1b)*H36(l1b,l1a,d1b,d1a)", &
        Z79_1,S46,H36,prefactor=(1.0d0,0.0d0))
!   original expression: Z52(e1ae1b|m1am1b)+=S46(e1a,d1b|m1b,l1a)*Z79_1(e1b,l1a|m1a,d1b)
    ierr=exatns_tensor_contract("Z52(e1a,e1b,m1a,m1b)+=S46(e1a,d1b,m1b,l1a)*Z79_1(e1b,l1a,m1a,d1b)", &
        Z52,S46,Z79_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z79_1)
!   original expression: Z52(e1ae1b|m1am1b)+=S46(e1a,d1b|m1b,l1a)*H31(e1b,l1a|m1a,d1b)*-1.
    ierr=exatns_tensor_contract("Z52(e1a,e1b,m1a,m1b)+=S46(e1a,d1b,m1b,l1a)*H31(e1b,l1a,m1a,d1b)", &
        Z52,S46,H31,prefactor=(-1.0d0,0.0d0))
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z77_1,"Z77_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z77_1,'ZERO')
!   original expression: Z77_1(e1b,l1b|m1b,d1b)+=H17(e1b,l1b|d1b,d2b)*S43(d2b|m1b)*-1.
    ierr=exatns_tensor_contract("Z77_1(e1b,l1b,m1b,d1b)+=H17(e1b,l1b,d1b,d2b)*S43(d2b,m1b)", &
        Z77_1,H17,S43,prefactor=(-1.0d0,0.0d0))
!   original expression: Z52(e1ae1b|m1am1b)+=S46(e1a,d1b|m1a,l1b)*Z77_1(e1b,l1b|m1b,d1b)
    ierr=exatns_tensor_contract("Z52(e1a,e1b,m1a,m1b)+=S46(e1a,d1b,m1a,l1b)*Z77_1(e1b,l1b,m1b,d1b)", &
        Z52,S46,Z77_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z77_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z77_1,"Z77_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z77_1,'ZERO')
!   original expression: Z77_1(e1b,l1b|m1b,d1b)+=S44(e1b,d2b|m1b,l2b)*H24(l1b,l2b|d1b,d2b)
    ierr=exatns_tensor_contract("Z77_1(e1b,l1b,m1b,d1b)+=S44(e1b,d2b,m1b,l2b)*H24(l1b,l2b,d1b,d2b)", &
        Z77_1,S44,H24,prefactor=(1.0d0,0.0d0))
!   original expression: Z52(e1ae1b|m1am1b)+=S46(e1a,d1b|m1a,l1b)*Z77_1(e1b,l1b|m1b,d1b)
    ierr=exatns_tensor_contract("Z52(e1a,e1b,m1a,m1b)+=S46(e1a,d1b,m1a,l1b)*Z77_1(e1b,l1b,m1b,d1b)", &
        Z52,S46,Z77_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z77_1)
!   original expression: Z52(e1ae1b|m1am1b)+=S46(e1a,d1b|m1a,l1b)*H18(e1b,l1b|m1b,d1b)
    ierr=exatns_tensor_contract("Z52(e1a,e1b,m1a,m1b)+=S46(e1a,d1b,m1a,l1b)*H18(e1b,l1b,m1b,d1b)", &
        Z52,S46,H18,prefactor=(1.0d0,0.0d0))
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z78_1,"Z78_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z78_1,'ZERO')
!   original expression: Z78_1(e1b,l1a|m1b,d1a)+=H29(e1b,l1a|d1b,d1a)*S43(d1b|m1b)
    ierr=exatns_tensor_contract("Z78_1(e1b,l1a,m1b,d1a)+=H29(e1b,l1a,d1b,d1a)*S43(d1b,m1b)", &
        Z78_1,H29,S43,prefactor=(1.0d0,0.0d0))
!   original expression: Z52(e1ae1b|m1am1b)+=S47(e1a,d1a|m1a,l1a)*Z78_1(e1b,l1a|m1b,d1a)
    ierr=exatns_tensor_contract("Z52(e1a,e1b,m1a,m1b)+=S47(e1a,d1a,m1a,l1a)*Z78_1(e1b,l1a,m1b,d1a)", &
        Z52,S47,Z78_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z78_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z78_1,"Z78_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z78_1,'ZERO')
!   original expression: Z78_1(e1b,l1a|m1b,d1a)+=S44(e1b,d1b|m1b,l1b)*H36(l1b,l1a|d1b,d1a)
    ierr=exatns_tensor_contract("Z78_1(e1b,l1a,m1b,d1a)+=S44(e1b,d1b,m1b,l1b)*H36(l1b,l1a,d1b,d1a)", &
        Z78_1,S44,H36,prefactor=(1.0d0,0.0d0))
!   original expression: Z52(e1ae1b|m1am1b)+=S47(e1a,d1a|m1a,l1a)*Z78_1(e1b,l1a|m1b,d1a)
    ierr=exatns_tensor_contract("Z52(e1a,e1b,m1a,m1b)+=S47(e1a,d1a,m1a,l1a)*Z78_1(e1b,l1a,m1b,d1a)", &
        Z52,S47,Z78_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z78_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z78_1,"Z78_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z78_1,'ZERO')
!   original expression: Z78_1(e1b,l1a|m1b,d1a)+=S46(e1b,d2a|m1b,l2a)*H40(l1a,l2a|d1a,d2a)
    ierr=exatns_tensor_contract("Z78_1(e1b,l1a,m1b,d1a)+=S46(e1b,d2a,m1b,l2a)*H40(l1a,l2a,d1a,d2a)", &
        Z78_1,S46,H40,prefactor=(1.0d0,0.0d0))
!   original expression: Z52(e1ae1b|m1am1b)+=S47(e1a,d1a|m1a,l1a)*Z78_1(e1b,l1a|m1b,d1a)
    ierr=exatns_tensor_contract("Z52(e1a,e1b,m1a,m1b)+=S47(e1a,d1a,m1a,l1a)*Z78_1(e1b,l1a,m1b,d1a)", &
        Z52,S47,Z78_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z78_1)
!   original expression: Z52(e1ae1b|m1am1b)+=S47(e1a,d1a|m1a,l1a)*H30(e1b,l1a|m1b,d1a)
    ierr=exatns_tensor_contract("Z52(e1a,e1b,m1a,m1b)+=S47(e1a,d1a,m1a,l1a)*H30(e1b,l1a,m1b,d1a)", &
        Z52,S47,H30,prefactor=(1.0d0,0.0d0))
!   original expression: Z53(e1ae2a|m1am2a)+=H14(e1ae2a|m1am2a)
    ierr=exatns_tensor_contract("Z53(e1a,e2a,m1a,m2a)+=H14(e1a,e2a,m1a,m2a)*K()", &
        Z53,H14,one_tensor,prefactor=(1.0d0,0.0d0))
!   original expression: Z53(e1ae2a|m1am2a)+=H12(e1ae2a|d1ad2a)*S47(d1ad2a|m1am2a)
    ierr=exatns_tensor_contract("Z53(e1a,e2a,m1a,m2a)+=H12(e1a,e2a,d1a,d2a)*S47(d1a,d2a,m1a,m2a)", &
        Z53,H12,S47,prefactor=(0.5d0,0.0d0))
!   original expression: Z53(e1ae2a|m1am2a)+=H35(e1a,l1a|m1am2a)*S45(e2a|l1a)*-1.
    ierr=exatns_tensor_contract("Z53(e1a,e2a,m1a,m2a)+=H35(e1a,l1a,m1a,m2a)*S45(e2a,l1a)", &
        Z53,H35,S45,prefactor=(-1.0d0,0.0d0))
!   original expression: Z53(e1ae2a|m1am2a)+=H35(e2a,l1a|m1am2a)*S45(e1a|l1a)
    ierr=exatns_tensor_contract("Z53(e1a,e2a,m1a,m2a)+=H35(e2a,l1a,m1a,m2a)*S45(e1a,l1a)", &
        Z53,H35,S45,prefactor=(1.0d0,0.0d0))
!   original expression: Z53(e1ae2a|m1am2a)+=H13(e1ae2a|m1a,d1a)*S45(d1a|m2a)
    ierr=exatns_tensor_contract("Z53(e1a,e2a,m1a,m2a)+=H13(e1a,e2a,m1a,d1a)*S45(d1a,m2a)", &
        Z53,H13,S45,prefactor=(1.0d0,0.0d0))
!   original expression: Z53(e1ae2a|m1am2a)+=H13(e1ae2a|m2a,d1a)*S45(d1a|m1a)*-1.
    ierr=exatns_tensor_contract("Z53(e1a,e2a,m1a,m2a)+=H13(e1a,e2a,m2a,d1a)*S45(d1a,m1a)", &
        Z53,H13,S45,prefactor=(-1.0d0,0.0d0))
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z67_1,"Z67_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z67_1,'ZERO')
!   original expression: Z67_1(e1a,l1a|m1am2a)+=H33(e1a,l1a|d1ad2a)*S47(d1ad2a|m1am2a)
    ierr=exatns_tensor_contract("Z67_1(e1a,l1a,m1a,m2a)+=H33(e1a,l1a,d1a,d2a)*S47(d1a,d2a,m1a,m2a)", &
        Z67_1,H33,S47,prefactor=(0.5d0,0.0d0))
!   original expression: Z53(e1ae2a|m1am2a)+=S45(e1a|l1a)*Z67_1(e2a,l1a|m1am2a)
    ierr=exatns_tensor_contract("Z53(e1a,e2a,m1a,m2a)+=S45(e1a,l1a)*Z67_1(e2a,l1a,m1a,m2a)", &
        Z53,S45,Z67_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z53(e1ae2a|m1am2a)+=S45(e2a|l1a)*Z67_1(e1a,l1a|m1am2a)*-1.
    ierr=exatns_tensor_contract("Z53(e1a,e2a,m1a,m2a)+=S45(e2a,l1a)*Z67_1(e1a,l1a,m1a,m2a)", &
        Z53,S45,Z67_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z67_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z67_1,"Z67_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z67_1,'ZERO')
!   original expression: Z67_1(e1a,l1a|m1am2a)+=H42(l1a,l2a|m1am2a)*S45(e1a|l2a)*0.5
    ierr=exatns_tensor_contract("Z67_1(e1a,l1a,m1a,m2a)+=H42(l1a,l2a,m1a,m2a)*S45(e1a,l2a)", &
        Z67_1,H42,S45,prefactor=(0.5d0,0.0d0))
!   original expression: Z53(e1ae2a|m1am2a)+=S45(e1a|l1a)*Z67_1(e2a,l1a|m1am2a)
    ierr=exatns_tensor_contract("Z53(e1a,e2a,m1a,m2a)+=S45(e1a,l1a)*Z67_1(e2a,l1a,m1a,m2a)", &
        Z53,S45,Z67_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z53(e1ae2a|m1am2a)+=S45(e2a|l1a)*Z67_1(e1a,l1a|m1am2a)*-1.
    ierr=exatns_tensor_contract("Z53(e1a,e2a,m1a,m2a)+=S45(e2a,l1a)*Z67_1(e1a,l1a,m1a,m2a)", &
        Z53,S45,Z67_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z67_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z67_1,"Z67_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z67_1,'ZERO')
!   original expression: Z67_1(e1a,l1a|m1am2a)+=H34(e1a,l1a|m1a,d1a)*S45(d1a|m2a)
    ierr=exatns_tensor_contract("Z67_1(e1a,l1a,m1a,m2a)+=H34(e1a,l1a,m1a,d1a)*S45(d1a,m2a)", &
        Z67_1,H34,S45,prefactor=(1.0d0,0.0d0))
!   original expression: Z67_1(e1a,l1a|m1am2a)+=H34(e1a,l1a|m2a,d1a)*S45(d1a|m1a)*-1.
    ierr=exatns_tensor_contract("Z67_1(e1a,l1a,m1a,m2a)+=H34(e1a,l1a,m2a,d1a)*S45(d1a,m1a)", &
        Z67_1,H34,S45,prefactor=(-1.0d0,0.0d0))
!   original expression: Z53(e1ae2a|m1am2a)+=S45(e1a|l1a)*Z67_1(e2a,l1a|m1am2a)
    ierr=exatns_tensor_contract("Z53(e1a,e2a,m1a,m2a)+=S45(e1a,l1a)*Z67_1(e2a,l1a,m1a,m2a)", &
        Z53,S45,Z67_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z53(e1ae2a|m1am2a)+=S45(e2a|l1a)*Z67_1(e1a,l1a|m1am2a)*-1.
    ierr=exatns_tensor_contract("Z53(e1a,e2a,m1a,m2a)+=S45(e2a,l1a)*Z67_1(e1a,l1a,m1a,m2a)", &
        Z53,S45,Z67_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z67_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z73_2,"Z73_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z73_2,'ZERO')
!   original expression: Z73_2(l1a,l2a|m1am2a)+=H40(l1a,l2a|d1ad2a)*S47(d1ad2a|m1am2a)*0.5
    ierr=exatns_tensor_contract("Z73_2(l1a,l2a,m1a,m2a)+=H40(l1a,l2a,d1a,d2a)*S47(d1a,d2a,m1a,m2a)", &
        Z73_2,H40,S47,prefactor=(0.25d0,0.0d0))
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z67_1,"Z67_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z67_1,'ZERO')
!   original expression: Z67_1(e1a,l1a|m1am2a)+=S45(e1a|l2a)*Z73_2(l1a,l2a|m1am2a)
    ierr=exatns_tensor_contract("Z67_1(e1a,l1a,m1a,m2a)+=S45(e1a,l2a)*Z73_2(l1a,l2a,m1a,m2a)", &
        Z67_1,S45,Z73_2,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z73_2)
!   original expression: Z53(e1ae2a|m1am2a)+=S45(e1a|l1a)*Z67_1(e2a,l1a|m1am2a)
    ierr=exatns_tensor_contract("Z53(e1a,e2a,m1a,m2a)+=S45(e1a,l1a)*Z67_1(e2a,l1a,m1a,m2a)", &
        Z53,S45,Z67_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z53(e1ae2a|m1am2a)+=S45(e2a|l1a)*Z67_1(e1a,l1a|m1am2a)*-1.
    ierr=exatns_tensor_contract("Z53(e1a,e2a,m1a,m2a)+=S45(e2a,l1a)*Z67_1(e1a,l1a,m1a,m2a)", &
        Z53,S45,Z67_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z67_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z73_2,"Z73_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z73_2,'ZERO')
!   original expression: Z73_2(l1a,l2a|m1am2a)+=H41(l1a,l2a|m1a,d1a)*S45(d1a|m2a)*0.5
    ierr=exatns_tensor_contract("Z73_2(l1a,l2a,m1a,m2a)+=H41(l1a,l2a,m1a,d1a)*S45(d1a,m2a)", &
        Z73_2,H41,S45,prefactor=(0.5d0,0.0d0))
!   original expression: Z73_2(l1a,l2a|m1am2a)+=H41(l1a,l2a|m2a,d1a)*S45(d1a|m1a)*-0.5
    ierr=exatns_tensor_contract("Z73_2(l1a,l2a,m1a,m2a)+=H41(l1a,l2a,m2a,d1a)*S45(d1a,m1a)", &
        Z73_2,H41,S45,prefactor=(-0.5d0,0.0d0))
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z67_1,"Z67_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z67_1,'ZERO')
!   original expression: Z67_1(e1a,l1a|m1am2a)+=S45(e1a|l2a)*Z73_2(l1a,l2a|m1am2a)
    ierr=exatns_tensor_contract("Z67_1(e1a,l1a,m1a,m2a)+=S45(e1a,l2a)*Z73_2(l1a,l2a,m1a,m2a)", &
        Z67_1,S45,Z73_2,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z73_2)
!   original expression: Z53(e1ae2a|m1am2a)+=S45(e1a|l1a)*Z67_1(e2a,l1a|m1am2a)
    ierr=exatns_tensor_contract("Z53(e1a,e2a,m1a,m2a)+=S45(e1a,l1a)*Z67_1(e2a,l1a,m1a,m2a)", &
        Z53,S45,Z67_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z53(e1ae2a|m1am2a)+=S45(e2a|l1a)*Z67_1(e1a,l1a|m1am2a)*-1.
    ierr=exatns_tensor_contract("Z53(e1a,e2a,m1a,m2a)+=S45(e2a,l1a)*Z67_1(e1a,l1a,m1a,m2a)", &
        Z53,S45,Z67_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z67_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z86_3,"Z86_3",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z86_3,'ZERO')
!   original expression: Z86_3(l1a,l2a|m1a,d1a)+=H40(l1a,l2a|d1a,d2a)*S45(d2a|m1a)*0.25
    ierr=exatns_tensor_contract("Z86_3(l1a,l2a,m1a,d1a)+=H40(l1a,l2a,d1a,d2a)*S45(d2a,m1a)", &
        Z86_3,H40,S45,prefactor=(0.25d0,0.0d0))
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z73_2,"Z73_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z73_2,'ZERO')
!   original expression: Z73_2(l1a,l2a|m1am2a)+=S45(d1a|m1a)*Z86_3(l1a,l2a|m2a,d1a)
    ierr=exatns_tensor_contract("Z73_2(l1a,l2a,m1a,m2a)+=S45(d1a,m1a)*Z86_3(l1a,l2a,m2a,d1a)", &
        Z73_2,S45,Z86_3,prefactor=(1.0d0,0.0d0))
!   original expression: Z73_2(l1a,l2a|m1am2a)+=S45(d1a|m2a)*Z86_3(l1a,l2a|m1a,d1a)*-1.
    ierr=exatns_tensor_contract("Z73_2(l1a,l2a,m1a,m2a)+=S45(d1a,m2a)*Z86_3(l1a,l2a,m1a,d1a)", &
        Z73_2,S45,Z86_3,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z86_3)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z67_1,"Z67_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z67_1,'ZERO')
!   original expression: Z67_1(e1a,l1a|m1am2a)+=S45(e1a|l2a)*Z73_2(l1a,l2a|m1am2a)
    ierr=exatns_tensor_contract("Z67_1(e1a,l1a,m1a,m2a)+=S45(e1a,l2a)*Z73_2(l1a,l2a,m1a,m2a)", &
        Z67_1,S45,Z73_2,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z73_2)
!   original expression: Z53(e1ae2a|m1am2a)+=S45(e1a|l1a)*Z67_1(e2a,l1a|m1am2a)
    ierr=exatns_tensor_contract("Z53(e1a,e2a,m1a,m2a)+=S45(e1a,l1a)*Z67_1(e2a,l1a,m1a,m2a)", &
        Z53,S45,Z67_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z53(e1ae2a|m1am2a)+=S45(e2a|l1a)*Z67_1(e1a,l1a|m1am2a)*-1.
    ierr=exatns_tensor_contract("Z53(e1a,e2a,m1a,m2a)+=S45(e2a,l1a)*Z67_1(e1a,l1a,m1a,m2a)", &
        Z53,S45,Z67_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z67_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z82_2,"Z82_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z82_2,'ZERO')
!   original expression: Z82_2(e1a,l1a|m1a,d1a)+=H33(e1a,l1a|d1a,d2a)*S45(d2a|m1a)*0.5
    ierr=exatns_tensor_contract("Z82_2(e1a,l1a,m1a,d1a)+=H33(e1a,l1a,d1a,d2a)*S45(d2a,m1a)", &
        Z82_2,H33,S45,prefactor=(0.5d0,0.0d0))
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z67_1,"Z67_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z67_1,'ZERO')
!   original expression: Z67_1(e1a,l1a|m1am2a)+=S45(d1a|m1a)*Z82_2(e1a,l1a|m2a,d1a)
    ierr=exatns_tensor_contract("Z67_1(e1a,l1a,m1a,m2a)+=S45(d1a,m1a)*Z82_2(e1a,l1a,m2a,d1a)", &
        Z67_1,S45,Z82_2,prefactor=(1.0d0,0.0d0))
!   original expression: Z67_1(e1a,l1a|m1am2a)+=S45(d1a|m2a)*Z82_2(e1a,l1a|m1a,d1a)*-1.
    ierr=exatns_tensor_contract("Z67_1(e1a,l1a,m1a,m2a)+=S45(d1a,m2a)*Z82_2(e1a,l1a,m1a,d1a)", &
        Z67_1,S45,Z82_2,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z82_2)
!   original expression: Z53(e1ae2a|m1am2a)+=S45(e1a|l1a)*Z67_1(e2a,l1a|m1am2a)
    ierr=exatns_tensor_contract("Z53(e1a,e2a,m1a,m2a)+=S45(e1a,l1a)*Z67_1(e2a,l1a,m1a,m2a)", &
        Z53,S45,Z67_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z53(e1ae2a|m1am2a)+=S45(e2a|l1a)*Z67_1(e1a,l1a|m1am2a)*-1.
    ierr=exatns_tensor_contract("Z53(e1a,e2a,m1a,m2a)+=S45(e2a,l1a)*Z67_1(e1a,l1a,m1a,m2a)", &
        Z53,S45,Z67_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z67_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nvir_id/)
    tens_root = (/nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z60_2,"Z60_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z60_2,'ZERO')
!   original expression: Z60_2(l1a|d1a)+=H36(l1b,l1a|d1b,d1a)*S43(d1b|l1b)
    ierr=exatns_tensor_contract("Z60_2(l1a,d1a)+=H36(l1b,l1a,d1b,d1a)*S43(d1b,l1b)", &
        Z60_2,H36,S43,prefactor=(1.0d0,0.0d0))
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z67_1,"Z67_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z67_1,'ZERO')
!   original expression: Z67_1(e1a,l1a|m1am2a)+=S47(e1a,d1a|m1am2a)*Z60_2(l1a|d1a)
    ierr=exatns_tensor_contract("Z67_1(e1a,l1a,m1a,m2a)+=S47(e1a,d1a,m1a,m2a)*Z60_2(l1a,d1a)", &
        Z67_1,S47,Z60_2,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z60_2)
!   original expression: Z53(e1ae2a|m1am2a)+=S45(e1a|l1a)*Z67_1(e2a,l1a|m1am2a)
    ierr=exatns_tensor_contract("Z53(e1a,e2a,m1a,m2a)+=S45(e1a,l1a)*Z67_1(e2a,l1a,m1a,m2a)", &
        Z53,S45,Z67_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z53(e1ae2a|m1am2a)+=S45(e2a|l1a)*Z67_1(e1a,l1a|m1am2a)*-1.
    ierr=exatns_tensor_contract("Z53(e1a,e2a,m1a,m2a)+=S45(e2a,l1a)*Z67_1(e1a,l1a,m1a,m2a)", &
        Z53,S45,Z67_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z67_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nvir_id/)
    tens_root = (/nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z60_2,"Z60_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z60_2,'ZERO')
!   original expression: Z60_2(l1a|d1a)+=H40(l1a,l2a|d1a,d2a)*S45(d2a|l2a)
    ierr=exatns_tensor_contract("Z60_2(l1a,d1a)+=H40(l1a,l2a,d1a,d2a)*S45(d2a,l2a)", &
        Z60_2,H40,S45,prefactor=(1.0d0,0.0d0))
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z67_1,"Z67_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z67_1,'ZERO')
!   original expression: Z67_1(e1a,l1a|m1am2a)+=S47(e1a,d1a|m1am2a)*Z60_2(l1a|d1a)
    ierr=exatns_tensor_contract("Z67_1(e1a,l1a,m1a,m2a)+=S47(e1a,d1a,m1a,m2a)*Z60_2(l1a,d1a)", &
        Z67_1,S47,Z60_2,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z60_2)
!   original expression: Z53(e1ae2a|m1am2a)+=S45(e1a|l1a)*Z67_1(e2a,l1a|m1am2a)
    ierr=exatns_tensor_contract("Z53(e1a,e2a,m1a,m2a)+=S45(e1a,l1a)*Z67_1(e2a,l1a,m1a,m2a)", &
        Z53,S45,Z67_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z53(e1ae2a|m1am2a)+=S45(e2a|l1a)*Z67_1(e1a,l1a|m1am2a)*-1.
    ierr=exatns_tensor_contract("Z53(e1a,e2a,m1a,m2a)+=S45(e2a,l1a)*Z67_1(e1a,l1a,m1a,m2a)", &
        Z53,S45,Z67_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z67_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z67_1,"Z67_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z67_1,'ZERO')
!   original expression: Z67_1(e1a,l1a|m1am2a)+=S47(e1a,d1a|m1am2a)*H27(l1a|d1a)
    ierr=exatns_tensor_contract("Z67_1(e1a,l1a,m1a,m2a)+=S47(e1a,d1a,m1a,m2a)*H27(l1a,d1a)", &
        Z67_1,S47,H27,prefactor=(1.0d0,0.0d0))
!   original expression: Z53(e1ae2a|m1am2a)+=S45(e1a|l1a)*Z67_1(e2a,l1a|m1am2a)
    ierr=exatns_tensor_contract("Z53(e1a,e2a,m1a,m2a)+=S45(e1a,l1a)*Z67_1(e2a,l1a,m1a,m2a)", &
        Z53,S45,Z67_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z53(e1ae2a|m1am2a)+=S45(e2a|l1a)*Z67_1(e1a,l1a|m1am2a)*-1.
    ierr=exatns_tensor_contract("Z53(e1a,e2a,m1a,m2a)+=S45(e2a,l1a)*Z67_1(e1a,l1a,m1a,m2a)", &
        Z53,S45,Z67_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z67_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z85_2,"Z85_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z85_2,'ZERO')
!   original expression: Z85_2(l1b,l1a|m1a,d1b)+=H36(l1b,l1a|d1b,d1a)*S45(d1a|m1a)
    ierr=exatns_tensor_contract("Z85_2(l1b,l1a,m1a,d1b)+=H36(l1b,l1a,d1b,d1a)*S45(d1a,m1a)", &
        Z85_2,H36,S45,prefactor=(1.0d0,0.0d0))
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z67_1,"Z67_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z67_1,'ZERO')
!   original expression: Z67_1(e1a,l1a|m1am2a)+=S46(e1a,d1b|m1a,l1b)*Z85_2(l1b,l1a|m2a,d1b)
    ierr=exatns_tensor_contract("Z67_1(e1a,l1a,m1a,m2a)+=S46(e1a,d1b,m1a,l1b)*Z85_2(l1b,l1a,m2a,d1b)", &
        Z67_1,S46,Z85_2,prefactor=(1.0d0,0.0d0))
!   original expression: Z67_1(e1a,l1a|m1am2a)+=S46(e1a,d1b|m2a,l1b)*Z85_2(l1b,l1a|m1a,d1b)*-1.
    ierr=exatns_tensor_contract("Z67_1(e1a,l1a,m1a,m2a)+=S46(e1a,d1b,m2a,l1b)*Z85_2(l1b,l1a,m1a,d1b)", &
        Z67_1,S46,Z85_2,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z85_2)
!   original expression: Z53(e1ae2a|m1am2a)+=S45(e1a|l1a)*Z67_1(e2a,l1a|m1am2a)
    ierr=exatns_tensor_contract("Z53(e1a,e2a,m1a,m2a)+=S45(e1a,l1a)*Z67_1(e2a,l1a,m1a,m2a)", &
        Z53,S45,Z67_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z53(e1ae2a|m1am2a)+=S45(e2a|l1a)*Z67_1(e1a,l1a|m1am2a)*-1.
    ierr=exatns_tensor_contract("Z53(e1a,e2a,m1a,m2a)+=S45(e2a,l1a)*Z67_1(e1a,l1a,m1a,m2a)", &
        Z53,S45,Z67_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z67_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z67_1,"Z67_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z67_1,'ZERO')
!   original expression: Z67_1(e1a,l1a|m1am2a)+=S46(e1a,d1b|m1a,l1b)*H38(l1b,l1a|m2a,d1b)*-1.
    ierr=exatns_tensor_contract("Z67_1(e1a,l1a,m1a,m2a)+=S46(e1a,d1b,m1a,l1b)*H38(l1b,l1a,m2a,d1b)", &
        Z67_1,S46,H38,prefactor=(-1.0d0,0.0d0))
!   original expression: Z67_1(e1a,l1a|m1am2a)+=S46(e1a,d1b|m2a,l1b)*H38(l1b,l1a|m1a,d1b)
    ierr=exatns_tensor_contract("Z67_1(e1a,l1a,m1a,m2a)+=S46(e1a,d1b,m2a,l1b)*H38(l1b,l1a,m1a,d1b)", &
        Z67_1,S46,H38,prefactor=(1.0d0,0.0d0))
!   original expression: Z53(e1ae2a|m1am2a)+=S45(e1a|l1a)*Z67_1(e2a,l1a|m1am2a)
    ierr=exatns_tensor_contract("Z53(e1a,e2a,m1a,m2a)+=S45(e1a,l1a)*Z67_1(e2a,l1a,m1a,m2a)", &
        Z53,S45,Z67_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z53(e1ae2a|m1am2a)+=S45(e2a|l1a)*Z67_1(e1a,l1a|m1am2a)*-1.
    ierr=exatns_tensor_contract("Z53(e1a,e2a,m1a,m2a)+=S45(e2a,l1a)*Z67_1(e1a,l1a,m1a,m2a)", &
        Z53,S45,Z67_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z67_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z86_2,"Z86_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z86_2,'ZERO')
!   original expression: Z86_2(l1a,l2a|m1a,d1a)+=H40(l1a,l2a|d1a,d2a)*S45(d2a|m1a)*-1.
    ierr=exatns_tensor_contract("Z86_2(l1a,l2a,m1a,d1a)+=H40(l1a,l2a,d1a,d2a)*S45(d2a,m1a)", &
        Z86_2,H40,S45,prefactor=(-1.0d0,0.0d0))
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z67_1,"Z67_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z67_1,'ZERO')
!   original expression: Z67_1(e1a,l1a|m1am2a)+=S47(e1a,d1a|m1a,l2a)*Z86_2(l1a,l2a|m2a,d1a)
    ierr=exatns_tensor_contract("Z67_1(e1a,l1a,m1a,m2a)+=S47(e1a,d1a,m1a,l2a)*Z86_2(l1a,l2a,m2a,d1a)", &
        Z67_1,S47,Z86_2,prefactor=(1.0d0,0.0d0))
!   original expression: Z67_1(e1a,l1a|m1am2a)+=S47(e1a,d1a|m2a,l2a)*Z86_2(l1a,l2a|m1a,d1a)*-1.
    ierr=exatns_tensor_contract("Z67_1(e1a,l1a,m1a,m2a)+=S47(e1a,d1a,m2a,l2a)*Z86_2(l1a,l2a,m1a,d1a)", &
        Z67_1,S47,Z86_2,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z86_2)
!   original expression: Z53(e1ae2a|m1am2a)+=S45(e1a|l1a)*Z67_1(e2a,l1a|m1am2a)
    ierr=exatns_tensor_contract("Z53(e1a,e2a,m1a,m2a)+=S45(e1a,l1a)*Z67_1(e2a,l1a,m1a,m2a)", &
        Z53,S45,Z67_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z53(e1ae2a|m1am2a)+=S45(e2a|l1a)*Z67_1(e1a,l1a|m1am2a)*-1.
    ierr=exatns_tensor_contract("Z53(e1a,e2a,m1a,m2a)+=S45(e2a,l1a)*Z67_1(e1a,l1a,m1a,m2a)", &
        Z53,S45,Z67_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z67_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z67_1,"Z67_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z67_1,'ZERO')
!   original expression: Z67_1(e1a,l1a|m1am2a)+=S47(e1a,d1a|m1a,l2a)*H41(l1a,l2a|m2a,d1a)
    ierr=exatns_tensor_contract("Z67_1(e1a,l1a,m1a,m2a)+=S47(e1a,d1a,m1a,l2a)*H41(l1a,l2a,m2a,d1a)", &
        Z67_1,S47,H41,prefactor=(1.0d0,0.0d0))
!   original expression: Z67_1(e1a,l1a|m1am2a)+=S47(e1a,d1a|m2a,l2a)*H41(l1a,l2a|m1a,d1a)*-1.
    ierr=exatns_tensor_contract("Z67_1(e1a,l1a,m1a,m2a)+=S47(e1a,d1a,m2a,l2a)*H41(l1a,l2a,m1a,d1a)", &
        Z67_1,S47,H41,prefactor=(-1.0d0,0.0d0))
!   original expression: Z53(e1ae2a|m1am2a)+=S45(e1a|l1a)*Z67_1(e2a,l1a|m1am2a)
    ierr=exatns_tensor_contract("Z53(e1a,e2a,m1a,m2a)+=S45(e1a,l1a)*Z67_1(e2a,l1a,m1a,m2a)", &
        Z53,S45,Z67_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z53(e1ae2a|m1am2a)+=S45(e2a|l1a)*Z67_1(e1a,l1a|m1am2a)*-1.
    ierr=exatns_tensor_contract("Z53(e1a,e2a,m1a,m2a)+=S45(e2a,l1a)*Z67_1(e1a,l1a,m1a,m2a)", &
        Z53,S45,Z67_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z67_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nvir_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z69_1,"Z69_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z69_1,'ZERO')
!   original expression: Z69_1(e1ae2a|m1a,d1a)+=H12(e1ae2a|d1a,d2a)*S45(d2a|m1a)*0.5
    ierr=exatns_tensor_contract("Z69_1(e1a,e2a,m1a,d1a)+=H12(e1a,e2a,d1a,d2a)*S45(d2a,m1a)", &
        Z69_1,H12,S45,prefactor=(0.5d0,0.0d0))
!   original expression: Z53(e1ae2a|m1am2a)+=S45(d1a|m1a)*Z69_1(e1ae2a|m2a,d1a)
    ierr=exatns_tensor_contract("Z53(e1a,e2a,m1a,m2a)+=S45(d1a,m1a)*Z69_1(e1a,e2a,m2a,d1a)", &
        Z53,S45,Z69_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z53(e1ae2a|m1am2a)+=S45(d1a|m2a)*Z69_1(e1ae2a|m1a,d1a)*-1.
    ierr=exatns_tensor_contract("Z53(e1a,e2a,m1a,m2a)+=S45(d1a,m2a)*Z69_1(e1a,e2a,m1a,d1a)", &
        Z53,S45,Z69_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z69_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z62_1,"Z62_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z62_1,'ZERO')
!   original expression: Z62_1(l1al2a|m1am2a)+=H41(l1al2a|m1a,d1a)*S45(d1a|m2a)
    ierr=exatns_tensor_contract("Z62_1(l1a,l2a,m1a,m2a)+=H41(l1a,l2a,m1a,d1a)*S45(d1a,m2a)", &
        Z62_1,H41,S45,prefactor=(1.0d0,0.0d0))
!   original expression: Z62_1(l1al2a|m1am2a)+=H41(l1al2a|m2a,d1a)*S45(d1a|m1a)*-1.
    ierr=exatns_tensor_contract("Z62_1(l1a,l2a,m1a,m2a)+=H41(l1a,l2a,m2a,d1a)*S45(d1a,m1a)", &
        Z62_1,H41,S45,prefactor=(-1.0d0,0.0d0))
!   original expression: Z53(e1ae2a|m1am2a)+=S47(e1ae2a|l1al2a)*Z62_1(l1al2a|m1am2a)
    ierr=exatns_tensor_contract("Z53(e1a,e2a,m1a,m2a)+=S47(e1a,e2a,l1a,l2a)*Z62_1(l1a,l2a,m1a,m2a)", &
        Z53,S47,Z62_1,prefactor=(0.5d0,0.0d0))
    ierr=exatns_tensor_destroy(Z62_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z76_2,"Z76_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z76_2,'ZERO')
!   original expression: Z76_2(l1al2a|m1a,d1a)+=H40(l1al2a|d1a,d2a)*S45(d2a|m1a)*0.5
    ierr=exatns_tensor_contract("Z76_2(l1a,l2a,m1a,d1a)+=H40(l1a,l2a,d1a,d2a)*S45(d2a,m1a)", &
        Z76_2,H40,S45,prefactor=(0.5d0,0.0d0))
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z62_1,"Z62_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z62_1,'ZERO')
!   original expression: Z62_1(l1al2a|m1am2a)+=S45(d1a|m1a)*Z76_2(l1al2a|m2a,d1a)
    ierr=exatns_tensor_contract("Z62_1(l1a,l2a,m1a,m2a)+=S45(d1a,m1a)*Z76_2(l1a,l2a,m2a,d1a)", &
        Z62_1,S45,Z76_2,prefactor=(1.0d0,0.0d0))
!   original expression: Z62_1(l1al2a|m1am2a)+=S45(d1a|m2a)*Z76_2(l1al2a|m1a,d1a)*-1.
    ierr=exatns_tensor_contract("Z62_1(l1a,l2a,m1a,m2a)+=S45(d1a,m2a)*Z76_2(l1a,l2a,m1a,d1a)", &
        Z62_1,S45,Z76_2,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z76_2)
!   original expression: Z53(e1ae2a|m1am2a)+=S47(e1ae2a|l1al2a)*Z62_1(l1al2a|m1am2a)
    ierr=exatns_tensor_contract("Z53(e1a,e2a,m1a,m2a)+=S47(e1a,e2a,l1a,l2a)*Z62_1(l1a,l2a,m1a,m2a)", &
        Z53,S47,Z62_1,prefactor=(0.5d0,0.0d0))
    ierr=exatns_tensor_destroy(Z62_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nocc_id,nocc_id,nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root,nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z62_1,"Z62_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z62_1,'ZERO')
!   original expression: Z62_1(l1al2a|m1am2a)+=S47(d1ad2a|m1am2a)*H40(l1al2a|d1ad2a)
    ierr=exatns_tensor_contract("Z62_1(l1a,l2a,m1a,m2a)+=S47(d1a,d2a,m1a,m2a)*H40(l1a,l2a,d1a,d2a)", &
        Z62_1,S47,H40,prefactor=(0.5d0,0.0d0))
!   original expression: Z53(e1ae2a|m1am2a)+=S47(e1ae2a|l1al2a)*Z62_1(l1al2a|m1am2a)
    ierr=exatns_tensor_contract("Z53(e1a,e2a,m1a,m2a)+=S47(e1a,e2a,l1a,l2a)*Z62_1(l1a,l2a,m1a,m2a)", &
        Z53,S47,Z62_1,prefactor=(0.5d0,0.0d0))
    ierr=exatns_tensor_destroy(Z62_1)
!   original expression: Z53(e1ae2a|m1am2a)+=S47(e1ae2a|l1al2a)*H42(l1al2a|m1am2a)
    ierr=exatns_tensor_contract("Z53(e1a,e2a,m1a,m2a)+=S47(e1a,e2a,l1a,l2a)*H42(l1a,l2a,m1a,m2a)", &
        Z53,S47,H42,prefactor=(0.5d0,0.0d0))
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nvir_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root/)
    ierr=exatns_tensor_create(Z55_1,"Z55_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z55_1,'ZERO')
!   original expression: Z55_1(e1a|d1a)+=H20(e1a,l1b|d1b,d1a)*S43(d1b|l1b)*-1.
    ierr=exatns_tensor_contract("Z55_1(e1a,d1a)+=H20(e1a,l1b,d1b,d1a)*S43(d1b,l1b)", &
        Z55_1,H20,S43,prefactor=(-1.0d0,0.0d0))
!   original expression: Z53(e1ae2a|m1am2a)+=S47(e1a,d1a|m1am2a)*Z55_1(e2a|d1a)
    ierr=exatns_tensor_contract("Z53(e1a,e2a,m1a,m2a)+=S47(e1a,d1a,m1a,m2a)*Z55_1(e2a,d1a)", &
        Z53,S47,Z55_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z53(e1ae2a|m1am2a)+=S47(e2a,d1a|m1am2a)*Z55_1(e1a|d1a)*-1.
    ierr=exatns_tensor_contract("Z53(e1a,e2a,m1a,m2a)+=S47(e2a,d1a,m1a,m2a)*Z55_1(e1a,d1a)", &
        Z53,S47,Z55_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z55_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nvir_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root/)
    ierr=exatns_tensor_create(Z55_1,"Z55_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z55_1,'ZERO')
!   original expression: Z55_1(e1a|d1a)+=H33(e1a,l1a|d1a,d2a)*S45(d2a|l1a)
    ierr=exatns_tensor_contract("Z55_1(e1a,d1a)+=H33(e1a,l1a,d1a,d2a)*S45(d2a,l1a)", &
        Z55_1,H33,S45,prefactor=(1.0d0,0.0d0))
!   original expression: Z53(e1ae2a|m1am2a)+=S47(e1a,d1a|m1am2a)*Z55_1(e2a|d1a)
    ierr=exatns_tensor_contract("Z53(e1a,e2a,m1a,m2a)+=S47(e1a,d1a,m1a,m2a)*Z55_1(e2a,d1a)", &
        Z53,S47,Z55_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z53(e1ae2a|m1am2a)+=S47(e2a,d1a|m1am2a)*Z55_1(e1a|d1a)*-1.
    ierr=exatns_tensor_contract("Z53(e1a,e2a,m1a,m2a)+=S47(e2a,d1a,m1a,m2a)*Z55_1(e1a,d1a)", &
        Z53,S47,Z55_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z55_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nvir_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root/)
    ierr=exatns_tensor_create(Z55_1,"Z55_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z55_1,'ZERO')
!   original expression: Z55_1(e1a|d1a)+=S46(e1a,d1b|l1al1b)*H36(l1al1b|d1b,d1a)
    ierr=exatns_tensor_contract("Z55_1(e1a,d1a)+=S46(e1a,d1b,l1a,l1b)*H36(l1a,l1b,d1b,d1a)", &
        Z55_1,S46,H36,prefactor=(0.5d0,0.0d0))
!   original expression: Z53(e1ae2a|m1am2a)+=S47(e1a,d1a|m1am2a)*Z55_1(e2a|d1a)
    ierr=exatns_tensor_contract("Z53(e1a,e2a,m1a,m2a)+=S47(e1a,d1a,m1a,m2a)*Z55_1(e2a,d1a)", &
        Z53,S47,Z55_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z53(e1ae2a|m1am2a)+=S47(e2a,d1a|m1am2a)*Z55_1(e1a|d1a)*-1.
    ierr=exatns_tensor_contract("Z53(e1a,e2a,m1a,m2a)+=S47(e2a,d1a,m1a,m2a)*Z55_1(e1a,d1a)", &
        Z53,S47,Z55_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z55_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nvir_id,nvir_id/)
    tens_root = (/nvir_root,nvir_root/)
    ierr=exatns_tensor_create(Z55_1,"Z55_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z55_1,'ZERO')
!   original expression: Z55_1(e1a|d1a)+=S47(e1a,d2a|l1al2a)*H40(l1al2a|d1a,d2a)*-1.
    ierr=exatns_tensor_contract("Z55_1(e1a,d1a)+=S47(e1a,d2a,l1a,l2a)*H40(l1a,l2a,d1a,d2a)", &
        Z55_1,S47,H40,prefactor=(-0.5d0,0.0d0))
!   original expression: Z53(e1ae2a|m1am2a)+=S47(e1a,d1a|m1am2a)*Z55_1(e2a|d1a)
    ierr=exatns_tensor_contract("Z53(e1a,e2a,m1a,m2a)+=S47(e1a,d1a,m1a,m2a)*Z55_1(e2a,d1a)", &
        Z53,S47,Z55_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z53(e1ae2a|m1am2a)+=S47(e2a,d1a|m1am2a)*Z55_1(e1a|d1a)*-1.
    ierr=exatns_tensor_contract("Z53(e1a,e2a,m1a,m2a)+=S47(e2a,d1a,m1a,m2a)*Z55_1(e1a,d1a)", &
        Z53,S47,Z55_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z55_1)
!   original expression: Z53(e1ae2a|m1am2a)+=S47(e1a,d1a|m1am2a)*H6(e2a|d1a)
    ierr=exatns_tensor_contract("Z53(e1a,e2a,m1a,m2a)+=S47(e1a,d1a,m1a,m2a)*H6(e2a,d1a)", &
        Z53,S47,H6,prefactor=(1.0d0,0.0d0))
!   original expression: Z53(e1ae2a|m1am2a)+=S47(e2a,d1a|m1am2a)*H6(e1a|d1a)*-1.
    ierr=exatns_tensor_contract("Z53(e1a,e2a,m1a,m2a)+=S47(e2a,d1a,m1a,m2a)*H6(e1a,d1a)", &
        Z53,S47,H6,prefactor=(-1.0d0,0.0d0))
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z59_1,"Z59_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z59_1,'ZERO')
!   original expression: Z59_1(l1a|m1a)+=H38(l1b,l1a|m1a,d1b)*S43(d1b|l1b)
    ierr=exatns_tensor_contract("Z59_1(l1a,m1a)+=H38(l1b,l1a,m1a,d1b)*S43(d1b,l1b)", &
        Z59_1,H38,S43,prefactor=(1.0d0,0.0d0))
!   original expression: Z53(e1ae2a|m1am2a)+=S47(e1ae2a|m1a,l1a)*Z59_1(l1a|m2a)
    ierr=exatns_tensor_contract("Z53(e1a,e2a,m1a,m2a)+=S47(e1a,e2a,m1a,l1a)*Z59_1(l1a,m2a)", &
        Z53,S47,Z59_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z53(e1ae2a|m1am2a)+=S47(e1ae2a|m2a,l1a)*Z59_1(l1a|m1a)*-1.
    ierr=exatns_tensor_contract("Z53(e1a,e2a,m1a,m2a)+=S47(e1a,e2a,m2a,l1a)*Z59_1(l1a,m1a)", &
        Z53,S47,Z59_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z59_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z59_1,"Z59_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z59_1,'ZERO')
!   original expression: Z59_1(l1a|m1a)+=H41(l1a,l2a|m1a,d1a)*S45(d1a|l2a)*-1.
    ierr=exatns_tensor_contract("Z59_1(l1a,m1a)+=H41(l1a,l2a,m1a,d1a)*S45(d1a,l2a)", &
        Z59_1,H41,S45,prefactor=(-1.0d0,0.0d0))
!   original expression: Z53(e1ae2a|m1am2a)+=S47(e1ae2a|m1a,l1a)*Z59_1(l1a|m2a)
    ierr=exatns_tensor_contract("Z53(e1a,e2a,m1a,m2a)+=S47(e1a,e2a,m1a,l1a)*Z59_1(l1a,m2a)", &
        Z53,S47,Z59_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z53(e1ae2a|m1am2a)+=S47(e1ae2a|m2a,l1a)*Z59_1(l1a|m1a)*-1.
    ierr=exatns_tensor_contract("Z53(e1a,e2a,m1a,m2a)+=S47(e1a,e2a,m2a,l1a)*Z59_1(l1a,m1a)", &
        Z53,S47,Z59_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z59_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nvir_id/)
    tens_root = (/nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z60_2,"Z60_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z60_2,'ZERO')
!   original expression: Z60_2(l1a|d1a)+=H36(l1b,l1a|d1b,d1a)*S43(d1b|l1b)*-1.
    ierr=exatns_tensor_contract("Z60_2(l1a,d1a)+=H36(l1b,l1a,d1b,d1a)*S43(d1b,l1b)", &
        Z60_2,H36,S43,prefactor=(-1.0d0,0.0d0))
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z59_1,"Z59_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z59_1,'ZERO')
!   original expression: Z59_1(l1a|m1a)+=S45(d1a|m1a)*Z60_2(l1a|d1a)
    ierr=exatns_tensor_contract("Z59_1(l1a,m1a)+=S45(d1a,m1a)*Z60_2(l1a,d1a)", &
        Z59_1,S45,Z60_2,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z60_2)
!   original expression: Z53(e1ae2a|m1am2a)+=S47(e1ae2a|m1a,l1a)*Z59_1(l1a|m2a)
    ierr=exatns_tensor_contract("Z53(e1a,e2a,m1a,m2a)+=S47(e1a,e2a,m1a,l1a)*Z59_1(l1a,m2a)", &
        Z53,S47,Z59_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z53(e1ae2a|m1am2a)+=S47(e1ae2a|m2a,l1a)*Z59_1(l1a|m1a)*-1.
    ierr=exatns_tensor_contract("Z53(e1a,e2a,m1a,m2a)+=S47(e1a,e2a,m2a,l1a)*Z59_1(l1a,m1a)", &
        Z53,S47,Z59_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z59_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nvir_id/)
    tens_root = (/nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z60_2,"Z60_2",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z60_2,'ZERO')
!   original expression: Z60_2(l1a|d1a)+=H40(l1a,l2a|d1a,d2a)*S45(d2a|l2a)*-1.
    ierr=exatns_tensor_contract("Z60_2(l1a,d1a)+=H40(l1a,l2a,d1a,d2a)*S45(d2a,l2a)", &
        Z60_2,H40,S45,prefactor=(-1.0d0,0.0d0))
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z59_1,"Z59_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z59_1,'ZERO')
!   original expression: Z59_1(l1a|m1a)+=S45(d1a|m1a)*Z60_2(l1a|d1a)
    ierr=exatns_tensor_contract("Z59_1(l1a,m1a)+=S45(d1a,m1a)*Z60_2(l1a,d1a)", &
        Z59_1,S45,Z60_2,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z60_2)
!   original expression: Z53(e1ae2a|m1am2a)+=S47(e1ae2a|m1a,l1a)*Z59_1(l1a|m2a)
    ierr=exatns_tensor_contract("Z53(e1a,e2a,m1a,m2a)+=S47(e1a,e2a,m1a,l1a)*Z59_1(l1a,m2a)", &
        Z53,S47,Z59_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z53(e1ae2a|m1am2a)+=S47(e1ae2a|m2a,l1a)*Z59_1(l1a|m1a)*-1.
    ierr=exatns_tensor_contract("Z53(e1a,e2a,m1a,m2a)+=S47(e1a,e2a,m2a,l1a)*Z59_1(l1a,m1a)", &
        Z53,S47,Z59_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z59_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z59_1,"Z59_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z59_1,'ZERO')
!   original expression: Z59_1(l1a|m1a)+=S45(d1a|m1a)*H27(l1a|d1a)*-1.
    ierr=exatns_tensor_contract("Z59_1(l1a,m1a)+=S45(d1a,m1a)*H27(l1a,d1a)", &
        Z59_1,S45,H27,prefactor=(-1.0d0,0.0d0))
!   original expression: Z53(e1ae2a|m1am2a)+=S47(e1ae2a|m1a,l1a)*Z59_1(l1a|m2a)
    ierr=exatns_tensor_contract("Z53(e1a,e2a,m1a,m2a)+=S47(e1a,e2a,m1a,l1a)*Z59_1(l1a,m2a)", &
        Z53,S47,Z59_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z53(e1ae2a|m1am2a)+=S47(e1ae2a|m2a,l1a)*Z59_1(l1a|m1a)*-1.
    ierr=exatns_tensor_contract("Z53(e1a,e2a,m1a,m2a)+=S47(e1a,e2a,m2a,l1a)*Z59_1(l1a,m1a)", &
        Z53,S47,Z59_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z59_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z59_1,"Z59_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z59_1,'ZERO')
!   original expression: Z59_1(l1a|m1a)+=S46(d1ad1b|m1a,l1b)*H36(l1b,l1a|d1ad1b)
    ierr=exatns_tensor_contract("Z59_1(l1a,m1a)+=S46(d1a,d1b,m1a,l1b)*H36(l1b,l1a,d1a,d1b)", &
        Z59_1,S46,H36,prefactor=(0.5d0,0.0d0))
!   original expression: Z53(e1ae2a|m1am2a)+=S47(e1ae2a|m1a,l1a)*Z59_1(l1a|m2a)
    ierr=exatns_tensor_contract("Z53(e1a,e2a,m1a,m2a)+=S47(e1a,e2a,m1a,l1a)*Z59_1(l1a,m2a)", &
        Z53,S47,Z59_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z53(e1ae2a|m1am2a)+=S47(e1ae2a|m2a,l1a)*Z59_1(l1a|m1a)*-1.
    ierr=exatns_tensor_contract("Z53(e1a,e2a,m1a,m2a)+=S47(e1a,e2a,m2a,l1a)*Z59_1(l1a,m1a)", &
        Z53,S47,Z59_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z59_1)
    
    allocate(tens_id(2), tens_root(2))
    tens_id   = (/nocc_id,nocc_id/)
    tens_root = (/nocc_root,nocc_root/)
    ierr=exatns_tensor_create(Z59_1,"Z59_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z59_1,'ZERO')
!   original expression: Z59_1(l1a|m1a)+=S47(d1ad2a|m1a,l2a)*H40(l1a,l2a|d1ad2a)*-1.
    ierr=exatns_tensor_contract("Z59_1(l1a,m1a)+=S47(d1a,d2a,m1a,l2a)*H40(l1a,l2a,d1a,d2a)", &
        Z59_1,S47,H40,prefactor=(-0.5d0,0.0d0))
!   original expression: Z53(e1ae2a|m1am2a)+=S47(e1ae2a|m1a,l1a)*Z59_1(l1a|m2a)
    ierr=exatns_tensor_contract("Z53(e1a,e2a,m1a,m2a)+=S47(e1a,e2a,m1a,l1a)*Z59_1(l1a,m2a)", &
        Z53,S47,Z59_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z53(e1ae2a|m1am2a)+=S47(e1ae2a|m2a,l1a)*Z59_1(l1a|m1a)*-1.
    ierr=exatns_tensor_contract("Z53(e1a,e2a,m1a,m2a)+=S47(e1a,e2a,m2a,l1a)*Z59_1(l1a,m1a)", &
        Z53,S47,Z59_1,prefactor=(-1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z59_1)
!   original expression: Z53(e1ae2a|m1am2a)+=S47(e1ae2a|m1a,l1a)*H28(l1a|m2a)*-1.
    ierr=exatns_tensor_contract("Z53(e1a,e2a,m1a,m2a)+=S47(e1a,e2a,m1a,l1a)*H28(l1a,m2a)", &
        Z53,S47,H28,prefactor=(-1.0d0,0.0d0))
!   original expression: Z53(e1ae2a|m1am2a)+=S47(e1ae2a|m2a,l1a)*H28(l1a|m1a)
    ierr=exatns_tensor_contract("Z53(e1a,e2a,m1a,m2a)+=S47(e1a,e2a,m2a,l1a)*H28(l1a,m1a)", &
        Z53,S47,H28,prefactor=(1.0d0,0.0d0))
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z81_1,"Z81_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z81_1,'ZERO')
!   original expression: Z81_1(e1a,l1b|m1a,d1b)+=H20(e1a,l1b|d1b,d1a)*S45(d1a|m1a)*-1.
    ierr=exatns_tensor_contract("Z81_1(e1a,l1b,m1a,d1b)+=H20(e1a,l1b,d1b,d1a)*S45(d1a,m1a)", &
        Z81_1,H20,S45,prefactor=(-1.0d0,0.0d0))
!   original expression: Z53(e1ae2a|m1am2a)+=S46(e1a,d1b|m1a,l1b)*Z81_1(e2a,l1b|m2a,d1b)
    ierr=exatns_tensor_contract("Z53(e1a,e2a,m1a,m2a)+=S46(e1a,d1b,m1a,l1b)*Z81_1(e2a,l1b,m2a,d1b)", &
        Z53,S46,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z53(e1ae2a|m1am2a)+=S46(e2a,d1b|m1a,l1b)*Z81_1(e1a,l1b|m2a,d1b)*-1.
    ierr=exatns_tensor_contract("Z53(e1a,e2a,m1a,m2a)+=S46(e2a,d1b,m1a,l1b)*Z81_1(e1a,l1b,m2a,d1b)", &
        Z53,S46,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z53(e1ae2a|m1am2a)+=S46(e1a,d1b|m2a,l1b)*Z81_1(e2a,l1b|m1a,d1b)*-1.
    ierr=exatns_tensor_contract("Z53(e1a,e2a,m1a,m2a)+=S46(e1a,d1b,m2a,l1b)*Z81_1(e2a,l1b,m1a,d1b)", &
        Z53,S46,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z53(e1ae2a|m1am2a)+=S46(e2a,d1b|m2a,l1b)*Z81_1(e1a,l1b|m1a,d1b)
    ierr=exatns_tensor_contract("Z53(e1a,e2a,m1a,m2a)+=S46(e2a,d1b,m2a,l1b)*Z81_1(e1a,l1b,m1a,d1b)", &
        Z53,S46,Z81_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z81_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z81_1,"Z81_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z81_1,'ZERO')
!   original expression: Z81_1(e1a,l1b|m1a,d1b)+=S46(e1a,d2b|m1a,l2b)*H24(l1b,l2b|d1b,d2b)*0.5
    ierr=exatns_tensor_contract("Z81_1(e1a,l1b,m1a,d1b)+=S46(e1a,d2b,m1a,l2b)*H24(l1b,l2b,d1b,d2b)", &
        Z81_1,S46,H24,prefactor=(0.5d0,0.0d0))
!   original expression: Z53(e1ae2a|m1am2a)+=S46(e1a,d1b|m1a,l1b)*Z81_1(e2a,l1b|m2a,d1b)
    ierr=exatns_tensor_contract("Z53(e1a,e2a,m1a,m2a)+=S46(e1a,d1b,m1a,l1b)*Z81_1(e2a,l1b,m2a,d1b)", &
        Z53,S46,Z81_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z53(e1ae2a|m1am2a)+=S46(e2a,d1b|m1a,l1b)*Z81_1(e1a,l1b|m2a,d1b)*-1.
    ierr=exatns_tensor_contract("Z53(e1a,e2a,m1a,m2a)+=S46(e2a,d1b,m1a,l1b)*Z81_1(e1a,l1b,m2a,d1b)", &
        Z53,S46,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z53(e1ae2a|m1am2a)+=S46(e1a,d1b|m2a,l1b)*Z81_1(e2a,l1b|m1a,d1b)*-1.
    ierr=exatns_tensor_contract("Z53(e1a,e2a,m1a,m2a)+=S46(e1a,d1b,m2a,l1b)*Z81_1(e2a,l1b,m1a,d1b)", &
        Z53,S46,Z81_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z53(e1ae2a|m1am2a)+=S46(e2a,d1b|m2a,l1b)*Z81_1(e1a,l1b|m1a,d1b)
    ierr=exatns_tensor_contract("Z53(e1a,e2a,m1a,m2a)+=S46(e2a,d1b,m2a,l1b)*Z81_1(e1a,l1b,m1a,d1b)", &
        Z53,S46,Z81_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z81_1)
!   original expression: Z53(e1ae2a|m1am2a)+=S46(e1a,d1b|m1a,l1b)*H22(e2a,l1b|m2a,d1b)
    ierr=exatns_tensor_contract("Z53(e1a,e2a,m1a,m2a)+=S46(e1a,d1b,m1a,l1b)*H22(e2a,l1b,m2a,d1b)", &
        Z53,S46,H22,prefactor=(1.0d0,0.0d0))
!   original expression: Z53(e1ae2a|m1am2a)+=S46(e2a,d1b|m1a,l1b)*H22(e1a,l1b|m2a,d1b)*-1.
    ierr=exatns_tensor_contract("Z53(e1a,e2a,m1a,m2a)+=S46(e2a,d1b,m1a,l1b)*H22(e1a,l1b,m2a,d1b)", &
        Z53,S46,H22,prefactor=(-1.0d0,0.0d0))
!   original expression: Z53(e1ae2a|m1am2a)+=S46(e1a,d1b|m2a,l1b)*H22(e2a,l1b|m1a,d1b)*-1.
    ierr=exatns_tensor_contract("Z53(e1a,e2a,m1a,m2a)+=S46(e1a,d1b,m2a,l1b)*H22(e2a,l1b,m1a,d1b)", &
        Z53,S46,H22,prefactor=(-1.0d0,0.0d0))
!   original expression: Z53(e1ae2a|m1am2a)+=S46(e2a,d1b|m2a,l1b)*H22(e1a,l1b|m1a,d1b)
    ierr=exatns_tensor_contract("Z53(e1a,e2a,m1a,m2a)+=S46(e2a,d1b,m2a,l1b)*H22(e1a,l1b,m1a,d1b)", &
        Z53,S46,H22,prefactor=(1.0d0,0.0d0))
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z82_1,"Z82_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z82_1,'ZERO')
!   original expression: Z82_1(e1a,l1a|m1a,d1a)+=H33(e1a,l1a|d1a,d2a)*S45(d2a|m1a)*-1.
    ierr=exatns_tensor_contract("Z82_1(e1a,l1a,m1a,d1a)+=H33(e1a,l1a,d1a,d2a)*S45(d2a,m1a)", &
        Z82_1,H33,S45,prefactor=(-1.0d0,0.0d0))
!   original expression: Z53(e1ae2a|m1am2a)+=S47(e1a,d1a|m1a,l1a)*Z82_1(e2a,l1a|m2a,d1a)
    ierr=exatns_tensor_contract("Z53(e1a,e2a,m1a,m2a)+=S47(e1a,d1a,m1a,l1a)*Z82_1(e2a,l1a,m2a,d1a)", &
        Z53,S47,Z82_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z53(e1ae2a|m1am2a)+=S47(e2a,d1a|m1a,l1a)*Z82_1(e1a,l1a|m2a,d1a)*-1.
    ierr=exatns_tensor_contract("Z53(e1a,e2a,m1a,m2a)+=S47(e2a,d1a,m1a,l1a)*Z82_1(e1a,l1a,m2a,d1a)", &
        Z53,S47,Z82_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z53(e1ae2a|m1am2a)+=S47(e1a,d1a|m2a,l1a)*Z82_1(e2a,l1a|m1a,d1a)*-1.
    ierr=exatns_tensor_contract("Z53(e1a,e2a,m1a,m2a)+=S47(e1a,d1a,m2a,l1a)*Z82_1(e2a,l1a,m1a,d1a)", &
        Z53,S47,Z82_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z53(e1ae2a|m1am2a)+=S47(e2a,d1a|m2a,l1a)*Z82_1(e1a,l1a|m1a,d1a)
    ierr=exatns_tensor_contract("Z53(e1a,e2a,m1a,m2a)+=S47(e2a,d1a,m2a,l1a)*Z82_1(e1a,l1a,m1a,d1a)", &
        Z53,S47,Z82_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z82_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z82_1,"Z82_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z82_1,'ZERO')
!   original expression: Z82_1(e1a,l1a|m1a,d1a)+=S46(e1a,d1b|m1a,l1b)*H36(l1b,l1a|d1b,d1a)
    ierr=exatns_tensor_contract("Z82_1(e1a,l1a,m1a,d1a)+=S46(e1a,d1b,m1a,l1b)*H36(l1b,l1a,d1b,d1a)", &
        Z82_1,S46,H36,prefactor=(1.0d0,0.0d0))
!   original expression: Z53(e1ae2a|m1am2a)+=S47(e1a,d1a|m1a,l1a)*Z82_1(e2a,l1a|m2a,d1a)
    ierr=exatns_tensor_contract("Z53(e1a,e2a,m1a,m2a)+=S47(e1a,d1a,m1a,l1a)*Z82_1(e2a,l1a,m2a,d1a)", &
        Z53,S47,Z82_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z53(e1ae2a|m1am2a)+=S47(e2a,d1a|m1a,l1a)*Z82_1(e1a,l1a|m2a,d1a)*-1.
    ierr=exatns_tensor_contract("Z53(e1a,e2a,m1a,m2a)+=S47(e2a,d1a,m1a,l1a)*Z82_1(e1a,l1a,m2a,d1a)", &
        Z53,S47,Z82_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z53(e1ae2a|m1am2a)+=S47(e1a,d1a|m2a,l1a)*Z82_1(e2a,l1a|m1a,d1a)*-1.
    ierr=exatns_tensor_contract("Z53(e1a,e2a,m1a,m2a)+=S47(e1a,d1a,m2a,l1a)*Z82_1(e2a,l1a,m1a,d1a)", &
        Z53,S47,Z82_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z53(e1ae2a|m1am2a)+=S47(e2a,d1a|m2a,l1a)*Z82_1(e1a,l1a|m1a,d1a)
    ierr=exatns_tensor_contract("Z53(e1a,e2a,m1a,m2a)+=S47(e2a,d1a,m2a,l1a)*Z82_1(e1a,l1a,m1a,d1a)", &
        Z53,S47,Z82_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z82_1)
    
    allocate(tens_id(4), tens_root(4))
    tens_id   = (/nvir_id,nocc_id,nocc_id,nvir_id/)
    tens_root = (/nvir_root,nocc_root,nocc_root,nvir_root/)
    ierr=exatns_tensor_create(Z82_1,"Z82_1",tens_id, tens_root,EXA_DATA_KIND_C8)
    deallocate(tens_id,tens_root)
    ierr=exatns_tensor_init(Z82_1,'ZERO')
!   original expression: Z82_1(e1a,l1a|m1a,d1a)+=S47(e1a,d2a|m1a,l2a)*H40(l1a,l2a|d1a,d2a)*0.5
    ierr=exatns_tensor_contract("Z82_1(e1a,l1a,m1a,d1a)+=S47(e1a,d2a,m1a,l2a)*H40(l1a,l2a,d1a,d2a)", &
        Z82_1,S47,H40,prefactor=(0.5d0,0.0d0))
!   original expression: Z53(e1ae2a|m1am2a)+=S47(e1a,d1a|m1a,l1a)*Z82_1(e2a,l1a|m2a,d1a)
    ierr=exatns_tensor_contract("Z53(e1a,e2a,m1a,m2a)+=S47(e1a,d1a,m1a,l1a)*Z82_1(e2a,l1a,m2a,d1a)", &
        Z53,S47,Z82_1,prefactor=(1.0d0,0.0d0))
!   original expression: Z53(e1ae2a|m1am2a)+=S47(e2a,d1a|m1a,l1a)*Z82_1(e1a,l1a|m2a,d1a)*-1.
    ierr=exatns_tensor_contract("Z53(e1a,e2a,m1a,m2a)+=S47(e2a,d1a,m1a,l1a)*Z82_1(e1a,l1a,m2a,d1a)", &
        Z53,S47,Z82_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z53(e1ae2a|m1am2a)+=S47(e1a,d1a|m2a,l1a)*Z82_1(e2a,l1a|m1a,d1a)*-1.
    ierr=exatns_tensor_contract("Z53(e1a,e2a,m1a,m2a)+=S47(e1a,d1a,m2a,l1a)*Z82_1(e2a,l1a,m1a,d1a)", &
        Z53,S47,Z82_1,prefactor=(-1.0d0,0.0d0))
!   original expression: Z53(e1ae2a|m1am2a)+=S47(e2a,d1a|m2a,l1a)*Z82_1(e1a,l1a|m1a,d1a)
    ierr=exatns_tensor_contract("Z53(e1a,e2a,m1a,m2a)+=S47(e2a,d1a,m2a,l1a)*Z82_1(e1a,l1a,m1a,d1a)", &
        Z53,S47,Z82_1,prefactor=(1.0d0,0.0d0))
    ierr=exatns_tensor_destroy(Z82_1)
!   original expression: Z53(e1ae2a|m1am2a)+=S47(e1a,d1a|m1a,l1a)*H34(e2a,l1a|m2a,d1a)
    ierr=exatns_tensor_contract("Z53(e1a,e2a,m1a,m2a)+=S47(e1a,d1a,m1a,l1a)*H34(e2a,l1a,m2a,d1a)", &
        Z53,S47,H34,prefactor=(1.0d0,0.0d0))
!   original expression: Z53(e1ae2a|m1am2a)+=S47(e2a,d1a|m1a,l1a)*H34(e1a,l1a|m2a,d1a)*-1.
    ierr=exatns_tensor_contract("Z53(e1a,e2a,m1a,m2a)+=S47(e2a,d1a,m1a,l1a)*H34(e1a,l1a,m2a,d1a)", &
        Z53,S47,H34,prefactor=(-1.0d0,0.0d0))
!   original expression: Z53(e1ae2a|m1am2a)+=S47(e1a,d1a|m2a,l1a)*H34(e2a,l1a|m1a,d1a)*-1.
    ierr=exatns_tensor_contract("Z53(e1a,e2a,m1a,m2a)+=S47(e1a,d1a,m2a,l1a)*H34(e2a,l1a,m1a,d1a)", &
        Z53,S47,H34,prefactor=(-1.0d0,0.0d0))
!   original expression: Z53(e1ae2a|m1am2a)+=S47(e2a,d1a|m2a,l1a)*H34(e1a,l1a|m1a,d1a)
    ierr=exatns_tensor_contract("Z53(e1a,e2a,m1a,m2a)+=S47(e2a,d1a,m2a,l1a)*H34(e1a,l1a,m1a,d1a)", &
        Z53,S47,H34,prefactor=(1.0d0,0.0d0))



    ierr=exatns_tensor_destroy(one_tensor)
end subroutine generic_exatensor_codegen_call
