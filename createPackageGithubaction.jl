using PkgTemplates

DirPath="~/.julia/dev"
PackageName="githubactions4julia.jl"
user="wakakusa"
cd(DirPath)

t = Template(;
                  :julia=>v"1",
                  :user=>user,
                  :authors=>[user],
                  :dir=>DirPath,
                  
                  plugins=[
                      License(; name="MIT"),
                      Git(; manifest=false, ssh=true),
                      GitHubActions(; x86=true),
                      Documenter{GitHubActions}(),
                  ],
              )

t(PackageName)



using DocumenterTools
using MyPackage

repo=string("git@github.com:",user,"/",splitdir(PackageName),".git")
Travis.genkeys(user=user, repo=repo)


## ドキュメントローカル作成
cd $DirPath/$PackageName
julia --project=docs -e 'using Pkg;Pkg.develop(PackageSpec(path=pwd()));Pkg.instantiate();include("docs/make.jl");'
