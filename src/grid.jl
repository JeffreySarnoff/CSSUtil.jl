"""
    rgrid(el...)
    Row grid multiple web components (horizontal).
"""
function rgrid(elems::AbstractVector)
    nelems = length(elems)
    container(elems)(style("display" => "grid", "grid-template-rows"=>"repeat(1fr, $(nelems))"))
end
rgrid(xs...) = rgrid([xs...])

"""
    cgrid(el...)
    Column grid multiple web components (vertical).
"""
function cgrid(elems::AbstractVector)
    nelems = length(elems)
    container(elems)(style("display" => "grid", "grid-template-columns"=>"repeat(1fr, $(nelems))"))
end
cgrid(xs...) = cgrid([xs...])

"""
    grid(el...)
    Row and Column grid multiple web components.
"""
function grid(elems::AbstractMatrix)
    nelems = length(elems)
    nrows, ncols = size(elems)
    container(elems)(style("display" => "grid", "grid-template-rows"=>"repeat(1fr, $(nrows))",  "grid-template-columns"=>"repeat(1fr, $(ncols))"))
end
# grid(xs...) = grid([xs...])
