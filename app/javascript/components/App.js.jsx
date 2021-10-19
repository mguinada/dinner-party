import React, {useState} from 'react'
import Recipes from './Recipes.js.jsx'

function App() {
  const [recipes, setRecipes] = useState([])
  const [ingredients, setIngredients] = useState([])
  const [noResults, setNoResults] = useState(false)

  const searchRecipes = (ingredients) => {
    fetch(`/recipes/search?ingredients=${ingredients}`)
      .then(data => {
        if(data.ok) {
          return data.json()
        } else {
          throw new Error("Network error.");
        }
      })
      .then(json => {
        if(json.length === 0) {
          setNoResults(true)
        } else {
          setNoResults(false)
          setRecipes([...json])
        }
      })
      .catch(error => alert(error))
  }

  function NoResults() {
    return(
      <div className="no-results text-center">
        <p>No Results</p>
      </div>
    )
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
             {!noResults ? <Recipes recipes={recipes}/> : <NoResults/>}
          </div>
        </div>
      </div>
    </div>
  )
}

export default App
