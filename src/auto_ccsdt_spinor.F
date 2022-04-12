!   
!    Outputting TAL-SH Fortran code generated with :
!      Codegen, a toolset to process tensor contraction DSLs (SIAL etc)
!      Andre Gomes (CNRS UMR8523, Lille) and Dmitry Lyakh (OCLF, Oak Ridge)
!   
subroutine generic_codegen_call(nocc,nvir,\
    H24,\
    S43,\
    H15,\
    S44,\
    H2,\
    H1,\
    H17,\
    H18,\
    H25,\
    H16,\
    H5,\
    H3,\
    H19,\
    H4,\
    H26,\
    Z48,\
    Z49,\
    Z50,\
    Z51)
    integer, intent(in) :: nocc
    integer, intent(in) :: nvir
    type(talsh_tensor_t), intent(inout) :: H24    !       OOVV
    type(talsh_tensor_t), intent(inout) :: S43    !       VO
    type(talsh_tensor_t), intent(inout) :: H15    !       OV
    type(talsh_tensor_t), intent(inout) :: S44    !       VVOO
    type(talsh_tensor_t), intent(inout) :: H2    !       VO
    type(talsh_tensor_t), intent(inout) :: H1    !       VV
    type(talsh_tensor_t), intent(inout) :: H17    !       OVVV
    type(talsh_tensor_t), intent(inout) :: H18    !       OVOV
    type(talsh_tensor_t), intent(inout) :: H25    !       OOOV
    type(talsh_tensor_t), intent(inout) :: H16    !       OO
    type(talsh_tensor_t), intent(inout) :: H5    !       VVOO
    type(talsh_tensor_t), intent(inout) :: H3    !       VVVV
    type(talsh_tensor_t), intent(inout) :: H19    !       OVOO
    type(talsh_tensor_t), intent(inout) :: H4    !       VVOV
    type(talsh_tensor_t), intent(inout) :: H26    !       OOOO
    type(talsh_tensor_t), intent(inout) :: Z48    !       UnitTensor
    type(talsh_tensor_t), intent(inout) :: Z49    !       VO
    type(talsh_tensor_t), intent(inout) :: Z50    !       VVOO
    type(talsh_tensor_t), intent(inout) :: Z51    !       VVVOOO
    type(talsh_tensor_t) :: Z61_1    !       OV
    type(talsh_tensor_t) :: Z60_1    !       OO
    type(talsh_tensor_t) :: Z61_2    !       OV
    type(talsh_tensor_t) :: Z58_1    !       VV
    type(talsh_tensor_t) :: Z83_1    !       OOOV
    type(talsh_tensor_t) :: Z67_1    !       VOOO
    type(talsh_tensor_t) :: Z81_2    !       OOOO
    type(talsh_tensor_t) :: Z100_3    !       OOOV
    type(talsh_tensor_t) :: Z90_2    !       VOOV
    type(talsh_tensor_t) :: Z100_2    !       OOOV
    type(talsh_tensor_t) :: Z71_1    !       VVOV
    type(talsh_tensor_t) :: Z62_1    !       OOOO
    type(talsh_tensor_t) :: Z83_2    !       OOOV
    type(talsh_tensor_t) :: Z90_1    !       VOOV
    type(talsh_tensor_t) :: Z69_1    !       VVOOOO
    type(talsh_tensor_t) :: Z88_2    !       VOOOOO


    ierr=talsh_tensor_construct(Z61_1, C8, /(nocc,nvir)/, init_val=ZERO)
!   original expression: Z61_1(l1b|d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|l2b)*0.5
    ierr=talsh_tensor_contract("Z61_1(l1,d1)+=H24(l1,l2,d1,d2)*S43(d2,l2)",Z61_1,H24,S43,scale=(0.5d0,0.0d0))
