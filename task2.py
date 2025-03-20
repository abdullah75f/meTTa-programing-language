from hyperon import MeTTa
metta= MeTTa()

metta_code = '''
; Define the GCD function using the Euclidean algorithm
   (= (gcd $a $b)
      (if (== $b 0)
          $a
          (gcd $b (% $a $b))))

   ; Test the GCD function
   ! (gcd 56 48)
   '''

result = metta.run(metta_code)
print(result)