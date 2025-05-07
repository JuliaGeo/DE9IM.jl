using DE9IM
using Test

@testset "DE9IM.jl" begin
    @testset "Constructors" begin
        @test Intersects() == Intersects(nothing)
        @test Disjoint() == Disjoint(nothing)
        @test Contains() == Contains(nothing)
        @test Within() == Within(nothing)
        @test Covers() == Covers(nothing)
        @test CoveredBy() == CoveredBy(nothing)
        @test Touches() == Touches(nothing)
        @test Crosses() == Crosses(nothing)
        @test Overlaps() == Overlaps(nothing)
        @test Equals() == Equals(nothing)
    end

    @testset "parent" begin
        @test parent(Intersects(3.0)) == 3.0
        @test parent(Disjoint(3.0)) == 3.0
        @test parent(Contains(3.0)) == 3.0
        @test parent(Within(3.0)) == 3.0
        @test parent(Covers(3.0)) == 3.0
        @test parent(CoveredBy(3.0)) == 3.0
        @test parent(Touches(3.0)) == 3.0
        @test parent(Crosses(3.0)) == 3.0
        @test parent(Overlaps(3.0)) == 3.0
        @test parent(Equals(3.0)) == 3.0
    end

    @testset "eltype" begin
        @test eltype(Intersects(3.0)) == Float64
        @test eltype(Disjoint(3.0)) == Float64
        @test eltype(Contains(3.0)) == Float64
        @test eltype(Within(3.0)) == Float64
        @test eltype(Covers(3.0)) == Float64
        @test eltype(CoveredBy(3.0)) == Float64
        @test eltype(Touches(3.0)) == Float64
        @test eltype(Crosses(3.0)) == Float64
        @test eltype(Overlaps(3.0)) == Float64
        @test eltype(Equals(3.0)) == Float64
    end
end;
