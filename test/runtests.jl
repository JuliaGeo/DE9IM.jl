using DE9IM
using Test

using DE9IM: keywords

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

    @testset "keywords" begin
        @test keywords(Intersects(3.0; foo=:bar)) == keywords(Intersects(; foo=:bar)) == (; foo=:bar)
        @test keywords(Disjoint(3.0; foo=:bar)) == keywords(Disjoint(; foo=:bar)) == (; foo=:bar)
        @test keywords(Contains(3.0; foo=:bar)) == keywords(Contains(; foo=:bar)) == (; foo=:bar)
        @test keywords(Within(3.0; foo=:bar)) == keywords(Within(; foo=:bar)) == (; foo=:bar)
        @test keywords(Covers(3.0; foo=:bar)) == keywords(Covers(; foo=:bar)) == (; foo=:bar)
        @test keywords(CoveredBy(3.0; foo=:bar)) == keywords(CoveredBy(; foo=:bar)) == (; foo=:bar)
        @test keywords(Touches(3.0; foo=:bar)) == keywords(Touches(; foo=:bar)) == (; foo=:bar)
        @test keywords(Crosses(3.0; foo=:bar)) == keywords(Crosses(; foo=:bar)) == (; foo=:bar)
        @test keywords(Overlaps(3.0; foo=:bar)) == keywords(Overlaps(; foo=:bar)) == (; foo=:bar)
        @test keywords(Equals(3.0; foo=:bar)) == keywords(Equals(; foo=:bar)) == (; foo=:bar)

        @test keywords(Intersects()) == (;)
        @test keywords(Disjoint()) == (;)
        @test keywords(Contains()) == (;)
        @test keywords(Within()) == (;)
        @test keywords(Covers()) == (;)
        @test keywords(CoveredBy()) == (;)
        @test keywords(Touches()) == (;)
        @test keywords(Crosses()) == (;)
        @test keywords(Overlaps()) == (;)
        @test keywords(Equals()) == (;)
    end

    @testset "parent" begin
        @test parent(Intersects(3.0)) == parent(Intersects(3.0; foo=:bar)) == 3.0
        @test parent(Disjoint(3.0)) == parent(Disjoint(3.0; foo=:bar)) == 3.0
        @test parent(Contains(3.0)) == parent(Contains(3.0; foo=:bar)) == 3.0
        @test parent(Within(3.0)) == parent(Within(3.0; foo=:bar)) == 3.0
        @test parent(Covers(3.0)) == parent(Covers(3.0; foo=:bar)) == 3.0
        @test parent(CoveredBy(3.0)) == parent(CoveredBy(3.0; foo=:bar)) == 3.0
        @test parent(Touches(3.0)) == parent(Touches(3.0; foo=:bar)) == 3.0
        @test parent(Crosses(3.0)) == parent(Crosses(3.0; foo=:bar)) == 3.0
        @test parent(Overlaps(3.0)) == parent(Overlaps(3.0; foo=:bar)) == 3.0
        @test parent(Equals(3.0)) == parent(Equals(3.0; foo=:bar)) == 3.0
    end

    @testset "eltype" begin
        @test eltype(Intersects(3.0)) == eltype(Intersects(3.0; kw=true)) == Float64
        @test eltype(Disjoint(3.0)) == eltype(Disjoint(3.0; kw=true)) == Float64
        @test eltype(Contains(3.0)) == eltype(Contains(3.0; kw=true)) == Float64
        @test eltype(Within(3.0)) == eltype(Within(3.0; kw=true)) == Float64
        @test eltype(Covers(3.0)) == eltype(Covers(3.0; kw=true)) == Float64
        @test eltype(CoveredBy(3.0)) == eltype(CoveredBy(3.0; kw=true)) == Float64
        @test eltype(Touches(3.0)) == eltype(Touches(3.0; kw=true)) == Float64
        @test eltype(Crosses(3.0)) == eltype(Crosses(3.0; kw=true)) == Float64
        @test eltype(Overlaps(3.0)) == eltype(Overlaps(3.0; kw=true)) == Float64
        @test eltype(Equals(3.0)) == eltype(Equals(3.0; kw=true)) == Float64
    end
end;
