module Fluster

include("Constants.jl")

greet() = print("Hello $(Constants.FLUSTER_ENV)!")

end # module
