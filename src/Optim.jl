require("Options")

module Optim
    using OptionsMod
    using Distributions
    using Calculus

    function centroid(p::Matrix)
         reshape(mean(p, 2), size(p, 1))
    end

    import Base.assign,
           Base.dot,
           Base.length,
           Base.push!,
           Base.ref,
           Base.show,
           Base.getindex,
           Base.setindex!

    export curve_fit,
           estimate_errors,
           optimize,
           DifferentiableFunction,
           TwiceDifferentiableFunction

    # Types
    include("utilities/assess_convergence.jl")

    # Types
    include("types.jl")

    # Grid Search
    include("grid_search.jl")

    # Line Search Methods
    include(joinpath("linesearch", "backtracking_linesearch.jl"))
    include(joinpath("linesearch", "interpolating_linesearch.jl"))
    include(joinpath("linesearch", "mt_cstep.jl"))
    include(joinpath("linesearch", "mt_linesearch.jl"))
    include(joinpath("linesearch", "hz_linesearch.jl"))

    # Gradient Descent
    include("gradient_descent.jl")
    include("accelerated_gradient_descent.jl")
    include("momentum_gradient_descent.jl")

    # Conjugate gradient
    include("cgdescent.jl")
    include("cg.jl")

    # Newton and Quasi-Newton Methods
    include("newton.jl")
    include("bfgs.jl")
    include("l_bfgs.jl")

    # Constrained optimization
    include("fminbox.jl")
    include("nnls.jl")

    # trust region methods
    include("levenberg_marquardt.jl")

    # Heuristic Optimization Methods
    include("nelder_mead.jl")
    include("simulated_annealing.jl")

    # End-User Facing Wrapper Functions
    include("optimize.jl")
    include("curve_fit.jl")

    # Examples for testing
    include(joinpath("problems", "unconstrained.jl"))
end
