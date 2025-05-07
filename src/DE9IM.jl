"""
    DE9IMPredicate{T} <: Any

Abstract type for all DE9IM predicates objects.
"""
abstract type DE9IMPredicate{T} end

Base.parent(p::DE9IMPredicate) = p.val
Base.eltype(p::DE9IMPredicate{T}) where T = T

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
Disjoint() = Disjoint(nothing)

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
Contains() = Contains(nothing)

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
Within() = Within(nothing)

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
Covers() = Covers(nothing)

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
CoveredBy() = CoveredBy(nothing)

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
Touches() = Touches(nothing)

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
Crosses() = Crosses(nothing)

"""
    Overlaps{T} <: DE9IMPredicate{T}
    Overlaps() = Overlaps(nothing)

`Overlaps`: Geometry A overlaps geometry B if and only if they have some interior points in common.

An `Overlaps` predicate returns true if the two geometries have some interior points in common.
"""
struct Overlaps{T} <: DE9IMPredicate{T}
    val::T
end
Overlaps() = Overlaps(nothing)

"""
    Equals{T} <: DE9IMPredicate{T}
    Equals() = Equals(nothing)

`Equals`: Two geometries are equal if and only if they have the same boundary and interior points.

An `Equals` predicate returns true if the two geometries have the same boundary and interior points.
"""
struct Equals{T} <: DE9IMPredicate{T}
    val::T
end
Equals() = Equals(nothing)