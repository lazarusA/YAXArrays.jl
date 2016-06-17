"""
## The Earth System Data Cube
![](http://earthsystemdatacube.net/wp-content/uploads/2015/07/EarthDataCube3.png "The DataCube")

Some info on the project...
"""
module CABLAB
export Cube, getCubeData,readCubeData,CubeMem,CubeAxis, TimeAxis, VariableAxis, LonAxis, LatAxis, CountryAxis, SpatialPointAxis, saveCube, loadCube,
        RangeAxis, CategoricalAxis#From Cube module
export registerDATFunction,registerDATFunctionN, mapCube #From DAT module
export axVal2Index, plotTS, plotMAP #From Plot module
export removeMSC, gapFillMSC, recurrences, normalize, timeMean, spatialMean #From Proc module
export TempCube, openTempCube # From CachedArrays

global const workdir=UTF8String["./"]
haskey(ENV,"CABLAB_WORKDIR") && (workdir[1]=ENV["CABLAB_WORKDIR"])
CABLABdir(x::AbstractString)=workdir[1]=x
CABLABdir()=workdir[1]
export CABLABdir

include("CABLABTools.jl")
include("Cubes/Cubes.jl")
include("CubeAPI/CubeAPI.jl")
include("DAT/DAT.jl")
include("Proc/Proc.jl")
include("Plot/Plot.jl")


importall .Cubes, .CubeAPI, .DAT, .Proc, .Plot

end # module
