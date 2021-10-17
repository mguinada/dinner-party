// import React, {Component, useState} from 'react'
import React, {useState} from 'react'
import Recipes from './Recipes.js.jsx'

function App() {
  const [recipes, setRecipes] = useState([])
  const [ingredients, setIngredients] = useState([])

  const searchRecipes = (ingredients) => {
    fetch(`/recipes/search?ingredients=${ingredients}`)
      .then(data => {
        if (data.ok) {
          return data.json()
        } else {
          throw new Error("Network error.");
        }
      })
      .then(json => { setRecipes([...json]) })
      .catch(error => alert(error))
  }

  return(
    <div className="container">
      <div>
        <h1>Recipe Search</h1>
      </div>
      <div className="row">
        <div className="col-md-11">
          <input type="text" id="ingredientSearch" className="form-control" value={ingredients} onChange={e => setIngredients(e.target.value)} placeholder="Input a comma separated ingredient list"/>
        </div>
        <div className="col-md-1">
          <button type="button" className="btn btn-primary" onClick={(e) => searchRecipes(ingredients)}>Search</button>
        </div>
      </div>
      <div className="results">
        <div className="row">
          <div className="col-md-12">
            <Recipes recipes={recipes}/>
          </div>
        </div>
      </div>
    </div>
  )
}

export default App
