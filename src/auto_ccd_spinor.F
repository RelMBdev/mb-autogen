!   
!    Outputting TAL-SH Fortran code generated with :
!      Codegen, a toolset to process tensor contraction DSLs (SIAL etc)
!      Andre Gomes (CNRS UMR8523, Lille) and Dmitry Lyakh (OCLF, Oak Ridge)
!   
subroutine generic_codegen_call(nocc,nvir,\
    S23,\
    H13,\
    H3,\
    H2,\
    H14,\
    H1,\
    H9,\
    H10,\
    Z26,\
    Z27)
    integer, intent(in) :: nocc
    integer, intent(in) :: nvir
    type(talsh_tensor_t), intent(inout) :: S23    !       VVOO
    type(talsh_tensor_t), intent(inout) :: H13    !       OOVV
    type(talsh_tensor_t), intent(inout) :: H3    !       VVOO
    type(talsh_tensor_t), intent(inout) :: H2    !       VVVV
    type(talsh_tensor_t), intent(inout) :: H14    !       OOOO
    type(talsh_tensor_t), intent(inout) :: H1    !       VV
    type(talsh_tensor_t), intent(inout) :: H9    !       OO
    type(talsh_tensor_t), intent(inout) :: H10    !       VOOV
    type(talsh_tensor_t), intent(inout) :: Z26    !       UnitTensor
    type(talsh_tensor_t), intent(inout) :: Z27    !       VVOO
    type(talsh_tensor_t) :: Z33_1    !       OOOO
    type(talsh_tensor_t) :: Z30_1    !       VV
    type(talsh_tensor_t) :: Z32_1    !       OO
    type(talsh_tensor_t) :: Z37_1    !       VOOV


!   original expression: Z26(|)+=S23(d1bd2b|l1bl2b)*H13(l1bl2b|d1bd2b)
    ierr=talsh_tensor_contract("Z26()+=S23(d1,d2,l1,l2)*H13(l1,l2,d1,d2)",Z26,S23,H13,scale=(0.25d0,0.0d0))
!   original expression: Z27(e1be2b|m1bm2b)+=H3(e1be2b|m1bm2b)
    ierr=talsh_tensor_add("Z27(e1,e2,m1,m2)+=H3(e1,e2,m1,m2)",Z27,H3,scale=(1.0d0,0.0d0))
!   original expression: Z27(e1be2b|m1bm2b)+=H2(e1be2b|d1bd2b)*S23(d1bd2b|m1bm2b)
    ierr=talsh_tensor_contract("Z27(e1,e2,m1,m2)+=H2(e1,e2,d1,d2)*S23(d1,d2,m1,m2)",Z27,H2,S23,scale=(0.5d0,0.0d0))
    ierr=talsh_tensor_construct(Z33_1, C8, /(nocc,nocc,nocc,nocc)/, init_val=ZERO)
!   original expression: Z33_1(l1bl2b|m1bm2b)+=S23(d1bd2b|m1bm2b)*H13(l1bl2b|d1bd2b)
    ierr=talsh_tensor_contract("Z33_1(l1,l2,m1,m2)+=S23(d1,d2,m1,m2)*H13(l1,l2,d1,d2)",Z33_1,S23,H13,scale=(0.5d0,0.0d0))
!   original expression: Z27(e1be2b|m1bm2b)+=S23(e1be2b|l1bl2b)*Z33_1(l1bl2b|m1bm2b)
    ierr=talsh_tensor_contract("Z27(e1,e2,m1,m2)+=S23(e1,e2,l1,l2)*Z33_1(l1,l2,m1,m2)",Z27,S23,Z33_1,scale=(0.5d0,0.0d0))
    ierr=talsh_tensor_destruct(Z33_1)
!   original expression: Z27(e1be2b|m1bm2b)+=S23(e1be2b|l1bl2b)*H14(l1bl2b|m1bm2b)
    ierr=talsh_tensor_contract("Z27(e1,e2,m1,m2)+=S23(e1,e2,l1,l2)*H14(l1,l2,m1,m2)",Z27,S23,H14,scale=(0.5d0,0.0d0))
    ierr=talsh_tensor_construct(Z30_1, C8, /(nvir,nvir)/, init_val=ZERO)
