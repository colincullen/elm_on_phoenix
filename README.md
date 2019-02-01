# Elm on Phoenix Minimal Setup
This repo contains a Phoenix scaffolding to which Elm has bee added. This implementation was created using the instructions that follow. To view the change differences between a base Phoenix project and the same project after Elm has been added, review @TODO

## Instructions

A minimal set of instructions for adding Elm to a Phoenix project
I credit these instructions to the following website for this minimalist approach - with one minor change to fix one of the elixir tests:
https://github.com/elixir-elm-tutorial/elixir-elm-tutorial-book

#### Create your new Phoenix project (use --no-ecto to skip the database - staying minimal)
```
mix phx.new elm_on_phoenix --no-ecto
```
#### Change your current working directory to the new project directory
```
cd elm_on_phoenix
```
#### Commit the generated project to a local git repo to save your work
```
git init
git add .
git commit -m 'Initial commit'
```
#### Add the local repo to a remote github repo
Note: I thought the following git commands would create and update my remote repo with the files in my newly created local repo, but this was not the case. I first had to create an empty repo named ```react_on_phoenix``` using the github GUI before the following commands had the desired result.
```
git remote add origin https://github.com/[your account name]/elm_on_phoenix.git
git push -u origin master
```

#### Install Elm
```
npm install -g elm
```

#### Include the elm compiler and the elm-webpack-loader tool in the project
'''
cd assets
npm install --save elm elm-webpack-loader
```
Adds the Elm dependencies to the package.json file.

"dependencies": {
  "elm": "^0.19.0",
  "elm-webpack-loader": "^5.0.0",
  "phoenix": "file:../deps/phoenix",
  "phoenix_html": "file:../deps/phoenix_html"
},

#### Create the folder elm where elm code and other elm related items will reside
```
cd assets
mkdir elm
```
