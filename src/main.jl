const c = -0.79 + 0.15im

f(z::Complex) = z^2 + c

f(z::Real) = f(z + 0im)

# R > 0 is such that R^2 - R ≥ |c|
const R = 2

const ε = 0.016

const symbols = " .:-=+*#%\$@"

for x=-R:ε:R
  for y=-R:ε:R
    z::Complex = complex(y,x)

    n = 1
    max_iteration = 100

    while abs(z) < R && (n += 1) < max_iteration
      z = f(z)
    end
    print(symbols[convert(Int64, ceil(n/11))])
  end
  println()
end
