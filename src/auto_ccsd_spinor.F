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
    Z50)
    integer, intent(in) :: nocc
    integer, intent(in) :: nvir
    type(talsh_tensor_t), intent(inout) :: H24    !       OOVV
    type(talsh_tensor_t), intent(inout) :: S43    !       VO
    type(talsh_tensor_t), intent(inout) :: H15    !       OV
    type(talsh_tensor_t), intent(inout) :: S44    !       VVOO
    type(talsh_tensor_t), intent(inout) :: H2    !       VO
    type(talsh_tensor_t), intent(inout) :: H1    !       VV
    type(talsh_tensor_t), intent(inout) :: H17    !       VOVV
    type(talsh_tensor_t), intent(inout) :: H18    !       VOOV
    type(talsh_tensor_t), intent(inout) :: H25    !       OOOV
    type(talsh_tensor_t), intent(inout) :: H16    !       OO
    type(talsh_tensor_t), intent(inout) :: H5    !       VVOO
    type(talsh_tensor_t), intent(inout) :: H3    !       VVVV
    type(talsh_tensor_t), intent(inout) :: H19    !       VOOO
    type(talsh_tensor_t), intent(inout) :: H4    !       VVOV
    type(talsh_tensor_t), intent(inout) :: H26    !       OOOO
    type(talsh_tensor_t), intent(inout) :: Z48    !       UnitTensor
    type(talsh_tensor_t), intent(inout) :: Z49    !       VO
    type(talsh_tensor_t), intent(inout) :: Z50    !       VVOO
    type(talsh_tensor_t) :: Z57_1    !       OV
    type(talsh_tensor_t) :: Z56_1    !       OO
    type(talsh_tensor_t) :: Z57_2    !       OV
    type(talsh_tensor_t) :: Z54_1    !       VV
    type(talsh_tensor_t) :: Z72_1    !       OOOV
    type(talsh_tensor_t) :: Z63_1    !       VOOO
    type(talsh_tensor_t) :: Z70_2    !       OOOO
    type(talsh_tensor_t) :: Z83_3    !       OOOV
    type(talsh_tensor_t) :: Z77_2    !       VOOV
    type(talsh_tensor_t) :: Z83_2    !       OOOV
    type(talsh_tensor_t) :: Z65_1    !       VVOV
    type(talsh_tensor_t) :: Z58_1    !       OOOO
    type(talsh_tensor_t) :: Z72_2    !       OOOV
    type(talsh_tensor_t) :: Z77_1    !       VOOV


    ierr=talsh_tensor_construct(Z57_1, C8, /(nocc,nvir)/, init_val=ZERO)
!   original expression: Z57_1(l1b|d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|l2b)*0.5
    ierr=talsh_tensor_contract("Z57_1(l1,d1)+=H24(l1,l2,d1,d2)*S43(d2,l2)",Z57_1,H24,S43,scale=(0.5d0,0.0d0))
