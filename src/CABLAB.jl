#__precompile__()

"""
## The Earth System Data Cube
![](http://earthsystemdatacube.net/wp-content/uploads/2015/07/EarthDataCube3.png "The DataCube")

Some info on the project...
"""
module CABLAB
export Cube, getCubeData,readCubeData,CubeMem,CubeAxis, TimeAxis, TimeHAxis, VariableAxis, LonAxis, FitAxis, LatAxis, CountryAxis, SpatialPointAxis, saveCube, loadCube,
        RangeAxis, CategoricalAxis, MSCAxis, getSingVal, TimeScaleAxis, QuantileAxis, MethodAxis, RemoteCube, showVarInfo, @caxis_str #From Cube module
export registerDATFunction, mapCube, reduceCube, getAxis #From DAT module
export axVal2Index, plotTS, plotMAP, plotXY, plotScatter, plotMAPRGB #From Plot module
export DAT_detectAnomalies!, removeMSC, gapFillMSC, normalizeTS,DATfitOnline,
  sampleLandPoints, toPointAxis, getMSC, filterTSFFT, getNpY,timespacequantiles,
  timelonlatquantiles, getMedSC, extractLonLats,
  cubePCA, rotation_matrix, transformPCA, explained_variance #From Proc module
export TempCube, openTempCube, rmCube # From CachedArrays
export @loadOrGenerate # from CABLAB Tools

global const workdir=String["./"]
global const recal=Bool[false]
haskey(ENV,"CABLAB_WORKDIR") && (workdir[1]=ENV["CABLAB_WORKDIR"])
CABLABdir(x::String)=workdir[1]=x
recalculate(x::Bool)=recal[1]=x
recalculate()=recal[1]
CABLABdir()=workdir[1]
export CABLABdir

include("CABLABTools.jl")
include("Cubes/Cubes.jl")
include("CubeAPI/CubeAPI.jl")
include("DAT/DAT.jl")
include("Proc/Proc.jl")
include("Plot/Plot.jl")

using Suppressor
@suppress begin
import Vega.VegaVisualization
import Vega.patchwork_repr
#Patch Vega
function Base.show(io::IO, m::MIME"text/html", v::VegaVisualization)
    show(io, m, patchwork_repr(v))
end
end

importall .Cubes, .CubeAPI, .DAT, .Proc, .Plot, .CABLABTools

end # module
