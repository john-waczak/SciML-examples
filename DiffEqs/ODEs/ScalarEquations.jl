using DifferentialEquations
using Plots
using Markdown

description = md"""

Solve the differential equation
``du/dt = f(u,p,t) = α u``
where t∈[0,1] and u₀= 1/2

"""
display(description)


α = 1.01
f(u, p, t) = α*u

# define IC's and time span
u₀ = 1/2
tspan = (0.0, 1.0)

prob = ODEProblem(f, u₀, tspan)
sol = solve(prob)  # type ?solve at repl to see list of solver options (methods, tolerance setting, etc...)


# visualize the solution
plot(sol, linewidth=5, title="Solution to the linear ODE", xaxis="Time (t)", yaxis="u(t) (μm)", label="Numerical Solution")
plot!(sol.t, t->0.5*exp(1.01t), lw=3, ls=:dash, label="True Solution")
