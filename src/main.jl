const c = -0.79 + 0.15im
#const c = -0.54 + 0.54im
#const c = 0.355 + 0.355im

f(z::Complex) = z^2 + c

f(z::Real) = f(z + 0im)

# R > 0 is such that R√2 ≥ |c|
const R = 2 

const ε = 0.016

const symbols = " .:-=+*#%\$@"

for x=-R:ε:R
  for y=-R:ε:R
    z::Complex = complex(y,x)

    i = 1
    n = 100

    while abs(z) ≤ √(2)*R && (i += 1) < n
      z = f(z)
    end
    print(symbols[convert(Int64, ceil(i/11))])
  end
  println()
end
