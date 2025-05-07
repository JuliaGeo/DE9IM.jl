module DE9IM

export DE9IMPredicate, 
    Intersects, 
    Disjoint, 
    Contains,
    Within,
    Covers,
    CoveredBy,
    Touches,
    Crosses,
    Overlaps,
    Equals

"""
    DE9IMPredicate{T} <: Any

Abstract type for all DE9IM predicates objects.
"""
abstract type DE9IMPredicate{T} end

# Allows passing keyword arguments into a predicate,
# for interpretation later in the context they are used in.
struct ArgWithKeywords{T,KW} 
    val::T 
    keywords::KW
end

keywords(::DE9IMPredicate) = NamedTuple()
keywords(p::DE9IMPredicate{<:ArgWithKeywords}) = keywords(p.val)
keywords(p::ArgWithKeywords) = p.keywords

Base.parent(p::DE9IMPredicate) = p.val
Base.parent(p::DE9IMPredicate{<:ArgWithKeywords}) = parent(p.val)
Base.parent(p::ArgWithKeywords) = p.val

Base.eltype(::DE9IMPredicate{T}) where T = T
Base.eltype(::ArgWithKeywords{T}) where T = T
Base.eltype(::DE9IMPredicate{<:ArgWithKeywords{T}}) where T = T

(::Type{T})(; kw...) where {T<:DE9IMPredicate} = T(_maybe_wrap(nothing, values(kw)))
(::Type{T})(x; kw...) where {T<:DE9IMPredicate} = T(_maybe_wrap(x, values(kw)))

_maybe_wrap(a, ::NamedTuple{(),Tuple{}}) = a
_maybe_wrap(a, kw::NamedTuple) = ArgWithKeywords(a, kw)

"""
    Intersects{T} <: DE9IMPredicate{T}

    Intersects(b)
    Intersects()

`Intersects`: Two geometries intersect if they have any point in common.

An `Intersects` predicate returns true if the two geometries have at least one point in common.

If `Intersects` wraps an object passed to a predicate function, it must be the second argument B.
"""
struct Intersects{T} <: DE9IMPredicate{T}
    val::T
end
Intersects() = Intersects(nothing)

"""
    Disjoint{T} <: DE9IMPredicate{T}

    Disjoint(b)
    Disjoint()

`Disjoint`: Two geometries are disjoint if their intersection is empty.

A `Disjoint` predicate returns true if the two geometries have no points in common.

If `Disjoint` wraps an object passed to a predicate function, it must be the second argument B.
"""
struct Disjoint{T} <: DE9IMPredicate{T}
    val::T
end

"""
    Contains{T} <: DE9IMPredicate{T}

    Contains(b)
    Contains()

`Contains`: Geometry A contains geometry B if and only if all points of B lie in the interior of A.

A `Contains` predicate returns true if all points of the second geometry lie in the interior of the first geometry.

If `Contains` wraps an object passed to a predicate function, it must be the second argument B.
"""
struct Contains{T} <: DE9IMPredicate{T}
    val::T
end

"""
    Within{T} <: DE9IMPredicate{T}

    Within(b)
    Within() = Within(nothing)

`Within`: Geometry A is within geometry B if and only if all points of A lie in the interior of B.

A `Within` predicate returns true if all points of the first geometry lie in the interior of the second geometry.

If `Within` wraps an object passed to a predicate function, it must be the second argument B.
"""
struct Within{T} <: DE9IMPredicate{T}
    val::T
end

"""
    Covers{T} <: DE9IMPredicate{T}

    Covers(b)
    Covers()

Covers: Geometry A covers geometry B if and only if the intersection of A and B is equal to B.

A Covers predicate returns true if the intersection of the two geometries is equal to the second geometry.

If `Covers` wraps an object passed to a predicate function, it must be the second argument B.
"""
struct Covers{T} <: DE9IMPredicate{T}
    val::T
end

"""
    CoveredBy{T} <: DE9IMPredicate{T}

    CoveredBy(b)
    CoveredBy()

`CoveredBy`: Geometry A is covered by geometry B if and only if the intersection of A and B is equal to A.

A `CoveredBy` predicate returns true if the intersection of the two geometries is equal to the first geometry.

If `CoveredBy` wraps an object passed to a predicate function, it must be the second argument B.
"""
struct CoveredBy{T} <: DE9IMPredicate{T}
    val::T
end

"""
    Touches{T} <: DE9IMPredicate{T}

    Touches(b)
    Touches()

`Touches`: Two geometries touch if they have at least one point in common, but their interiors do not intersect.

A `Touches` predicate returns true if the two geometries have at least one point in common, but their interiors do not intersect.
"""
struct Touches{T} <: DE9IMPredicate{T}
    val::T
end

"""
    Crosses{T} <: DE9IMPredicate{T}

    Crosses(b)
    Crosses()

`Crosses`: Geometry A crosses geometry B if and only if they have some but not all interior points in common.

A `Crosses` predicate returns true if the two geometries have some but not all interior points in common.
"""
struct Crosses{T} <: DE9IMPredicate{T}
    val::T
end

"""
    Overlaps{T} <: DE9IMPredicate{T}
    Overlaps() = Overlaps(nothing)

`Overlaps`: Geometry A overlaps geometry B if and only if they have some interior points in common.

An `Overlaps` predicate returns true if the two geometries have some interior points in common.
"""
struct Overlaps{T} <: DE9IMPredicate{T}
    val::T
end

"""
    Equals{T} <: DE9IMPredicate{T}
    Equals() = Equals(nothing)

`Equals`: Two geometries are equal if and only if they have the same boundary and interior points.

An `Equals` predicate returns true if the two geometries have the same boundary and interior points.
"""
struct Equals{T} <: DE9IMPredicate{T}
    val::T
end

end