!   original expression: Z48(|)+=S43(d1b|l1b)*Z61_1(l1b|d1b)
    ierr=talsh_tensor_contract("Z48()+=S43(d1,l1)*Z61_1(l1,d1)",Z48,S43,Z61_1,scale=(1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z61_1)
!   original expression: Z48(|)+=S43(d1b|l1b)*H15(l1b|d1b)
    ierr=talsh_tensor_contract("Z48()+=S43(d1,l1)*H15(l1,d1)",Z48,S43,H15,scale=(1.0d0,0.0d0))
!   original expression: Z48(|)+=S44(d1bd2b|l1bl2b)*H24(l1bl2b|d1bd2b)
    ierr=talsh_tensor_contract("Z48()+=S44(d1,d2,l1,l2)*H24(l1,l2,d1,d2)",Z48,S44,H24,scale=(0.25d0,0.0d0))
!   original expression: Z49(e1b|m1b)+=H2(e1b|m1b)
    ierr=talsh_tensor_add("Z49(e1,m1)+=H2(e1,m1)",Z49,H2,scale=(1.0d0,0.0d0))
!   original expression: Z49(e1b|m1b)+=H1(e1b|d1b)*S43(d1b|m1b)
    ierr=talsh_tensor_contract("Z49(e1,m1)+=H1(e1,d1)*S43(d1,m1)",Z49,H1,S43,scale=(1.0d0,0.0d0))
!   original expression: Z49(e1b|m1b)+=H17(e1b,l1b|d1bd2b)*S44(d1bd2b|m1b,l1b)
    ierr=talsh_tensor_contract("Z49(e1,m1)+=H17(e1,l1,d1,d2)*S44(d1,d2,m1,l1)",Z49,H17,S44,scale=(0.5d0,0.0d0))
!   original expression: Z49(e1b|m1b)+=H18(e1b,l1b|m1b,d1b)*S43(d1b|l1b)
    ierr=talsh_tensor_contract("Z49(e1,m1)+=H18(e1,l1,m1,d1)*S43(d1,l1)",Z49,H18,S43,scale=(1.0d0,0.0d0))
    ierr=talsh_tensor_construct(Z60_1, C8, /(nocc,nocc)/, init_val=ZERO)
!   original expression: Z60_1(l1b|m1b)+=H25(l1b,l2b|m1b,d1b)*S43(d1b|l2b)*-1.
    ierr=talsh_tensor_contract("Z60_1(l1,m1)+=H25(l1,l2,m1,d1)*S43(d1,l2)",Z60_1,H25,S43,scale=(-1.0d0,0.0d0))
!   original expression: Z49(e1b|m1b)+=S43(e1b|l1b)*Z60_1(l1b|m1b)
    ierr=talsh_tensor_contract("Z49(e1,m1)+=S43(e1,l1)*Z60_1(l1,m1)",Z49,S43,Z60_1,scale=(1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z60_1)
    ierr=talsh_tensor_construct(Z60_1, C8, /(nocc,nocc)/, init_val=ZERO)
!   original expression: Z49(e1b|m1b)+=S43(e1b|l1b)*Z60_1(l1b|m1b)
    ierr=talsh_tensor_contract("Z49(e1,m1)+=S43(e1,l1)*Z60_1(l1,m1)",Z49,S43,Z60_1,scale=(1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z60_1)
    ierr=talsh_tensor_construct(Z61_2, C8, /(nocc,nvir)/, init_val=ZERO)
!   original expression: Z61_2(l1b|d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|l2b)*-1.
    ierr=talsh_tensor_contract("Z61_2(l1,d1)+=H24(l1,l2,d1,d2)*S43(d2,l2)",Z61_2,H24,S43,scale=(-1.0d0,0.0d0))
    ierr=talsh_tensor_construct(Z60_1, C8, /(nocc,nocc)/, init_val=ZERO)
!   original expression: Z60_1(l1b|m1b)+=S43(d1b|m1b)*Z61_2(l1b|d1b)
    ierr=talsh_tensor_contract("Z60_1(l1,m1)+=S43(d1,m1)*Z61_2(l1,d1)",Z60_1,S43,Z61_2,scale=(1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z61_2)
!   original expression: Z49(e1b|m1b)+=S43(e1b|l1b)*Z60_1(l1b|m1b)
    ierr=talsh_tensor_contract("Z49(e1,m1)+=S43(e1,l1)*Z60_1(l1,m1)",Z49,S43,Z60_1,scale=(1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z60_1)
    ierr=talsh_tensor_construct(Z61_2, C8, /(nocc,nvir)/, init_val=ZERO)
    ierr=talsh_tensor_construct(Z60_1, C8, /(nocc,nocc)/, init_val=ZERO)
!   original expression: Z60_1(l1b|m1b)+=S43(d1b|m1b)*Z61_2(l1b|d1b)
    ierr=talsh_tensor_contract("Z60_1(l1,m1)+=S43(d1,m1)*Z61_2(l1,d1)",Z60_1,S43,Z61_2,scale=(1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z61_2)
!   original expression: Z49(e1b|m1b)+=S43(e1b|l1b)*Z60_1(l1b|m1b)
    ierr=talsh_tensor_contract("Z49(e1,m1)+=S43(e1,l1)*Z60_1(l1,m1)",Z49,S43,Z60_1,scale=(1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z60_1)
    ierr=talsh_tensor_construct(Z60_1, C8, /(nocc,nocc)/, init_val=ZERO)
!   original expression: Z60_1(l1b|m1b)+=S43(d1b|m1b)*H15(l1b|d1b)*-1.
    ierr=talsh_tensor_contract("Z60_1(l1,m1)+=S43(d1,m1)*H15(l1,d1)",Z60_1,S43,H15,scale=(-1.0d0,0.0d0))
!   original expression: Z49(e1b|m1b)+=S43(e1b|l1b)*Z60_1(l1b|m1b)
    ierr=talsh_tensor_contract("Z49(e1,m1)+=S43(e1,l1)*Z60_1(l1,m1)",Z49,S43,Z60_1,scale=(1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z60_1)
    ierr=talsh_tensor_construct(Z60_1, C8, /(nocc,nocc)/, init_val=ZERO)
!   original expression: Z60_1(l1b|m1b)+=S44(d1bd2b|m1b,l2b)*H24(l1b,l2b|d1bd2b)*-1.
    ierr=talsh_tensor_contract("Z60_1(l1,m1)+=S44(d1,d2,m1,l2)*H24(l1,l2,d1,d2)",Z60_1,S44,H24,scale=(-0.5d0,0.0d0))
!   original expression: Z49(e1b|m1b)+=S43(e1b|l1b)*Z60_1(l1b|m1b)
    ierr=talsh_tensor_contract("Z49(e1,m1)+=S43(e1,l1)*Z60_1(l1,m1)",Z49,S43,Z60_1,scale=(1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z60_1)
    ierr=talsh_tensor_construct(Z60_1, C8, /(nocc,nocc)/, init_val=ZERO)
!   original expression: Z49(e1b|m1b)+=S43(e1b|l1b)*Z60_1(l1b|m1b)
    ierr=talsh_tensor_contract("Z49(e1,m1)+=S43(e1,l1)*Z60_1(l1,m1)",Z49,S43,Z60_1,scale=(1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z60_1)
!   original expression: Z49(e1b|m1b)+=S43(e1b|l1b)*H16(l1b|m1b)*-1.
    ierr=talsh_tensor_contract("Z49(e1,m1)+=S43(e1,l1)*H16(l1,m1)",Z49,S43,H16,scale=(-1.0d0,0.0d0))
    ierr=talsh_tensor_construct(Z58_1, C8, /(nvir,nvir)/, init_val=ZERO)
!   original expression: Z58_1(e1b|d1b)+=H17(e1b,l1b|d1b,d2b)*S43(d2b|l1b)
    ierr=talsh_tensor_contract("Z58_1(e1,d1)+=H17(e1,l1,d1,d2)*S43(d2,l1)",Z58_1,H17,S43,scale=(1.0d0,0.0d0))
!   original expression: Z49(e1b|m1b)+=S43(d1b|m1b)*Z58_1(e1b|d1b)
    ierr=talsh_tensor_contract("Z49(e1,m1)+=S43(d1,m1)*Z58_1(e1,d1)",Z49,S43,Z58_1,scale=(1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z58_1)
    ierr=talsh_tensor_construct(Z58_1, C8, /(nvir,nvir)/, init_val=ZERO)
!   original expression: Z49(e1b|m1b)+=S43(d1b|m1b)*Z58_1(e1b|d1b)
    ierr=talsh_tensor_contract("Z49(e1,m1)+=S43(d1,m1)*Z58_1(e1,d1)",Z49,S43,Z58_1,scale=(1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z58_1)
    ierr=talsh_tensor_construct(Z83_1, C8, /(nocc,nocc,nocc,nvir)/, init_val=ZERO)
!   original expression: Z83_1(l1bl2b|m1b,d1b)+=H24(l1bl2b|d1b,d2b)*S43(d2b|m1b)
    ierr=talsh_tensor_contract("Z83_1(l1,l2,m1,d1)+=H24(l1,l2,d1,d2)*S43(d2,m1)",Z83_1,H24,S43,scale=(1.0d0,0.0d0))
!   original expression: Z49(e1b|m1b)+=S44(e1b,d1b|l1bl2b)*Z83_1(l1bl2b|m1b,d1b)
    ierr=talsh_tensor_contract("Z49(e1,m1)+=S44(e1,d1,l1,l2)*Z83_1(l1,l2,m1,d1)",Z49,S44,Z83_1,scale=(0.5d0,0.0d0))
    ierr=talsh_tensor_destruct(Z83_1)
!   original expression: Z49(e1b|m1b)+=S44(e1b,d1b|l1bl2b)*H25(l1bl2b|m1b,d1b)*-1.
    ierr=talsh_tensor_contract("Z49(e1,m1)+=S44(e1,d1,l1,l2)*H25(l1,l2,m1,d1)",Z49,S44,H25,scale=(-0.5d0,0.0d0))
    ierr=talsh_tensor_construct(Z61_1, C8, /(nocc,nvir)/, init_val=ZERO)
!   original expression: Z61_1(l1b|d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|l2b)
    ierr=talsh_tensor_contract("Z61_1(l1,d1)+=H24(l1,l2,d1,d2)*S43(d2,l2)",Z61_1,H24,S43,scale=(1.0d0,0.0d0))
!   original expression: Z49(e1b|m1b)+=S44(e1b,d1b|m1b,l1b)*Z61_1(l1b|d1b)
    ierr=talsh_tensor_contract("Z49(e1,m1)+=S44(e1,d1,m1,l1)*Z61_1(l1,d1)",Z49,S44,Z61_1,scale=(1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z61_1)
    ierr=talsh_tensor_construct(Z61_1, C8, /(nocc,nvir)/, init_val=ZERO)
!   original expression: Z49(e1b|m1b)+=S44(e1b,d1b|m1b,l1b)*Z61_1(l1b|d1b)
    ierr=talsh_tensor_contract("Z49(e1,m1)+=S44(e1,d1,m1,l1)*Z61_1(l1,d1)",Z49,S44,Z61_1,scale=(1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z61_1)
!   original expression: Z49(e1b|m1b)+=S44(e1b,d1b|m1b,l1b)*H15(l1b|d1b)
    ierr=talsh_tensor_contract("Z49(e1,m1)+=S44(e1,d1,m1,l1)*H15(l1,d1)",Z49,S44,H15,scale=(1.0d0,0.0d0))
    ierr=talsh_tensor_construct(Z61_1, C8, /(nocc,nvir)/, init_val=ZERO)
!   original expression: Z61_1(l1b|d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|l2b)
    ierr=talsh_tensor_contract("Z61_1(l1,d1)+=H24(l1,l2,d1,d2)*S43(d2,l2)",Z61_1,H24,S43,scale=(1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z61_1)
    ierr=talsh_tensor_construct(Z61_1, C8, /(nocc,nvir)/, init_val=ZERO)
    ierr=talsh_tensor_destruct(Z61_1)
!   original expression: Z50(e1be2b|m1bm2b)+=H5(e1be2b|m1bm2b)
    ierr=talsh_tensor_add("Z50(e1,e2,m1,m2)+=H5(e1,e2,m1,m2)",Z50,H5,scale=(1.0d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=H3(e1be2b|d1bd2b)*S44(d1bd2b|m1bm2b)
    ierr=talsh_tensor_contract("Z50(e1,e2,m1,m2)+=H3(e1,e2,d1,d2)*S44(d1,d2,m1,m2)",Z50,H3,S44,scale=(0.5d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=H19(e1b,l1b|m1bm2b)*S43(e2b|l1b)*-1.
    ierr=talsh_tensor_contract("Z50(e1,e2,m1,m2)+=H19(e1,l1,m1,m2)*S43(e2,l1)",Z50,H19,S43,scale=(-1.0d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=H19(e2b,l1b|m1bm2b)*S43(e1b|l1b)
    ierr=talsh_tensor_contract("Z50(e1,e2,m1,m2)+=H19(e2,l1,m1,m2)*S43(e1,l1)",Z50,H19,S43,scale=(1.0d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=H4(e1be2b|m1b,d1b)*S43(d1b|m2b)
    ierr=talsh_tensor_contract("Z50(e1,e2,m1,m2)+=H4(e1,e2,m1,d1)*S43(d1,m2)",Z50,H4,S43,scale=(1.0d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=H4(e1be2b|m2b,d1b)*S43(d1b|m1b)*-1.
    ierr=talsh_tensor_contract("Z50(e1,e2,m1,m2)+=H4(e1,e2,m2,d1)*S43(d1,m1)",Z50,H4,S43,scale=(-1.0d0,0.0d0))
    ierr=talsh_tensor_construct(Z67_1, C8, /(nvir,nocc,nocc,nocc)/, init_val=ZERO)
!   original expression: Z67_1(e1b,l1b|m1bm2b)+=H17(e1b,l1b|d1bd2b)*S44(d1bd2b|m1bm2b)
    ierr=talsh_tensor_contract("Z67_1(e1,l1,m1,m2)+=H17(e1,l1,d1,d2)*S44(d1,d2,m1,m2)",Z67_1,H17,S44,scale=(0.5d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S43(e1b|l1b)*Z67_1(e2b,l1b|m1bm2b)
    ierr=talsh_tensor_contract("Z50(e1,e2,m1,m2)+=S43(e1,l1)*Z67_1(e2,l1,m1,m2)",Z50,S43,Z67_1,scale=(1.0d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S43(e2b|l1b)*Z67_1(e1b,l1b|m1bm2b)*-1.
    ierr=talsh_tensor_contract("Z50(e1,e2,m1,m2)+=S43(e2,l1)*Z67_1(e1,l1,m1,m2)",Z50,S43,Z67_1,scale=(-1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z67_1)
    ierr=talsh_tensor_construct(Z67_1, C8, /(nvir,nocc,nocc,nocc)/, init_val=ZERO)
!   original expression: Z67_1(e1b,l1b|m1bm2b)+=H26(l1b,l2b|m1bm2b)*S43(e1b|l2b)*0.5
    ierr=talsh_tensor_contract("Z67_1(e1,l1,m1,m2)+=H26(l1,l2,m1,m2)*S43(e1,l2)",Z67_1,H26,S43,scale=(0.5d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S43(e1b|l1b)*Z67_1(e2b,l1b|m1bm2b)
    ierr=talsh_tensor_contract("Z50(e1,e2,m1,m2)+=S43(e1,l1)*Z67_1(e2,l1,m1,m2)",Z50,S43,Z67_1,scale=(1.0d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S43(e2b|l1b)*Z67_1(e1b,l1b|m1bm2b)*-1.
    ierr=talsh_tensor_contract("Z50(e1,e2,m1,m2)+=S43(e2,l1)*Z67_1(e1,l1,m1,m2)",Z50,S43,Z67_1,scale=(-1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z67_1)
    ierr=talsh_tensor_construct(Z67_1, C8, /(nvir,nocc,nocc,nocc)/, init_val=ZERO)
!   original expression: Z67_1(e1b,l1b|m1bm2b)+=H18(e1b,l1b|m1b,d1b)*S43(d1b|m2b)
    ierr=talsh_tensor_contract("Z67_1(e1,l1,m1,m2)+=H18(e1,l1,m1,d1)*S43(d1,m2)",Z67_1,H18,S43,scale=(1.0d0,0.0d0))
!   original expression: Z67_1(e1b,l1b|m1bm2b)+=H18(e1b,l1b|m2b,d1b)*S43(d1b|m1b)*-1.
    ierr=talsh_tensor_contract("Z67_1(e1,l1,m1,m2)+=H18(e1,l1,m2,d1)*S43(d1,m1)",Z67_1,H18,S43,scale=(-1.0d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S43(e1b|l1b)*Z67_1(e2b,l1b|m1bm2b)
    ierr=talsh_tensor_contract("Z50(e1,e2,m1,m2)+=S43(e1,l1)*Z67_1(e2,l1,m1,m2)",Z50,S43,Z67_1,scale=(1.0d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S43(e2b|l1b)*Z67_1(e1b,l1b|m1bm2b)*-1.
    ierr=talsh_tensor_contract("Z50(e1,e2,m1,m2)+=S43(e2,l1)*Z67_1(e1,l1,m1,m2)",Z50,S43,Z67_1,scale=(-1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z67_1)
    ierr=talsh_tensor_construct(Z81_2, C8, /(nocc,nocc,nocc,nocc)/, init_val=ZERO)
!   original expression: Z81_2(l1b,l2b|m1bm2b)+=H24(l1b,l2b|d1bd2b)*S44(d1bd2b|m1bm2b)*0.5
    ierr=talsh_tensor_contract("Z81_2(l1,l2,m1,m2)+=H24(l1,l2,d1,d2)*S44(d1,d2,m1,m2)",Z81_2,H24,S44,scale=(0.25d0,0.0d0))
    ierr=talsh_tensor_construct(Z67_1, C8, /(nvir,nocc,nocc,nocc)/, init_val=ZERO)
!   original expression: Z67_1(e1b,l1b|m1bm2b)+=S43(e1b|l2b)*Z81_2(l1b,l2b|m1bm2b)
    ierr=talsh_tensor_contract("Z67_1(e1,l1,m1,m2)+=S43(e1,l2)*Z81_2(l1,l2,m1,m2)",Z67_1,S43,Z81_2,scale=(1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z81_2)
!   original expression: Z50(e1be2b|m1bm2b)+=S43(e1b|l1b)*Z67_1(e2b,l1b|m1bm2b)
    ierr=talsh_tensor_contract("Z50(e1,e2,m1,m2)+=S43(e1,l1)*Z67_1(e2,l1,m1,m2)",Z50,S43,Z67_1,scale=(1.0d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S43(e2b|l1b)*Z67_1(e1b,l1b|m1bm2b)*-1.
    ierr=talsh_tensor_contract("Z50(e1,e2,m1,m2)+=S43(e2,l1)*Z67_1(e1,l1,m1,m2)",Z50,S43,Z67_1,scale=(-1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z67_1)
    ierr=talsh_tensor_construct(Z81_2, C8, /(nocc,nocc,nocc,nocc)/, init_val=ZERO)
!   original expression: Z81_2(l1b,l2b|m1bm2b)+=H25(l1b,l2b|m1b,d1b)*S43(d1b|m2b)*0.5
    ierr=talsh_tensor_contract("Z81_2(l1,l2,m1,m2)+=H25(l1,l2,m1,d1)*S43(d1,m2)",Z81_2,H25,S43,scale=(0.5d0,0.0d0))
!   original expression: Z81_2(l1b,l2b|m1bm2b)+=H25(l1b,l2b|m2b,d1b)*S43(d1b|m1b)*-0.5
    ierr=talsh_tensor_contract("Z81_2(l1,l2,m1,m2)+=H25(l1,l2,m2,d1)*S43(d1,m1)",Z81_2,H25,S43,scale=(-0.5d0,0.0d0))
    ierr=talsh_tensor_construct(Z67_1, C8, /(nvir,nocc,nocc,nocc)/, init_val=ZERO)
!   original expression: Z67_1(e1b,l1b|m1bm2b)+=S43(e1b|l2b)*Z81_2(l1b,l2b|m1bm2b)
    ierr=talsh_tensor_contract("Z67_1(e1,l1,m1,m2)+=S43(e1,l2)*Z81_2(l1,l2,m1,m2)",Z67_1,S43,Z81_2,scale=(1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z81_2)
!   original expression: Z50(e1be2b|m1bm2b)+=S43(e1b|l1b)*Z67_1(e2b,l1b|m1bm2b)
    ierr=talsh_tensor_contract("Z50(e1,e2,m1,m2)+=S43(e1,l1)*Z67_1(e2,l1,m1,m2)",Z50,S43,Z67_1,scale=(1.0d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S43(e2b|l1b)*Z67_1(e1b,l1b|m1bm2b)*-1.
    ierr=talsh_tensor_contract("Z50(e1,e2,m1,m2)+=S43(e2,l1)*Z67_1(e1,l1,m1,m2)",Z50,S43,Z67_1,scale=(-1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z67_1)
    ierr=talsh_tensor_construct(Z100_3, C8, /(nocc,nocc,nocc,nvir)/, init_val=ZERO)
!   original expression: Z100_3(l1b,l2b|m1b,d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|m1b)*0.25
    ierr=talsh_tensor_contract("Z100_3(l1,l2,m1,d1)+=H24(l1,l2,d1,d2)*S43(d2,m1)",Z100_3,H24,S43,scale=(0.25d0,0.0d0))
    ierr=talsh_tensor_construct(Z81_2, C8, /(nocc,nocc,nocc,nocc)/, init_val=ZERO)
!   original expression: Z81_2(l1b,l2b|m1bm2b)+=S43(d1b|m1b)*Z100_3(l1b,l2b|m2b,d1b)
    ierr=talsh_tensor_contract("Z81_2(l1,l2,m1,m2)+=S43(d1,m1)*Z100_3(l1,l2,m2,d1)",Z81_2,S43,Z100_3,scale=(1.0d0,0.0d0))
!   original expression: Z81_2(l1b,l2b|m1bm2b)+=S43(d1b|m2b)*Z100_3(l1b,l2b|m1b,d1b)*-1.
    ierr=talsh_tensor_contract("Z81_2(l1,l2,m1,m2)+=S43(d1,m2)*Z100_3(l1,l2,m1,d1)",Z81_2,S43,Z100_3,scale=(-1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z100_3)
    ierr=talsh_tensor_construct(Z67_1, C8, /(nvir,nocc,nocc,nocc)/, init_val=ZERO)
!   original expression: Z67_1(e1b,l1b|m1bm2b)+=S43(e1b|l2b)*Z81_2(l1b,l2b|m1bm2b)
    ierr=talsh_tensor_contract("Z67_1(e1,l1,m1,m2)+=S43(e1,l2)*Z81_2(l1,l2,m1,m2)",Z67_1,S43,Z81_2,scale=(1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z81_2)
!   original expression: Z50(e1be2b|m1bm2b)+=S43(e1b|l1b)*Z67_1(e2b,l1b|m1bm2b)
    ierr=talsh_tensor_contract("Z50(e1,e2,m1,m2)+=S43(e1,l1)*Z67_1(e2,l1,m1,m2)",Z50,S43,Z67_1,scale=(1.0d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S43(e2b|l1b)*Z67_1(e1b,l1b|m1bm2b)*-1.
    ierr=talsh_tensor_contract("Z50(e1,e2,m1,m2)+=S43(e2,l1)*Z67_1(e1,l1,m1,m2)",Z50,S43,Z67_1,scale=(-1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z67_1)
    ierr=talsh_tensor_construct(Z90_2, C8, /(nvir,nocc,nocc,nvir)/, init_val=ZERO)
!   original expression: Z90_2(e1b,l1b|m1b,d1b)+=H17(e1b,l1b|d1b,d2b)*S43(d2b|m1b)*0.5
    ierr=talsh_tensor_contract("Z90_2(e1,l1,m1,d1)+=H17(e1,l1,d1,d2)*S43(d2,m1)",Z90_2,H17,S43,scale=(0.5d0,0.0d0))
    ierr=talsh_tensor_construct(Z67_1, C8, /(nvir,nocc,nocc,nocc)/, init_val=ZERO)
!   original expression: Z67_1(e1b,l1b|m1bm2b)+=S43(d1b|m1b)*Z90_2(e1b,l1b|m2b,d1b)
    ierr=talsh_tensor_contract("Z67_1(e1,l1,m1,m2)+=S43(d1,m1)*Z90_2(e1,l1,m2,d1)",Z67_1,S43,Z90_2,scale=(1.0d0,0.0d0))
!   original expression: Z67_1(e1b,l1b|m1bm2b)+=S43(d1b|m2b)*Z90_2(e1b,l1b|m1b,d1b)*-1.
    ierr=talsh_tensor_contract("Z67_1(e1,l1,m1,m2)+=S43(d1,m2)*Z90_2(e1,l1,m1,d1)",Z67_1,S43,Z90_2,scale=(-1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z90_2)
!   original expression: Z50(e1be2b|m1bm2b)+=S43(e1b|l1b)*Z67_1(e2b,l1b|m1bm2b)
    ierr=talsh_tensor_contract("Z50(e1,e2,m1,m2)+=S43(e1,l1)*Z67_1(e2,l1,m1,m2)",Z50,S43,Z67_1,scale=(1.0d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S43(e2b|l1b)*Z67_1(e1b,l1b|m1bm2b)*-1.
    ierr=talsh_tensor_contract("Z50(e1,e2,m1,m2)+=S43(e2,l1)*Z67_1(e1,l1,m1,m2)",Z50,S43,Z67_1,scale=(-1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z67_1)
    ierr=talsh_tensor_construct(Z61_2, C8, /(nocc,nvir)/, init_val=ZERO)
!   original expression: Z61_2(l1b|d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|l2b)
    ierr=talsh_tensor_contract("Z61_2(l1,d1)+=H24(l1,l2,d1,d2)*S43(d2,l2)",Z61_2,H24,S43,scale=(1.0d0,0.0d0))
    ierr=talsh_tensor_construct(Z67_1, C8, /(nvir,nocc,nocc,nocc)/, init_val=ZERO)
!   original expression: Z67_1(e1b,l1b|m1bm2b)+=S44(e1b,d1b|m1bm2b)*Z61_2(l1b|d1b)
    ierr=talsh_tensor_contract("Z67_1(e1,l1,m1,m2)+=S44(e1,d1,m1,m2)*Z61_2(l1,d1)",Z67_1,S44,Z61_2,scale=(1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z61_2)
!   original expression: Z50(e1be2b|m1bm2b)+=S43(e1b|l1b)*Z67_1(e2b,l1b|m1bm2b)
    ierr=talsh_tensor_contract("Z50(e1,e2,m1,m2)+=S43(e1,l1)*Z67_1(e2,l1,m1,m2)",Z50,S43,Z67_1,scale=(1.0d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S43(e2b|l1b)*Z67_1(e1b,l1b|m1bm2b)*-1.
    ierr=talsh_tensor_contract("Z50(e1,e2,m1,m2)+=S43(e2,l1)*Z67_1(e1,l1,m1,m2)",Z50,S43,Z67_1,scale=(-1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z67_1)
    ierr=talsh_tensor_construct(Z61_2, C8, /(nocc,nvir)/, init_val=ZERO)
    ierr=talsh_tensor_construct(Z67_1, C8, /(nvir,nocc,nocc,nocc)/, init_val=ZERO)
!   original expression: Z67_1(e1b,l1b|m1bm2b)+=S44(e1b,d1b|m1bm2b)*Z61_2(l1b|d1b)
    ierr=talsh_tensor_contract("Z67_1(e1,l1,m1,m2)+=S44(e1,d1,m1,m2)*Z61_2(l1,d1)",Z67_1,S44,Z61_2,scale=(1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z61_2)
!   original expression: Z50(e1be2b|m1bm2b)+=S43(e1b|l1b)*Z67_1(e2b,l1b|m1bm2b)
    ierr=talsh_tensor_contract("Z50(e1,e2,m1,m2)+=S43(e1,l1)*Z67_1(e2,l1,m1,m2)",Z50,S43,Z67_1,scale=(1.0d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S43(e2b|l1b)*Z67_1(e1b,l1b|m1bm2b)*-1.
    ierr=talsh_tensor_contract("Z50(e1,e2,m1,m2)+=S43(e2,l1)*Z67_1(e1,l1,m1,m2)",Z50,S43,Z67_1,scale=(-1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z67_1)
    ierr=talsh_tensor_construct(Z67_1, C8, /(nvir,nocc,nocc,nocc)/, init_val=ZERO)
!   original expression: Z67_1(e1b,l1b|m1bm2b)+=S44(e1b,d1b|m1bm2b)*H15(l1b|d1b)
    ierr=talsh_tensor_contract("Z67_1(e1,l1,m1,m2)+=S44(e1,d1,m1,m2)*H15(l1,d1)",Z67_1,S44,H15,scale=(1.0d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S43(e1b|l1b)*Z67_1(e2b,l1b|m1bm2b)
    ierr=talsh_tensor_contract("Z50(e1,e2,m1,m2)+=S43(e1,l1)*Z67_1(e2,l1,m1,m2)",Z50,S43,Z67_1,scale=(1.0d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S43(e2b|l1b)*Z67_1(e1b,l1b|m1bm2b)*-1.
    ierr=talsh_tensor_contract("Z50(e1,e2,m1,m2)+=S43(e2,l1)*Z67_1(e1,l1,m1,m2)",Z50,S43,Z67_1,scale=(-1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z67_1)
    ierr=talsh_tensor_construct(Z100_2, C8, /(nocc,nocc,nocc,nvir)/, init_val=ZERO)
!   original expression: Z100_2(l1b,l2b|m1b,d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|m1b)*-1.
    ierr=talsh_tensor_contract("Z100_2(l1,l2,m1,d1)+=H24(l1,l2,d1,d2)*S43(d2,m1)",Z100_2,H24,S43,scale=(-1.0d0,0.0d0))
    ierr=talsh_tensor_construct(Z67_1, C8, /(nvir,nocc,nocc,nocc)/, init_val=ZERO)
!   original expression: Z67_1(e1b,l1b|m1bm2b)+=S44(e1b,d1b|m1b,l2b)*Z100_2(l1b,l2b|m2b,d1b)
    ierr=talsh_tensor_contract("Z67_1(e1,l1,m1,m2)+=S44(e1,d1,m1,l2)*Z100_2(l1,l2,m2,d1)",Z67_1,S44,Z100_2,scale=(1.0d0,0.0d0))
!   original expression: Z67_1(e1b,l1b|m1bm2b)+=S44(e1b,d1b|m2b,l2b)*Z100_2(l1b,l2b|m1b,d1b)*-1.
    ierr=talsh_tensor_contract("Z67_1(e1,l1,m1,m2)+=S44(e1,d1,m2,l2)*Z100_2(l1,l2,m1,d1)",Z67_1,S44,Z100_2,scale=(-1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z100_2)
!   original expression: Z50(e1be2b|m1bm2b)+=S43(e1b|l1b)*Z67_1(e2b,l1b|m1bm2b)
    ierr=talsh_tensor_contract("Z50(e1,e2,m1,m2)+=S43(e1,l1)*Z67_1(e2,l1,m1,m2)",Z50,S43,Z67_1,scale=(1.0d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S43(e2b|l1b)*Z67_1(e1b,l1b|m1bm2b)*-1.
    ierr=talsh_tensor_contract("Z50(e1,e2,m1,m2)+=S43(e2,l1)*Z67_1(e1,l1,m1,m2)",Z50,S43,Z67_1,scale=(-1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z67_1)
    ierr=talsh_tensor_construct(Z67_1, C8, /(nvir,nocc,nocc,nocc)/, init_val=ZERO)
!   original expression: Z67_1(e1b,l1b|m1bm2b)+=S44(e1b,d1b|m1b,l2b)*H25(l1b,l2b|m2b,d1b)
    ierr=talsh_tensor_contract("Z67_1(e1,l1,m1,m2)+=S44(e1,d1,m1,l2)*H25(l1,l2,m2,d1)",Z67_1,S44,H25,scale=(1.0d0,0.0d0))
!   original expression: Z67_1(e1b,l1b|m1bm2b)+=S44(e1b,d1b|m2b,l2b)*H25(l1b,l2b|m1b,d1b)*-1.
    ierr=talsh_tensor_contract("Z67_1(e1,l1,m1,m2)+=S44(e1,d1,m2,l2)*H25(l1,l2,m1,d1)",Z67_1,S44,H25,scale=(-1.0d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S43(e1b|l1b)*Z67_1(e2b,l1b|m1bm2b)
    ierr=talsh_tensor_contract("Z50(e1,e2,m1,m2)+=S43(e1,l1)*Z67_1(e2,l1,m1,m2)",Z50,S43,Z67_1,scale=(1.0d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S43(e2b|l1b)*Z67_1(e1b,l1b|m1bm2b)*-1.
    ierr=talsh_tensor_contract("Z50(e1,e2,m1,m2)+=S43(e2,l1)*Z67_1(e1,l1,m1,m2)",Z50,S43,Z67_1,scale=(-1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z67_1)
    ierr=talsh_tensor_construct(Z67_1, C8, /(nvir,nocc,nocc,nocc)/, init_val=ZERO)
!   original expression: Z50(e1be2b|m1bm2b)+=S43(e1b|l1b)*Z67_1(e2b,l1b|m1bm2b)
    ierr=talsh_tensor_contract("Z50(e1,e2,m1,m2)+=S43(e1,l1)*Z67_1(e2,l1,m1,m2)",Z50,S43,Z67_1,scale=(1.0d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S43(e2b|l1b)*Z67_1(e1b,l1b|m1bm2b)*-1.
    ierr=talsh_tensor_contract("Z50(e1,e2,m1,m2)+=S43(e2,l1)*Z67_1(e1,l1,m1,m2)",Z50,S43,Z67_1,scale=(-1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z67_1)
    ierr=talsh_tensor_construct(Z67_1, C8, /(nvir,nocc,nocc,nocc)/, init_val=ZERO)
!   original expression: Z50(e1be2b|m1bm2b)+=S43(e1b|l1b)*Z67_1(e2b,l1b|m1bm2b)
    ierr=talsh_tensor_contract("Z50(e1,e2,m1,m2)+=S43(e1,l1)*Z67_1(e2,l1,m1,m2)",Z50,S43,Z67_1,scale=(1.0d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S43(e2b|l1b)*Z67_1(e1b,l1b|m1bm2b)*-1.
    ierr=talsh_tensor_contract("Z50(e1,e2,m1,m2)+=S43(e2,l1)*Z67_1(e1,l1,m1,m2)",Z50,S43,Z67_1,scale=(-1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z67_1)
    ierr=talsh_tensor_construct(Z71_1, C8, /(nvir,nvir,nocc,nvir)/, init_val=ZERO)
!   original expression: Z71_1(e1be2b|m1b,d1b)+=H3(e1be2b|d1b,d2b)*S43(d2b|m1b)*0.5
    ierr=talsh_tensor_contract("Z71_1(e1,e2,m1,d1)+=H3(e1,e2,d1,d2)*S43(d2,m1)",Z71_1,H3,S43,scale=(0.5d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S43(d1b|m1b)*Z71_1(e1be2b|m2b,d1b)
    ierr=talsh_tensor_contract("Z50(e1,e2,m1,m2)+=S43(d1,m1)*Z71_1(e1,e2,m2,d1)",Z50,S43,Z71_1,scale=(1.0d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S43(d1b|m2b)*Z71_1(e1be2b|m1b,d1b)*-1.
    ierr=talsh_tensor_contract("Z50(e1,e2,m1,m2)+=S43(d1,m2)*Z71_1(e1,e2,m1,d1)",Z50,S43,Z71_1,scale=(-1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z71_1)
    ierr=talsh_tensor_construct(Z62_1, C8, /(nocc,nocc,nocc,nocc)/, init_val=ZERO)
!   original expression: Z62_1(l1bl2b|m1bm2b)+=H25(l1bl2b|m1b,d1b)*S43(d1b|m2b)
    ierr=talsh_tensor_contract("Z62_1(l1,l2,m1,m2)+=H25(l1,l2,m1,d1)*S43(d1,m2)",Z62_1,H25,S43,scale=(1.0d0,0.0d0))
!   original expression: Z62_1(l1bl2b|m1bm2b)+=H25(l1bl2b|m2b,d1b)*S43(d1b|m1b)*-1.
    ierr=talsh_tensor_contract("Z62_1(l1,l2,m1,m2)+=H25(l1,l2,m2,d1)*S43(d1,m1)",Z62_1,H25,S43,scale=(-1.0d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S44(e1be2b|l1bl2b)*Z62_1(l1bl2b|m1bm2b)
    ierr=talsh_tensor_contract("Z50(e1,e2,m1,m2)+=S44(e1,e2,l1,l2)*Z62_1(l1,l2,m1,m2)",Z50,S44,Z62_1,scale=(0.5d0,0.0d0))
    ierr=talsh_tensor_destruct(Z62_1)
    ierr=talsh_tensor_construct(Z83_2, C8, /(nocc,nocc,nocc,nvir)/, init_val=ZERO)
!   original expression: Z83_2(l1bl2b|m1b,d1b)+=H24(l1bl2b|d1b,d2b)*S43(d2b|m1b)*0.5
    ierr=talsh_tensor_contract("Z83_2(l1,l2,m1,d1)+=H24(l1,l2,d1,d2)*S43(d2,m1)",Z83_2,H24,S43,scale=(0.5d0,0.0d0))
    ierr=talsh_tensor_construct(Z62_1, C8, /(nocc,nocc,nocc,nocc)/, init_val=ZERO)
!   original expression: Z62_1(l1bl2b|m1bm2b)+=S43(d1b|m1b)*Z83_2(l1bl2b|m2b,d1b)
    ierr=talsh_tensor_contract("Z62_1(l1,l2,m1,m2)+=S43(d1,m1)*Z83_2(l1,l2,m2,d1)",Z62_1,S43,Z83_2,scale=(1.0d0,0.0d0))
!   original expression: Z62_1(l1bl2b|m1bm2b)+=S43(d1b|m2b)*Z83_2(l1bl2b|m1b,d1b)*-1.
    ierr=talsh_tensor_contract("Z62_1(l1,l2,m1,m2)+=S43(d1,m2)*Z83_2(l1,l2,m1,d1)",Z62_1,S43,Z83_2,scale=(-1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z83_2)
!   original expression: Z50(e1be2b|m1bm2b)+=S44(e1be2b|l1bl2b)*Z62_1(l1bl2b|m1bm2b)
    ierr=talsh_tensor_contract("Z50(e1,e2,m1,m2)+=S44(e1,e2,l1,l2)*Z62_1(l1,l2,m1,m2)",Z50,S44,Z62_1,scale=(0.5d0,0.0d0))
    ierr=talsh_tensor_destruct(Z62_1)
    ierr=talsh_tensor_construct(Z62_1, C8, /(nocc,nocc,nocc,nocc)/, init_val=ZERO)
!   original expression: Z62_1(l1bl2b|m1bm2b)+=S44(d1bd2b|m1bm2b)*H24(l1bl2b|d1bd2b)
    ierr=talsh_tensor_contract("Z62_1(l1,l2,m1,m2)+=S44(d1,d2,m1,m2)*H24(l1,l2,d1,d2)",Z62_1,S44,H24,scale=(0.5d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S44(e1be2b|l1bl2b)*Z62_1(l1bl2b|m1bm2b)
    ierr=talsh_tensor_contract("Z50(e1,e2,m1,m2)+=S44(e1,e2,l1,l2)*Z62_1(l1,l2,m1,m2)",Z50,S44,Z62_1,scale=(0.5d0,0.0d0))
    ierr=talsh_tensor_destruct(Z62_1)
!   original expression: Z50(e1be2b|m1bm2b)+=S44(e1be2b|l1bl2b)*H26(l1bl2b|m1bm2b)
    ierr=talsh_tensor_contract("Z50(e1,e2,m1,m2)+=S44(e1,e2,l1,l2)*H26(l1,l2,m1,m2)",Z50,S44,H26,scale=(0.5d0,0.0d0))
    ierr=talsh_tensor_construct(Z58_1, C8, /(nvir,nvir)/, init_val=ZERO)
!   original expression: Z58_1(e1b|d1b)+=H17(e1b,l1b|d1b,d2b)*S43(d2b|l1b)
    ierr=talsh_tensor_contract("Z58_1(e1,d1)+=H17(e1,l1,d1,d2)*S43(d2,l1)",Z58_1,H17,S43,scale=(1.0d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S44(e1b,d1b|m1bm2b)*Z58_1(e2b|d1b)
    ierr=talsh_tensor_contract("Z50(e1,e2,m1,m2)+=S44(e1,d1,m1,m2)*Z58_1(e2,d1)",Z50,S44,Z58_1,scale=(1.0d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S44(e2b,d1b|m1bm2b)*Z58_1(e1b|d1b)*-1.
    ierr=talsh_tensor_contract("Z50(e1,e2,m1,m2)+=S44(e2,d1,m1,m2)*Z58_1(e1,d1)",Z50,S44,Z58_1,scale=(-1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z58_1)
    ierr=talsh_tensor_construct(Z58_1, C8, /(nvir,nvir)/, init_val=ZERO)
!   original expression: Z50(e1be2b|m1bm2b)+=S44(e1b,d1b|m1bm2b)*Z58_1(e2b|d1b)
    ierr=talsh_tensor_contract("Z50(e1,e2,m1,m2)+=S44(e1,d1,m1,m2)*Z58_1(e2,d1)",Z50,S44,Z58_1,scale=(1.0d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S44(e2b,d1b|m1bm2b)*Z58_1(e1b|d1b)*-1.
    ierr=talsh_tensor_contract("Z50(e1,e2,m1,m2)+=S44(e2,d1,m1,m2)*Z58_1(e1,d1)",Z50,S44,Z58_1,scale=(-1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z58_1)
    ierr=talsh_tensor_construct(Z58_1, C8, /(nvir,nvir)/, init_val=ZERO)
!   original expression: Z58_1(e1b|d1b)+=S44(e1b,d2b|l1bl2b)*H24(l1bl2b|d1b,d2b)*-1.
    ierr=talsh_tensor_contract("Z58_1(e1,d1)+=S44(e1,d2,l1,l2)*H24(l1,l2,d1,d2)",Z58_1,S44,H24,scale=(-0.5d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S44(e1b,d1b|m1bm2b)*Z58_1(e2b|d1b)
    ierr=talsh_tensor_contract("Z50(e1,e2,m1,m2)+=S44(e1,d1,m1,m2)*Z58_1(e2,d1)",Z50,S44,Z58_1,scale=(1.0d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S44(e2b,d1b|m1bm2b)*Z58_1(e1b|d1b)*-1.
    ierr=talsh_tensor_contract("Z50(e1,e2,m1,m2)+=S44(e2,d1,m1,m2)*Z58_1(e1,d1)",Z50,S44,Z58_1,scale=(-1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z58_1)
    ierr=talsh_tensor_construct(Z58_1, C8, /(nvir,nvir)/, init_val=ZERO)
!   original expression: Z50(e1be2b|m1bm2b)+=S44(e1b,d1b|m1bm2b)*Z58_1(e2b|d1b)
    ierr=talsh_tensor_contract("Z50(e1,e2,m1,m2)+=S44(e1,d1,m1,m2)*Z58_1(e2,d1)",Z50,S44,Z58_1,scale=(1.0d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S44(e2b,d1b|m1bm2b)*Z58_1(e1b|d1b)*-1.
    ierr=talsh_tensor_contract("Z50(e1,e2,m1,m2)+=S44(e2,d1,m1,m2)*Z58_1(e1,d1)",Z50,S44,Z58_1,scale=(-1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z58_1)
!   original expression: Z50(e1be2b|m1bm2b)+=S44(e1b,d1b|m1bm2b)*H1(e2b|d1b)
    ierr=talsh_tensor_contract("Z50(e1,e2,m1,m2)+=S44(e1,d1,m1,m2)*H1(e2,d1)",Z50,S44,H1,scale=(1.0d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S44(e2b,d1b|m1bm2b)*H1(e1b|d1b)*-1.
    ierr=talsh_tensor_contract("Z50(e1,e2,m1,m2)+=S44(e2,d1,m1,m2)*H1(e1,d1)",Z50,S44,H1,scale=(-1.0d0,0.0d0))
    ierr=talsh_tensor_construct(Z60_1, C8, /(nocc,nocc)/, init_val=ZERO)
!   original expression: Z60_1(l1b|m1b)+=H25(l1b,l2b|m1b,d1b)*S43(d1b|l2b)*-1.
    ierr=talsh_tensor_contract("Z60_1(l1,m1)+=H25(l1,l2,m1,d1)*S43(d1,l2)",Z60_1,H25,S43,scale=(-1.0d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S44(e1be2b|m1b,l1b)*Z60_1(l1b|m2b)
    ierr=talsh_tensor_contract("Z50(e1,e2,m1,m2)+=S44(e1,e2,m1,l1)*Z60_1(l1,m2)",Z50,S44,Z60_1,scale=(1.0d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S44(e1be2b|m2b,l1b)*Z60_1(l1b|m1b)*-1.
    ierr=talsh_tensor_contract("Z50(e1,e2,m1,m2)+=S44(e1,e2,m2,l1)*Z60_1(l1,m1)",Z50,S44,Z60_1,scale=(-1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z60_1)
    ierr=talsh_tensor_construct(Z60_1, C8, /(nocc,nocc)/, init_val=ZERO)
!   original expression: Z50(e1be2b|m1bm2b)+=S44(e1be2b|m1b,l1b)*Z60_1(l1b|m2b)
    ierr=talsh_tensor_contract("Z50(e1,e2,m1,m2)+=S44(e1,e2,m1,l1)*Z60_1(l1,m2)",Z50,S44,Z60_1,scale=(1.0d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S44(e1be2b|m2b,l1b)*Z60_1(l1b|m1b)*-1.
    ierr=talsh_tensor_contract("Z50(e1,e2,m1,m2)+=S44(e1,e2,m2,l1)*Z60_1(l1,m1)",Z50,S44,Z60_1,scale=(-1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z60_1)
    ierr=talsh_tensor_construct(Z61_2, C8, /(nocc,nvir)/, init_val=ZERO)
!   original expression: Z61_2(l1b|d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|l2b)*-1.
    ierr=talsh_tensor_contract("Z61_2(l1,d1)+=H24(l1,l2,d1,d2)*S43(d2,l2)",Z61_2,H24,S43,scale=(-1.0d0,0.0d0))
    ierr=talsh_tensor_construct(Z60_1, C8, /(nocc,nocc)/, init_val=ZERO)
!   original expression: Z60_1(l1b|m1b)+=S43(d1b|m1b)*Z61_2(l1b|d1b)
    ierr=talsh_tensor_contract("Z60_1(l1,m1)+=S43(d1,m1)*Z61_2(l1,d1)",Z60_1,S43,Z61_2,scale=(1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z61_2)
!   original expression: Z50(e1be2b|m1bm2b)+=S44(e1be2b|m1b,l1b)*Z60_1(l1b|m2b)
    ierr=talsh_tensor_contract("Z50(e1,e2,m1,m2)+=S44(e1,e2,m1,l1)*Z60_1(l1,m2)",Z50,S44,Z60_1,scale=(1.0d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S44(e1be2b|m2b,l1b)*Z60_1(l1b|m1b)*-1.
    ierr=talsh_tensor_contract("Z50(e1,e2,m1,m2)+=S44(e1,e2,m2,l1)*Z60_1(l1,m1)",Z50,S44,Z60_1,scale=(-1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z60_1)
    ierr=talsh_tensor_construct(Z61_2, C8, /(nocc,nvir)/, init_val=ZERO)
    ierr=talsh_tensor_construct(Z60_1, C8, /(nocc,nocc)/, init_val=ZERO)
!   original expression: Z60_1(l1b|m1b)+=S43(d1b|m1b)*Z61_2(l1b|d1b)
    ierr=talsh_tensor_contract("Z60_1(l1,m1)+=S43(d1,m1)*Z61_2(l1,d1)",Z60_1,S43,Z61_2,scale=(1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z61_2)
!   original expression: Z50(e1be2b|m1bm2b)+=S44(e1be2b|m1b,l1b)*Z60_1(l1b|m2b)
    ierr=talsh_tensor_contract("Z50(e1,e2,m1,m2)+=S44(e1,e2,m1,l1)*Z60_1(l1,m2)",Z50,S44,Z60_1,scale=(1.0d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S44(e1be2b|m2b,l1b)*Z60_1(l1b|m1b)*-1.
    ierr=talsh_tensor_contract("Z50(e1,e2,m1,m2)+=S44(e1,e2,m2,l1)*Z60_1(l1,m1)",Z50,S44,Z60_1,scale=(-1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z60_1)
    ierr=talsh_tensor_construct(Z60_1, C8, /(nocc,nocc)/, init_val=ZERO)
!   original expression: Z60_1(l1b|m1b)+=S43(d1b|m1b)*H15(l1b|d1b)*-1.
    ierr=talsh_tensor_contract("Z60_1(l1,m1)+=S43(d1,m1)*H15(l1,d1)",Z60_1,S43,H15,scale=(-1.0d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S44(e1be2b|m1b,l1b)*Z60_1(l1b|m2b)
    ierr=talsh_tensor_contract("Z50(e1,e2,m1,m2)+=S44(e1,e2,m1,l1)*Z60_1(l1,m2)",Z50,S44,Z60_1,scale=(1.0d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S44(e1be2b|m2b,l1b)*Z60_1(l1b|m1b)*-1.
    ierr=talsh_tensor_contract("Z50(e1,e2,m1,m2)+=S44(e1,e2,m2,l1)*Z60_1(l1,m1)",Z50,S44,Z60_1,scale=(-1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z60_1)
    ierr=talsh_tensor_construct(Z60_1, C8, /(nocc,nocc)/, init_val=ZERO)
!   original expression: Z60_1(l1b|m1b)+=S44(d1bd2b|m1b,l2b)*H24(l1b,l2b|d1bd2b)*-1.
    ierr=talsh_tensor_contract("Z60_1(l1,m1)+=S44(d1,d2,m1,l2)*H24(l1,l2,d1,d2)",Z60_1,S44,H24,scale=(-0.5d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S44(e1be2b|m1b,l1b)*Z60_1(l1b|m2b)
    ierr=talsh_tensor_contract("Z50(e1,e2,m1,m2)+=S44(e1,e2,m1,l1)*Z60_1(l1,m2)",Z50,S44,Z60_1,scale=(1.0d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S44(e1be2b|m2b,l1b)*Z60_1(l1b|m1b)*-1.
    ierr=talsh_tensor_contract("Z50(e1,e2,m1,m2)+=S44(e1,e2,m2,l1)*Z60_1(l1,m1)",Z50,S44,Z60_1,scale=(-1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z60_1)
    ierr=talsh_tensor_construct(Z60_1, C8, /(nocc,nocc)/, init_val=ZERO)
!   original expression: Z50(e1be2b|m1bm2b)+=S44(e1be2b|m1b,l1b)*Z60_1(l1b|m2b)
    ierr=talsh_tensor_contract("Z50(e1,e2,m1,m2)+=S44(e1,e2,m1,l1)*Z60_1(l1,m2)",Z50,S44,Z60_1,scale=(1.0d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S44(e1be2b|m2b,l1b)*Z60_1(l1b|m1b)*-1.
    ierr=talsh_tensor_contract("Z50(e1,e2,m1,m2)+=S44(e1,e2,m2,l1)*Z60_1(l1,m1)",Z50,S44,Z60_1,scale=(-1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z60_1)
!   original expression: Z50(e1be2b|m1bm2b)+=S44(e1be2b|m1b,l1b)*H16(l1b|m2b)*-1.
    ierr=talsh_tensor_contract("Z50(e1,e2,m1,m2)+=S44(e1,e2,m1,l1)*H16(l1,m2)",Z50,S44,H16,scale=(-1.0d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S44(e1be2b|m2b,l1b)*H16(l1b|m1b)
    ierr=talsh_tensor_contract("Z50(e1,e2,m1,m2)+=S44(e1,e2,m2,l1)*H16(l1,m1)",Z50,S44,H16,scale=(1.0d0,0.0d0))
    ierr=talsh_tensor_construct(Z90_1, C8, /(nvir,nocc,nocc,nvir)/, init_val=ZERO)
!   original expression: Z90_1(e1b,l1b|m1b,d1b)+=H17(e1b,l1b|d1b,d2b)*S43(d2b|m1b)*-1.
    ierr=talsh_tensor_contract("Z90_1(e1,l1,m1,d1)+=H17(e1,l1,d1,d2)*S43(d2,m1)",Z90_1,H17,S43,scale=(-1.0d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S44(e1b,d1b|m1b,l1b)*Z90_1(e2b,l1b|m2b,d1b)
    ierr=talsh_tensor_contract("Z50(e1,e2,m1,m2)+=S44(e1,d1,m1,l1)*Z90_1(e2,l1,m2,d1)",Z50,S44,Z90_1,scale=(1.0d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S44(e2b,d1b|m1b,l1b)*Z90_1(e1b,l1b|m2b,d1b)*-1.
    ierr=talsh_tensor_contract("Z50(e1,e2,m1,m2)+=S44(e2,d1,m1,l1)*Z90_1(e1,l1,m2,d1)",Z50,S44,Z90_1,scale=(-1.0d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S44(e1b,d1b|m2b,l1b)*Z90_1(e2b,l1b|m1b,d1b)*-1.
    ierr=talsh_tensor_contract("Z50(e1,e2,m1,m2)+=S44(e1,d1,m2,l1)*Z90_1(e2,l1,m1,d1)",Z50,S44,Z90_1,scale=(-1.0d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S44(e2b,d1b|m2b,l1b)*Z90_1(e1b,l1b|m1b,d1b)
    ierr=talsh_tensor_contract("Z50(e1,e2,m1,m2)+=S44(e2,d1,m2,l1)*Z90_1(e1,l1,m1,d1)",Z50,S44,Z90_1,scale=(1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z90_1)
    ierr=talsh_tensor_construct(Z90_1, C8, /(nvir,nocc,nocc,nvir)/, init_val=ZERO)
!   original expression: Z90_1(e1b,l1b|m1b,d1b)+=S44(e1b,d2b|m1b,l2b)*H24(l1b,l2b|d1b,d2b)*0.5
    ierr=talsh_tensor_contract("Z90_1(e1,l1,m1,d1)+=S44(e1,d2,m1,l2)*H24(l1,l2,d1,d2)",Z90_1,S44,H24,scale=(0.5d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S44(e1b,d1b|m1b,l1b)*Z90_1(e2b,l1b|m2b,d1b)
    ierr=talsh_tensor_contract("Z50(e1,e2,m1,m2)+=S44(e1,d1,m1,l1)*Z90_1(e2,l1,m2,d1)",Z50,S44,Z90_1,scale=(1.0d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S44(e2b,d1b|m1b,l1b)*Z90_1(e1b,l1b|m2b,d1b)*-1.
    ierr=talsh_tensor_contract("Z50(e1,e2,m1,m2)+=S44(e2,d1,m1,l1)*Z90_1(e1,l1,m2,d1)",Z50,S44,Z90_1,scale=(-1.0d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S44(e1b,d1b|m2b,l1b)*Z90_1(e2b,l1b|m1b,d1b)*-1.
    ierr=talsh_tensor_contract("Z50(e1,e2,m1,m2)+=S44(e1,d1,m2,l1)*Z90_1(e2,l1,m1,d1)",Z50,S44,Z90_1,scale=(-1.0d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S44(e2b,d1b|m2b,l1b)*Z90_1(e1b,l1b|m1b,d1b)
    ierr=talsh_tensor_contract("Z50(e1,e2,m1,m2)+=S44(e2,d1,m2,l1)*Z90_1(e1,l1,m1,d1)",Z50,S44,Z90_1,scale=(1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z90_1)
!   original expression: Z50(e1be2b|m1bm2b)+=S44(e1b,d1b|m1b,l1b)*H18(e2b,l1b|m2b,d1b)
    ierr=talsh_tensor_contract("Z50(e1,e2,m1,m2)+=S44(e1,d1,m1,l1)*H18(e2,l1,m2,d1)",Z50,S44,H18,scale=(1.0d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S44(e2b,d1b|m1b,l1b)*H18(e1b,l1b|m2b,d1b)*-1.
    ierr=talsh_tensor_contract("Z50(e1,e2,m1,m2)+=S44(e2,d1,m1,l1)*H18(e1,l1,m2,d1)",Z50,S44,H18,scale=(-1.0d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S44(e1b,d1b|m2b,l1b)*H18(e2b,l1b|m1b,d1b)*-1.
    ierr=talsh_tensor_contract("Z50(e1,e2,m1,m2)+=S44(e1,d1,m2,l1)*H18(e2,l1,m1,d1)",Z50,S44,H18,scale=(-1.0d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S44(e2b,d1b|m2b,l1b)*H18(e1b,l1b|m1b,d1b)
    ierr=talsh_tensor_contract("Z50(e1,e2,m1,m2)+=S44(e2,d1,m2,l1)*H18(e1,l1,m1,d1)",Z50,S44,H18,scale=(1.0d0,0.0d0))
    ierr=talsh_tensor_construct(Z61_2, C8, /(nocc,nvir)/, init_val=ZERO)
!   original expression: Z61_2(l1b|d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|l2b)*-1.
    ierr=talsh_tensor_contract("Z61_2(l1,d1)+=H24(l1,l2,d1,d2)*S43(d2,l2)",Z61_2,H24,S43,scale=(-1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z61_2)
    ierr=talsh_tensor_construct(Z61_2, C8, /(nocc,nvir)/, init_val=ZERO)
    ierr=talsh_tensor_destruct(Z61_2)
    ierr=talsh_tensor_construct(Z100_2, C8, /(nocc,nocc,nocc,nvir)/, init_val=ZERO)
!   original expression: Z100_2(l1b,l2b|m1b,d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|m1b)
    ierr=talsh_tensor_contract("Z100_2(l1,l2,m1,d1)+=H24(l1,l2,d1,d2)*S43(d2,m1)",Z100_2,H24,S43,scale=(1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z100_2)
    ierr=talsh_tensor_construct(Z58_1, C8, /(nvir,nvir)/, init_val=ZERO)
!   original expression: Z58_1(e1b|d1b)+=H17(e1b,l1b|d1b,d2b)*S43(d2b|l1b)
    ierr=talsh_tensor_contract("Z58_1(e1,d1)+=H17(e1,l1,d1,d2)*S43(d2,l1)",Z58_1,H17,S43,scale=(1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z58_1)
    ierr=talsh_tensor_construct(Z58_1, C8, /(nvir,nvir)/, init_val=ZERO)
    ierr=talsh_tensor_destruct(Z58_1)
    ierr=talsh_tensor_construct(Z58_1, C8, /(nvir,nvir)/, init_val=ZERO)
!   original expression: Z58_1(e1b|d1b)+=S44(e1b,d2b|l1bl2b)*H24(l1bl2b|d1b,d2b)*-1.
    ierr=talsh_tensor_contract("Z58_1(e1,d1)+=S44(e1,d2,l1,l2)*H24(l1,l2,d1,d2)",Z58_1,S44,H24,scale=(-0.5d0,0.0d0))
    ierr=talsh_tensor_destruct(Z58_1)
    ierr=talsh_tensor_construct(Z58_1, C8, /(nvir,nvir)/, init_val=ZERO)
    ierr=talsh_tensor_destruct(Z58_1)
    ierr=talsh_tensor_construct(Z60_1, C8, /(nocc,nocc)/, init_val=ZERO)
!   original expression: Z60_1(l1b|m1b)+=H25(l1b,l2b|m1b,d1b)*S43(d1b|l2b)*-1.
    ierr=talsh_tensor_contract("Z60_1(l1,m1)+=H25(l1,l2,m1,d1)*S43(d1,l2)",Z60_1,H25,S43,scale=(-1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z60_1)
    ierr=talsh_tensor_construct(Z60_1, C8, /(nocc,nocc)/, init_val=ZERO)
    ierr=talsh_tensor_destruct(Z60_1)
    ierr=talsh_tensor_construct(Z61_2, C8, /(nocc,nvir)/, init_val=ZERO)
!   original expression: Z61_2(l1b|d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|l2b)*-1.
    ierr=talsh_tensor_contract("Z61_2(l1,d1)+=H24(l1,l2,d1,d2)*S43(d2,l2)",Z61_2,H24,S43,scale=(-1.0d0,0.0d0))
    ierr=talsh_tensor_construct(Z60_1, C8, /(nocc,nocc)/, init_val=ZERO)
!   original expression: Z60_1(l1b|m1b)+=S43(d1b|m1b)*Z61_2(l1b|d1b)
    ierr=talsh_tensor_contract("Z60_1(l1,m1)+=S43(d1,m1)*Z61_2(l1,d1)",Z60_1,S43,Z61_2,scale=(1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z61_2)
    ierr=talsh_tensor_destruct(Z60_1)
    ierr=talsh_tensor_construct(Z61_2, C8, /(nocc,nvir)/, init_val=ZERO)
    ierr=talsh_tensor_construct(Z60_1, C8, /(nocc,nocc)/, init_val=ZERO)
!   original expression: Z60_1(l1b|m1b)+=S43(d1b|m1b)*Z61_2(l1b|d1b)
    ierr=talsh_tensor_contract("Z60_1(l1,m1)+=S43(d1,m1)*Z61_2(l1,d1)",Z60_1,S43,Z61_2,scale=(1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z61_2)
    ierr=talsh_tensor_destruct(Z60_1)
    ierr=talsh_tensor_construct(Z60_1, C8, /(nocc,nocc)/, init_val=ZERO)
!   original expression: Z60_1(l1b|m1b)+=S43(d1b|m1b)*H15(l1b|d1b)*-1.
    ierr=talsh_tensor_contract("Z60_1(l1,m1)+=S43(d1,m1)*H15(l1,d1)",Z60_1,S43,H15,scale=(-1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z60_1)
    ierr=talsh_tensor_construct(Z60_1, C8, /(nocc,nocc)/, init_val=ZERO)
!   original expression: Z60_1(l1b|m1b)+=S44(d1bd2b|m1b,l2b)*H24(l1b,l2b|d1bd2b)*-1.
    ierr=talsh_tensor_contract("Z60_1(l1,m1)+=S44(d1,d2,m1,l2)*H24(l1,l2,d1,d2)",Z60_1,S44,H24,scale=(-0.5d0,0.0d0))
    ierr=talsh_tensor_destruct(Z60_1)
    ierr=talsh_tensor_construct(Z60_1, C8, /(nocc,nocc)/, init_val=ZERO)
    ierr=talsh_tensor_destruct(Z60_1)
    ierr=talsh_tensor_construct(Z90_1, C8, /(nvir,nocc,nocc,nvir)/, init_val=ZERO)
!   original expression: Z90_1(e1b,l1b|m1b,d1b)+=H17(e1b,l1b|d1b,d2b)*S43(d2b|m1b)*-1.
    ierr=talsh_tensor_contract("Z90_1(e1,l1,m1,d1)+=H17(e1,l1,d1,d2)*S43(d2,m1)",Z90_1,H17,S43,scale=(-1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z90_1)
    ierr=talsh_tensor_construct(Z90_1, C8, /(nvir,nocc,nocc,nvir)/, init_val=ZERO)
!   original expression: Z90_1(e1b,l1b|m1b,d1b)+=S44(e1b,d2b|m1b,l2b)*H24(l1b,l2b|d1b,d2b)
    ierr=talsh_tensor_contract("Z90_1(e1,l1,m1,d1)+=S44(e1,d2,m1,l2)*H24(l1,l2,d1,d2)",Z90_1,S44,H24,scale=(1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z90_1)
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=H4(e1be2b|m1b,d1b)*S44(e3b,d1b|m2bm3b)*-1.
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=H4(e1,e2,m1,d1)*S44(e3,d1,m2,m3)",Z51,H4,S44,scale=(-1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=H4(e1be3b|m1b,d1b)*S44(e2b,d1b|m2bm3b)
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=H4(e1,e3,m1,d1)*S44(e2,d1,m2,m3)",Z51,H4,S44,scale=(1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=H4(e2be3b|m1b,d1b)*S44(e1b,d1b|m2bm3b)*-1.
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=H4(e2,e3,m1,d1)*S44(e1,d1,m2,m3)",Z51,H4,S44,scale=(-1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=H4(e1be2b|m2b,d1b)*S44(e3b,d1b|m1bm3b)
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=H4(e1,e2,m2,d1)*S44(e3,d1,m1,m3)",Z51,H4,S44,scale=(1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=H4(e1be3b|m2b,d1b)*S44(e2b,d1b|m1bm3b)*-1.
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=H4(e1,e3,m2,d1)*S44(e2,d1,m1,m3)",Z51,H4,S44,scale=(-1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=H4(e2be3b|m2b,d1b)*S44(e1b,d1b|m1bm3b)
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=H4(e2,e3,m2,d1)*S44(e1,d1,m1,m3)",Z51,H4,S44,scale=(1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=H4(e1be2b|m3b,d1b)*S44(e3b,d1b|m1bm2b)*-1.
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=H4(e1,e2,m3,d1)*S44(e3,d1,m1,m2)",Z51,H4,S44,scale=(-1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=H4(e1be3b|m3b,d1b)*S44(e2b,d1b|m1bm2b)
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=H4(e1,e3,m3,d1)*S44(e2,d1,m1,m2)",Z51,H4,S44,scale=(1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=H4(e2be3b|m3b,d1b)*S44(e1b,d1b|m1bm2b)*-1.
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=H4(e2,e3,m3,d1)*S44(e1,d1,m1,m2)",Z51,H4,S44,scale=(-1.0d0,0.0d0))
    ierr=talsh_tensor_construct(Z69_1, C8, /(nvir,nvir,nocc,nocc,nocc,nocc)/, init_val=ZERO)
!   original expression: Z69_1(e1be2b,l1b|m1bm2bm3b)+=H18(e1b,l1b|m1b,d1b)*S44(e2b,d1b|m2bm3b)*-1.
    ierr=talsh_tensor_contract("Z69_1(e1,e2,l1,m1,m2,m3)+=H18(e1,l1,m1,d1)*S44(e2,d1,m2,m3)",Z69_1,H18,S44,scale=(-1.0d0,0.0d0))
!   original expression: Z69_1(e1be2b,l1b|m1bm2bm3b)+=H18(e2b,l1b|m1b,d1b)*S44(e1b,d1b|m2bm3b)
    ierr=talsh_tensor_contract("Z69_1(e1,e2,l1,m1,m2,m3)+=H18(e2,l1,m1,d1)*S44(e1,d1,m2,m3)",Z69_1,H18,S44,scale=(1.0d0,0.0d0))
!   original expression: Z69_1(e1be2b,l1b|m1bm2bm3b)+=H18(e1b,l1b|m2b,d1b)*S44(e2b,d1b|m1bm3b)
    ierr=talsh_tensor_contract("Z69_1(e1,e2,l1,m1,m2,m3)+=H18(e1,l1,m2,d1)*S44(e2,d1,m1,m3)",Z69_1,H18,S44,scale=(1.0d0,0.0d0))
!   original expression: Z69_1(e1be2b,l1b|m1bm2bm3b)+=H18(e2b,l1b|m2b,d1b)*S44(e1b,d1b|m1bm3b)*-1.
    ierr=talsh_tensor_contract("Z69_1(e1,e2,l1,m1,m2,m3)+=H18(e2,l1,m2,d1)*S44(e1,d1,m1,m3)",Z69_1,H18,S44,scale=(-1.0d0,0.0d0))
!   original expression: Z69_1(e1be2b,l1b|m1bm2bm3b)+=H18(e1b,l1b|m3b,d1b)*S44(e2b,d1b|m1bm2b)*-1.
    ierr=talsh_tensor_contract("Z69_1(e1,e2,l1,m1,m2,m3)+=H18(e1,l1,m3,d1)*S44(e2,d1,m1,m2)",Z69_1,H18,S44,scale=(-1.0d0,0.0d0))
!   original expression: Z69_1(e1be2b,l1b|m1bm2bm3b)+=H18(e2b,l1b|m3b,d1b)*S44(e1b,d1b|m1bm2b)
    ierr=talsh_tensor_contract("Z69_1(e1,e2,l1,m1,m2,m3)+=H18(e2,l1,m3,d1)*S44(e1,d1,m1,m2)",Z69_1,H18,S44,scale=(1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S43(e1b|l1b)*Z69_1(e2be3b,l1b|m1bm2bm3b)
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S43(e1,l1)*Z69_1(e2,e3,l1,m1,m2,m3)",Z51,S43,Z69_1,scale=(1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S43(e2b|l1b)*Z69_1(e1be3b,l1b|m1bm2bm3b)*-1.
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S43(e2,l1)*Z69_1(e1,e3,l1,m1,m2,m3)",Z51,S43,Z69_1,scale=(-1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S43(e3b|l1b)*Z69_1(e1be2b,l1b|m1bm2bm3b)
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S43(e3,l1)*Z69_1(e1,e2,l1,m1,m2,m3)",Z51,S43,Z69_1,scale=(1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z69_1)
    ierr=talsh_tensor_construct(Z100_3, C8, /(nocc,nocc,nocc,nvir)/, init_val=ZERO)
!   original expression: Z100_3(l1b,l2b|m1b,d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|m1b)*0.5
    ierr=talsh_tensor_contract("Z100_3(l1,l2,m1,d1)+=H24(l1,l2,d1,d2)*S43(d2,m1)",Z100_3,H24,S43,scale=(0.5d0,0.0d0))
    ierr=talsh_tensor_construct(Z88_2, C8, /(nvir,nocc,nocc,nocc,nocc,nocc)/, init_val=ZERO)
!   original expression: Z88_2(e1b,l1b,l2b|m1bm2bm3b)+=S44(e1b,d1b|m1bm2b)*Z100_3(l1b,l2b|m3b,d1b)
    ierr=talsh_tensor_contract("Z88_2(e1,l1,l2,m1,m2,m3)+=S44(e1,d1,m1,m2)*Z100_3(l1,l2,m3,d1)",Z88_2,S44,Z100_3,scale=(1.0d0,0.0d0))
!   original expression: Z88_2(e1b,l1b,l2b|m1bm2bm3b)+=S44(e1b,d1b|m1bm3b)*Z100_3(l1b,l2b|m2b,d1b)*-1.
    ierr=talsh_tensor_contract("Z88_2(e1,l1,l2,m1,m2,m3)+=S44(e1,d1,m1,m3)*Z100_3(l1,l2,m2,d1)",Z88_2,S44,Z100_3,scale=(-1.0d0,0.0d0))
!   original expression: Z88_2(e1b,l1b,l2b|m1bm2bm3b)+=S44(e1b,d1b|m2bm3b)*Z100_3(l1b,l2b|m1b,d1b)
    ierr=talsh_tensor_contract("Z88_2(e1,l1,l2,m1,m2,m3)+=S44(e1,d1,m2,m3)*Z100_3(l1,l2,m1,d1)",Z88_2,S44,Z100_3,scale=(1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z100_3)
    ierr=talsh_tensor_construct(Z69_1, C8, /(nvir,nvir,nocc,nocc,nocc,nocc)/, init_val=ZERO)
!   original expression: Z69_1(e1be2b,l1b|m1bm2bm3b)+=S43(e1b|l2b)*Z88_2(e2b,l1b,l2b|m1bm2bm3b)
    ierr=talsh_tensor_contract("Z69_1(e1,e2,l1,m1,m2,m3)+=S43(e1,l2)*Z88_2(e2,l1,l2,m1,m2,m3)",Z69_1,S43,Z88_2,scale=(1.0d0,0.0d0))
!   original expression: Z69_1(e1be2b,l1b|m1bm2bm3b)+=S43(e2b|l2b)*Z88_2(e1b,l1b,l2b|m1bm2bm3b)*-1.
    ierr=talsh_tensor_contract("Z69_1(e1,e2,l1,m1,m2,m3)+=S43(e2,l2)*Z88_2(e1,l1,l2,m1,m2,m3)",Z69_1,S43,Z88_2,scale=(-1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z88_2)
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S43(e1b|l1b)*Z69_1(e2be3b,l1b|m1bm2bm3b)
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S43(e1,l1)*Z69_1(e2,e3,l1,m1,m2,m3)",Z51,S43,Z69_1,scale=(1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S43(e2b|l1b)*Z69_1(e1be3b,l1b|m1bm2bm3b)*-1.
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S43(e2,l1)*Z69_1(e1,e3,l1,m1,m2,m3)",Z51,S43,Z69_1,scale=(-1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S43(e3b|l1b)*Z69_1(e1be2b,l1b|m1bm2bm3b)
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S43(e3,l1)*Z69_1(e1,e2,l1,m1,m2,m3)",Z51,S43,Z69_1,scale=(1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z69_1)
    ierr=talsh_tensor_construct(Z88_2, C8, /(nvir,nocc,nocc,nocc,nocc,nocc)/, init_val=ZERO)
!   original expression: Z88_2(e1b,l1b,l2b|m1bm2bm3b)+=S44(e1b,d1b|m1bm2b)*H25(l1b,l2b|m3b,d1b)*-0.5
    ierr=talsh_tensor_contract("Z88_2(e1,l1,l2,m1,m2,m3)+=S44(e1,d1,m1,m2)*H25(l1,l2,m3,d1)",Z88_2,S44,H25,scale=(-0.5d0,0.0d0))
!   original expression: Z88_2(e1b,l1b,l2b|m1bm2bm3b)+=S44(e1b,d1b|m1bm3b)*H25(l1b,l2b|m2b,d1b)*+0.5
    ierr=talsh_tensor_contract("Z88_2(e1,l1,l2,m1,m2,m3)+=S44(e1,d1,m1,m3)*H25(l1,l2,m2,d1)",Z88_2,S44,H25,scale=(1.0d0,0.0d0))
!   original expression: Z88_2(e1b,l1b,l2b|m1bm2bm3b)+=S44(e1b,d1b|m2bm3b)*H25(l1b,l2b|m1b,d1b)*+0.5
    ierr=talsh_tensor_contract("Z88_2(e1,l1,l2,m1,m2,m3)+=S44(e1,d1,m2,m3)*H25(l1,l2,m1,d1)",Z88_2,S44,H25,scale=(1.0d0,0.0d0))
    ierr=talsh_tensor_construct(Z69_1, C8, /(nvir,nvir,nocc,nocc,nocc,nocc)/, init_val=ZERO)
!   original expression: Z69_1(e1be2b,l1b|m1bm2bm3b)+=S43(e1b|l2b)*Z88_2(e2b,l1b,l2b|m1bm2bm3b)
    ierr=talsh_tensor_contract("Z69_1(e1,e2,l1,m1,m2,m3)+=S43(e1,l2)*Z88_2(e2,l1,l2,m1,m2,m3)",Z69_1,S43,Z88_2,scale=(1.0d0,0.0d0))
!   original expression: Z69_1(e1be2b,l1b|m1bm2bm3b)+=S43(e2b|l2b)*Z88_2(e1b,l1b,l2b|m1bm2bm3b)*-1.
    ierr=talsh_tensor_contract("Z69_1(e1,e2,l1,m1,m2,m3)+=S43(e2,l2)*Z88_2(e1,l1,l2,m1,m2,m3)",Z69_1,S43,Z88_2,scale=(-1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z88_2)
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S43(e1b|l1b)*Z69_1(e2be3b,l1b|m1bm2bm3b)
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S43(e1,l1)*Z69_1(e2,e3,l1,m1,m2,m3)",Z51,S43,Z69_1,scale=(1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S43(e2b|l1b)*Z69_1(e1be3b,l1b|m1bm2bm3b)*-1.
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S43(e2,l1)*Z69_1(e1,e3,l1,m1,m2,m3)",Z51,S43,Z69_1,scale=(-1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S43(e3b|l1b)*Z69_1(e1be2b,l1b|m1bm2bm3b)
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S43(e3,l1)*Z69_1(e1,e2,l1,m1,m2,m3)",Z51,S43,Z69_1,scale=(1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z69_1)
    ierr=talsh_tensor_construct(Z90_2, C8, /(nvir,nocc,nocc,nvir)/, init_val=ZERO)
!   original expression: Z90_2(e1b,l1b|m1b,d1b)+=H17(e1b,l1b|d1b,d2b)*S43(d2b|m1b)*-1.
    ierr=talsh_tensor_contract("Z90_2(e1,l1,m1,d1)+=H17(e1,l1,d1,d2)*S43(d2,m1)",Z90_2,H17,S43,scale=(-1.0d0,0.0d0))
    ierr=talsh_tensor_construct(Z69_1, C8, /(nvir,nvir,nocc,nocc,nocc,nocc)/, init_val=ZERO)
!   original expression: Z69_1(e1be2b,l1b|m1bm2bm3b)+=S44(e1b,d1b|m1bm2b)*Z90_2(e2b,l1b|m3b,d1b)
    ierr=talsh_tensor_contract("Z69_1(e1,e2,l1,m1,m2,m3)+=S44(e1,d1,m1,m2)*Z90_2(e2,l1,m3,d1)",Z69_1,S44,Z90_2,scale=(1.0d0,0.0d0))
!   original expression: Z69_1(e1be2b,l1b|m1bm2bm3b)+=S44(e2b,d1b|m1bm2b)*Z90_2(e1b,l1b|m3b,d1b)*-1.
    ierr=talsh_tensor_contract("Z69_1(e1,e2,l1,m1,m2,m3)+=S44(e2,d1,m1,m2)*Z90_2(e1,l1,m3,d1)",Z69_1,S44,Z90_2,scale=(-1.0d0,0.0d0))
!   original expression: Z69_1(e1be2b,l1b|m1bm2bm3b)+=S44(e1b,d1b|m1bm3b)*Z90_2(e2b,l1b|m2b,d1b)*-1.
    ierr=talsh_tensor_contract("Z69_1(e1,e2,l1,m1,m2,m3)+=S44(e1,d1,m1,m3)*Z90_2(e2,l1,m2,d1)",Z69_1,S44,Z90_2,scale=(-1.0d0,0.0d0))
!   original expression: Z69_1(e1be2b,l1b|m1bm2bm3b)+=S44(e2b,d1b|m1bm3b)*Z90_2(e1b,l1b|m2b,d1b)
    ierr=talsh_tensor_contract("Z69_1(e1,e2,l1,m1,m2,m3)+=S44(e2,d1,m1,m3)*Z90_2(e1,l1,m2,d1)",Z69_1,S44,Z90_2,scale=(1.0d0,0.0d0))
!   original expression: Z69_1(e1be2b,l1b|m1bm2bm3b)+=S44(e1b,d1b|m2bm3b)*Z90_2(e2b,l1b|m1b,d1b)
    ierr=talsh_tensor_contract("Z69_1(e1,e2,l1,m1,m2,m3)+=S44(e1,d1,m2,m3)*Z90_2(e2,l1,m1,d1)",Z69_1,S44,Z90_2,scale=(1.0d0,0.0d0))
!   original expression: Z69_1(e1be2b,l1b|m1bm2bm3b)+=S44(e2b,d1b|m2bm3b)*Z90_2(e1b,l1b|m1b,d1b)*-1.
    ierr=talsh_tensor_contract("Z69_1(e1,e2,l1,m1,m2,m3)+=S44(e2,d1,m2,m3)*Z90_2(e1,l1,m1,d1)",Z69_1,S44,Z90_2,scale=(-1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z90_2)
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S43(e1b|l1b)*Z69_1(e2be3b,l1b|m1bm2bm3b)
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S43(e1,l1)*Z69_1(e2,e3,l1,m1,m2,m3)",Z51,S43,Z69_1,scale=(1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S43(e2b|l1b)*Z69_1(e1be3b,l1b|m1bm2bm3b)*-1.
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S43(e2,l1)*Z69_1(e1,e3,l1,m1,m2,m3)",Z51,S43,Z69_1,scale=(-1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S43(e3b|l1b)*Z69_1(e1be2b,l1b|m1bm2bm3b)
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S43(e3,l1)*Z69_1(e1,e2,l1,m1,m2,m3)",Z51,S43,Z69_1,scale=(1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z69_1)
    ierr=talsh_tensor_construct(Z90_2, C8, /(nvir,nocc,nocc,nvir)/, init_val=ZERO)
!   original expression: Z90_2(e1b,l1b|m1b,d1b)+=S44(e1b,d2b|m1b,l2b)*H24(l1b,l2b|d1b,d2b)
    ierr=talsh_tensor_contract("Z90_2(e1,l1,m1,d1)+=S44(e1,d2,m1,l2)*H24(l1,l2,d1,d2)",Z90_2,S44,H24,scale=(1.0d0,0.0d0))
    ierr=talsh_tensor_construct(Z69_1, C8, /(nvir,nvir,nocc,nocc,nocc,nocc)/, init_val=ZERO)
!   original expression: Z69_1(e1be2b,l1b|m1bm2bm3b)+=S44(e1b,d1b|m1bm2b)*Z90_2(e2b,l1b|m3b,d1b)
    ierr=talsh_tensor_contract("Z69_1(e1,e2,l1,m1,m2,m3)+=S44(e1,d1,m1,m2)*Z90_2(e2,l1,m3,d1)",Z69_1,S44,Z90_2,scale=(1.0d0,0.0d0))
!   original expression: Z69_1(e1be2b,l1b|m1bm2bm3b)+=S44(e2b,d1b|m1bm2b)*Z90_2(e1b,l1b|m3b,d1b)*-1.
    ierr=talsh_tensor_contract("Z69_1(e1,e2,l1,m1,m2,m3)+=S44(e2,d1,m1,m2)*Z90_2(e1,l1,m3,d1)",Z69_1,S44,Z90_2,scale=(-1.0d0,0.0d0))
!   original expression: Z69_1(e1be2b,l1b|m1bm2bm3b)+=S44(e1b,d1b|m1bm3b)*Z90_2(e2b,l1b|m2b,d1b)*-1.
    ierr=talsh_tensor_contract("Z69_1(e1,e2,l1,m1,m2,m3)+=S44(e1,d1,m1,m3)*Z90_2(e2,l1,m2,d1)",Z69_1,S44,Z90_2,scale=(-1.0d0,0.0d0))
!   original expression: Z69_1(e1be2b,l1b|m1bm2bm3b)+=S44(e2b,d1b|m1bm3b)*Z90_2(e1b,l1b|m2b,d1b)
    ierr=talsh_tensor_contract("Z69_1(e1,e2,l1,m1,m2,m3)+=S44(e2,d1,m1,m3)*Z90_2(e1,l1,m2,d1)",Z69_1,S44,Z90_2,scale=(1.0d0,0.0d0))
!   original expression: Z69_1(e1be2b,l1b|m1bm2bm3b)+=S44(e1b,d1b|m2bm3b)*Z90_2(e2b,l1b|m1b,d1b)
    ierr=talsh_tensor_contract("Z69_1(e1,e2,l1,m1,m2,m3)+=S44(e1,d1,m2,m3)*Z90_2(e2,l1,m1,d1)",Z69_1,S44,Z90_2,scale=(1.0d0,0.0d0))
!   original expression: Z69_1(e1be2b,l1b|m1bm2bm3b)+=S44(e2b,d1b|m2bm3b)*Z90_2(e1b,l1b|m1b,d1b)*-1.
    ierr=talsh_tensor_contract("Z69_1(e1,e2,l1,m1,m2,m3)+=S44(e2,d1,m2,m3)*Z90_2(e1,l1,m1,d1)",Z69_1,S44,Z90_2,scale=(-1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z90_2)
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S43(e1b|l1b)*Z69_1(e2be3b,l1b|m1bm2bm3b)
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S43(e1,l1)*Z69_1(e2,e3,l1,m1,m2,m3)",Z51,S43,Z69_1,scale=(1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S43(e2b|l1b)*Z69_1(e1be3b,l1b|m1bm2bm3b)*-1.
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S43(e2,l1)*Z69_1(e1,e3,l1,m1,m2,m3)",Z51,S43,Z69_1,scale=(-1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S43(e3b|l1b)*Z69_1(e1be2b,l1b|m1bm2bm3b)
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S43(e3,l1)*Z69_1(e1,e2,l1,m1,m2,m3)",Z51,S43,Z69_1,scale=(1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z69_1)
    ierr=talsh_tensor_construct(Z90_2, C8, /(nvir,nocc,nocc,nvir)/, init_val=ZERO)
    ierr=talsh_tensor_construct(Z69_1, C8, /(nvir,nvir,nocc,nocc,nocc,nocc)/, init_val=ZERO)
!   original expression: Z69_1(e1be2b,l1b|m1bm2bm3b)+=S44(e1b,d1b|m1bm2b)*Z90_2(e2b,l1b|m3b,d1b)
    ierr=talsh_tensor_contract("Z69_1(e1,e2,l1,m1,m2,m3)+=S44(e1,d1,m1,m2)*Z90_2(e2,l1,m3,d1)",Z69_1,S44,Z90_2,scale=(1.0d0,0.0d0))
!   original expression: Z69_1(e1be2b,l1b|m1bm2bm3b)+=S44(e2b,d1b|m1bm2b)*Z90_2(e1b,l1b|m3b,d1b)*-1.
    ierr=talsh_tensor_contract("Z69_1(e1,e2,l1,m1,m2,m3)+=S44(e2,d1,m1,m2)*Z90_2(e1,l1,m3,d1)",Z69_1,S44,Z90_2,scale=(-1.0d0,0.0d0))
!   original expression: Z69_1(e1be2b,l1b|m1bm2bm3b)+=S44(e1b,d1b|m1bm3b)*Z90_2(e2b,l1b|m2b,d1b)*-1.
    ierr=talsh_tensor_contract("Z69_1(e1,e2,l1,m1,m2,m3)+=S44(e1,d1,m1,m3)*Z90_2(e2,l1,m2,d1)",Z69_1,S44,Z90_2,scale=(-1.0d0,0.0d0))
!   original expression: Z69_1(e1be2b,l1b|m1bm2bm3b)+=S44(e2b,d1b|m1bm3b)*Z90_2(e1b,l1b|m2b,d1b)
    ierr=talsh_tensor_contract("Z69_1(e1,e2,l1,m1,m2,m3)+=S44(e2,d1,m1,m3)*Z90_2(e1,l1,m2,d1)",Z69_1,S44,Z90_2,scale=(1.0d0,0.0d0))
!   original expression: Z69_1(e1be2b,l1b|m1bm2bm3b)+=S44(e1b,d1b|m2bm3b)*Z90_2(e2b,l1b|m1b,d1b)
    ierr=talsh_tensor_contract("Z69_1(e1,e2,l1,m1,m2,m3)+=S44(e1,d1,m2,m3)*Z90_2(e2,l1,m1,d1)",Z69_1,S44,Z90_2,scale=(1.0d0,0.0d0))
!   original expression: Z69_1(e1be2b,l1b|m1bm2bm3b)+=S44(e2b,d1b|m2bm3b)*Z90_2(e1b,l1b|m1b,d1b)*-1.
    ierr=talsh_tensor_contract("Z69_1(e1,e2,l1,m1,m2,m3)+=S44(e2,d1,m2,m3)*Z90_2(e1,l1,m1,d1)",Z69_1,S44,Z90_2,scale=(-1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z90_2)
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S43(e1b|l1b)*Z69_1(e2be3b,l1b|m1bm2bm3b)
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S43(e1,l1)*Z69_1(e2,e3,l1,m1,m2,m3)",Z51,S43,Z69_1,scale=(1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S43(e2b|l1b)*Z69_1(e1be3b,l1b|m1bm2bm3b)*-1.
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S43(e2,l1)*Z69_1(e1,e3,l1,m1,m2,m3)",Z51,S43,Z69_1,scale=(-1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S43(e3b|l1b)*Z69_1(e1be2b,l1b|m1bm2bm3b)
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S43(e3,l1)*Z69_1(e1,e2,l1,m1,m2,m3)",Z51,S43,Z69_1,scale=(1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z69_1)
    ierr=talsh_tensor_construct(Z71_1, C8, /(nvir,nvir,nocc,nvir)/, init_val=ZERO)
!   original expression: Z71_1(e1be2b|m1b,d1b)+=H3(e1be2b|d1b,d2b)*S43(d2b|m1b)
    ierr=talsh_tensor_contract("Z71_1(e1,e2,m1,d1)+=H3(e1,e2,d1,d2)*S43(d2,m1)",Z71_1,H3,S43,scale=(1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e1b,d1b|m1bm2b)*Z71_1(e2be3b|m3b,d1b)
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e1,d1,m1,m2)*Z71_1(e2,e3,m3,d1)",Z51,S44,Z71_1,scale=(1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e2b,d1b|m1bm2b)*Z71_1(e1be3b|m3b,d1b)*-1.
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e2,d1,m1,m2)*Z71_1(e1,e3,m3,d1)",Z51,S44,Z71_1,scale=(-1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e3b,d1b|m1bm2b)*Z71_1(e1be2b|m3b,d1b)
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e3,d1,m1,m2)*Z71_1(e1,e2,m3,d1)",Z51,S44,Z71_1,scale=(1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e1b,d1b|m1bm3b)*Z71_1(e2be3b|m2b,d1b)*-1.
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e1,d1,m1,m3)*Z71_1(e2,e3,m2,d1)",Z51,S44,Z71_1,scale=(-1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e2b,d1b|m1bm3b)*Z71_1(e1be3b|m2b,d1b)
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e2,d1,m1,m3)*Z71_1(e1,e3,m2,d1)",Z51,S44,Z71_1,scale=(1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e3b,d1b|m1bm3b)*Z71_1(e1be2b|m2b,d1b)*-1.
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e3,d1,m1,m3)*Z71_1(e1,e2,m2,d1)",Z51,S44,Z71_1,scale=(-1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e1b,d1b|m2bm3b)*Z71_1(e2be3b|m1b,d1b)
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e1,d1,m2,m3)*Z71_1(e2,e3,m1,d1)",Z51,S44,Z71_1,scale=(1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e2b,d1b|m2bm3b)*Z71_1(e1be3b|m1b,d1b)*-1.
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e2,d1,m2,m3)*Z71_1(e1,e3,m1,d1)",Z51,S44,Z71_1,scale=(-1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e3b,d1b|m2bm3b)*Z71_1(e1be2b|m1b,d1b)
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e3,d1,m2,m3)*Z71_1(e1,e2,m1,d1)",Z51,S44,Z71_1,scale=(1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z71_1)
    ierr=talsh_tensor_construct(Z71_1, C8, /(nvir,nvir,nocc,nvir)/, init_val=ZERO)
!   original expression: Z71_1(e1be2b|m1b,d1b)+=H17(e1b,l1b|d1b,d2b)*S44(e2b,d2b|m1b,l1b)
    ierr=talsh_tensor_contract("Z71_1(e1,e2,m1,d1)+=H17(e1,l1,d1,d2)*S44(e2,d2,m1,l1)",Z71_1,H17,S44,scale=(1.0d0,0.0d0))
!   original expression: Z71_1(e1be2b|m1b,d1b)+=H17(e2b,l1b|d1b,d2b)*S44(e1b,d2b|m1b,l1b)*-1.
    ierr=talsh_tensor_contract("Z71_1(e1,e2,m1,d1)+=H17(e2,l1,d1,d2)*S44(e1,d2,m1,l1)",Z71_1,H17,S44,scale=(-1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e1b,d1b|m1bm2b)*Z71_1(e2be3b|m3b,d1b)
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e1,d1,m1,m2)*Z71_1(e2,e3,m3,d1)",Z51,S44,Z71_1,scale=(1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e2b,d1b|m1bm2b)*Z71_1(e1be3b|m3b,d1b)*-1.
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e2,d1,m1,m2)*Z71_1(e1,e3,m3,d1)",Z51,S44,Z71_1,scale=(-1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e3b,d1b|m1bm2b)*Z71_1(e1be2b|m3b,d1b)
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e3,d1,m1,m2)*Z71_1(e1,e2,m3,d1)",Z51,S44,Z71_1,scale=(1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e1b,d1b|m1bm3b)*Z71_1(e2be3b|m2b,d1b)*-1.
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e1,d1,m1,m3)*Z71_1(e2,e3,m2,d1)",Z51,S44,Z71_1,scale=(-1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e2b,d1b|m1bm3b)*Z71_1(e1be3b|m2b,d1b)
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e2,d1,m1,m3)*Z71_1(e1,e3,m2,d1)",Z51,S44,Z71_1,scale=(1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e3b,d1b|m1bm3b)*Z71_1(e1be2b|m2b,d1b)*-1.
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e3,d1,m1,m3)*Z71_1(e1,e2,m2,d1)",Z51,S44,Z71_1,scale=(-1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e1b,d1b|m2bm3b)*Z71_1(e2be3b|m1b,d1b)
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e1,d1,m2,m3)*Z71_1(e2,e3,m1,d1)",Z51,S44,Z71_1,scale=(1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e2b,d1b|m2bm3b)*Z71_1(e1be3b|m1b,d1b)*-1.
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e2,d1,m2,m3)*Z71_1(e1,e3,m1,d1)",Z51,S44,Z71_1,scale=(-1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e3b,d1b|m2bm3b)*Z71_1(e1be2b|m1b,d1b)
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e3,d1,m2,m3)*Z71_1(e1,e2,m1,d1)",Z51,S44,Z71_1,scale=(1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z71_1)
    ierr=talsh_tensor_construct(Z71_1, C8, /(nvir,nvir,nocc,nvir)/, init_val=ZERO)
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e1b,d1b|m1bm2b)*Z71_1(e2be3b|m3b,d1b)
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e1,d1,m1,m2)*Z71_1(e2,e3,m3,d1)",Z51,S44,Z71_1,scale=(1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e2b,d1b|m1bm2b)*Z71_1(e1be3b|m3b,d1b)*-1.
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e2,d1,m1,m2)*Z71_1(e1,e3,m3,d1)",Z51,S44,Z71_1,scale=(-1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e3b,d1b|m1bm2b)*Z71_1(e1be2b|m3b,d1b)
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e3,d1,m1,m2)*Z71_1(e1,e2,m3,d1)",Z51,S44,Z71_1,scale=(1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e1b,d1b|m1bm3b)*Z71_1(e2be3b|m2b,d1b)*-1.
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e1,d1,m1,m3)*Z71_1(e2,e3,m2,d1)",Z51,S44,Z71_1,scale=(-1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e2b,d1b|m1bm3b)*Z71_1(e1be3b|m2b,d1b)
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e2,d1,m1,m3)*Z71_1(e1,e3,m2,d1)",Z51,S44,Z71_1,scale=(1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e3b,d1b|m1bm3b)*Z71_1(e1be2b|m2b,d1b)*-1.
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e3,d1,m1,m3)*Z71_1(e1,e2,m2,d1)",Z51,S44,Z71_1,scale=(-1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e1b,d1b|m2bm3b)*Z71_1(e2be3b|m1b,d1b)
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e1,d1,m2,m3)*Z71_1(e2,e3,m1,d1)",Z51,S44,Z71_1,scale=(1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e2b,d1b|m2bm3b)*Z71_1(e1be3b|m1b,d1b)*-1.
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e2,d1,m2,m3)*Z71_1(e1,e3,m1,d1)",Z51,S44,Z71_1,scale=(-1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e3b,d1b|m2bm3b)*Z71_1(e1be2b|m1b,d1b)
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e3,d1,m2,m3)*Z71_1(e1,e2,m1,d1)",Z51,S44,Z71_1,scale=(1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z71_1)
    ierr=talsh_tensor_construct(Z83_2, C8, /(nocc,nocc,nocc,nvir)/, init_val=ZERO)
!   original expression: Z83_2(l1bl2b|m1b,d1b)+=H24(l1bl2b|d1b,d2b)*S43(d2b|m1b)
    ierr=talsh_tensor_contract("Z83_2(l1,l2,m1,d1)+=H24(l1,l2,d1,d2)*S43(d2,m1)",Z83_2,H24,S43,scale=(1.0d0,0.0d0))
    ierr=talsh_tensor_construct(Z71_1, C8, /(nvir,nvir,nocc,nvir)/, init_val=ZERO)
!   original expression: Z71_1(e1be2b|m1b,d1b)+=S44(e1be2b|l1bl2b)*Z83_2(l1bl2b|m1b,d1b)
    ierr=talsh_tensor_contract("Z71_1(e1,e2,m1,d1)+=S44(e1,e2,l1,l2)*Z83_2(l1,l2,m1,d1)",Z71_1,S44,Z83_2,scale=(0.5d0,0.0d0))
    ierr=talsh_tensor_destruct(Z83_2)
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e1b,d1b|m1bm2b)*Z71_1(e2be3b|m3b,d1b)
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e1,d1,m1,m2)*Z71_1(e2,e3,m3,d1)",Z51,S44,Z71_1,scale=(1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e2b,d1b|m1bm2b)*Z71_1(e1be3b|m3b,d1b)*-1.
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e2,d1,m1,m2)*Z71_1(e1,e3,m3,d1)",Z51,S44,Z71_1,scale=(-1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e3b,d1b|m1bm2b)*Z71_1(e1be2b|m3b,d1b)
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e3,d1,m1,m2)*Z71_1(e1,e2,m3,d1)",Z51,S44,Z71_1,scale=(1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e1b,d1b|m1bm3b)*Z71_1(e2be3b|m2b,d1b)*-1.
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e1,d1,m1,m3)*Z71_1(e2,e3,m2,d1)",Z51,S44,Z71_1,scale=(-1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e2b,d1b|m1bm3b)*Z71_1(e1be3b|m2b,d1b)
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e2,d1,m1,m3)*Z71_1(e1,e3,m2,d1)",Z51,S44,Z71_1,scale=(1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e3b,d1b|m1bm3b)*Z71_1(e1be2b|m2b,d1b)*-1.
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e3,d1,m1,m3)*Z71_1(e1,e2,m2,d1)",Z51,S44,Z71_1,scale=(-1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e1b,d1b|m2bm3b)*Z71_1(e2be3b|m1b,d1b)
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e1,d1,m2,m3)*Z71_1(e2,e3,m1,d1)",Z51,S44,Z71_1,scale=(1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e2b,d1b|m2bm3b)*Z71_1(e1be3b|m1b,d1b)*-1.
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e2,d1,m2,m3)*Z71_1(e1,e3,m1,d1)",Z51,S44,Z71_1,scale=(-1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e3b,d1b|m2bm3b)*Z71_1(e1be2b|m1b,d1b)
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e3,d1,m2,m3)*Z71_1(e1,e2,m1,d1)",Z51,S44,Z71_1,scale=(1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z71_1)
    ierr=talsh_tensor_construct(Z71_1, C8, /(nvir,nvir,nocc,nvir)/, init_val=ZERO)
!   original expression: Z71_1(e1be2b|m1b,d1b)+=S44(e1be2b|l1bl2b)*H25(l1bl2b|m1b,d1b)*-1.
    ierr=talsh_tensor_contract("Z71_1(e1,e2,m1,d1)+=S44(e1,e2,l1,l2)*H25(l1,l2,m1,d1)",Z71_1,S44,H25,scale=(-0.5d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e1b,d1b|m1bm2b)*Z71_1(e2be3b|m3b,d1b)
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e1,d1,m1,m2)*Z71_1(e2,e3,m3,d1)",Z51,S44,Z71_1,scale=(1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e2b,d1b|m1bm2b)*Z71_1(e1be3b|m3b,d1b)*-1.
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e2,d1,m1,m2)*Z71_1(e1,e3,m3,d1)",Z51,S44,Z71_1,scale=(-1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e3b,d1b|m1bm2b)*Z71_1(e1be2b|m3b,d1b)
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e3,d1,m1,m2)*Z71_1(e1,e2,m3,d1)",Z51,S44,Z71_1,scale=(1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e1b,d1b|m1bm3b)*Z71_1(e2be3b|m2b,d1b)*-1.
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e1,d1,m1,m3)*Z71_1(e2,e3,m2,d1)",Z51,S44,Z71_1,scale=(-1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e2b,d1b|m1bm3b)*Z71_1(e1be3b|m2b,d1b)
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e2,d1,m1,m3)*Z71_1(e1,e3,m2,d1)",Z51,S44,Z71_1,scale=(1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e3b,d1b|m1bm3b)*Z71_1(e1be2b|m2b,d1b)*-1.
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e3,d1,m1,m3)*Z71_1(e1,e2,m2,d1)",Z51,S44,Z71_1,scale=(-1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e1b,d1b|m2bm3b)*Z71_1(e2be3b|m1b,d1b)
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e1,d1,m2,m3)*Z71_1(e2,e3,m1,d1)",Z51,S44,Z71_1,scale=(1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e2b,d1b|m2bm3b)*Z71_1(e1be3b|m1b,d1b)*-1.
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e2,d1,m2,m3)*Z71_1(e1,e3,m1,d1)",Z51,S44,Z71_1,scale=(-1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e3b,d1b|m2bm3b)*Z71_1(e1be2b|m1b,d1b)
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e3,d1,m2,m3)*Z71_1(e1,e2,m1,d1)",Z51,S44,Z71_1,scale=(1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z71_1)
    ierr=talsh_tensor_construct(Z67_1, C8, /(nvir,nocc,nocc,nocc)/, init_val=ZERO)
!   original expression: Z67_1(e1b,l1b|m1bm2b)+=H17(e1b,l1b|d1bd2b)*S44(d1bd2b|m1bm2b)
    ierr=talsh_tensor_contract("Z67_1(e1,l1,m1,m2)+=H17(e1,l1,d1,d2)*S44(d1,d2,m1,m2)",Z67_1,H17,S44,scale=(0.5d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e1be2b|m1b,l1b)*Z67_1(e3b,l1b|m2bm3b)
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e1,e2,m1,l1)*Z67_1(e3,l1,m2,m3)",Z51,S44,Z67_1,scale=(1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e1be3b|m1b,l1b)*Z67_1(e2b,l1b|m2bm3b)*-1.
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e1,e3,m1,l1)*Z67_1(e2,l1,m2,m3)",Z51,S44,Z67_1,scale=(-1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e2be3b|m1b,l1b)*Z67_1(e1b,l1b|m2bm3b)
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e2,e3,m1,l1)*Z67_1(e1,l1,m2,m3)",Z51,S44,Z67_1,scale=(1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e1be2b|m2b,l1b)*Z67_1(e3b,l1b|m1bm3b)*-1.
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e1,e2,m2,l1)*Z67_1(e3,l1,m1,m3)",Z51,S44,Z67_1,scale=(-1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e1be3b|m2b,l1b)*Z67_1(e2b,l1b|m1bm3b)
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e1,e3,m2,l1)*Z67_1(e2,l1,m1,m3)",Z51,S44,Z67_1,scale=(1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e2be3b|m2b,l1b)*Z67_1(e1b,l1b|m1bm3b)*-1.
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e2,e3,m2,l1)*Z67_1(e1,l1,m1,m3)",Z51,S44,Z67_1,scale=(-1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e1be2b|m3b,l1b)*Z67_1(e3b,l1b|m1bm2b)
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e1,e2,m3,l1)*Z67_1(e3,l1,m1,m2)",Z51,S44,Z67_1,scale=(1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e1be3b|m3b,l1b)*Z67_1(e2b,l1b|m1bm2b)*-1.
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e1,e3,m3,l1)*Z67_1(e2,l1,m1,m2)",Z51,S44,Z67_1,scale=(-1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e2be3b|m3b,l1b)*Z67_1(e1b,l1b|m1bm2b)
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e2,e3,m3,l1)*Z67_1(e1,l1,m1,m2)",Z51,S44,Z67_1,scale=(1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z67_1)
    ierr=talsh_tensor_construct(Z67_1, C8, /(nvir,nocc,nocc,nocc)/, init_val=ZERO)
!   original expression: Z67_1(e1b,l1b|m1bm2b)+=H26(l1b,l2b|m1bm2b)*S43(e1b|l2b)
    ierr=talsh_tensor_contract("Z67_1(e1,l1,m1,m2)+=H26(l1,l2,m1,m2)*S43(e1,l2)",Z67_1,H26,S43,scale=(1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e1be2b|m1b,l1b)*Z67_1(e3b,l1b|m2bm3b)
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e1,e2,m1,l1)*Z67_1(e3,l1,m2,m3)",Z51,S44,Z67_1,scale=(1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e1be3b|m1b,l1b)*Z67_1(e2b,l1b|m2bm3b)*-1.
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e1,e3,m1,l1)*Z67_1(e2,l1,m2,m3)",Z51,S44,Z67_1,scale=(-1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e2be3b|m1b,l1b)*Z67_1(e1b,l1b|m2bm3b)
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e2,e3,m1,l1)*Z67_1(e1,l1,m2,m3)",Z51,S44,Z67_1,scale=(1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e1be2b|m2b,l1b)*Z67_1(e3b,l1b|m1bm3b)*-1.
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e1,e2,m2,l1)*Z67_1(e3,l1,m1,m3)",Z51,S44,Z67_1,scale=(-1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e1be3b|m2b,l1b)*Z67_1(e2b,l1b|m1bm3b)
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e1,e3,m2,l1)*Z67_1(e2,l1,m1,m3)",Z51,S44,Z67_1,scale=(1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e2be3b|m2b,l1b)*Z67_1(e1b,l1b|m1bm3b)*-1.
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e2,e3,m2,l1)*Z67_1(e1,l1,m1,m3)",Z51,S44,Z67_1,scale=(-1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e1be2b|m3b,l1b)*Z67_1(e3b,l1b|m1bm2b)
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e1,e2,m3,l1)*Z67_1(e3,l1,m1,m2)",Z51,S44,Z67_1,scale=(1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e1be3b|m3b,l1b)*Z67_1(e2b,l1b|m1bm2b)*-1.
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e1,e3,m3,l1)*Z67_1(e2,l1,m1,m2)",Z51,S44,Z67_1,scale=(-1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e2be3b|m3b,l1b)*Z67_1(e1b,l1b|m1bm2b)
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e2,e3,m3,l1)*Z67_1(e1,l1,m1,m2)",Z51,S44,Z67_1,scale=(1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z67_1)
    ierr=talsh_tensor_construct(Z67_1, C8, /(nvir,nocc,nocc,nocc)/, init_val=ZERO)
!   original expression: Z67_1(e1b,l1b|m1bm2b)+=H18(e1b,l1b|m1b,d1b)*S43(d1b|m2b)
    ierr=talsh_tensor_contract("Z67_1(e1,l1,m1,m2)+=H18(e1,l1,m1,d1)*S43(d1,m2)",Z67_1,H18,S43,scale=(1.0d0,0.0d0))
!   original expression: Z67_1(e1b,l1b|m1bm2b)+=H18(e1b,l1b|m2b,d1b)*S43(d1b|m1b)*-1.
    ierr=talsh_tensor_contract("Z67_1(e1,l1,m1,m2)+=H18(e1,l1,m2,d1)*S43(d1,m1)",Z67_1,H18,S43,scale=(-1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e1be2b|m1b,l1b)*Z67_1(e3b,l1b|m2bm3b)
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e1,e2,m1,l1)*Z67_1(e3,l1,m2,m3)",Z51,S44,Z67_1,scale=(1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e1be3b|m1b,l1b)*Z67_1(e2b,l1b|m2bm3b)*-1.
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e1,e3,m1,l1)*Z67_1(e2,l1,m2,m3)",Z51,S44,Z67_1,scale=(-1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e2be3b|m1b,l1b)*Z67_1(e1b,l1b|m2bm3b)
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e2,e3,m1,l1)*Z67_1(e1,l1,m2,m3)",Z51,S44,Z67_1,scale=(1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e1be2b|m2b,l1b)*Z67_1(e3b,l1b|m1bm3b)*-1.
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e1,e2,m2,l1)*Z67_1(e3,l1,m1,m3)",Z51,S44,Z67_1,scale=(-1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e1be3b|m2b,l1b)*Z67_1(e2b,l1b|m1bm3b)
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e1,e3,m2,l1)*Z67_1(e2,l1,m1,m3)",Z51,S44,Z67_1,scale=(1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e2be3b|m2b,l1b)*Z67_1(e1b,l1b|m1bm3b)*-1.
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e2,e3,m2,l1)*Z67_1(e1,l1,m1,m3)",Z51,S44,Z67_1,scale=(-1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e1be2b|m3b,l1b)*Z67_1(e3b,l1b|m1bm2b)
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e1,e2,m3,l1)*Z67_1(e3,l1,m1,m2)",Z51,S44,Z67_1,scale=(1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e1be3b|m3b,l1b)*Z67_1(e2b,l1b|m1bm2b)*-1.
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e1,e3,m3,l1)*Z67_1(e2,l1,m1,m2)",Z51,S44,Z67_1,scale=(-1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e2be3b|m3b,l1b)*Z67_1(e1b,l1b|m1bm2b)
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e2,e3,m3,l1)*Z67_1(e1,l1,m1,m2)",Z51,S44,Z67_1,scale=(1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z67_1)
    ierr=talsh_tensor_construct(Z81_2, C8, /(nocc,nocc,nocc,nocc)/, init_val=ZERO)
!   original expression: Z81_2(l1b,l2b|m1bm2b)+=H24(l1b,l2b|d1bd2b)*S44(d1bd2b|m1bm2b)
    ierr=talsh_tensor_contract("Z81_2(l1,l2,m1,m2)+=H24(l1,l2,d1,d2)*S44(d1,d2,m1,m2)",Z81_2,H24,S44,scale=(0.5d0,0.0d0))
    ierr=talsh_tensor_construct(Z67_1, C8, /(nvir,nocc,nocc,nocc)/, init_val=ZERO)
!   original expression: Z67_1(e1b,l1b|m1bm2b)+=S43(e1b|l2b)*Z81_2(l1b,l2b|m1bm2b)
    ierr=talsh_tensor_contract("Z67_1(e1,l1,m1,m2)+=S43(e1,l2)*Z81_2(l1,l2,m1,m2)",Z67_1,S43,Z81_2,scale=(1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z81_2)
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e1be2b|m1b,l1b)*Z67_1(e3b,l1b|m2bm3b)
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e1,e2,m1,l1)*Z67_1(e3,l1,m2,m3)",Z51,S44,Z67_1,scale=(1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e1be3b|m1b,l1b)*Z67_1(e2b,l1b|m2bm3b)*-1.
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e1,e3,m1,l1)*Z67_1(e2,l1,m2,m3)",Z51,S44,Z67_1,scale=(-1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e2be3b|m1b,l1b)*Z67_1(e1b,l1b|m2bm3b)
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e2,e3,m1,l1)*Z67_1(e1,l1,m2,m3)",Z51,S44,Z67_1,scale=(1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e1be2b|m2b,l1b)*Z67_1(e3b,l1b|m1bm3b)*-1.
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e1,e2,m2,l1)*Z67_1(e3,l1,m1,m3)",Z51,S44,Z67_1,scale=(-1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e1be3b|m2b,l1b)*Z67_1(e2b,l1b|m1bm3b)
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e1,e3,m2,l1)*Z67_1(e2,l1,m1,m3)",Z51,S44,Z67_1,scale=(1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e2be3b|m2b,l1b)*Z67_1(e1b,l1b|m1bm3b)*-1.
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e2,e3,m2,l1)*Z67_1(e1,l1,m1,m3)",Z51,S44,Z67_1,scale=(-1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e1be2b|m3b,l1b)*Z67_1(e3b,l1b|m1bm2b)
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e1,e2,m3,l1)*Z67_1(e3,l1,m1,m2)",Z51,S44,Z67_1,scale=(1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e1be3b|m3b,l1b)*Z67_1(e2b,l1b|m1bm2b)*-1.
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e1,e3,m3,l1)*Z67_1(e2,l1,m1,m2)",Z51,S44,Z67_1,scale=(-1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e2be3b|m3b,l1b)*Z67_1(e1b,l1b|m1bm2b)
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e2,e3,m3,l1)*Z67_1(e1,l1,m1,m2)",Z51,S44,Z67_1,scale=(1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z67_1)
    ierr=talsh_tensor_construct(Z81_2, C8, /(nocc,nocc,nocc,nocc)/, init_val=ZERO)
!   original expression: Z81_2(l1b,l2b|m1bm2b)+=H25(l1b,l2b|m1b,d1b)*S43(d1b|m2b)
    ierr=talsh_tensor_contract("Z81_2(l1,l2,m1,m2)+=H25(l1,l2,m1,d1)*S43(d1,m2)",Z81_2,H25,S43,scale=(1.0d0,0.0d0))
!   original expression: Z81_2(l1b,l2b|m1bm2b)+=H25(l1b,l2b|m2b,d1b)*S43(d1b|m1b)*-1.
    ierr=talsh_tensor_contract("Z81_2(l1,l2,m1,m2)+=H25(l1,l2,m2,d1)*S43(d1,m1)",Z81_2,H25,S43,scale=(-1.0d0,0.0d0))
    ierr=talsh_tensor_construct(Z67_1, C8, /(nvir,nocc,nocc,nocc)/, init_val=ZERO)
!   original expression: Z67_1(e1b,l1b|m1bm2b)+=S43(e1b|l2b)*Z81_2(l1b,l2b|m1bm2b)
    ierr=talsh_tensor_contract("Z67_1(e1,l1,m1,m2)+=S43(e1,l2)*Z81_2(l1,l2,m1,m2)",Z67_1,S43,Z81_2,scale=(1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z81_2)
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e1be2b|m1b,l1b)*Z67_1(e3b,l1b|m2bm3b)
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e1,e2,m1,l1)*Z67_1(e3,l1,m2,m3)",Z51,S44,Z67_1,scale=(1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e1be3b|m1b,l1b)*Z67_1(e2b,l1b|m2bm3b)*-1.
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e1,e3,m1,l1)*Z67_1(e2,l1,m2,m3)",Z51,S44,Z67_1,scale=(-1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e2be3b|m1b,l1b)*Z67_1(e1b,l1b|m2bm3b)
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e2,e3,m1,l1)*Z67_1(e1,l1,m2,m3)",Z51,S44,Z67_1,scale=(1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e1be2b|m2b,l1b)*Z67_1(e3b,l1b|m1bm3b)*-1.
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e1,e2,m2,l1)*Z67_1(e3,l1,m1,m3)",Z51,S44,Z67_1,scale=(-1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e1be3b|m2b,l1b)*Z67_1(e2b,l1b|m1bm3b)
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e1,e3,m2,l1)*Z67_1(e2,l1,m1,m3)",Z51,S44,Z67_1,scale=(1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e2be3b|m2b,l1b)*Z67_1(e1b,l1b|m1bm3b)*-1.
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e2,e3,m2,l1)*Z67_1(e1,l1,m1,m3)",Z51,S44,Z67_1,scale=(-1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e1be2b|m3b,l1b)*Z67_1(e3b,l1b|m1bm2b)
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e1,e2,m3,l1)*Z67_1(e3,l1,m1,m2)",Z51,S44,Z67_1,scale=(1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e1be3b|m3b,l1b)*Z67_1(e2b,l1b|m1bm2b)*-1.
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e1,e3,m3,l1)*Z67_1(e2,l1,m1,m2)",Z51,S44,Z67_1,scale=(-1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e2be3b|m3b,l1b)*Z67_1(e1b,l1b|m1bm2b)
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e2,e3,m3,l1)*Z67_1(e1,l1,m1,m2)",Z51,S44,Z67_1,scale=(1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z67_1)
    ierr=talsh_tensor_construct(Z100_3, C8, /(nocc,nocc,nocc,nvir)/, init_val=ZERO)
!   original expression: Z100_3(l1b,l2b|m1b,d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|m1b)*0.5
    ierr=talsh_tensor_contract("Z100_3(l1,l2,m1,d1)+=H24(l1,l2,d1,d2)*S43(d2,m1)",Z100_3,H24,S43,scale=(0.5d0,0.0d0))
    ierr=talsh_tensor_construct(Z81_2, C8, /(nocc,nocc,nocc,nocc)/, init_val=ZERO)
!   original expression: Z81_2(l1b,l2b|m1bm2b)+=S43(d1b|m1b)*Z100_3(l1b,l2b|m2b,d1b)
    ierr=talsh_tensor_contract("Z81_2(l1,l2,m1,m2)+=S43(d1,m1)*Z100_3(l1,l2,m2,d1)",Z81_2,S43,Z100_3,scale=(1.0d0,0.0d0))
!   original expression: Z81_2(l1b,l2b|m1bm2b)+=S43(d1b|m2b)*Z100_3(l1b,l2b|m1b,d1b)*-1.
    ierr=talsh_tensor_contract("Z81_2(l1,l2,m1,m2)+=S43(d1,m2)*Z100_3(l1,l2,m1,d1)",Z81_2,S43,Z100_3,scale=(-1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z100_3)
    ierr=talsh_tensor_construct(Z67_1, C8, /(nvir,nocc,nocc,nocc)/, init_val=ZERO)
!   original expression: Z67_1(e1b,l1b|m1bm2b)+=S43(e1b|l2b)*Z81_2(l1b,l2b|m1bm2b)
    ierr=talsh_tensor_contract("Z67_1(e1,l1,m1,m2)+=S43(e1,l2)*Z81_2(l1,l2,m1,m2)",Z67_1,S43,Z81_2,scale=(1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z81_2)
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e1be2b|m1b,l1b)*Z67_1(e3b,l1b|m2bm3b)
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e1,e2,m1,l1)*Z67_1(e3,l1,m2,m3)",Z51,S44,Z67_1,scale=(1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e1be3b|m1b,l1b)*Z67_1(e2b,l1b|m2bm3b)*-1.
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e1,e3,m1,l1)*Z67_1(e2,l1,m2,m3)",Z51,S44,Z67_1,scale=(-1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e2be3b|m1b,l1b)*Z67_1(e1b,l1b|m2bm3b)
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e2,e3,m1,l1)*Z67_1(e1,l1,m2,m3)",Z51,S44,Z67_1,scale=(1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e1be2b|m2b,l1b)*Z67_1(e3b,l1b|m1bm3b)*-1.
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e1,e2,m2,l1)*Z67_1(e3,l1,m1,m3)",Z51,S44,Z67_1,scale=(-1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e1be3b|m2b,l1b)*Z67_1(e2b,l1b|m1bm3b)
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e1,e3,m2,l1)*Z67_1(e2,l1,m1,m3)",Z51,S44,Z67_1,scale=(1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e2be3b|m2b,l1b)*Z67_1(e1b,l1b|m1bm3b)*-1.
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e2,e3,m2,l1)*Z67_1(e1,l1,m1,m3)",Z51,S44,Z67_1,scale=(-1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e1be2b|m3b,l1b)*Z67_1(e3b,l1b|m1bm2b)
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e1,e2,m3,l1)*Z67_1(e3,l1,m1,m2)",Z51,S44,Z67_1,scale=(1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e1be3b|m3b,l1b)*Z67_1(e2b,l1b|m1bm2b)*-1.
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e1,e3,m3,l1)*Z67_1(e2,l1,m1,m2)",Z51,S44,Z67_1,scale=(-1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e2be3b|m3b,l1b)*Z67_1(e1b,l1b|m1bm2b)
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e2,e3,m3,l1)*Z67_1(e1,l1,m1,m2)",Z51,S44,Z67_1,scale=(1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z67_1)
    ierr=talsh_tensor_construct(Z90_2, C8, /(nvir,nocc,nocc,nvir)/, init_val=ZERO)
!   original expression: Z90_2(e1b,l1b|m1b,d1b)+=H17(e1b,l1b|d1b,d2b)*S43(d2b|m1b)*0.5
    ierr=talsh_tensor_contract("Z90_2(e1,l1,m1,d1)+=H17(e1,l1,d1,d2)*S43(d2,m1)",Z90_2,H17,S43,scale=(0.5d0,0.0d0))
    ierr=talsh_tensor_construct(Z67_1, C8, /(nvir,nocc,nocc,nocc)/, init_val=ZERO)
!   original expression: Z67_1(e1b,l1b|m1bm2b)+=S43(d1b|m1b)*Z90_2(e1b,l1b|m2b,d1b)
    ierr=talsh_tensor_contract("Z67_1(e1,l1,m1,m2)+=S43(d1,m1)*Z90_2(e1,l1,m2,d1)",Z67_1,S43,Z90_2,scale=(1.0d0,0.0d0))
!   original expression: Z67_1(e1b,l1b|m1bm2b)+=S43(d1b|m2b)*Z90_2(e1b,l1b|m1b,d1b)*-1.
    ierr=talsh_tensor_contract("Z67_1(e1,l1,m1,m2)+=S43(d1,m2)*Z90_2(e1,l1,m1,d1)",Z67_1,S43,Z90_2,scale=(-1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z90_2)
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e1be2b|m1b,l1b)*Z67_1(e3b,l1b|m2bm3b)
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e1,e2,m1,l1)*Z67_1(e3,l1,m2,m3)",Z51,S44,Z67_1,scale=(1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e1be3b|m1b,l1b)*Z67_1(e2b,l1b|m2bm3b)*-1.
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e1,e3,m1,l1)*Z67_1(e2,l1,m2,m3)",Z51,S44,Z67_1,scale=(-1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e2be3b|m1b,l1b)*Z67_1(e1b,l1b|m2bm3b)
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e2,e3,m1,l1)*Z67_1(e1,l1,m2,m3)",Z51,S44,Z67_1,scale=(1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e1be2b|m2b,l1b)*Z67_1(e3b,l1b|m1bm3b)*-1.
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e1,e2,m2,l1)*Z67_1(e3,l1,m1,m3)",Z51,S44,Z67_1,scale=(-1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e1be3b|m2b,l1b)*Z67_1(e2b,l1b|m1bm3b)
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e1,e3,m2,l1)*Z67_1(e2,l1,m1,m3)",Z51,S44,Z67_1,scale=(1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e2be3b|m2b,l1b)*Z67_1(e1b,l1b|m1bm3b)*-1.
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e2,e3,m2,l1)*Z67_1(e1,l1,m1,m3)",Z51,S44,Z67_1,scale=(-1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e1be2b|m3b,l1b)*Z67_1(e3b,l1b|m1bm2b)
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e1,e2,m3,l1)*Z67_1(e3,l1,m1,m2)",Z51,S44,Z67_1,scale=(1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e1be3b|m3b,l1b)*Z67_1(e2b,l1b|m1bm2b)*-1.
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e1,e3,m3,l1)*Z67_1(e2,l1,m1,m2)",Z51,S44,Z67_1,scale=(-1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e2be3b|m3b,l1b)*Z67_1(e1b,l1b|m1bm2b)
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e2,e3,m3,l1)*Z67_1(e1,l1,m1,m2)",Z51,S44,Z67_1,scale=(1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z67_1)
    ierr=talsh_tensor_construct(Z61_2, C8, /(nocc,nvir)/, init_val=ZERO)
!   original expression: Z61_2(l1b|d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|l2b)
    ierr=talsh_tensor_contract("Z61_2(l1,d1)+=H24(l1,l2,d1,d2)*S43(d2,l2)",Z61_2,H24,S43,scale=(1.0d0,0.0d0))
    ierr=talsh_tensor_construct(Z67_1, C8, /(nvir,nocc,nocc,nocc)/, init_val=ZERO)
!   original expression: Z67_1(e1b,l1b|m1bm2b)+=S44(e1b,d1b|m1bm2b)*Z61_2(l1b|d1b)
    ierr=talsh_tensor_contract("Z67_1(e1,l1,m1,m2)+=S44(e1,d1,m1,m2)*Z61_2(l1,d1)",Z67_1,S44,Z61_2,scale=(1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z61_2)
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e1be2b|m1b,l1b)*Z67_1(e3b,l1b|m2bm3b)
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e1,e2,m1,l1)*Z67_1(e3,l1,m2,m3)",Z51,S44,Z67_1,scale=(1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e1be3b|m1b,l1b)*Z67_1(e2b,l1b|m2bm3b)*-1.
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e1,e3,m1,l1)*Z67_1(e2,l1,m2,m3)",Z51,S44,Z67_1,scale=(-1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e2be3b|m1b,l1b)*Z67_1(e1b,l1b|m2bm3b)
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e2,e3,m1,l1)*Z67_1(e1,l1,m2,m3)",Z51,S44,Z67_1,scale=(1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e1be2b|m2b,l1b)*Z67_1(e3b,l1b|m1bm3b)*-1.
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e1,e2,m2,l1)*Z67_1(e3,l1,m1,m3)",Z51,S44,Z67_1,scale=(-1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e1be3b|m2b,l1b)*Z67_1(e2b,l1b|m1bm3b)
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e1,e3,m2,l1)*Z67_1(e2,l1,m1,m3)",Z51,S44,Z67_1,scale=(1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e2be3b|m2b,l1b)*Z67_1(e1b,l1b|m1bm3b)*-1.
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e2,e3,m2,l1)*Z67_1(e1,l1,m1,m3)",Z51,S44,Z67_1,scale=(-1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e1be2b|m3b,l1b)*Z67_1(e3b,l1b|m1bm2b)
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e1,e2,m3,l1)*Z67_1(e3,l1,m1,m2)",Z51,S44,Z67_1,scale=(1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e1be3b|m3b,l1b)*Z67_1(e2b,l1b|m1bm2b)*-1.
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e1,e3,m3,l1)*Z67_1(e2,l1,m1,m2)",Z51,S44,Z67_1,scale=(-1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e2be3b|m3b,l1b)*Z67_1(e1b,l1b|m1bm2b)
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e2,e3,m3,l1)*Z67_1(e1,l1,m1,m2)",Z51,S44,Z67_1,scale=(1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z67_1)
    ierr=talsh_tensor_construct(Z61_2, C8, /(nocc,nvir)/, init_val=ZERO)
    ierr=talsh_tensor_construct(Z67_1, C8, /(nvir,nocc,nocc,nocc)/, init_val=ZERO)
!   original expression: Z67_1(e1b,l1b|m1bm2b)+=S44(e1b,d1b|m1bm2b)*Z61_2(l1b|d1b)
    ierr=talsh_tensor_contract("Z67_1(e1,l1,m1,m2)+=S44(e1,d1,m1,m2)*Z61_2(l1,d1)",Z67_1,S44,Z61_2,scale=(1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z61_2)
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e1be2b|m1b,l1b)*Z67_1(e3b,l1b|m2bm3b)
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e1,e2,m1,l1)*Z67_1(e3,l1,m2,m3)",Z51,S44,Z67_1,scale=(1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e1be3b|m1b,l1b)*Z67_1(e2b,l1b|m2bm3b)*-1.
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e1,e3,m1,l1)*Z67_1(e2,l1,m2,m3)",Z51,S44,Z67_1,scale=(-1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e2be3b|m1b,l1b)*Z67_1(e1b,l1b|m2bm3b)
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e2,e3,m1,l1)*Z67_1(e1,l1,m2,m3)",Z51,S44,Z67_1,scale=(1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e1be2b|m2b,l1b)*Z67_1(e3b,l1b|m1bm3b)*-1.
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e1,e2,m2,l1)*Z67_1(e3,l1,m1,m3)",Z51,S44,Z67_1,scale=(-1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e1be3b|m2b,l1b)*Z67_1(e2b,l1b|m1bm3b)
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e1,e3,m2,l1)*Z67_1(e2,l1,m1,m3)",Z51,S44,Z67_1,scale=(1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e2be3b|m2b,l1b)*Z67_1(e1b,l1b|m1bm3b)*-1.
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e2,e3,m2,l1)*Z67_1(e1,l1,m1,m3)",Z51,S44,Z67_1,scale=(-1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e1be2b|m3b,l1b)*Z67_1(e3b,l1b|m1bm2b)
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e1,e2,m3,l1)*Z67_1(e3,l1,m1,m2)",Z51,S44,Z67_1,scale=(1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e1be3b|m3b,l1b)*Z67_1(e2b,l1b|m1bm2b)*-1.
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e1,e3,m3,l1)*Z67_1(e2,l1,m1,m2)",Z51,S44,Z67_1,scale=(-1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e2be3b|m3b,l1b)*Z67_1(e1b,l1b|m1bm2b)
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e2,e3,m3,l1)*Z67_1(e1,l1,m1,m2)",Z51,S44,Z67_1,scale=(1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z67_1)
    ierr=talsh_tensor_construct(Z67_1, C8, /(nvir,nocc,nocc,nocc)/, init_val=ZERO)
!   original expression: Z67_1(e1b,l1b|m1bm2b)+=S44(e1b,d1b|m1bm2b)*H15(l1b|d1b)
    ierr=talsh_tensor_contract("Z67_1(e1,l1,m1,m2)+=S44(e1,d1,m1,m2)*H15(l1,d1)",Z67_1,S44,H15,scale=(1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e1be2b|m1b,l1b)*Z67_1(e3b,l1b|m2bm3b)
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e1,e2,m1,l1)*Z67_1(e3,l1,m2,m3)",Z51,S44,Z67_1,scale=(1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e1be3b|m1b,l1b)*Z67_1(e2b,l1b|m2bm3b)*-1.
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e1,e3,m1,l1)*Z67_1(e2,l1,m2,m3)",Z51,S44,Z67_1,scale=(-1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e2be3b|m1b,l1b)*Z67_1(e1b,l1b|m2bm3b)
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e2,e3,m1,l1)*Z67_1(e1,l1,m2,m3)",Z51,S44,Z67_1,scale=(1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e1be2b|m2b,l1b)*Z67_1(e3b,l1b|m1bm3b)*-1.
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e1,e2,m2,l1)*Z67_1(e3,l1,m1,m3)",Z51,S44,Z67_1,scale=(-1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e1be3b|m2b,l1b)*Z67_1(e2b,l1b|m1bm3b)
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e1,e3,m2,l1)*Z67_1(e2,l1,m1,m3)",Z51,S44,Z67_1,scale=(1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e2be3b|m2b,l1b)*Z67_1(e1b,l1b|m1bm3b)*-1.
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e2,e3,m2,l1)*Z67_1(e1,l1,m1,m3)",Z51,S44,Z67_1,scale=(-1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e1be2b|m3b,l1b)*Z67_1(e3b,l1b|m1bm2b)
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e1,e2,m3,l1)*Z67_1(e3,l1,m1,m2)",Z51,S44,Z67_1,scale=(1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e1be3b|m3b,l1b)*Z67_1(e2b,l1b|m1bm2b)*-1.
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e1,e3,m3,l1)*Z67_1(e2,l1,m1,m2)",Z51,S44,Z67_1,scale=(-1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e2be3b|m3b,l1b)*Z67_1(e1b,l1b|m1bm2b)
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e2,e3,m3,l1)*Z67_1(e1,l1,m1,m2)",Z51,S44,Z67_1,scale=(1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z67_1)
    ierr=talsh_tensor_construct(Z100_2, C8, /(nocc,nocc,nocc,nvir)/, init_val=ZERO)
!   original expression: Z100_2(l1b,l2b|m1b,d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|m1b)*-1.
    ierr=talsh_tensor_contract("Z100_2(l1,l2,m1,d1)+=H24(l1,l2,d1,d2)*S43(d2,m1)",Z100_2,H24,S43,scale=(-1.0d0,0.0d0))
    ierr=talsh_tensor_construct(Z67_1, C8, /(nvir,nocc,nocc,nocc)/, init_val=ZERO)
!   original expression: Z67_1(e1b,l1b|m1bm2b)+=S44(e1b,d1b|m1b,l2b)*Z100_2(l1b,l2b|m2b,d1b)
    ierr=talsh_tensor_contract("Z67_1(e1,l1,m1,m2)+=S44(e1,d1,m1,l2)*Z100_2(l1,l2,m2,d1)",Z67_1,S44,Z100_2,scale=(1.0d0,0.0d0))
!   original expression: Z67_1(e1b,l1b|m1bm2b)+=S44(e1b,d1b|m2b,l2b)*Z100_2(l1b,l2b|m1b,d1b)*-1.
    ierr=talsh_tensor_contract("Z67_1(e1,l1,m1,m2)+=S44(e1,d1,m2,l2)*Z100_2(l1,l2,m1,d1)",Z67_1,S44,Z100_2,scale=(-1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z100_2)
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e1be2b|m1b,l1b)*Z67_1(e3b,l1b|m2bm3b)
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e1,e2,m1,l1)*Z67_1(e3,l1,m2,m3)",Z51,S44,Z67_1,scale=(1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e1be3b|m1b,l1b)*Z67_1(e2b,l1b|m2bm3b)*-1.
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e1,e3,m1,l1)*Z67_1(e2,l1,m2,m3)",Z51,S44,Z67_1,scale=(-1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e2be3b|m1b,l1b)*Z67_1(e1b,l1b|m2bm3b)
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e2,e3,m1,l1)*Z67_1(e1,l1,m2,m3)",Z51,S44,Z67_1,scale=(1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e1be2b|m2b,l1b)*Z67_1(e3b,l1b|m1bm3b)*-1.
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e1,e2,m2,l1)*Z67_1(e3,l1,m1,m3)",Z51,S44,Z67_1,scale=(-1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e1be3b|m2b,l1b)*Z67_1(e2b,l1b|m1bm3b)
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e1,e3,m2,l1)*Z67_1(e2,l1,m1,m3)",Z51,S44,Z67_1,scale=(1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e2be3b|m2b,l1b)*Z67_1(e1b,l1b|m1bm3b)*-1.
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e2,e3,m2,l1)*Z67_1(e1,l1,m1,m3)",Z51,S44,Z67_1,scale=(-1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e1be2b|m3b,l1b)*Z67_1(e3b,l1b|m1bm2b)
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e1,e2,m3,l1)*Z67_1(e3,l1,m1,m2)",Z51,S44,Z67_1,scale=(1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e1be3b|m3b,l1b)*Z67_1(e2b,l1b|m1bm2b)*-1.
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e1,e3,m3,l1)*Z67_1(e2,l1,m1,m2)",Z51,S44,Z67_1,scale=(-1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e2be3b|m3b,l1b)*Z67_1(e1b,l1b|m1bm2b)
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e2,e3,m3,l1)*Z67_1(e1,l1,m1,m2)",Z51,S44,Z67_1,scale=(1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z67_1)
    ierr=talsh_tensor_construct(Z67_1, C8, /(nvir,nocc,nocc,nocc)/, init_val=ZERO)
!   original expression: Z67_1(e1b,l1b|m1bm2b)+=S44(e1b,d1b|m1b,l2b)*H25(l1b,l2b|m2b,d1b)
    ierr=talsh_tensor_contract("Z67_1(e1,l1,m1,m2)+=S44(e1,d1,m1,l2)*H25(l1,l2,m2,d1)",Z67_1,S44,H25,scale=(1.0d0,0.0d0))
!   original expression: Z67_1(e1b,l1b|m1bm2b)+=S44(e1b,d1b|m2b,l2b)*H25(l1b,l2b|m1b,d1b)*-1.
    ierr=talsh_tensor_contract("Z67_1(e1,l1,m1,m2)+=S44(e1,d1,m2,l2)*H25(l1,l2,m1,d1)",Z67_1,S44,H25,scale=(-1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e1be2b|m1b,l1b)*Z67_1(e3b,l1b|m2bm3b)
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e1,e2,m1,l1)*Z67_1(e3,l1,m2,m3)",Z51,S44,Z67_1,scale=(1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e1be3b|m1b,l1b)*Z67_1(e2b,l1b|m2bm3b)*-1.
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e1,e3,m1,l1)*Z67_1(e2,l1,m2,m3)",Z51,S44,Z67_1,scale=(-1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e2be3b|m1b,l1b)*Z67_1(e1b,l1b|m2bm3b)
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e2,e3,m1,l1)*Z67_1(e1,l1,m2,m3)",Z51,S44,Z67_1,scale=(1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e1be2b|m2b,l1b)*Z67_1(e3b,l1b|m1bm3b)*-1.
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e1,e2,m2,l1)*Z67_1(e3,l1,m1,m3)",Z51,S44,Z67_1,scale=(-1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e1be3b|m2b,l1b)*Z67_1(e2b,l1b|m1bm3b)
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e1,e3,m2,l1)*Z67_1(e2,l1,m1,m3)",Z51,S44,Z67_1,scale=(1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e2be3b|m2b,l1b)*Z67_1(e1b,l1b|m1bm3b)*-1.
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e2,e3,m2,l1)*Z67_1(e1,l1,m1,m3)",Z51,S44,Z67_1,scale=(-1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e1be2b|m3b,l1b)*Z67_1(e3b,l1b|m1bm2b)
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e1,e2,m3,l1)*Z67_1(e3,l1,m1,m2)",Z51,S44,Z67_1,scale=(1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e1be3b|m3b,l1b)*Z67_1(e2b,l1b|m1bm2b)*-1.
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e1,e3,m3,l1)*Z67_1(e2,l1,m1,m2)",Z51,S44,Z67_1,scale=(-1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e2be3b|m3b,l1b)*Z67_1(e1b,l1b|m1bm2b)
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e2,e3,m3,l1)*Z67_1(e1,l1,m1,m2)",Z51,S44,Z67_1,scale=(1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z67_1)
    ierr=talsh_tensor_construct(Z67_1, C8, /(nvir,nocc,nocc,nocc)/, init_val=ZERO)
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e1be2b|m1b,l1b)*Z67_1(e3b,l1b|m2bm3b)
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e1,e2,m1,l1)*Z67_1(e3,l1,m2,m3)",Z51,S44,Z67_1,scale=(1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e1be3b|m1b,l1b)*Z67_1(e2b,l1b|m2bm3b)*-1.
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e1,e3,m1,l1)*Z67_1(e2,l1,m2,m3)",Z51,S44,Z67_1,scale=(-1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e2be3b|m1b,l1b)*Z67_1(e1b,l1b|m2bm3b)
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e2,e3,m1,l1)*Z67_1(e1,l1,m2,m3)",Z51,S44,Z67_1,scale=(1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e1be2b|m2b,l1b)*Z67_1(e3b,l1b|m1bm3b)*-1.
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e1,e2,m2,l1)*Z67_1(e3,l1,m1,m3)",Z51,S44,Z67_1,scale=(-1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e1be3b|m2b,l1b)*Z67_1(e2b,l1b|m1bm3b)
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e1,e3,m2,l1)*Z67_1(e2,l1,m1,m3)",Z51,S44,Z67_1,scale=(1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e2be3b|m2b,l1b)*Z67_1(e1b,l1b|m1bm3b)*-1.
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e2,e3,m2,l1)*Z67_1(e1,l1,m1,m3)",Z51,S44,Z67_1,scale=(-1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e1be2b|m3b,l1b)*Z67_1(e3b,l1b|m1bm2b)
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e1,e2,m3,l1)*Z67_1(e3,l1,m1,m2)",Z51,S44,Z67_1,scale=(1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e1be3b|m3b,l1b)*Z67_1(e2b,l1b|m1bm2b)*-1.
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e1,e3,m3,l1)*Z67_1(e2,l1,m1,m2)",Z51,S44,Z67_1,scale=(-1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e2be3b|m3b,l1b)*Z67_1(e1b,l1b|m1bm2b)
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e2,e3,m3,l1)*Z67_1(e1,l1,m1,m2)",Z51,S44,Z67_1,scale=(1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z67_1)
    ierr=talsh_tensor_construct(Z67_1, C8, /(nvir,nocc,nocc,nocc)/, init_val=ZERO)
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e1be2b|m1b,l1b)*Z67_1(e3b,l1b|m2bm3b)
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e1,e2,m1,l1)*Z67_1(e3,l1,m2,m3)",Z51,S44,Z67_1,scale=(1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e1be3b|m1b,l1b)*Z67_1(e2b,l1b|m2bm3b)*-1.
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e1,e3,m1,l1)*Z67_1(e2,l1,m2,m3)",Z51,S44,Z67_1,scale=(-1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e2be3b|m1b,l1b)*Z67_1(e1b,l1b|m2bm3b)
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e2,e3,m1,l1)*Z67_1(e1,l1,m2,m3)",Z51,S44,Z67_1,scale=(1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e1be2b|m2b,l1b)*Z67_1(e3b,l1b|m1bm3b)*-1.
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e1,e2,m2,l1)*Z67_1(e3,l1,m1,m3)",Z51,S44,Z67_1,scale=(-1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e1be3b|m2b,l1b)*Z67_1(e2b,l1b|m1bm3b)
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e1,e3,m2,l1)*Z67_1(e2,l1,m1,m3)",Z51,S44,Z67_1,scale=(1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e2be3b|m2b,l1b)*Z67_1(e1b,l1b|m1bm3b)*-1.
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e2,e3,m2,l1)*Z67_1(e1,l1,m1,m3)",Z51,S44,Z67_1,scale=(-1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e1be2b|m3b,l1b)*Z67_1(e3b,l1b|m1bm2b)
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e1,e2,m3,l1)*Z67_1(e3,l1,m1,m2)",Z51,S44,Z67_1,scale=(1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e1be3b|m3b,l1b)*Z67_1(e2b,l1b|m1bm2b)*-1.
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e1,e3,m3,l1)*Z67_1(e2,l1,m1,m2)",Z51,S44,Z67_1,scale=(-1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e2be3b|m3b,l1b)*Z67_1(e1b,l1b|m1bm2b)
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e2,e3,m3,l1)*Z67_1(e1,l1,m1,m2)",Z51,S44,Z67_1,scale=(1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z67_1)
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e1be2b|m1b,l1b)*H19(e3b,l1b|m2bm3b)
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e1,e2,m1,l1)*H19(e3,l1,m2,m3)",Z51,S44,H19,scale=(1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e1be3b|m1b,l1b)*H19(e2b,l1b|m2bm3b)*-1.
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e1,e3,m1,l1)*H19(e2,l1,m2,m3)",Z51,S44,H19,scale=(-1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e2be3b|m1b,l1b)*H19(e1b,l1b|m2bm3b)
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e2,e3,m1,l1)*H19(e1,l1,m2,m3)",Z51,S44,H19,scale=(1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e1be2b|m2b,l1b)*H19(e3b,l1b|m1bm3b)*-1.
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e1,e2,m2,l1)*H19(e3,l1,m1,m3)",Z51,S44,H19,scale=(-1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e1be3b|m2b,l1b)*H19(e2b,l1b|m1bm3b)
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e1,e3,m2,l1)*H19(e2,l1,m1,m3)",Z51,S44,H19,scale=(1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e2be3b|m2b,l1b)*H19(e1b,l1b|m1bm3b)*-1.
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e2,e3,m2,l1)*H19(e1,l1,m1,m3)",Z51,S44,H19,scale=(-1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e1be2b|m3b,l1b)*H19(e3b,l1b|m1bm2b)
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e1,e2,m3,l1)*H19(e3,l1,m1,m2)",Z51,S44,H19,scale=(1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e1be3b|m3b,l1b)*H19(e2b,l1b|m1bm2b)*-1.
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e1,e3,m3,l1)*H19(e2,l1,m1,m2)",Z51,S44,H19,scale=(-1.0d0,0.0d0))
!   original expression: Z51(e1be2be3b|m1bm2bm3b)+=S44(e2be3b|m3b,l1b)*H19(e1b,l1b|m1bm2b)
    ierr=talsh_tensor_contract("Z51(e1,e2,e3,m1,m2,m3)+=S44(e2,e3,m3,l1)*H19(e1,l1,m1,m2)",Z51,S44,H19,scale=(1.0d0,0.0d0))
    ierr=talsh_tensor_construct(Z100_3, C8, /(nocc,nocc,nocc,nvir)/, init_val=ZERO)
!   original expression: Z100_3(l1b,l2b|m1b,d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|m1b)*0.5
    ierr=talsh_tensor_contract("Z100_3(l1,l2,m1,d1)+=H24(l1,l2,d1,d2)*S43(d2,m1)",Z100_3,H24,S43,scale=(0.5d0,0.0d0))
    ierr=talsh_tensor_destruct(Z100_3)
    ierr=talsh_tensor_construct(Z90_2, C8, /(nvir,nocc,nocc,nvir)/, init_val=ZERO)
!   original expression: Z90_2(e1b,l1b|m1b,d1b)+=H17(e1b,l1b|d1b,d2b)*S43(d2b|m1b)
    ierr=talsh_tensor_contract("Z90_2(e1,l1,m1,d1)+=H17(e1,l1,d1,d2)*S43(d2,m1)",Z90_2,H17,S43,scale=(1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z90_2)
    ierr=talsh_tensor_construct(Z90_2, C8, /(nvir,nocc,nocc,nvir)/, init_val=ZERO)
!   original expression: Z90_2(e1b,l1b|m1b,d1b)+=S44(e1b,d2b|m1b,l2b)*H24(l1b,l2b|d1b,d2b)*-1.
    ierr=talsh_tensor_contract("Z90_2(e1,l1,m1,d1)+=S44(e1,d2,m1,l2)*H24(l1,l2,d1,d2)",Z90_2,S44,H24,scale=(-1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z90_2)
    ierr=talsh_tensor_construct(Z90_2, C8, /(nvir,nocc,nocc,nvir)/, init_val=ZERO)
    ierr=talsh_tensor_destruct(Z90_2)
    ierr=talsh_tensor_construct(Z61_2, C8, /(nocc,nvir)/, init_val=ZERO)
!   original expression: Z61_2(l1b|d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|l2b)*-1.
    ierr=talsh_tensor_contract("Z61_2(l1,d1)+=H24(l1,l2,d1,d2)*S43(d2,l2)",Z61_2,H24,S43,scale=(-1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z61_2)
    ierr=talsh_tensor_construct(Z61_2, C8, /(nocc,nvir)/, init_val=ZERO)
    ierr=talsh_tensor_destruct(Z61_2)
    ierr=talsh_tensor_construct(Z100_2, C8, /(nocc,nocc,nocc,nvir)/, init_val=ZERO)
!   original expression: Z100_2(l1b,l2b|m1b,d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|m1b)
    ierr=talsh_tensor_contract("Z100_2(l1,l2,m1,d1)+=H24(l1,l2,d1,d2)*S43(d2,m1)",Z100_2,H24,S43,scale=(1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z100_2)
    ierr=talsh_tensor_construct(Z71_1, C8, /(nvir,nvir,nocc,nvir)/, init_val=ZERO)
!   original expression: Z71_1(e1be2b|m1b,d1b)+=H3(e1be2b|d1b,d2b)*S43(d2b|m1b)
    ierr=talsh_tensor_contract("Z71_1(e1,e2,m1,d1)+=H3(e1,e2,d1,d2)*S43(d2,m1)",Z71_1,H3,S43,scale=(1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z71_1)
    ierr=talsh_tensor_construct(Z71_1, C8, /(nvir,nvir,nocc,nvir)/, init_val=ZERO)
!   original expression: Z71_1(e1be2b|m1b,d1b)+=H17(e1b,l1b|d1b,d2b)*S44(e2b,d2b|m1b,l1b)
    ierr=talsh_tensor_contract("Z71_1(e1,e2,m1,d1)+=H17(e1,l1,d1,d2)*S44(e2,d2,m1,l1)",Z71_1,H17,S44,scale=(1.0d0,0.0d0))
!   original expression: Z71_1(e1be2b|m1b,d1b)+=H17(e2b,l1b|d1b,d2b)*S44(e1b,d2b|m1b,l1b)*-1.
    ierr=talsh_tensor_contract("Z71_1(e1,e2,m1,d1)+=H17(e2,l1,d1,d2)*S44(e1,d2,m1,l1)",Z71_1,H17,S44,scale=(-1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z71_1)
    ierr=talsh_tensor_construct(Z71_1, C8, /(nvir,nvir,nocc,nvir)/, init_val=ZERO)
    ierr=talsh_tensor_destruct(Z71_1)
    ierr=talsh_tensor_construct(Z83_2, C8, /(nocc,nocc,nocc,nvir)/, init_val=ZERO)
!   original expression: Z83_2(l1bl2b|m1b,d1b)+=H24(l1bl2b|d1b,d2b)*S43(d2b|m1b)
    ierr=talsh_tensor_contract("Z83_2(l1,l2,m1,d1)+=H24(l1,l2,d1,d2)*S43(d2,m1)",Z83_2,H24,S43,scale=(1.0d0,0.0d0))
    ierr=talsh_tensor_construct(Z71_1, C8, /(nvir,nvir,nocc,nvir)/, init_val=ZERO)
!   original expression: Z71_1(e1be2b|m1b,d1b)+=S44(e1be2b|l1bl2b)*Z83_2(l1bl2b|m1b,d1b)
    ierr=talsh_tensor_contract("Z71_1(e1,e2,m1,d1)+=S44(e1,e2,l1,l2)*Z83_2(l1,l2,m1,d1)",Z71_1,S44,Z83_2,scale=(0.5d0,0.0d0))
    ierr=talsh_tensor_destruct(Z83_2)
    ierr=talsh_tensor_destruct(Z71_1)
    ierr=talsh_tensor_construct(Z71_1, C8, /(nvir,nvir,nocc,nvir)/, init_val=ZERO)
!   original expression: Z71_1(e1be2b|m1b,d1b)+=S44(e1be2b|l1bl2b)*H25(l1bl2b|m1b,d1b)*-1.
    ierr=talsh_tensor_contract("Z71_1(e1,e2,m1,d1)+=S44(e1,e2,l1,l2)*H25(l1,l2,m1,d1)",Z71_1,S44,H25,scale=(-0.5d0,0.0d0))
    ierr=talsh_tensor_destruct(Z71_1)
    ierr=talsh_tensor_construct(Z67_1, C8, /(nvir,nocc,nocc,nocc)/, init_val=ZERO)
!   original expression: Z67_1(e1b,l1b|m1bm2b)+=H17(e1b,l1b|d1bd2b)*S44(d1bd2b|m1bm2b)
    ierr=talsh_tensor_contract("Z67_1(e1,l1,m1,m2)+=H17(e1,l1,d1,d2)*S44(d1,d2,m1,m2)",Z67_1,H17,S44,scale=(0.5d0,0.0d0))
    ierr=talsh_tensor_destruct(Z67_1)
    ierr=talsh_tensor_construct(Z67_1, C8, /(nvir,nocc,nocc,nocc)/, init_val=ZERO)
!   original expression: Z67_1(e1b,l1b|m1bm2b)+=H26(l1b,l2b|m1bm2b)*S43(e1b|l2b)
    ierr=talsh_tensor_contract("Z67_1(e1,l1,m1,m2)+=H26(l1,l2,m1,m2)*S43(e1,l2)",Z67_1,H26,S43,scale=(1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z67_1)
    ierr=talsh_tensor_construct(Z67_1, C8, /(nvir,nocc,nocc,nocc)/, init_val=ZERO)
!   original expression: Z67_1(e1b,l1b|m1bm2b)+=H18(e1b,l1b|m1b,d1b)*S43(d1b|m2b)
    ierr=talsh_tensor_contract("Z67_1(e1,l1,m1,m2)+=H18(e1,l1,m1,d1)*S43(d1,m2)",Z67_1,H18,S43,scale=(1.0d0,0.0d0))
!   original expression: Z67_1(e1b,l1b|m1bm2b)+=H18(e1b,l1b|m2b,d1b)*S43(d1b|m1b)*-1.
    ierr=talsh_tensor_contract("Z67_1(e1,l1,m1,m2)+=H18(e1,l1,m2,d1)*S43(d1,m1)",Z67_1,H18,S43,scale=(-1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z67_1)
    ierr=talsh_tensor_construct(Z81_2, C8, /(nocc,nocc,nocc,nocc)/, init_val=ZERO)
!   original expression: Z81_2(l1b,l2b|m1bm2b)+=H24(l1b,l2b|d1bd2b)*S44(d1bd2b|m1bm2b)
    ierr=talsh_tensor_contract("Z81_2(l1,l2,m1,m2)+=H24(l1,l2,d1,d2)*S44(d1,d2,m1,m2)",Z81_2,H24,S44,scale=(0.5d0,0.0d0))
    ierr=talsh_tensor_construct(Z67_1, C8, /(nvir,nocc,nocc,nocc)/, init_val=ZERO)
!   original expression: Z67_1(e1b,l1b|m1bm2b)+=S43(e1b|l2b)*Z81_2(l1b,l2b|m1bm2b)
    ierr=talsh_tensor_contract("Z67_1(e1,l1,m1,m2)+=S43(e1,l2)*Z81_2(l1,l2,m1,m2)",Z67_1,S43,Z81_2,scale=(1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z81_2)
    ierr=talsh_tensor_destruct(Z67_1)
    ierr=talsh_tensor_construct(Z81_2, C8, /(nocc,nocc,nocc,nocc)/, init_val=ZERO)
!   original expression: Z81_2(l1b,l2b|m1bm2b)+=H25(l1b,l2b|m1b,d1b)*S43(d1b|m2b)
    ierr=talsh_tensor_contract("Z81_2(l1,l2,m1,m2)+=H25(l1,l2,m1,d1)*S43(d1,m2)",Z81_2,H25,S43,scale=(1.0d0,0.0d0))
!   original expression: Z81_2(l1b,l2b|m1bm2b)+=H25(l1b,l2b|m2b,d1b)*S43(d1b|m1b)*-1.
    ierr=talsh_tensor_contract("Z81_2(l1,l2,m1,m2)+=H25(l1,l2,m2,d1)*S43(d1,m1)",Z81_2,H25,S43,scale=(-1.0d0,0.0d0))
    ierr=talsh_tensor_construct(Z67_1, C8, /(nvir,nocc,nocc,nocc)/, init_val=ZERO)
!   original expression: Z67_1(e1b,l1b|m1bm2b)+=S43(e1b|l2b)*Z81_2(l1b,l2b|m1bm2b)
    ierr=talsh_tensor_contract("Z67_1(e1,l1,m1,m2)+=S43(e1,l2)*Z81_2(l1,l2,m1,m2)",Z67_1,S43,Z81_2,scale=(1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z81_2)
    ierr=talsh_tensor_destruct(Z67_1)
    ierr=talsh_tensor_construct(Z100_3, C8, /(nocc,nocc,nocc,nvir)/, init_val=ZERO)
!   original expression: Z100_3(l1b,l2b|m1b,d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|m1b)*0.5
    ierr=talsh_tensor_contract("Z100_3(l1,l2,m1,d1)+=H24(l1,l2,d1,d2)*S43(d2,m1)",Z100_3,H24,S43,scale=(0.5d0,0.0d0))
    ierr=talsh_tensor_construct(Z81_2, C8, /(nocc,nocc,nocc,nocc)/, init_val=ZERO)
!   original expression: Z81_2(l1b,l2b|m1bm2b)+=S43(d1b|m1b)*Z100_3(l1b,l2b|m2b,d1b)
    ierr=talsh_tensor_contract("Z81_2(l1,l2,m1,m2)+=S43(d1,m1)*Z100_3(l1,l2,m2,d1)",Z81_2,S43,Z100_3,scale=(1.0d0,0.0d0))
!   original expression: Z81_2(l1b,l2b|m1bm2b)+=S43(d1b|m2b)*Z100_3(l1b,l2b|m1b,d1b)*-1.
    ierr=talsh_tensor_contract("Z81_2(l1,l2,m1,m2)+=S43(d1,m2)*Z100_3(l1,l2,m1,d1)",Z81_2,S43,Z100_3,scale=(-1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z100_3)
    ierr=talsh_tensor_construct(Z67_1, C8, /(nvir,nocc,nocc,nocc)/, init_val=ZERO)
!   original expression: Z67_1(e1b,l1b|m1bm2b)+=S43(e1b|l2b)*Z81_2(l1b,l2b|m1bm2b)
    ierr=talsh_tensor_contract("Z67_1(e1,l1,m1,m2)+=S43(e1,l2)*Z81_2(l1,l2,m1,m2)",Z67_1,S43,Z81_2,scale=(1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z81_2)
    ierr=talsh_tensor_destruct(Z67_1)
    ierr=talsh_tensor_construct(Z90_2, C8, /(nvir,nocc,nocc,nvir)/, init_val=ZERO)
!   original expression: Z90_2(e1b,l1b|m1b,d1b)+=H17(e1b,l1b|d1b,d2b)*S43(d2b|m1b)*0.5
    ierr=talsh_tensor_contract("Z90_2(e1,l1,m1,d1)+=H17(e1,l1,d1,d2)*S43(d2,m1)",Z90_2,H17,S43,scale=(0.5d0,0.0d0))
    ierr=talsh_tensor_construct(Z67_1, C8, /(nvir,nocc,nocc,nocc)/, init_val=ZERO)
!   original expression: Z67_1(e1b,l1b|m1bm2b)+=S43(d1b|m1b)*Z90_2(e1b,l1b|m2b,d1b)
    ierr=talsh_tensor_contract("Z67_1(e1,l1,m1,m2)+=S43(d1,m1)*Z90_2(e1,l1,m2,d1)",Z67_1,S43,Z90_2,scale=(1.0d0,0.0d0))
!   original expression: Z67_1(e1b,l1b|m1bm2b)+=S43(d1b|m2b)*Z90_2(e1b,l1b|m1b,d1b)*-1.
    ierr=talsh_tensor_contract("Z67_1(e1,l1,m1,m2)+=S43(d1,m2)*Z90_2(e1,l1,m1,d1)",Z67_1,S43,Z90_2,scale=(-1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z90_2)
    ierr=talsh_tensor_destruct(Z67_1)
    ierr=talsh_tensor_construct(Z61_2, C8, /(nocc,nvir)/, init_val=ZERO)
!   original expression: Z61_2(l1b|d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|l2b)
    ierr=talsh_tensor_contract("Z61_2(l1,d1)+=H24(l1,l2,d1,d2)*S43(d2,l2)",Z61_2,H24,S43,scale=(1.0d0,0.0d0))
    ierr=talsh_tensor_construct(Z67_1, C8, /(nvir,nocc,nocc,nocc)/, init_val=ZERO)
!   original expression: Z67_1(e1b,l1b|m1bm2b)+=S44(e1b,d1b|m1bm2b)*Z61_2(l1b|d1b)
    ierr=talsh_tensor_contract("Z67_1(e1,l1,m1,m2)+=S44(e1,d1,m1,m2)*Z61_2(l1,d1)",Z67_1,S44,Z61_2,scale=(1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z61_2)
    ierr=talsh_tensor_destruct(Z67_1)
    ierr=talsh_tensor_construct(Z61_2, C8, /(nocc,nvir)/, init_val=ZERO)
    ierr=talsh_tensor_construct(Z67_1, C8, /(nvir,nocc,nocc,nocc)/, init_val=ZERO)
!   original expression: Z67_1(e1b,l1b|m1bm2b)+=S44(e1b,d1b|m1bm2b)*Z61_2(l1b|d1b)
    ierr=talsh_tensor_contract("Z67_1(e1,l1,m1,m2)+=S44(e1,d1,m1,m2)*Z61_2(l1,d1)",Z67_1,S44,Z61_2,scale=(1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z61_2)
    ierr=talsh_tensor_destruct(Z67_1)
    ierr=talsh_tensor_construct(Z67_1, C8, /(nvir,nocc,nocc,nocc)/, init_val=ZERO)
!   original expression: Z67_1(e1b,l1b|m1bm2b)+=S44(e1b,d1b|m1bm2b)*H15(l1b|d1b)
    ierr=talsh_tensor_contract("Z67_1(e1,l1,m1,m2)+=S44(e1,d1,m1,m2)*H15(l1,d1)",Z67_1,S44,H15,scale=(1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z67_1)
    ierr=talsh_tensor_construct(Z100_2, C8, /(nocc,nocc,nocc,nvir)/, init_val=ZERO)
!   original expression: Z100_2(l1b,l2b|m1b,d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|m1b)*-1.
    ierr=talsh_tensor_contract("Z100_2(l1,l2,m1,d1)+=H24(l1,l2,d1,d2)*S43(d2,m1)",Z100_2,H24,S43,scale=(-1.0d0,0.0d0))
    ierr=talsh_tensor_construct(Z67_1, C8, /(nvir,nocc,nocc,nocc)/, init_val=ZERO)
!   original expression: Z67_1(e1b,l1b|m1bm2b)+=S44(e1b,d1b|m1b,l2b)*Z100_2(l1b,l2b|m2b,d1b)
    ierr=talsh_tensor_contract("Z67_1(e1,l1,m1,m2)+=S44(e1,d1,m1,l2)*Z100_2(l1,l2,m2,d1)",Z67_1,S44,Z100_2,scale=(1.0d0,0.0d0))
!   original expression: Z67_1(e1b,l1b|m1bm2b)+=S44(e1b,d1b|m2b,l2b)*Z100_2(l1b,l2b|m1b,d1b)*-1.
    ierr=talsh_tensor_contract("Z67_1(e1,l1,m1,m2)+=S44(e1,d1,m2,l2)*Z100_2(l1,l2,m1,d1)",Z67_1,S44,Z100_2,scale=(-1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z100_2)
    ierr=talsh_tensor_destruct(Z67_1)
    ierr=talsh_tensor_construct(Z67_1, C8, /(nvir,nocc,nocc,nocc)/, init_val=ZERO)
!   original expression: Z67_1(e1b,l1b|m1bm2b)+=S44(e1b,d1b|m1b,l2b)*H25(l1b,l2b|m2b,d1b)
    ierr=talsh_tensor_contract("Z67_1(e1,l1,m1,m2)+=S44(e1,d1,m1,l2)*H25(l1,l2,m2,d1)",Z67_1,S44,H25,scale=(1.0d0,0.0d0))
!   original expression: Z67_1(e1b,l1b|m1bm2b)+=S44(e1b,d1b|m2b,l2b)*H25(l1b,l2b|m1b,d1b)*-1.
    ierr=talsh_tensor_contract("Z67_1(e1,l1,m1,m2)+=S44(e1,d1,m2,l2)*H25(l1,l2,m1,d1)",Z67_1,S44,H25,scale=(-1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z67_1)
    ierr=talsh_tensor_construct(Z67_1, C8, /(nvir,nocc,nocc,nocc)/, init_val=ZERO)
    ierr=talsh_tensor_destruct(Z67_1)
    ierr=talsh_tensor_construct(Z67_1, C8, /(nvir,nocc,nocc,nocc)/, init_val=ZERO)
    ierr=talsh_tensor_destruct(Z67_1)
    ierr=talsh_tensor_construct(Z61_2, C8, /(nocc,nvir)/, init_val=ZERO)
!   original expression: Z61_2(l1b|d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|l2b)*-1.
    ierr=talsh_tensor_contract("Z61_2(l1,d1)+=H24(l1,l2,d1,d2)*S43(d2,l2)",Z61_2,H24,S43,scale=(-1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z61_2)
    ierr=talsh_tensor_construct(Z61_2, C8, /(nocc,nvir)/, init_val=ZERO)
    ierr=talsh_tensor_destruct(Z61_2)
    ierr=talsh_tensor_construct(Z100_2, C8, /(nocc,nocc,nocc,nvir)/, init_val=ZERO)
!   original expression: Z100_2(l1b,l2b|m1b,d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|m1b)
    ierr=talsh_tensor_contract("Z100_2(l1,l2,m1,d1)+=H24(l1,l2,d1,d2)*S43(d2,m1)",Z100_2,H24,S43,scale=(1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z100_2)


end subroutine generic_codegen_call