!   original expression: Z30_1(e1b|d1b)+=S23(e1b,d2b|l1bl2b)*H13(l1bl2b|d1b,d2b)*-1.
    ierr=talsh_tensor_contract("Z30_1(e1,d1)+=S23(e1,d2,l1,l2)*H13(l1,l2,d1,d2)",Z30_1,S23,H13,scale=(-0.5d0,0.0d0))
!   original expression: Z27(e1be2b|m1bm2b)+=S23(e1b,d1b|m1bm2b)*Z30_1(e2b|d1b)
    ierr=talsh_tensor_contract("Z27(e1,e2,m1,m2)+=S23(e1,d1,m1,m2)*Z30_1(e2,d1)",Z27,S23,Z30_1,scale=(1.0d0,0.0d0))
!   original expression: Z27(e1be2b|m1bm2b)+=S23(e2b,d1b|m1bm2b)*Z30_1(e1b|d1b)*-1.
    ierr=talsh_tensor_contract("Z27(e1,e2,m1,m2)+=S23(e2,d1,m1,m2)*Z30_1(e1,d1)",Z27,S23,Z30_1,scale=(-1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z30_1)
    ierr=talsh_tensor_construct(Z30_1, C8, /(nvir,nvir)/, init_val=ZERO)
!   original expression: Z27(e1be2b|m1bm2b)+=S23(e1b,d1b|m1bm2b)*Z30_1(e2b|d1b)
    ierr=talsh_tensor_contract("Z27(e1,e2,m1,m2)+=S23(e1,d1,m1,m2)*Z30_1(e2,d1)",Z27,S23,Z30_1,scale=(1.0d0,0.0d0))
!   original expression: Z27(e1be2b|m1bm2b)+=S23(e2b,d1b|m1bm2b)*Z30_1(e1b|d1b)*-1.
    ierr=talsh_tensor_contract("Z27(e1,e2,m1,m2)+=S23(e2,d1,m1,m2)*Z30_1(e1,d1)",Z27,S23,Z30_1,scale=(-1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z30_1)
!   original expression: Z27(e1be2b|m1bm2b)+=S23(e1b,d1b|m1bm2b)*H1(e2b|d1b)
    ierr=talsh_tensor_contract("Z27(e1,e2,m1,m2)+=S23(e1,d1,m1,m2)*H1(e2,d1)",Z27,S23,H1,scale=(1.0d0,0.0d0))
!   original expression: Z27(e1be2b|m1bm2b)+=S23(e2b,d1b|m1bm2b)*H1(e1b|d1b)*-1.
    ierr=talsh_tensor_contract("Z27(e1,e2,m1,m2)+=S23(e2,d1,m1,m2)*H1(e1,d1)",Z27,S23,H1,scale=(-1.0d0,0.0d0))
    ierr=talsh_tensor_construct(Z32_1, C8, /(nocc,nocc)/, init_val=ZERO)
!   original expression: Z32_1(l1b|m1b)+=S23(d1bd2b|m1b,l2b)*H13(l1b,l2b|d1bd2b)*-1.
    ierr=talsh_tensor_contract("Z32_1(l1,m1)+=S23(d1,d2,m1,l2)*H13(l1,l2,d1,d2)",Z32_1,S23,H13,scale=(-0.5d0,0.0d0))
!   original expression: Z27(e1be2b|m1bm2b)+=S23(e1be2b|m1b,l1b)*Z32_1(l1b|m2b)
    ierr=talsh_tensor_contract("Z27(e1,e2,m1,m2)+=S23(e1,e2,m1,l1)*Z32_1(l1,m2)",Z27,S23,Z32_1,scale=(1.0d0,0.0d0))
!   original expression: Z27(e1be2b|m1bm2b)+=S23(e1be2b|m2b,l1b)*Z32_1(l1b|m1b)*-1.
    ierr=talsh_tensor_contract("Z27(e1,e2,m1,m2)+=S23(e1,e2,m2,l1)*Z32_1(l1,m1)",Z27,S23,Z32_1,scale=(-1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z32_1)
    ierr=talsh_tensor_construct(Z32_1, C8, /(nocc,nocc)/, init_val=ZERO)
!   original expression: Z27(e1be2b|m1bm2b)+=S23(e1be2b|m1b,l1b)*Z32_1(l1b|m2b)
    ierr=talsh_tensor_contract("Z27(e1,e2,m1,m2)+=S23(e1,e2,m1,l1)*Z32_1(l1,m2)",Z27,S23,Z32_1,scale=(1.0d0,0.0d0))
!   original expression: Z27(e1be2b|m1bm2b)+=S23(e1be2b|m2b,l1b)*Z32_1(l1b|m1b)*-1.
    ierr=talsh_tensor_contract("Z27(e1,e2,m1,m2)+=S23(e1,e2,m2,l1)*Z32_1(l1,m1)",Z27,S23,Z32_1,scale=(-1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z32_1)
!   original expression: Z27(e1be2b|m1bm2b)+=S23(e1be2b|m1b,l1b)*H9(l1b|m2b)*-1.
    ierr=talsh_tensor_contract("Z27(e1,e2,m1,m2)+=S23(e1,e2,m1,l1)*H9(l1,m2)",Z27,S23,H9,scale=(-1.0d0,0.0d0))
!   original expression: Z27(e1be2b|m1bm2b)+=S23(e1be2b|m2b,l1b)*H9(l1b|m1b)
    ierr=talsh_tensor_contract("Z27(e1,e2,m1,m2)+=S23(e1,e2,m2,l1)*H9(l1,m1)",Z27,S23,H9,scale=(1.0d0,0.0d0))
    ierr=talsh_tensor_construct(Z37_1, C8, /(nvir,nocc,nocc,nvir)/, init_val=ZERO)
!   original expression: Z37_1(e1b,l1b|m1b,d1b)+=S23(e1b,d2b|m1b,l2b)*H13(l1b,l2b|d1b,d2b)*0.5
    ierr=talsh_tensor_contract("Z37_1(e1,l1,m1,d1)+=S23(e1,d2,m1,l2)*H13(l1,l2,d1,d2)",Z37_1,S23,H13,scale=(0.5d0,0.0d0))
!   original expression: Z27(e1be2b|m1bm2b)+=S23(e1b,d1b|m1b,l1b)*Z37_1(e2b,l1b|m2b,d1b)
    ierr=talsh_tensor_contract("Z27(e1,e2,m1,m2)+=S23(e1,d1,m1,l1)*Z37_1(e2,l1,m2,d1)",Z27,S23,Z37_1,scale=(1.0d0,0.0d0))
!   original expression: Z27(e1be2b|m1bm2b)+=S23(e2b,d1b|m1b,l1b)*Z37_1(e1b,l1b|m2b,d1b)*-1.
    ierr=talsh_tensor_contract("Z27(e1,e2,m1,m2)+=S23(e2,d1,m1,l1)*Z37_1(e1,l1,m2,d1)",Z27,S23,Z37_1,scale=(-1.0d0,0.0d0))
!   original expression: Z27(e1be2b|m1bm2b)+=S23(e1b,d1b|m2b,l1b)*Z37_1(e2b,l1b|m1b,d1b)*-1.
    ierr=talsh_tensor_contract("Z27(e1,e2,m1,m2)+=S23(e1,d1,m2,l1)*Z37_1(e2,l1,m1,d1)",Z27,S23,Z37_1,scale=(-1.0d0,0.0d0))
!   original expression: Z27(e1be2b|m1bm2b)+=S23(e2b,d1b|m2b,l1b)*Z37_1(e1b,l1b|m1b,d1b)
    ierr=talsh_tensor_contract("Z27(e1,e2,m1,m2)+=S23(e2,d1,m2,l1)*Z37_1(e1,l1,m1,d1)",Z27,S23,Z37_1,scale=(1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z37_1)
!   original expression: Z27(e1be2b|m1bm2b)+=S23(e1b,d1b|m1b,l1b)*H10(e2b,l1b|m2b,d1b)
    ierr=talsh_tensor_contract("Z27(e1,e2,m1,m2)+=S23(e1,d1,m1,l1)*H10(e2,l1,m2,d1)",Z27,S23,H10,scale=(1.0d0,0.0d0))
!   original expression: Z27(e1be2b|m1bm2b)+=S23(e2b,d1b|m1b,l1b)*H10(e1b,l1b|m2b,d1b)*-1.
    ierr=talsh_tensor_contract("Z27(e1,e2,m1,m2)+=S23(e2,d1,m1,l1)*H10(e1,l1,m2,d1)",Z27,S23,H10,scale=(-1.0d0,0.0d0))
!   original expression: Z27(e1be2b|m1bm2b)+=S23(e1b,d1b|m2b,l1b)*H10(e2b,l1b|m1b,d1b)*-1.
    ierr=talsh_tensor_contract("Z27(e1,e2,m1,m2)+=S23(e1,d1,m2,l1)*H10(e2,l1,m1,d1)",Z27,S23,H10,scale=(-1.0d0,0.0d0))
!   original expression: Z27(e1be2b|m1bm2b)+=S23(e2b,d1b|m2b,l1b)*H10(e1b,l1b|m1b,d1b)
    ierr=talsh_tensor_contract("Z27(e1,e2,m1,m2)+=S23(e2,d1,m2,l1)*H10(e1,l1,m1,d1)",Z27,S23,H10,scale=(1.0d0,0.0d0))
    ierr=talsh_tensor_construct(Z30_1, C8, /(nvir,nvir)/, init_val=ZERO)
!   original expression: Z30_1(e1b|d1b)+=S23(e1b,d2b|l1bl2b)*H13(l1bl2b|d1b,d2b)*-1.
    ierr=talsh_tensor_contract("Z30_1(e1,d1)+=S23(e1,d2,l1,l2)*H13(l1,l2,d1,d2)",Z30_1,S23,H13,scale=(-0.5d0,0.0d0))
    ierr=talsh_tensor_destruct(Z30_1)
    ierr=talsh_tensor_construct(Z30_1, C8, /(nvir,nvir)/, init_val=ZERO)
    ierr=talsh_tensor_destruct(Z30_1)
    ierr=talsh_tensor_construct(Z32_1, C8, /(nocc,nocc)/, init_val=ZERO)
!   original expression: Z32_1(l1b|m1b)+=S23(d1bd2b|m1b,l2b)*H13(l1b,l2b|d1bd2b)*-1.
    ierr=talsh_tensor_contract("Z32_1(l1,m1)+=S23(d1,d2,m1,l2)*H13(l1,l2,d1,d2)",Z32_1,S23,H13,scale=(-0.5d0,0.0d0))
    ierr=talsh_tensor_destruct(Z32_1)
    ierr=talsh_tensor_construct(Z32_1, C8, /(nocc,nocc)/, init_val=ZERO)
    ierr=talsh_tensor_destruct(Z32_1)
    ierr=talsh_tensor_construct(Z37_1, C8, /(nvir,nocc,nocc,nvir)/, init_val=ZERO)
!   original expression: Z37_1(e1b,l1b|m1b,d1b)+=S23(e1b,d2b|m1b,l2b)*H13(l1b,l2b|d1b,d2b)
    ierr=talsh_tensor_contract("Z37_1(e1,l1,m1,d1)+=S23(e1,d2,m1,l2)*H13(l1,l2,d1,d2)",Z37_1,S23,H13,scale=(1.0d0,0.0d0))
    ierr=talsh_tensor_destruct(Z37_1)


end subroutine generic_codegen_call
