; This is a solution for the Leetcode isPowerOfFour Question 
(= (isPowerOfFour $n)
    (if (== $n 1)
        (return True)
        (if (<= $n 0) 
            (return False)
            (if( == (% $n 4) 0)
                (isPowerOfFour (/ $n 4))
                (return False)

            
            )

        )
    )
)


!( isPowerOfFour 16)
!( isPowerOfFour 0)
!( isPowerOfFour -16)
!( isPowerOfFour 1)
!( isPowerOfFour 12)
!( isPowerOfFour 2)