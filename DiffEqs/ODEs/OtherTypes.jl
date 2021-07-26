using DifferentialEquations
using Plots
using Markdown
using LinearAlgebra
using StaticArrays


description=md"""

solve the matrix system
``u' = Au``
for matrix A and i.c. u₀

"""
display(description)

# use immutable arrays that are stack-allocated
A = @SMatrix [1.0 0 0 -5
              4 -2 4 -3
              -4 0 0 1
              5 -2 2 3]

u0 = rand(4, 2)

tspan = (0.0, 1.0)

f(du, u, p, t) = mul!(du, A, u)  # in-place version of matrix multiply

prob = ODEProblem(f, u0, tspan)
sol = solve(prob)
plot(sol)
