using Pkg
using Conda

import Fluster.Constants: FLUSTER_ENV

if !(Conda.check_pip_interop(FLUSTER_ENV))
    Conda.pip_interop(true, FLUSTER_ENV)
end

Conda.add("pynwb", FLUSTER_ENV; channel="conda-forge")
Conda.pip("install", ["spikeinterface"], FLUSTER_ENV)

ENV["PYTHON"] = joinpath(Conda.python_dir(FLUSTER_ENV), "python")
Pkg.build("PyCall")
