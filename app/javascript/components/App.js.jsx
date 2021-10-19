import React, {useState} from 'react'
import Recipes from './Recipes.js.jsx'

function App() {
  const [recipes, setRecipes] = useState([])
  const [ingredients, setIngredients] = useState([])
  const [isLoading, setLoading] = useState(false)
  const [noResults, setNoResults] = useState(false)

  const searchRecipes = (ingredients) => {
    fetch(`/recipes/search?ingredients=${ingredients}`)
      .then(data => {
        setLoading(true)

        if(data.ok) {
          return data.json()
        } else {
          setLoading(false)
          throw new Error("Network error.");
        }
      })
      .then(json => {
        setLoading(false)

        if(json.length === 0) {
          setNoResults(true)
        } else {
          setNoResults(false)
          setRecipes([...json])
        }
      })
      .catch(error => {
        setLoading(false)
        alert(error)
      })
  }

  function Button(props) {
    if(props.isLoading) {
      return(
        <button type="button" className="btn btn-primary w-100" disabled>
          <span className="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span>
        </button>
      )
    } else {
      return(
        <button type="button" className="btn btn-primary w-100" onClick={(e) => searchRecipes(ingredients)}>
          Search
        </button>
      )
    }
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
      <div className="text-center header">
        <h1>Recipe Search</h1>
      </div>
      <div className="row">
        <div className="col-md-10">
          <input type="text" className="form-control" value={ingredients} onChange={e => setIngredients(e.target.value)} placeholder="Input a comma separated list of ingredients"/>
        </div>
        <div className="col-md-2">
          <Button isLoading={isLoading}/>
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
