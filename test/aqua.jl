import Aqua
import RBM_Hidden_Unit_Importance
using Test: @testset

@testset "aqua" begin
    Aqua.test_all(RBM_Hidden_Unit_Importance; ambiguities = false)
end
