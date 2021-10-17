import React, {Component} from 'react'
import PropTypes from 'prop-types'
import Recipe from './Recipe.js.jsx'

class Recipes extends Component {
  static propTypes = {
    recipes: PropTypes.array.isRequired
  }

  static defaultProps = {
    recipes: []
  }

  render() {
    return(
      <ul className="list-group">
        {
          this.props.recipes.map((recipe) => {
            return <Recipe key={recipe.id} recipe={recipe}/>
          })
        }
      </ul>
    )
  }
}

export default Recipes
