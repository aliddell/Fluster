import Conda
import PyCall
import Fluster.Constants: FLUSTER_ENV

using Pkg
Pkg.build()

function syspy()
    "python" * (Base.Sys.iswindows() ? ".exe" : "")
end

@testset "Python env" begin
    @test joinpath(Conda.python_dir(FLUSTER_ENV), syspy()) == PyCall.pyprogramname
end

@testset "Imports OK" begin
    @test PyCall.pyimport("spikeextractors") isa PyCall.PyObject
    @test PyCall.pyimport("pynwb") isa PyCall.PyObject
end
