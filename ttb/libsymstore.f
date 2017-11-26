       function symstore_2s(T,w)
        implicit none
        
        integer, intent(in) :: w
        type(Tensor2s), intent(in) :: T
        type(Tensor2s) :: symstore_2s

        symstore_2s%a6 = T%a6

       end function symstore_2s
       
       function symstore_4s(T,w)
        implicit none
        
        integer, intent(in) :: w
        type(Tensor4s), intent(in) :: T
        type(Tensor4s) :: symstore_4s

        symstore_4s%a6b6 = T%a6b6

       end function symstore_4s

       function symstore_2(T,w)
        implicit none
        
        integer, intent(in) :: w
        type(Tensor2), intent(in) :: T
        type(Tensor2s) :: symstore_2
        integer :: i
        
        symstore_2%a6 = 0.d0
        do i=1,3
         symstore_2%a6(i) = T%ab(i,i)
        enddo
        symstore_2%a6(4) = dble(w)*T%ab(1,2)
        symstore_2%a6(5) = dble(w)*T%ab(2,3)
        symstore_2%a6(6) = dble(w)*T%ab(3,1)

       end function symstore_2
       
       function symstore_4(T)
        implicit none
        
        type(Tensor4), intent(in) :: T
        type(Tensor4s) :: symstore_4
        integer :: i,j
        
        symstore_4%a6b6 = 0.d0
        do i=1,3
         do j=1,3
          symstore_4%a6b6(i,j) = T%abcd(i,i,j,j)
         enddo
        enddo
        
        symstore_4%a6b6(4,4) = 2.*T%abcd(1,2,1,2)
        symstore_4%a6b6(5,5) = 2.*T%abcd(2,3,2,3)
        symstore_4%a6b6(6,6) = 2.*T%abcd(3,1,3,1)
        
        do i=1,3
         symstore_4%a6b6(i,4) = 2.*T%abcd(i,i,1,2)
         symstore_4%a6b6(i,5) = 2.*T%abcd(i,i,2,3)
         symstore_4%a6b6(i,6) = 2.*T%abcd(i,i,3,1)
        enddo
        
        symstore_4%a6b6(4,5) = 2.*T%abcd(1,2,2,3)
        symstore_4%a6b6(4,6) = 2.*T%abcd(1,2,3,1)
        
        symstore_4%a6b6(5,4) = 2.*T%abcd(2,3,1,2)
        symstore_4%a6b6(5,6) = 2.*T%abcd(2,3,3,1)
        
        symstore_4%a6b6(6,4) = 2.*T%abcd(3,1,1,2)
        symstore_4%a6b6(6,5) = 2.*T%abcd(3,1,2,3)
        
       end function symstore_4