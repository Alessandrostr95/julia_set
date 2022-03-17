#const c = -1 + 0im
const c = -0.79 + 0.15im
#const c = -0.54 + 0.54im
#const c = 0.355 + 0.355im

f(z::Complex) = z^2 + c

f(z::Real) = f(z + 0im)

# R > 0 is such that R√2 ≥ |c|
const R = 2 

const ε = 0.016

const symbols = " .:-=+*#%\$@"

function Julia_set(f::Function)
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
end

# function map_range(x, a1, b1, a2, b2)
#   !(a1 ≤ x ≤ b1 || a1 ≥ x ≥ b1) && throw(ErrorException("x out of range."))

#   dim1, dim2 = abs(b1-a1), abs(b2-a2)
#   min1, min2 = min(a1,b1), min(a2,b2)
#   
#   Δ₁, Δ₂ = -min1, -min2
#   x̂ = x + Δ₁
#   y = x̂ / dim1
#   return (y*dim2) - Δ₂
# end

function Mandelbrot_set(f::Function)
  for x=-R:ε:R
    for y=-R:ε:R
      c::Complex = complex(y,x)
      z::Complex = 0im

      i = 1
      n = 100

      while abs(z) ≤ √(2)*R && (i += 1) < n
        z = f(z,c)
      end
      index = i == n ? 1 : i/n * 11  
      print(symbols[convert(Int64, ceil(index))])
    end
    println()
  end 
end


# Julia_set(f)
Mandelbrot_set((z,c) -> z^2 + c)
