"""
    DE9IMPredicate <: Any

Abstract type for all DE9IM predicates objects.
"""
abstract type DE9IMPredicate{T} end

Base.parent(p::DE9IMPredicate) = p.val

"""
    Intersects{T} <: DE9IMPredicate{T}
    Intersects() = Intersects(nothing)

Intersects: Two geometries intersect if they have any point in common.

An Intersects predicate returns true if the two geometries have at least one point in common.
"""
struct Intersects{T} <: DE9IMPredicate{T}
    val::T
end
Intersects() = Intersects(nothing)

"""
    Disjoint{T} <: DE9IMPredicate{T}
    Disjoint() = Disjoint(nothing)

Disjoint: Two geometries are disjoint if their intersection is empty.

A Disjoint predicate returns true if the two geometries have no points in common.
"""
struct Disjoint{T} <: DE9IMPredicate{T}
    val::T
end
Disjoint() = Disjoint(nothing)

"""
    Contains{T} <: DE9IMPredicate{T}
    Contains() = Contains(nothing)

Contains: Geometry A contains geometry B if and only if all points of B lie in the interior of A.

A Contains predicate returns true if all points of the second geometry lie in the interior of the first geometry.
"""
struct Contains{T} <: DE9IMPredicate{T}
    val::T
end
Contains() = Contains(nothing)

"""
    Within{T} <: DE9IMPredicate{T}
    Within() = Within(nothing)

Within: Geometry A is within geometry B if and only if all points of A lie in the interior of B.

A Within predicate returns true if all points of the first geometry lie in the interior of the second geometry.
"""
struct Within{T} <: DE9IMPredicate{T}
    val::T
end
Within() = Within(nothing)

"""
    Covers{T} <: DE9IMPredicate{T}
    Covers() = Covers(nothing)

Covers: Geometry A covers geometry B if and only if the intersection of A and B is equal to B.

A Covers predicate returns true if the intersection of the two geometries is equal to the second geometry.
"""
struct Covers{T} <: DE9IMPredicate{T}
    val::T
end
Covers() = Covers(nothing)

"""
    CoveredBy{T} <: DE9IMPredicate{T}
    CoveredBy() = CoveredBy(nothing)

CoveredBy: Geometry A is covered by geometry B if and only if the intersection of A and B is equal to A.

A CoveredBy predicate returns true if the intersection of the two geometries is equal to the first geometry.
"""
struct CoveredBy{T} <: DE9IMPredicate{T}
    val::T
end
CoveredBy() = CoveredBy(nothing)

"""
    Touches{T} <: DE9IMPredicate{T}
    Touches() = Touches(nothing)

Touches: Two geometries touch if they have at least one point in common, but their interiors do not intersect.

A Touches predicate returns true if the two geometries have at least one point in common, but their interiors do not intersect.
"""
struct Touches{T} <: DE9IMPredicate{T}
    val::T
end
Touches() = Touches(nothing)

"""
    Crosses{T} <: DE9IMPredicate{T}
    Crosses() = Crosses(nothing)

Crosses: Geometry A crosses geometry B if and only if they have some but not all interior points in common.

A Crosses predicate returns true if the two geometries have some but not all interior points in common.
"""
struct Crosses{T} <: DE9IMPredicate{T}
    val::T
end
Crosses() = Crosses(nothing)

"""
    Overlaps{T} <: DE9IMPredicate{T}
    Overlaps() = Overlaps(nothing)

Overlaps: Geometry A overlaps geometry B if and only if they have some interior points in common.

An Overlaps predicate returns true if the two geometries have some interior points in common.
"""
struct Overlaps{T} <: DE9IMPredicate{T}
    val::T
end
Overlaps() = Overlaps(nothing)

"""
    Equals{T} <: DE9IMPredicate{T}
    Equals() = Equals(nothing)

Equals: Two geometries are equal if and only if they have the same boundary and interior points.

An Equals predicate returns true if the two geometries have the same boundary and interior points.
"""
struct Equals{T} <: DE9IMPredicate{T}
    val::T
end
Equals() = Equals(nothing)