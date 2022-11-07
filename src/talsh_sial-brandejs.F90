!   
!    Outputting TAL-SH Fortran code generated with :
!      Codegen, a toolset to process tensor contraction DSLs (SIAL etc)
!      Andre Gomes (CNRS UMR8523, Lille) and Dmitry Lyakh (OCLF, Oak Ridge)
!   
subroutine generic_codegen_call(nocc,nvir, &
    V4, &
    T2, &
    A8)


    use talsh
    use tensor_algebra
    use, intrinsic:: ISO_C_BINDING


    implicit none


    complex(8), parameter :: ZERO=(0.D0,0.D0),ONE_HALF=(0.5D0,0.D0), &
                             MINUS_ONE=(-1.D0,0.D0),ONE=(1.0D0,0.D0), MINUS_ONE_HALF=(-0.5D0,0.D0), &
                             MINUS_ONE_QUARTER=(-0.25D0,0.D0), ONE_QUARTER=(0.25D0,0.D0), &
                             MINUS_ONE_EIGHT=(-0.125D0,0.D0)


    integer :: ierr


    integer, intent(in) :: nocc
    integer, intent(in) :: nvir
    type(talsh_tens_t), intent(inout) :: V4    !       OOOV
    type(talsh_tens_t), intent(inout) :: T2    !       VVOO
    type(talsh_tens_t), intent(inout) :: A8    !       VOOO
    type(talsh_tens_t) :: I1    !       OVOO


    ierr=talsh_tensor_construct(I1, C8, (/nocc,nvir,nocc,nocc/), init_val=ZERO)
!   original expression: I1(l1af1a|m1an1a)+=V4(l1am2a|m1ad1a)*T2(f1ad1a|n1am2a)
    ierr=talsh_tensor_contract("I1(l1a,f1a,m1a,n1a)+=V4(l1a,m2a,m1a,d1a)*T2(f1a,d1a,n1a,m2a)", &
        I1,V4,T2,scale=(1.0d0,0.0d0))
!   original expression: A8(f1al1a|n1am1a)+=I1(l1af1a|m1an1a)*-4.
    ierr=talsh_tensor_add("A8(f1a,l1a,n1a,m1a)+=I1(l1a,f1a,m1a,n1a)", &
        A8,I1,scale=(-4.0d0,0.0d0))
!   original expression: A8(f1al1a|n1am1a)+=I1(l1af1a|n1am1a)*4.
    ierr=talsh_tensor_add("A8(f1a,l1a,n1a,m1a)+=I1(l1a,f1a,n1a,m1a)", &
        A8,I1,scale=(4.0d0,0.0d0))


end subroutine generic_codegen_call
