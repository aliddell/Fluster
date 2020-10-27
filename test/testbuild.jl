import Conda
import PyCall
import Fluster.Constants: FLUSTER_ENV

function syspy()
    "python" * (Base.Sys.iswindows() ? ".exe" : "")
end

@testset "Python env" begin
    @test joinpath(Conda.python_dir(FLUSTER_ENV), syspy()) == PyCall.pyprogramname
end
