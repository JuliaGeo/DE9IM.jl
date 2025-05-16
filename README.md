# DE9IM

[![Build Status](https://github.com/JuliaGeo/DE9IM.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/rafaqz/DE9IM.jl/actions/workflows/CI.yml?query=branch%3Amain)

This package define wrapper structs for [DE9IM predicates](https://en.wikipedia.org/wiki/DE-9IM)

It provides no functionality of predicate calculation, just
structs to use as a shared interface that signifies that the
DE9IM standard will be followed.

- If used in Extents.jl, this would the corresponding Extents.jl
predicates will be used specifially for the extents of objects.
- In GeometryOps, it could be used for Point/Line/Polygon extents.
- In Rasters.jl, for selection of raster cells.

## Dispatch

Base dispatch can be overwritten by any package if it owns the wrapped object:

```julia
Base.func(::Covers{Package.Object}, x)
```

But more usually package functions will use it directly:

```julia
Package.predicate(::Covers{Nothing}, a, b) = Package.covers(a, b)
Package.predicate(pred::Covers, a) = Package.covers(a, parent(pred))
```

The predicate is assumed to wrap the _second_ argument, rather than the first, similar to `Base.Fix2`. 
Then, e.g. `predicate(Covers(b), a)` means that `a` covers `b`.

A real use case is something like this:

```julia
raster[Covers(geom)]
```
Where the vocabulary makes more sense.

## Basic Usage

Use as a "singleton" type, filled with `nothing`
```julia
pred = Crosses()
@assert parent(pred) === nothing
```

Use as a wrapper type:

```
pred = Crosses(1.0)
@assert parent(pred) === 1.0
@assert eltype(pred) == Float64
@assert typeof(pred) == Crosses{Float64}
```

Predicates may accept keywords:

```julia
pred = Intersects(1.0; manifold=:euclidian)
@assert DE9IM.keywords(pred) === (; manifold=:euclidian)
```

This doesn't change the basic behaviour of the object:
```
@assert parent(pred) === 1.0
@assert eltype(pred) === Float64
```

But somewhat complicates the type, with an inner wrapper:
```julia
@assert typeof(pred) == Intersects{DE9IM.ArgWithKeywords{Float64, @NamedTuple{manifold::Symbol}}}
```

Keyword interpretation is the responsibility of the ingesting package, any are allowed.
