module CSSUtil

export style, empty

using WebIO
using JSON
import WebIO: render, Node

using Measures

function style(dict::Dict)
    Dict(:style=>dict)
end

function style(p::Pair...)
    style(Dict(p...))
end

function style(elem, dict::Dict)
    render(elem)(style(dict))
end

function style(elem, p::Pair...)
    style(elem, style(p...))
end

function style(::Void, arg...)
    style(arg...)
end

const empty = dom"div"()

export mm, em, cm, inch, pt, px, vw, vh, vmin, cent
"1mm"
const mm = Length(:mm, 1.0)
" 1em "
const em = Length(:em, 1.0)
"1cm"
const cm = Length(:cm, 1.0)
"1inch"
const inch = Length(:in, 1.0)
"1pt"
const pt = Length(:pt, 1.0)
"1px"
const px = Length(:px, 1.0)
"1vw"
const vw = Length(:vw, 1.0)
"1vh"
const vh = Length(:vh, 1.0)
"1vmin"
const vmin = Length(:vmin, 1.0)
"1% length"
const cent = Length(:cent, 1.0)

JSON.lower{u}(l::Length{u}) = "$(l.value)$u"
JSON.lower(l::Length{:cent}) = "$(l.value)%"

function assertoneof(x, xs, name="argument")
    if !(string(x) in xs)
        throw(ArgumentError("$name should be one of $(join(xs, ",", "or")) as a string or symbol."))
    end
end

include("layout.jl")

end # module