!   original expression: Z48(|)+=S43(d1b|l1b)*Z57_1(l1b|d1b)
    ierr=talsh_tensor_contract("Z48()+=S43(d1,l1)*Z57_1(l1,d1)",Z48,S43,Z57_1,scale=(1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z57_1)
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
    ierr=talsh_tensor_construct(Z56_1, C8, /(nocc,nocc)/, init_val=ZERO)
!   original expression: Z56_1(l1b|m1b)+=H25(l1b,l2b|m1b,d1b)*S43(d1b|l2b)*-1.
    ierr=talsh_tensor_contract("Z56_1(l1,m1)+=H25(l1,l2,m1,d1)*S43(d1,l2)",Z56_1,H25,S43,scale=(-1.0d0,0.0d0))
!   original expression: Z49(e1b|m1b)+=S43(e1b|l1b)*Z56_1(l1b|m1b)
    ierr=talsh_tensor_contract("Z49(e1,m1)+=S43(e1,l1)*Z56_1(l1,m1)",Z49,S43,Z56_1,scale=(1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z56_1)
    ierr=talsh_tensor_construct(Z56_1, C8, /(nocc,nocc)/, init_val=ZERO)
!   original expression: Z49(e1b|m1b)+=S43(e1b|l1b)*Z56_1(l1b|m1b)
    ierr=talsh_tensor_contract("Z49(e1,m1)+=S43(e1,l1)*Z56_1(l1,m1)",Z49,S43,Z56_1,scale=(1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z56_1)
    ierr=talsh_tensor_construct(Z57_2, C8, /(nocc,nvir)/, init_val=ZERO)
!   original expression: Z57_2(l1b|d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|l2b)*-1.
    ierr=talsh_tensor_contract("Z57_2(l1,d1)+=H24(l1,l2,d1,d2)*S43(d2,l2)",Z57_2,H24,S43,scale=(-1.0d0,0.0d0))
    ierr=talsh_tensor_construct(Z56_1, C8, /(nocc,nocc)/, init_val=ZERO)
!   original expression: Z56_1(l1b|m1b)+=S43(d1b|m1b)*Z57_2(l1b|d1b)
    ierr=talsh_tensor_contract("Z56_1(l1,m1)+=S43(d1,m1)*Z57_2(l1,d1)",Z56_1,S43,Z57_2,scale=(1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z57_2)
!   original expression: Z49(e1b|m1b)+=S43(e1b|l1b)*Z56_1(l1b|m1b)
    ierr=talsh_tensor_contract("Z49(e1,m1)+=S43(e1,l1)*Z56_1(l1,m1)",Z49,S43,Z56_1,scale=(1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z56_1)
    ierr=talsh_tensor_construct(Z57_2, C8, /(nocc,nvir)/, init_val=ZERO)
    ierr=talsh_tensor_construct(Z56_1, C8, /(nocc,nocc)/, init_val=ZERO)
!   original expression: Z56_1(l1b|m1b)+=S43(d1b|m1b)*Z57_2(l1b|d1b)
    ierr=talsh_tensor_contract("Z56_1(l1,m1)+=S43(d1,m1)*Z57_2(l1,d1)",Z56_1,S43,Z57_2,scale=(1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z57_2)
!   original expression: Z49(e1b|m1b)+=S43(e1b|l1b)*Z56_1(l1b|m1b)
    ierr=talsh_tensor_contract("Z49(e1,m1)+=S43(e1,l1)*Z56_1(l1,m1)",Z49,S43,Z56_1,scale=(1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z56_1)
    ierr=talsh_tensor_construct(Z56_1, C8, /(nocc,nocc)/, init_val=ZERO)
!   original expression: Z56_1(l1b|m1b)+=S43(d1b|m1b)*H15(l1b|d1b)*-1.
    ierr=talsh_tensor_contract("Z56_1(l1,m1)+=S43(d1,m1)*H15(l1,d1)",Z56_1,S43,H15,scale=(-1.0d0,0.0d0))
!   original expression: Z49(e1b|m1b)+=S43(e1b|l1b)*Z56_1(l1b|m1b)
    ierr=talsh_tensor_contract("Z49(e1,m1)+=S43(e1,l1)*Z56_1(l1,m1)",Z49,S43,Z56_1,scale=(1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z56_1)
    ierr=talsh_tensor_construct(Z56_1, C8, /(nocc,nocc)/, init_val=ZERO)
!   original expression: Z56_1(l1b|m1b)+=S44(d1bd2b|m1b,l2b)*H24(l1b,l2b|d1bd2b)*-1.
    ierr=talsh_tensor_contract("Z56_1(l1,m1)+=S44(d1,d2,m1,l2)*H24(l1,l2,d1,d2)",Z56_1,S44,H24,scale=(-0.5d0,0.0d0))
!   original expression: Z49(e1b|m1b)+=S43(e1b|l1b)*Z56_1(l1b|m1b)
    ierr=talsh_tensor_contract("Z49(e1,m1)+=S43(e1,l1)*Z56_1(l1,m1)",Z49,S43,Z56_1,scale=(1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z56_1)
    ierr=talsh_tensor_construct(Z56_1, C8, /(nocc,nocc)/, init_val=ZERO)
!   original expression: Z49(e1b|m1b)+=S43(e1b|l1b)*Z56_1(l1b|m1b)
    ierr=talsh_tensor_contract("Z49(e1,m1)+=S43(e1,l1)*Z56_1(l1,m1)",Z49,S43,Z56_1,scale=(1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z56_1)
!   original expression: Z49(e1b|m1b)+=S43(e1b|l1b)*H16(l1b|m1b)*-1.
    ierr=talsh_tensor_contract("Z49(e1,m1)+=S43(e1,l1)*H16(l1,m1)",Z49,S43,H16,scale=(-1.0d0,0.0d0))
    ierr=talsh_tensor_construct(Z54_1, C8, /(nvir,nvir)/, init_val=ZERO)
!   original expression: Z54_1(e1b|d1b)+=H17(e1b,l1b|d1b,d2b)*S43(d2b|l1b)
    ierr=talsh_tensor_contract("Z54_1(e1,d1)+=H17(e1,l1,d1,d2)*S43(d2,l1)",Z54_1,H17,S43,scale=(1.0d0,0.0d0))
!   original expression: Z49(e1b|m1b)+=S43(d1b|m1b)*Z54_1(e1b|d1b)
    ierr=talsh_tensor_contract("Z49(e1,m1)+=S43(d1,m1)*Z54_1(e1,d1)",Z49,S43,Z54_1,scale=(1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z54_1)
    ierr=talsh_tensor_construct(Z54_1, C8, /(nvir,nvir)/, init_val=ZERO)
!   original expression: Z49(e1b|m1b)+=S43(d1b|m1b)*Z54_1(e1b|d1b)
    ierr=talsh_tensor_contract("Z49(e1,m1)+=S43(d1,m1)*Z54_1(e1,d1)",Z49,S43,Z54_1,scale=(1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z54_1)
    ierr=talsh_tensor_construct(Z72_1, C8, /(nocc,nocc,nocc,nvir)/, init_val=ZERO)
!   original expression: Z72_1(l1bl2b|m1b,d1b)+=H24(l1bl2b|d1b,d2b)*S43(d2b|m1b)
    ierr=talsh_tensor_contract("Z72_1(l1,l2,m1,d1)+=H24(l1,l2,d1,d2)*S43(d2,m1)",Z72_1,H24,S43,scale=(1.0d0,0.0d0))
!   original expression: Z49(e1b|m1b)+=S44(e1b,d1b|l1bl2b)*Z72_1(l1bl2b|m1b,d1b)
    ierr=talsh_tensor_contract("Z49(e1,m1)+=S44(e1,d1,l1,l2)*Z72_1(l1,l2,m1,d1)",Z49,S44,Z72_1,scale=(0.5d0,0.0d0))
    ierr=talsh_tensor_destruct(Z72_1)
!   original expression: Z49(e1b|m1b)+=S44(e1b,d1b|l1bl2b)*H25(l1bl2b|m1b,d1b)*-1.
    ierr=talsh_tensor_contract("Z49(e1,m1)+=S44(e1,d1,l1,l2)*H25(l1,l2,m1,d1)",Z49,S44,H25,scale=(-0.5d0,0.0d0))
    ierr=talsh_tensor_construct(Z57_1, C8, /(nocc,nvir)/, init_val=ZERO)
!   original expression: Z57_1(l1b|d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|l2b)
    ierr=talsh_tensor_contract("Z57_1(l1,d1)+=H24(l1,l2,d1,d2)*S43(d2,l2)",Z57_1,H24,S43,scale=(1.0d0,0.0d0))
!   original expression: Z49(e1b|m1b)+=S44(e1b,d1b|m1b,l1b)*Z57_1(l1b|d1b)
    ierr=talsh_tensor_contract("Z49(e1,m1)+=S44(e1,d1,m1,l1)*Z57_1(l1,d1)",Z49,S44,Z57_1,scale=(1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z57_1)
    ierr=talsh_tensor_construct(Z57_1, C8, /(nocc,nvir)/, init_val=ZERO)
!   original expression: Z49(e1b|m1b)+=S44(e1b,d1b|m1b,l1b)*Z57_1(l1b|d1b)
    ierr=talsh_tensor_contract("Z49(e1,m1)+=S44(e1,d1,m1,l1)*Z57_1(l1,d1)",Z49,S44,Z57_1,scale=(1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z57_1)
!   original expression: Z49(e1b|m1b)+=S44(e1b,d1b|m1b,l1b)*H15(l1b|d1b)
    ierr=talsh_tensor_contract("Z49(e1,m1)+=S44(e1,d1,m1,l1)*H15(l1,d1)",Z49,S44,H15,scale=(1.0d0,0.0d0))
    ierr=talsh_tensor_construct(Z57_1, C8, /(nocc,nvir)/, init_val=ZERO)
!   original expression: Z57_1(l1b|d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|l2b)
    ierr=talsh_tensor_contract("Z57_1(l1,d1)+=H24(l1,l2,d1,d2)*S43(d2,l2)",Z57_1,H24,S43,scale=(1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z57_1)
    ierr=talsh_tensor_construct(Z57_1, C8, /(nocc,nvir)/, init_val=ZERO)
    ierr=talsh_tensor_destruct(Z57_1)
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
    ierr=talsh_tensor_construct(Z63_1, C8, /(nvir,nocc,nocc,nocc)/, init_val=ZERO)
!   original expression: Z63_1(e1b,l1b|m1bm2b)+=H17(e1b,l1b|d1bd2b)*S44(d1bd2b|m1bm2b)
    ierr=talsh_tensor_contract("Z63_1(e1,l1,m1,m2)+=H17(e1,l1,d1,d2)*S44(d1,d2,m1,m2)",Z63_1,H17,S44,scale=(0.5d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S43(e1b|l1b)*Z63_1(e2b,l1b|m1bm2b)
    ierr=talsh_tensor_contract("Z50(e1,e2,m1,m2)+=S43(e1,l1)*Z63_1(e2,l1,m1,m2)",Z50,S43,Z63_1,scale=(1.0d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S43(e2b|l1b)*Z63_1(e1b,l1b|m1bm2b)*-1.
    ierr=talsh_tensor_contract("Z50(e1,e2,m1,m2)+=S43(e2,l1)*Z63_1(e1,l1,m1,m2)",Z50,S43,Z63_1,scale=(-1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z63_1)
    ierr=talsh_tensor_construct(Z63_1, C8, /(nvir,nocc,nocc,nocc)/, init_val=ZERO)
!   original expression: Z63_1(e1b,l1b|m1bm2b)+=H26(l1b,l2b|m1bm2b)*S43(e1b|l2b)*0.5
    ierr=talsh_tensor_contract("Z63_1(e1,l1,m1,m2)+=H26(l1,l2,m1,m2)*S43(e1,l2)",Z63_1,H26,S43,scale=(0.5d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S43(e1b|l1b)*Z63_1(e2b,l1b|m1bm2b)
    ierr=talsh_tensor_contract("Z50(e1,e2,m1,m2)+=S43(e1,l1)*Z63_1(e2,l1,m1,m2)",Z50,S43,Z63_1,scale=(1.0d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S43(e2b|l1b)*Z63_1(e1b,l1b|m1bm2b)*-1.
    ierr=talsh_tensor_contract("Z50(e1,e2,m1,m2)+=S43(e2,l1)*Z63_1(e1,l1,m1,m2)",Z50,S43,Z63_1,scale=(-1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z63_1)
    ierr=talsh_tensor_construct(Z63_1, C8, /(nvir,nocc,nocc,nocc)/, init_val=ZERO)
!   original expression: Z63_1(e1b,l1b|m1bm2b)+=H18(e1b,l1b|m1b,d1b)*S43(d1b|m2b)
    ierr=talsh_tensor_contract("Z63_1(e1,l1,m1,m2)+=H18(e1,l1,m1,d1)*S43(d1,m2)",Z63_1,H18,S43,scale=(1.0d0,0.0d0))
!   original expression: Z63_1(e1b,l1b|m1bm2b)+=H18(e1b,l1b|m2b,d1b)*S43(d1b|m1b)*-1.
    ierr=talsh_tensor_contract("Z63_1(e1,l1,m1,m2)+=H18(e1,l1,m2,d1)*S43(d1,m1)",Z63_1,H18,S43,scale=(-1.0d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S43(e1b|l1b)*Z63_1(e2b,l1b|m1bm2b)
    ierr=talsh_tensor_contract("Z50(e1,e2,m1,m2)+=S43(e1,l1)*Z63_1(e2,l1,m1,m2)",Z50,S43,Z63_1,scale=(1.0d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S43(e2b|l1b)*Z63_1(e1b,l1b|m1bm2b)*-1.
    ierr=talsh_tensor_contract("Z50(e1,e2,m1,m2)+=S43(e2,l1)*Z63_1(e1,l1,m1,m2)",Z50,S43,Z63_1,scale=(-1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z63_1)
    ierr=talsh_tensor_construct(Z70_2, C8, /(nocc,nocc,nocc,nocc)/, init_val=ZERO)
!   original expression: Z70_2(l1b,l2b|m1bm2b)+=H24(l1b,l2b|d1bd2b)*S44(d1bd2b|m1bm2b)*0.5
    ierr=talsh_tensor_contract("Z70_2(l1,l2,m1,m2)+=H24(l1,l2,d1,d2)*S44(d1,d2,m1,m2)",Z70_2,H24,S44,scale=(0.25d0,0.0d0))
    ierr=talsh_tensor_construct(Z63_1, C8, /(nvir,nocc,nocc,nocc)/, init_val=ZERO)
!   original expression: Z63_1(e1b,l1b|m1bm2b)+=S43(e1b|l2b)*Z70_2(l1b,l2b|m1bm2b)
    ierr=talsh_tensor_contract("Z63_1(e1,l1,m1,m2)+=S43(e1,l2)*Z70_2(l1,l2,m1,m2)",Z63_1,S43,Z70_2,scale=(1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z70_2)
!   original expression: Z50(e1be2b|m1bm2b)+=S43(e1b|l1b)*Z63_1(e2b,l1b|m1bm2b)
    ierr=talsh_tensor_contract("Z50(e1,e2,m1,m2)+=S43(e1,l1)*Z63_1(e2,l1,m1,m2)",Z50,S43,Z63_1,scale=(1.0d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S43(e2b|l1b)*Z63_1(e1b,l1b|m1bm2b)*-1.
    ierr=talsh_tensor_contract("Z50(e1,e2,m1,m2)+=S43(e2,l1)*Z63_1(e1,l1,m1,m2)",Z50,S43,Z63_1,scale=(-1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z63_1)
    ierr=talsh_tensor_construct(Z70_2, C8, /(nocc,nocc,nocc,nocc)/, init_val=ZERO)
!   original expression: Z70_2(l1b,l2b|m1bm2b)+=H25(l1b,l2b|m1b,d1b)*S43(d1b|m2b)*0.5
    ierr=talsh_tensor_contract("Z70_2(l1,l2,m1,m2)+=H25(l1,l2,m1,d1)*S43(d1,m2)",Z70_2,H25,S43,scale=(0.5d0,0.0d0))
!   original expression: Z70_2(l1b,l2b|m1bm2b)+=H25(l1b,l2b|m2b,d1b)*S43(d1b|m1b)*-0.5
    ierr=talsh_tensor_contract("Z70_2(l1,l2,m1,m2)+=H25(l1,l2,m2,d1)*S43(d1,m1)",Z70_2,H25,S43,scale=(-0.5d0,0.0d0))
    ierr=talsh_tensor_construct(Z63_1, C8, /(nvir,nocc,nocc,nocc)/, init_val=ZERO)
!   original expression: Z63_1(e1b,l1b|m1bm2b)+=S43(e1b|l2b)*Z70_2(l1b,l2b|m1bm2b)
    ierr=talsh_tensor_contract("Z63_1(e1,l1,m1,m2)+=S43(e1,l2)*Z70_2(l1,l2,m1,m2)",Z63_1,S43,Z70_2,scale=(1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z70_2)
!   original expression: Z50(e1be2b|m1bm2b)+=S43(e1b|l1b)*Z63_1(e2b,l1b|m1bm2b)
    ierr=talsh_tensor_contract("Z50(e1,e2,m1,m2)+=S43(e1,l1)*Z63_1(e2,l1,m1,m2)",Z50,S43,Z63_1,scale=(1.0d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S43(e2b|l1b)*Z63_1(e1b,l1b|m1bm2b)*-1.
    ierr=talsh_tensor_contract("Z50(e1,e2,m1,m2)+=S43(e2,l1)*Z63_1(e1,l1,m1,m2)",Z50,S43,Z63_1,scale=(-1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z63_1)
    ierr=talsh_tensor_construct(Z83_3, C8, /(nocc,nocc,nocc,nvir)/, init_val=ZERO)
!   original expression: Z83_3(l1b,l2b|m1b,d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|m1b)*0.25
    ierr=talsh_tensor_contract("Z83_3(l1,l2,m1,d1)+=H24(l1,l2,d1,d2)*S43(d2,m1)",Z83_3,H24,S43,scale=(0.25d0,0.0d0))
    ierr=talsh_tensor_construct(Z70_2, C8, /(nocc,nocc,nocc,nocc)/, init_val=ZERO)
!   original expression: Z70_2(l1b,l2b|m1bm2b)+=S43(d1b|m1b)*Z83_3(l1b,l2b|m2b,d1b)
    ierr=talsh_tensor_contract("Z70_2(l1,l2,m1,m2)+=S43(d1,m1)*Z83_3(l1,l2,m2,d1)",Z70_2,S43,Z83_3,scale=(1.0d0,0.0d0))
!   original expression: Z70_2(l1b,l2b|m1bm2b)+=S43(d1b|m2b)*Z83_3(l1b,l2b|m1b,d1b)*-1.
    ierr=talsh_tensor_contract("Z70_2(l1,l2,m1,m2)+=S43(d1,m2)*Z83_3(l1,l2,m1,d1)",Z70_2,S43,Z83_3,scale=(-1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z83_3)
    ierr=talsh_tensor_construct(Z63_1, C8, /(nvir,nocc,nocc,nocc)/, init_val=ZERO)
!   original expression: Z63_1(e1b,l1b|m1bm2b)+=S43(e1b|l2b)*Z70_2(l1b,l2b|m1bm2b)
    ierr=talsh_tensor_contract("Z63_1(e1,l1,m1,m2)+=S43(e1,l2)*Z70_2(l1,l2,m1,m2)",Z63_1,S43,Z70_2,scale=(1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z70_2)
!   original expression: Z50(e1be2b|m1bm2b)+=S43(e1b|l1b)*Z63_1(e2b,l1b|m1bm2b)
    ierr=talsh_tensor_contract("Z50(e1,e2,m1,m2)+=S43(e1,l1)*Z63_1(e2,l1,m1,m2)",Z50,S43,Z63_1,scale=(1.0d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S43(e2b|l1b)*Z63_1(e1b,l1b|m1bm2b)*-1.
    ierr=talsh_tensor_contract("Z50(e1,e2,m1,m2)+=S43(e2,l1)*Z63_1(e1,l1,m1,m2)",Z50,S43,Z63_1,scale=(-1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z63_1)
    ierr=talsh_tensor_construct(Z77_2, C8, /(nvir,nocc,nocc,nvir)/, init_val=ZERO)
!   original expression: Z77_2(e1b,l1b|m1b,d1b)+=H17(e1b,l1b|d1b,d2b)*S43(d2b|m1b)*0.5
    ierr=talsh_tensor_contract("Z77_2(e1,l1,m1,d1)+=H17(e1,l1,d1,d2)*S43(d2,m1)",Z77_2,H17,S43,scale=(0.5d0,0.0d0))
    ierr=talsh_tensor_construct(Z63_1, C8, /(nvir,nocc,nocc,nocc)/, init_val=ZERO)
!   original expression: Z63_1(e1b,l1b|m1bm2b)+=S43(d1b|m1b)*Z77_2(e1b,l1b|m2b,d1b)
    ierr=talsh_tensor_contract("Z63_1(e1,l1,m1,m2)+=S43(d1,m1)*Z77_2(e1,l1,m2,d1)",Z63_1,S43,Z77_2,scale=(1.0d0,0.0d0))
!   original expression: Z63_1(e1b,l1b|m1bm2b)+=S43(d1b|m2b)*Z77_2(e1b,l1b|m1b,d1b)*-1.
    ierr=talsh_tensor_contract("Z63_1(e1,l1,m1,m2)+=S43(d1,m2)*Z77_2(e1,l1,m1,d1)",Z63_1,S43,Z77_2,scale=(-1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z77_2)
!   original expression: Z50(e1be2b|m1bm2b)+=S43(e1b|l1b)*Z63_1(e2b,l1b|m1bm2b)
    ierr=talsh_tensor_contract("Z50(e1,e2,m1,m2)+=S43(e1,l1)*Z63_1(e2,l1,m1,m2)",Z50,S43,Z63_1,scale=(1.0d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S43(e2b|l1b)*Z63_1(e1b,l1b|m1bm2b)*-1.
    ierr=talsh_tensor_contract("Z50(e1,e2,m1,m2)+=S43(e2,l1)*Z63_1(e1,l1,m1,m2)",Z50,S43,Z63_1,scale=(-1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z63_1)
    ierr=talsh_tensor_construct(Z57_2, C8, /(nocc,nvir)/, init_val=ZERO)
!   original expression: Z57_2(l1b|d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|l2b)
    ierr=talsh_tensor_contract("Z57_2(l1,d1)+=H24(l1,l2,d1,d2)*S43(d2,l2)",Z57_2,H24,S43,scale=(1.0d0,0.0d0))
    ierr=talsh_tensor_construct(Z63_1, C8, /(nvir,nocc,nocc,nocc)/, init_val=ZERO)
!   original expression: Z63_1(e1b,l1b|m1bm2b)+=S44(e1b,d1b|m1bm2b)*Z57_2(l1b|d1b)
    ierr=talsh_tensor_contract("Z63_1(e1,l1,m1,m2)+=S44(e1,d1,m1,m2)*Z57_2(l1,d1)",Z63_1,S44,Z57_2,scale=(1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z57_2)
!   original expression: Z50(e1be2b|m1bm2b)+=S43(e1b|l1b)*Z63_1(e2b,l1b|m1bm2b)
    ierr=talsh_tensor_contract("Z50(e1,e2,m1,m2)+=S43(e1,l1)*Z63_1(e2,l1,m1,m2)",Z50,S43,Z63_1,scale=(1.0d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S43(e2b|l1b)*Z63_1(e1b,l1b|m1bm2b)*-1.
    ierr=talsh_tensor_contract("Z50(e1,e2,m1,m2)+=S43(e2,l1)*Z63_1(e1,l1,m1,m2)",Z50,S43,Z63_1,scale=(-1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z63_1)
    ierr=talsh_tensor_construct(Z57_2, C8, /(nocc,nvir)/, init_val=ZERO)
    ierr=talsh_tensor_construct(Z63_1, C8, /(nvir,nocc,nocc,nocc)/, init_val=ZERO)
!   original expression: Z63_1(e1b,l1b|m1bm2b)+=S44(e1b,d1b|m1bm2b)*Z57_2(l1b|d1b)
    ierr=talsh_tensor_contract("Z63_1(e1,l1,m1,m2)+=S44(e1,d1,m1,m2)*Z57_2(l1,d1)",Z63_1,S44,Z57_2,scale=(1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z57_2)
!   original expression: Z50(e1be2b|m1bm2b)+=S43(e1b|l1b)*Z63_1(e2b,l1b|m1bm2b)
    ierr=talsh_tensor_contract("Z50(e1,e2,m1,m2)+=S43(e1,l1)*Z63_1(e2,l1,m1,m2)",Z50,S43,Z63_1,scale=(1.0d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S43(e2b|l1b)*Z63_1(e1b,l1b|m1bm2b)*-1.
    ierr=talsh_tensor_contract("Z50(e1,e2,m1,m2)+=S43(e2,l1)*Z63_1(e1,l1,m1,m2)",Z50,S43,Z63_1,scale=(-1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z63_1)
    ierr=talsh_tensor_construct(Z63_1, C8, /(nvir,nocc,nocc,nocc)/, init_val=ZERO)
!   original expression: Z63_1(e1b,l1b|m1bm2b)+=S44(e1b,d1b|m1bm2b)*H15(l1b|d1b)
    ierr=talsh_tensor_contract("Z63_1(e1,l1,m1,m2)+=S44(e1,d1,m1,m2)*H15(l1,d1)",Z63_1,S44,H15,scale=(1.0d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S43(e1b|l1b)*Z63_1(e2b,l1b|m1bm2b)
    ierr=talsh_tensor_contract("Z50(e1,e2,m1,m2)+=S43(e1,l1)*Z63_1(e2,l1,m1,m2)",Z50,S43,Z63_1,scale=(1.0d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S43(e2b|l1b)*Z63_1(e1b,l1b|m1bm2b)*-1.
    ierr=talsh_tensor_contract("Z50(e1,e2,m1,m2)+=S43(e2,l1)*Z63_1(e1,l1,m1,m2)",Z50,S43,Z63_1,scale=(-1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z63_1)
    ierr=talsh_tensor_construct(Z83_2, C8, /(nocc,nocc,nocc,nvir)/, init_val=ZERO)
!   original expression: Z83_2(l1b,l2b|m1b,d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|m1b)*-1.
    ierr=talsh_tensor_contract("Z83_2(l1,l2,m1,d1)+=H24(l1,l2,d1,d2)*S43(d2,m1)",Z83_2,H24,S43,scale=(-1.0d0,0.0d0))
    ierr=talsh_tensor_construct(Z63_1, C8, /(nvir,nocc,nocc,nocc)/, init_val=ZERO)
!   original expression: Z63_1(e1b,l1b|m1bm2b)+=S44(e1b,d1b|m1b,l2b)*Z83_2(l1b,l2b|m2b,d1b)
    ierr=talsh_tensor_contract("Z63_1(e1,l1,m1,m2)+=S44(e1,d1,m1,l2)*Z83_2(l1,l2,m2,d1)",Z63_1,S44,Z83_2,scale=(1.0d0,0.0d0))
!   original expression: Z63_1(e1b,l1b|m1bm2b)+=S44(e1b,d1b|m2b,l2b)*Z83_2(l1b,l2b|m1b,d1b)*-1.
    ierr=talsh_tensor_contract("Z63_1(e1,l1,m1,m2)+=S44(e1,d1,m2,l2)*Z83_2(l1,l2,m1,d1)",Z63_1,S44,Z83_2,scale=(-1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z83_2)
!   original expression: Z50(e1be2b|m1bm2b)+=S43(e1b|l1b)*Z63_1(e2b,l1b|m1bm2b)
    ierr=talsh_tensor_contract("Z50(e1,e2,m1,m2)+=S43(e1,l1)*Z63_1(e2,l1,m1,m2)",Z50,S43,Z63_1,scale=(1.0d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S43(e2b|l1b)*Z63_1(e1b,l1b|m1bm2b)*-1.
    ierr=talsh_tensor_contract("Z50(e1,e2,m1,m2)+=S43(e2,l1)*Z63_1(e1,l1,m1,m2)",Z50,S43,Z63_1,scale=(-1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z63_1)
    ierr=talsh_tensor_construct(Z63_1, C8, /(nvir,nocc,nocc,nocc)/, init_val=ZERO)
!   original expression: Z63_1(e1b,l1b|m1bm2b)+=S44(e1b,d1b|m1b,l2b)*H25(l1b,l2b|m2b,d1b)
    ierr=talsh_tensor_contract("Z63_1(e1,l1,m1,m2)+=S44(e1,d1,m1,l2)*H25(l1,l2,m2,d1)",Z63_1,S44,H25,scale=(1.0d0,0.0d0))
!   original expression: Z63_1(e1b,l1b|m1bm2b)+=S44(e1b,d1b|m2b,l2b)*H25(l1b,l2b|m1b,d1b)*-1.
    ierr=talsh_tensor_contract("Z63_1(e1,l1,m1,m2)+=S44(e1,d1,m2,l2)*H25(l1,l2,m1,d1)",Z63_1,S44,H25,scale=(-1.0d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S43(e1b|l1b)*Z63_1(e2b,l1b|m1bm2b)
    ierr=talsh_tensor_contract("Z50(e1,e2,m1,m2)+=S43(e1,l1)*Z63_1(e2,l1,m1,m2)",Z50,S43,Z63_1,scale=(1.0d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S43(e2b|l1b)*Z63_1(e1b,l1b|m1bm2b)*-1.
    ierr=talsh_tensor_contract("Z50(e1,e2,m1,m2)+=S43(e2,l1)*Z63_1(e1,l1,m1,m2)",Z50,S43,Z63_1,scale=(-1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z63_1)
    ierr=talsh_tensor_construct(Z63_1, C8, /(nvir,nocc,nocc,nocc)/, init_val=ZERO)
!   original expression: Z50(e1be2b|m1bm2b)+=S43(e1b|l1b)*Z63_1(e2b,l1b|m1bm2b)
    ierr=talsh_tensor_contract("Z50(e1,e2,m1,m2)+=S43(e1,l1)*Z63_1(e2,l1,m1,m2)",Z50,S43,Z63_1,scale=(1.0d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S43(e2b|l1b)*Z63_1(e1b,l1b|m1bm2b)*-1.
    ierr=talsh_tensor_contract("Z50(e1,e2,m1,m2)+=S43(e2,l1)*Z63_1(e1,l1,m1,m2)",Z50,S43,Z63_1,scale=(-1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z63_1)
    ierr=talsh_tensor_construct(Z63_1, C8, /(nvir,nocc,nocc,nocc)/, init_val=ZERO)
!   original expression: Z50(e1be2b|m1bm2b)+=S43(e1b|l1b)*Z63_1(e2b,l1b|m1bm2b)
    ierr=talsh_tensor_contract("Z50(e1,e2,m1,m2)+=S43(e1,l1)*Z63_1(e2,l1,m1,m2)",Z50,S43,Z63_1,scale=(1.0d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S43(e2b|l1b)*Z63_1(e1b,l1b|m1bm2b)*-1.
    ierr=talsh_tensor_contract("Z50(e1,e2,m1,m2)+=S43(e2,l1)*Z63_1(e1,l1,m1,m2)",Z50,S43,Z63_1,scale=(-1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z63_1)
    ierr=talsh_tensor_construct(Z65_1, C8, /(nvir,nvir,nocc,nvir)/, init_val=ZERO)
!   original expression: Z65_1(e1be2b|m1b,d1b)+=H3(e1be2b|d1b,d2b)*S43(d2b|m1b)*0.5
    ierr=talsh_tensor_contract("Z65_1(e1,e2,m1,d1)+=H3(e1,e2,d1,d2)*S43(d2,m1)",Z65_1,H3,S43,scale=(0.5d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S43(d1b|m1b)*Z65_1(e1be2b|m2b,d1b)
    ierr=talsh_tensor_contract("Z50(e1,e2,m1,m2)+=S43(d1,m1)*Z65_1(e1,e2,m2,d1)",Z50,S43,Z65_1,scale=(1.0d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S43(d1b|m2b)*Z65_1(e1be2b|m1b,d1b)*-1.
    ierr=talsh_tensor_contract("Z50(e1,e2,m1,m2)+=S43(d1,m2)*Z65_1(e1,e2,m1,d1)",Z50,S43,Z65_1,scale=(-1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z65_1)
    ierr=talsh_tensor_construct(Z58_1, C8, /(nocc,nocc,nocc,nocc)/, init_val=ZERO)
!   original expression: Z58_1(l1bl2b|m1bm2b)+=H25(l1bl2b|m1b,d1b)*S43(d1b|m2b)
    ierr=talsh_tensor_contract("Z58_1(l1,l2,m1,m2)+=H25(l1,l2,m1,d1)*S43(d1,m2)",Z58_1,H25,S43,scale=(1.0d0,0.0d0))
!   original expression: Z58_1(l1bl2b|m1bm2b)+=H25(l1bl2b|m2b,d1b)*S43(d1b|m1b)*-1.
    ierr=talsh_tensor_contract("Z58_1(l1,l2,m1,m2)+=H25(l1,l2,m2,d1)*S43(d1,m1)",Z58_1,H25,S43,scale=(-1.0d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S44(e1be2b|l1bl2b)*Z58_1(l1bl2b|m1bm2b)
    ierr=talsh_tensor_contract("Z50(e1,e2,m1,m2)+=S44(e1,e2,l1,l2)*Z58_1(l1,l2,m1,m2)",Z50,S44,Z58_1,scale=(0.5d0,0.0d0))
    ierr=talsh_tensor_destruct(Z58_1)
    ierr=talsh_tensor_construct(Z72_2, C8, /(nocc,nocc,nocc,nvir)/, init_val=ZERO)
!   original expression: Z72_2(l1bl2b|m1b,d1b)+=H24(l1bl2b|d1b,d2b)*S43(d2b|m1b)*0.5
    ierr=talsh_tensor_contract("Z72_2(l1,l2,m1,d1)+=H24(l1,l2,d1,d2)*S43(d2,m1)",Z72_2,H24,S43,scale=(0.5d0,0.0d0))
    ierr=talsh_tensor_construct(Z58_1, C8, /(nocc,nocc,nocc,nocc)/, init_val=ZERO)
!   original expression: Z58_1(l1bl2b|m1bm2b)+=S43(d1b|m1b)*Z72_2(l1bl2b|m2b,d1b)
    ierr=talsh_tensor_contract("Z58_1(l1,l2,m1,m2)+=S43(d1,m1)*Z72_2(l1,l2,m2,d1)",Z58_1,S43,Z72_2,scale=(1.0d0,0.0d0))
!   original expression: Z58_1(l1bl2b|m1bm2b)+=S43(d1b|m2b)*Z72_2(l1bl2b|m1b,d1b)*-1.
    ierr=talsh_tensor_contract("Z58_1(l1,l2,m1,m2)+=S43(d1,m2)*Z72_2(l1,l2,m1,d1)",Z58_1,S43,Z72_2,scale=(-1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z72_2)
!   original expression: Z50(e1be2b|m1bm2b)+=S44(e1be2b|l1bl2b)*Z58_1(l1bl2b|m1bm2b)
    ierr=talsh_tensor_contract("Z50(e1,e2,m1,m2)+=S44(e1,e2,l1,l2)*Z58_1(l1,l2,m1,m2)",Z50,S44,Z58_1,scale=(0.5d0,0.0d0))
    ierr=talsh_tensor_destruct(Z58_1)
    ierr=talsh_tensor_construct(Z58_1, C8, /(nocc,nocc,nocc,nocc)/, init_val=ZERO)
!   original expression: Z58_1(l1bl2b|m1bm2b)+=S44(d1bd2b|m1bm2b)*H24(l1bl2b|d1bd2b)
    ierr=talsh_tensor_contract("Z58_1(l1,l2,m1,m2)+=S44(d1,d2,m1,m2)*H24(l1,l2,d1,d2)",Z58_1,S44,H24,scale=(0.5d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S44(e1be2b|l1bl2b)*Z58_1(l1bl2b|m1bm2b)
    ierr=talsh_tensor_contract("Z50(e1,e2,m1,m2)+=S44(e1,e2,l1,l2)*Z58_1(l1,l2,m1,m2)",Z50,S44,Z58_1,scale=(0.5d0,0.0d0))
    ierr=talsh_tensor_destruct(Z58_1)
!   original expression: Z50(e1be2b|m1bm2b)+=S44(e1be2b|l1bl2b)*H26(l1bl2b|m1bm2b)
    ierr=talsh_tensor_contract("Z50(e1,e2,m1,m2)+=S44(e1,e2,l1,l2)*H26(l1,l2,m1,m2)",Z50,S44,H26,scale=(0.5d0,0.0d0))
    ierr=talsh_tensor_construct(Z54_1, C8, /(nvir,nvir)/, init_val=ZERO)
!   original expression: Z54_1(e1b|d1b)+=H17(e1b,l1b|d1b,d2b)*S43(d2b|l1b)
    ierr=talsh_tensor_contract("Z54_1(e1,d1)+=H17(e1,l1,d1,d2)*S43(d2,l1)",Z54_1,H17,S43,scale=(1.0d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S44(e1b,d1b|m1bm2b)*Z54_1(e2b|d1b)
    ierr=talsh_tensor_contract("Z50(e1,e2,m1,m2)+=S44(e1,d1,m1,m2)*Z54_1(e2,d1)",Z50,S44,Z54_1,scale=(1.0d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S44(e2b,d1b|m1bm2b)*Z54_1(e1b|d1b)*-1.
    ierr=talsh_tensor_contract("Z50(e1,e2,m1,m2)+=S44(e2,d1,m1,m2)*Z54_1(e1,d1)",Z50,S44,Z54_1,scale=(-1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z54_1)
    ierr=talsh_tensor_construct(Z54_1, C8, /(nvir,nvir)/, init_val=ZERO)
!   original expression: Z50(e1be2b|m1bm2b)+=S44(e1b,d1b|m1bm2b)*Z54_1(e2b|d1b)
    ierr=talsh_tensor_contract("Z50(e1,e2,m1,m2)+=S44(e1,d1,m1,m2)*Z54_1(e2,d1)",Z50,S44,Z54_1,scale=(1.0d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S44(e2b,d1b|m1bm2b)*Z54_1(e1b|d1b)*-1.
    ierr=talsh_tensor_contract("Z50(e1,e2,m1,m2)+=S44(e2,d1,m1,m2)*Z54_1(e1,d1)",Z50,S44,Z54_1,scale=(-1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z54_1)
    ierr=talsh_tensor_construct(Z54_1, C8, /(nvir,nvir)/, init_val=ZERO)
!   original expression: Z54_1(e1b|d1b)+=S44(e1b,d2b|l1bl2b)*H24(l1bl2b|d1b,d2b)*-1.
    ierr=talsh_tensor_contract("Z54_1(e1,d1)+=S44(e1,d2,l1,l2)*H24(l1,l2,d1,d2)",Z54_1,S44,H24,scale=(-0.5d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S44(e1b,d1b|m1bm2b)*Z54_1(e2b|d1b)
    ierr=talsh_tensor_contract("Z50(e1,e2,m1,m2)+=S44(e1,d1,m1,m2)*Z54_1(e2,d1)",Z50,S44,Z54_1,scale=(1.0d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S44(e2b,d1b|m1bm2b)*Z54_1(e1b|d1b)*-1.
    ierr=talsh_tensor_contract("Z50(e1,e2,m1,m2)+=S44(e2,d1,m1,m2)*Z54_1(e1,d1)",Z50,S44,Z54_1,scale=(-1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z54_1)
    ierr=talsh_tensor_construct(Z54_1, C8, /(nvir,nvir)/, init_val=ZERO)
!   original expression: Z50(e1be2b|m1bm2b)+=S44(e1b,d1b|m1bm2b)*Z54_1(e2b|d1b)
    ierr=talsh_tensor_contract("Z50(e1,e2,m1,m2)+=S44(e1,d1,m1,m2)*Z54_1(e2,d1)",Z50,S44,Z54_1,scale=(1.0d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S44(e2b,d1b|m1bm2b)*Z54_1(e1b|d1b)*-1.
    ierr=talsh_tensor_contract("Z50(e1,e2,m1,m2)+=S44(e2,d1,m1,m2)*Z54_1(e1,d1)",Z50,S44,Z54_1,scale=(-1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z54_1)
!   original expression: Z50(e1be2b|m1bm2b)+=S44(e1b,d1b|m1bm2b)*H1(e2b|d1b)
    ierr=talsh_tensor_contract("Z50(e1,e2,m1,m2)+=S44(e1,d1,m1,m2)*H1(e2,d1)",Z50,S44,H1,scale=(1.0d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S44(e2b,d1b|m1bm2b)*H1(e1b|d1b)*-1.
    ierr=talsh_tensor_contract("Z50(e1,e2,m1,m2)+=S44(e2,d1,m1,m2)*H1(e1,d1)",Z50,S44,H1,scale=(-1.0d0,0.0d0))
    ierr=talsh_tensor_construct(Z56_1, C8, /(nocc,nocc)/, init_val=ZERO)
!   original expression: Z56_1(l1b|m1b)+=H25(l1b,l2b|m1b,d1b)*S43(d1b|l2b)*-1.
    ierr=talsh_tensor_contract("Z56_1(l1,m1)+=H25(l1,l2,m1,d1)*S43(d1,l2)",Z56_1,H25,S43,scale=(-1.0d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S44(e1be2b|m1b,l1b)*Z56_1(l1b|m2b)
    ierr=talsh_tensor_contract("Z50(e1,e2,m1,m2)+=S44(e1,e2,m1,l1)*Z56_1(l1,m2)",Z50,S44,Z56_1,scale=(1.0d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S44(e1be2b|m2b,l1b)*Z56_1(l1b|m1b)*-1.
    ierr=talsh_tensor_contract("Z50(e1,e2,m1,m2)+=S44(e1,e2,m2,l1)*Z56_1(l1,m1)",Z50,S44,Z56_1,scale=(-1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z56_1)
    ierr=talsh_tensor_construct(Z56_1, C8, /(nocc,nocc)/, init_val=ZERO)
!   original expression: Z50(e1be2b|m1bm2b)+=S44(e1be2b|m1b,l1b)*Z56_1(l1b|m2b)
    ierr=talsh_tensor_contract("Z50(e1,e2,m1,m2)+=S44(e1,e2,m1,l1)*Z56_1(l1,m2)",Z50,S44,Z56_1,scale=(1.0d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S44(e1be2b|m2b,l1b)*Z56_1(l1b|m1b)*-1.
    ierr=talsh_tensor_contract("Z50(e1,e2,m1,m2)+=S44(e1,e2,m2,l1)*Z56_1(l1,m1)",Z50,S44,Z56_1,scale=(-1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z56_1)
    ierr=talsh_tensor_construct(Z57_2, C8, /(nocc,nvir)/, init_val=ZERO)
!   original expression: Z57_2(l1b|d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|l2b)*-1.
    ierr=talsh_tensor_contract("Z57_2(l1,d1)+=H24(l1,l2,d1,d2)*S43(d2,l2)",Z57_2,H24,S43,scale=(-1.0d0,0.0d0))
    ierr=talsh_tensor_construct(Z56_1, C8, /(nocc,nocc)/, init_val=ZERO)
!   original expression: Z56_1(l1b|m1b)+=S43(d1b|m1b)*Z57_2(l1b|d1b)
    ierr=talsh_tensor_contract("Z56_1(l1,m1)+=S43(d1,m1)*Z57_2(l1,d1)",Z56_1,S43,Z57_2,scale=(1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z57_2)
!   original expression: Z50(e1be2b|m1bm2b)+=S44(e1be2b|m1b,l1b)*Z56_1(l1b|m2b)
    ierr=talsh_tensor_contract("Z50(e1,e2,m1,m2)+=S44(e1,e2,m1,l1)*Z56_1(l1,m2)",Z50,S44,Z56_1,scale=(1.0d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S44(e1be2b|m2b,l1b)*Z56_1(l1b|m1b)*-1.
    ierr=talsh_tensor_contract("Z50(e1,e2,m1,m2)+=S44(e1,e2,m2,l1)*Z56_1(l1,m1)",Z50,S44,Z56_1,scale=(-1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z56_1)
    ierr=talsh_tensor_construct(Z57_2, C8, /(nocc,nvir)/, init_val=ZERO)
    ierr=talsh_tensor_construct(Z56_1, C8, /(nocc,nocc)/, init_val=ZERO)
!   original expression: Z56_1(l1b|m1b)+=S43(d1b|m1b)*Z57_2(l1b|d1b)
    ierr=talsh_tensor_contract("Z56_1(l1,m1)+=S43(d1,m1)*Z57_2(l1,d1)",Z56_1,S43,Z57_2,scale=(1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z57_2)
!   original expression: Z50(e1be2b|m1bm2b)+=S44(e1be2b|m1b,l1b)*Z56_1(l1b|m2b)
    ierr=talsh_tensor_contract("Z50(e1,e2,m1,m2)+=S44(e1,e2,m1,l1)*Z56_1(l1,m2)",Z50,S44,Z56_1,scale=(1.0d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S44(e1be2b|m2b,l1b)*Z56_1(l1b|m1b)*-1.
    ierr=talsh_tensor_contract("Z50(e1,e2,m1,m2)+=S44(e1,e2,m2,l1)*Z56_1(l1,m1)",Z50,S44,Z56_1,scale=(-1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z56_1)
    ierr=talsh_tensor_construct(Z56_1, C8, /(nocc,nocc)/, init_val=ZERO)
!   original expression: Z56_1(l1b|m1b)+=S43(d1b|m1b)*H15(l1b|d1b)*-1.
    ierr=talsh_tensor_contract("Z56_1(l1,m1)+=S43(d1,m1)*H15(l1,d1)",Z56_1,S43,H15,scale=(-1.0d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S44(e1be2b|m1b,l1b)*Z56_1(l1b|m2b)
    ierr=talsh_tensor_contract("Z50(e1,e2,m1,m2)+=S44(e1,e2,m1,l1)*Z56_1(l1,m2)",Z50,S44,Z56_1,scale=(1.0d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S44(e1be2b|m2b,l1b)*Z56_1(l1b|m1b)*-1.
    ierr=talsh_tensor_contract("Z50(e1,e2,m1,m2)+=S44(e1,e2,m2,l1)*Z56_1(l1,m1)",Z50,S44,Z56_1,scale=(-1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z56_1)
    ierr=talsh_tensor_construct(Z56_1, C8, /(nocc,nocc)/, init_val=ZERO)
!   original expression: Z56_1(l1b|m1b)+=S44(d1bd2b|m1b,l2b)*H24(l1b,l2b|d1bd2b)*-1.
    ierr=talsh_tensor_contract("Z56_1(l1,m1)+=S44(d1,d2,m1,l2)*H24(l1,l2,d1,d2)",Z56_1,S44,H24,scale=(-0.5d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S44(e1be2b|m1b,l1b)*Z56_1(l1b|m2b)
    ierr=talsh_tensor_contract("Z50(e1,e2,m1,m2)+=S44(e1,e2,m1,l1)*Z56_1(l1,m2)",Z50,S44,Z56_1,scale=(1.0d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S44(e1be2b|m2b,l1b)*Z56_1(l1b|m1b)*-1.
    ierr=talsh_tensor_contract("Z50(e1,e2,m1,m2)+=S44(e1,e2,m2,l1)*Z56_1(l1,m1)",Z50,S44,Z56_1,scale=(-1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z56_1)
    ierr=talsh_tensor_construct(Z56_1, C8, /(nocc,nocc)/, init_val=ZERO)
!   original expression: Z50(e1be2b|m1bm2b)+=S44(e1be2b|m1b,l1b)*Z56_1(l1b|m2b)
    ierr=talsh_tensor_contract("Z50(e1,e2,m1,m2)+=S44(e1,e2,m1,l1)*Z56_1(l1,m2)",Z50,S44,Z56_1,scale=(1.0d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S44(e1be2b|m2b,l1b)*Z56_1(l1b|m1b)*-1.
    ierr=talsh_tensor_contract("Z50(e1,e2,m1,m2)+=S44(e1,e2,m2,l1)*Z56_1(l1,m1)",Z50,S44,Z56_1,scale=(-1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z56_1)
!   original expression: Z50(e1be2b|m1bm2b)+=S44(e1be2b|m1b,l1b)*H16(l1b|m2b)*-1.
    ierr=talsh_tensor_contract("Z50(e1,e2,m1,m2)+=S44(e1,e2,m1,l1)*H16(l1,m2)",Z50,S44,H16,scale=(-1.0d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S44(e1be2b|m2b,l1b)*H16(l1b|m1b)
    ierr=talsh_tensor_contract("Z50(e1,e2,m1,m2)+=S44(e1,e2,m2,l1)*H16(l1,m1)",Z50,S44,H16,scale=(1.0d0,0.0d0))
    ierr=talsh_tensor_construct(Z77_1, C8, /(nvir,nocc,nocc,nvir)/, init_val=ZERO)
!   original expression: Z77_1(e1b,l1b|m1b,d1b)+=H17(e1b,l1b|d1b,d2b)*S43(d2b|m1b)*-1.
    ierr=talsh_tensor_contract("Z77_1(e1,l1,m1,d1)+=H17(e1,l1,d1,d2)*S43(d2,m1)",Z77_1,H17,S43,scale=(-1.0d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S44(e1b,d1b|m1b,l1b)*Z77_1(e2b,l1b|m2b,d1b)
    ierr=talsh_tensor_contract("Z50(e1,e2,m1,m2)+=S44(e1,d1,m1,l1)*Z77_1(e2,l1,m2,d1)",Z50,S44,Z77_1,scale=(1.0d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S44(e2b,d1b|m1b,l1b)*Z77_1(e1b,l1b|m2b,d1b)*-1.
    ierr=talsh_tensor_contract("Z50(e1,e2,m1,m2)+=S44(e2,d1,m1,l1)*Z77_1(e1,l1,m2,d1)",Z50,S44,Z77_1,scale=(-1.0d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S44(e1b,d1b|m2b,l1b)*Z77_1(e2b,l1b|m1b,d1b)*-1.
    ierr=talsh_tensor_contract("Z50(e1,e2,m1,m2)+=S44(e1,d1,m2,l1)*Z77_1(e2,l1,m1,d1)",Z50,S44,Z77_1,scale=(-1.0d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S44(e2b,d1b|m2b,l1b)*Z77_1(e1b,l1b|m1b,d1b)
    ierr=talsh_tensor_contract("Z50(e1,e2,m1,m2)+=S44(e2,d1,m2,l1)*Z77_1(e1,l1,m1,d1)",Z50,S44,Z77_1,scale=(1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z77_1)
    ierr=talsh_tensor_construct(Z77_1, C8, /(nvir,nocc,nocc,nvir)/, init_val=ZERO)
!   original expression: Z77_1(e1b,l1b|m1b,d1b)+=S44(e1b,d2b|m1b,l2b)*H24(l1b,l2b|d1b,d2b)*0.5
    ierr=talsh_tensor_contract("Z77_1(e1,l1,m1,d1)+=S44(e1,d2,m1,l2)*H24(l1,l2,d1,d2)",Z77_1,S44,H24,scale=(0.5d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S44(e1b,d1b|m1b,l1b)*Z77_1(e2b,l1b|m2b,d1b)
    ierr=talsh_tensor_contract("Z50(e1,e2,m1,m2)+=S44(e1,d1,m1,l1)*Z77_1(e2,l1,m2,d1)",Z50,S44,Z77_1,scale=(1.0d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S44(e2b,d1b|m1b,l1b)*Z77_1(e1b,l1b|m2b,d1b)*-1.
    ierr=talsh_tensor_contract("Z50(e1,e2,m1,m2)+=S44(e2,d1,m1,l1)*Z77_1(e1,l1,m2,d1)",Z50,S44,Z77_1,scale=(-1.0d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S44(e1b,d1b|m2b,l1b)*Z77_1(e2b,l1b|m1b,d1b)*-1.
    ierr=talsh_tensor_contract("Z50(e1,e2,m1,m2)+=S44(e1,d1,m2,l1)*Z77_1(e2,l1,m1,d1)",Z50,S44,Z77_1,scale=(-1.0d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S44(e2b,d1b|m2b,l1b)*Z77_1(e1b,l1b|m1b,d1b)
    ierr=talsh_tensor_contract("Z50(e1,e2,m1,m2)+=S44(e2,d1,m2,l1)*Z77_1(e1,l1,m1,d1)",Z50,S44,Z77_1,scale=(1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z77_1)
!   original expression: Z50(e1be2b|m1bm2b)+=S44(e1b,d1b|m1b,l1b)*H18(e2b,l1b|m2b,d1b)
    ierr=talsh_tensor_contract("Z50(e1,e2,m1,m2)+=S44(e1,d1,m1,l1)*H18(e2,l1,m2,d1)",Z50,S44,H18,scale=(1.0d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S44(e2b,d1b|m1b,l1b)*H18(e1b,l1b|m2b,d1b)*-1.
    ierr=talsh_tensor_contract("Z50(e1,e2,m1,m2)+=S44(e2,d1,m1,l1)*H18(e1,l1,m2,d1)",Z50,S44,H18,scale=(-1.0d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S44(e1b,d1b|m2b,l1b)*H18(e2b,l1b|m1b,d1b)*-1.
    ierr=talsh_tensor_contract("Z50(e1,e2,m1,m2)+=S44(e1,d1,m2,l1)*H18(e2,l1,m1,d1)",Z50,S44,H18,scale=(-1.0d0,0.0d0))
!   original expression: Z50(e1be2b|m1bm2b)+=S44(e2b,d1b|m2b,l1b)*H18(e1b,l1b|m1b,d1b)
    ierr=talsh_tensor_contract("Z50(e1,e2,m1,m2)+=S44(e2,d1,m2,l1)*H18(e1,l1,m1,d1)",Z50,S44,H18,scale=(1.0d0,0.0d0))
    ierr=talsh_tensor_construct(Z57_2, C8, /(nocc,nvir)/, init_val=ZERO)
!   original expression: Z57_2(l1b|d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|l2b)*-1.
    ierr=talsh_tensor_contract("Z57_2(l1,d1)+=H24(l1,l2,d1,d2)*S43(d2,l2)",Z57_2,H24,S43,scale=(-1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z57_2)
    ierr=talsh_tensor_construct(Z57_2, C8, /(nocc,nvir)/, init_val=ZERO)
    ierr=talsh_tensor_destruct(Z57_2)
    ierr=talsh_tensor_construct(Z83_2, C8, /(nocc,nocc,nocc,nvir)/, init_val=ZERO)
!   original expression: Z83_2(l1b,l2b|m1b,d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|m1b)
    ierr=talsh_tensor_contract("Z83_2(l1,l2,m1,d1)+=H24(l1,l2,d1,d2)*S43(d2,m1)",Z83_2,H24,S43,scale=(1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z83_2)
    ierr=talsh_tensor_construct(Z54_1, C8, /(nvir,nvir)/, init_val=ZERO)
!   original expression: Z54_1(e1b|d1b)+=H17(e1b,l1b|d1b,d2b)*S43(d2b|l1b)
    ierr=talsh_tensor_contract("Z54_1(e1,d1)+=H17(e1,l1,d1,d2)*S43(d2,l1)",Z54_1,H17,S43,scale=(1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z54_1)
    ierr=talsh_tensor_construct(Z54_1, C8, /(nvir,nvir)/, init_val=ZERO)
    ierr=talsh_tensor_destruct(Z54_1)
    ierr=talsh_tensor_construct(Z54_1, C8, /(nvir,nvir)/, init_val=ZERO)
!   original expression: Z54_1(e1b|d1b)+=S44(e1b,d2b|l1bl2b)*H24(l1bl2b|d1b,d2b)*-1.
    ierr=talsh_tensor_contract("Z54_1(e1,d1)+=S44(e1,d2,l1,l2)*H24(l1,l2,d1,d2)",Z54_1,S44,H24,scale=(-0.5d0,0.0d0))
    ierr=talsh_tensor_destruct(Z54_1)
    ierr=talsh_tensor_construct(Z54_1, C8, /(nvir,nvir)/, init_val=ZERO)
    ierr=talsh_tensor_destruct(Z54_1)
    ierr=talsh_tensor_construct(Z56_1, C8, /(nocc,nocc)/, init_val=ZERO)
!   original expression: Z56_1(l1b|m1b)+=H25(l1b,l2b|m1b,d1b)*S43(d1b|l2b)*-1.
    ierr=talsh_tensor_contract("Z56_1(l1,m1)+=H25(l1,l2,m1,d1)*S43(d1,l2)",Z56_1,H25,S43,scale=(-1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z56_1)
    ierr=talsh_tensor_construct(Z56_1, C8, /(nocc,nocc)/, init_val=ZERO)
    ierr=talsh_tensor_destruct(Z56_1)
    ierr=talsh_tensor_construct(Z57_2, C8, /(nocc,nvir)/, init_val=ZERO)
!   original expression: Z57_2(l1b|d1b)+=H24(l1b,l2b|d1b,d2b)*S43(d2b|l2b)*-1.
    ierr=talsh_tensor_contract("Z57_2(l1,d1)+=H24(l1,l2,d1,d2)*S43(d2,l2)",Z57_2,H24,S43,scale=(-1.0d0,0.0d0))
    ierr=talsh_tensor_construct(Z56_1, C8, /(nocc,nocc)/, init_val=ZERO)
!   original expression: Z56_1(l1b|m1b)+=S43(d1b|m1b)*Z57_2(l1b|d1b)
    ierr=talsh_tensor_contract("Z56_1(l1,m1)+=S43(d1,m1)*Z57_2(l1,d1)",Z56_1,S43,Z57_2,scale=(1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z57_2)
    ierr=talsh_tensor_destruct(Z56_1)
    ierr=talsh_tensor_construct(Z57_2, C8, /(nocc,nvir)/, init_val=ZERO)
    ierr=talsh_tensor_construct(Z56_1, C8, /(nocc,nocc)/, init_val=ZERO)
!   original expression: Z56_1(l1b|m1b)+=S43(d1b|m1b)*Z57_2(l1b|d1b)
    ierr=talsh_tensor_contract("Z56_1(l1,m1)+=S43(d1,m1)*Z57_2(l1,d1)",Z56_1,S43,Z57_2,scale=(1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z57_2)
    ierr=talsh_tensor_destruct(Z56_1)
    ierr=talsh_tensor_construct(Z56_1, C8, /(nocc,nocc)/, init_val=ZERO)
!   original expression: Z56_1(l1b|m1b)+=S43(d1b|m1b)*H15(l1b|d1b)*-1.
    ierr=talsh_tensor_contract("Z56_1(l1,m1)+=S43(d1,m1)*H15(l1,d1)",Z56_1,S43,H15,scale=(-1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z56_1)
    ierr=talsh_tensor_construct(Z56_1, C8, /(nocc,nocc)/, init_val=ZERO)
!   original expression: Z56_1(l1b|m1b)+=S44(d1bd2b|m1b,l2b)*H24(l1b,l2b|d1bd2b)*-1.
    ierr=talsh_tensor_contract("Z56_1(l1,m1)+=S44(d1,d2,m1,l2)*H24(l1,l2,d1,d2)",Z56_1,S44,H24,scale=(-0.5d0,0.0d0))
    ierr=talsh_tensor_destruct(Z56_1)
    ierr=talsh_tensor_construct(Z56_1, C8, /(nocc,nocc)/, init_val=ZERO)
    ierr=talsh_tensor_destruct(Z56_1)
    ierr=talsh_tensor_construct(Z77_1, C8, /(nvir,nocc,nocc,nvir)/, init_val=ZERO)
!   original expression: Z77_1(e1b,l1b|m1b,d1b)+=H17(e1b,l1b|d1b,d2b)*S43(d2b|m1b)*-1.
    ierr=talsh_tensor_contract("Z77_1(e1,l1,m1,d1)+=H17(e1,l1,d1,d2)*S43(d2,m1)",Z77_1,H17,S43,scale=(-1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z77_1)
    ierr=talsh_tensor_construct(Z77_1, C8, /(nvir,nocc,nocc,nvir)/, init_val=ZERO)
!   original expression: Z77_1(e1b,l1b|m1b,d1b)+=S44(e1b,d2b|m1b,l2b)*H24(l1b,l2b|d1b,d2b)
    ierr=talsh_tensor_contract("Z77_1(e1,l1,m1,d1)+=S44(e1,d2,m1,l2)*H24(l1,l2,d1,d2)",Z77_1,S44,H24,scale=(1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z77_1)


end subroutine generic_codegen_call
