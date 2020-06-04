using githubactions4julia
using Test

@testset "githubactions4julia.jl" begin
    # Write your tests here.
    @test plus(1,1)==2 #結果は成功
    @test plus(1,1)==3 #結果は失敗
    @test fail
end
