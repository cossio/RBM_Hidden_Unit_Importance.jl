using RBM_Hidden_Unit_Importance
using Documenter

DocMeta.setdocmeta!(RBM_Hidden_Unit_Importance, :DocTestSetup, :(using RBM_Hidden_Unit_Importance); recursive=true)

makedocs(;
    modules=[RBM_Hidden_Unit_Importance],
    authors="JFdCD <j.cossio.diaz@gmail.com>",
    repo="https://github.com/cossio/RBM_Hidden_Unit_Importance.jl/blob/{commit}{path}#{line}",
    sitename="RBM_Hidden_Unit_Importance.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)
