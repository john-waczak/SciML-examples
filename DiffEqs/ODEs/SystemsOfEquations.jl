using DifferentialEquations
using Plots
using Markdown

description = md"""

Solve the Lorenz System:
``dx/dt = σ(y-x),
  dy/dt = x(ρ-z) -y,
  dz/dt = xy - βz
``
where t∈[0,100] and u₀= [1.0, 0.0, 0.0]

"""
display(description)


# use in-place version (w/ ! symbol) so that
# the number of array allocations is minimal
function lorenz!(du, u, p, t)
    x,y,z = u
    σ, ρ, β = p
    du[1] = σ*(y-x)
    du[2] = x*(ρ-z) - y
    du[3] = x*y - β*z
end


# define IC's, parameters, and time span
u0 = [1.0; 0.0; 0.0]
p = [10.0; 28.0; 8/3]
tspan = (0.0, 100.0)

# solve the problem
prob = ODEProblem(lorenz!, u0, tspan, p)
sol = solve(prob)


# visualize the result
p1 = plot(sol, vars=(1, 2, 3)) # i.e. plot x,y,z
p2 = plot(sol, vars=(0,2))
plot(p1, p2)
