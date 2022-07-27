using Malyuzhinets
using Documenter

DocMeta.setdocmeta!(Malyuzhinets, :DocTestSetup, :(using Malyuzhinets); recursive=true)

makedocs(;
    modules=[Malyuzhinets],
    authors="Matthew Priddin and contributors",
    repo="https://github.com/mjp98/Malyuzhinets.jl/blob/{commit}{path}#{line}",
    sitename="Malyuzhinets.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://mjp98.github.io/Malyuzhinets.jl",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/mjp98/Malyuzhinets.jl",
    devbranch="main",
)
