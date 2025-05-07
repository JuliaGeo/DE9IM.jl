# DE9IM

[![Build Status](https://github.com/rafaqz/DE9IM.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/rafaqz/DE9IM.jl/actions/workflows/CI.yml?query=branch%3Amain)

This package define wrapper structs for [DE9IM predicates](https://en.wikipedia.org/wiki/DE-9IM)

It provides no functionality of predicate calculation, just
structs to use as a shared interface that signifies that the
DE9IM standard will be followed.

If used in Extents.jl, this would the corresponding Extents.jl
predicates will be used specifially for the extents of objects.

In GeometryOps, it could be used for Point/Line/Polygon extents.

In Rasters.jl, for selection of raster cells.

Base dispatch can be overwritten by any package if it owns the wrapped object:

```julia
Base.func(::Covers{Package.Object}, x)
```

But more usually package functions will use it directly:

```julia
Package.predicate(::Covers{Nothing}, a, b) = Package.covers(a, b)
Package.predicate(pred::Covers, a) = Package.covers(a, parent(pred))
```

When wrapping predicate arguments is assumed to wrap the _second_ argument of the predicate, rather than the first.