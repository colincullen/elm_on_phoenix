# Elm on Phoenix Minimal Setup
This repo contains a Phoenix scaffolding to which Elm has bee added. This implementation was created using the instructions that follow. To view the change differences between a base Phoenix project and the same project after Elm has been added, review:
https://github.com/colincullen/elm_on_phoenix/pull/1/files

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
Note: I thought the following git commands would create and update my remote repo with the files in my newly created local repo, but this was not the case. I first had to create an empty repo named ```_on_phoenix``` using the github GUI before the following commands had the desired result.
```
git remote add origin https://github.com/[your account name]/elm_on_phoenix.git
git push -u origin master
```

#### Install Elm
```
npm install -g elm
````

#### Include the elm compiler and the elm-webpack-loader tool in the project
```
cd assets
npm install --save elm elm-webpack-loader
```
Adds the Elm dependencies to the package.json file.
```
"dependencies": {
  "elm": "^0.19.0",
  "elm-webpack-loader": "^5.0.0",
  "phoenix": "file:../deps/phoenix",
  "phoenix_html": "file:../deps/phoenix_html"
},
```
#### Create the folder ```elm``` where elm code and other elm related items will reside

```
cd assets
mkdir elm
```
#### Update .gitignore
```
# Elm
/assets/elm/elm-stuff
```
#### Add the Elm project within the Phoenix scaffold - executed in ```assets```

``` 
elm init
```
#### Create file ```Main.elm``` in ```assets/elm/src``` and add the following content
```javascript
module Main exposing (main)

import Html exposing (Html, text)


main : Html msg
main =
    text "Hello from Elm!"
```
#### In the ```assets``` folder, add the following to the ```rules``` section of the ```webpack.config.js``` file 
```javascript
// ...
module: {
  //...
  rules: [
    {
      test: /\.elm$/,
      exclude: [/elm-stuff/, /node_modules/],
      use: {
        loader: 'elm-webpack-loader',
        options: {
          cwd: path.resolve(__dirname, 'elm')
        }
      }
    }
  ]
},
// ...
```
#### Replace the complete contents of the ```assets/js/app.js``` file with the following
```javascript
import { Elm } from "../elm/src/Main.elm"

Elm.Main.init({
  node: document.getElementById("elm-container")
})
```
#### Replace the complete contents of ```lib/elm_on_phoenix_web/templates/page/index.html.eex``` with the following
```
<div id="elm-container"></div>
```
#### Because the web page response was changed one of the tests will need to be fixed

To see the failing test change back to the project directory root and execute the tests using Mix by entering
```
mix test
```
The right side value, "Welcome to Phoenix!", will no longer match because it no longer exists.

The failing test is
```
test/elm_on_phoenix_web/controllers/page_controller_test.exs
```
Replace the line 
```
assert html_response(conn, 200) =~ "Welcome to Phoenix!"
```
with
```
assert html_response(conn, 200) =~ "elm-container"
```
Re-run the tests using Mix - all tests should pass now

#### Finally, from the project root directory of the app, start the server
```
mix phx.server
```
You should now see ```Hello, Elm!``` on the page at http://localhost:4000

