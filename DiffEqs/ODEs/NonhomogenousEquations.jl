using DifferentialEquations
using Plots
using Markdown

description = md"""

Solve the Pendulum System:
``dθ/dt = ω(t),``
``dω/dt = -(3/2)(g/l)sinθ + (3/ml²)M(t)``
for mass m, length l, and where t∈[0,10], u₀= [0.01, 0.0], and M(t) is an external torque

"""
display(description)

l = 1.0
m = 1.0
g = 9.81

function pendulum!(du, u, p, t)
    du[1] = u[2]
    du[2] = -3g/(2l)*sin(u[1]) + 3/(m*l^2)*p(t)  # here p is a function
end

θ₀ = 0.01
ω₀ = 0.0
u0 = [θ₀, ω₀]

tspan = (0.0, 10.0)


M = t->0.1sin(t)  # this is the external torque

prob = ODEProblem(pendulum!, u0, tspan, M)
sol = solve(prob)

# visualize the result
plot(sol, linewidth=2, xaxis="t", label=["θ [rad]" "ω [rad/s]"], layout=(2,1))
