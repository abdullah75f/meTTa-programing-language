 ; Define the GCD function using the Euclidean algorithm
   (= (gcd $a $b)
      (if (== $b 0)
          $a
          (gcd $b (% $a $b))))

   ; Test the GCD function
   ! (gcd 56 48)


