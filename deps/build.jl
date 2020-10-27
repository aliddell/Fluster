using Pkg
using Conda

import Fluster.Constants: FLUSTER_ENV

# required to use pip within a conda env
Conda.pip_interop(true, FLUSTER_ENV)

# add required Python packages
Conda.add("pynwb", FLUSTER_ENV; channel="conda-forge")
Conda.pip("install", ["spikeinterface"], FLUSTER_ENV)

# set PyCall's python to our conda env and rebuild
ENV["PYTHON"] = joinpath(Conda.python_dir(FLUSTER_ENV), "python")
Pkg.build("PyCall")
