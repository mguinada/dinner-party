import React, {Component} from 'react'
import PropTypes from 'prop-types'

function Tags(props) {
  return(
    <div className="tag-list">
      {props.tags.map(tag => <span key={tag} className='tag'>{tag}</span>)}
    </div>
  )
}

function Ingredients(props) {
  return(
    <div className="ingredients col-md-9">
      <h5 className="mb-1">Ingredients</h5>
      <ul className="ingredient-list">
        {props.ingredients.map(ingredient => <li key={ingredient.id} className='ingredient'>{ingredient.description}</li>)}
      </ul>
    </div>
  )
}

class Recipe extends Component {
  static propTypes = {
    recipe: PropTypes.shape({
      id: PropTypes.number.isRequired,
      name: PropTypes.string.isRequired,
      ingredients: PropTypes.array,
      rate: PropTypes.string,
      budget: PropTypes.string,
      prep_time: PropTypes.string,
      cook_time: PropTypes.string,
      total_time: PropTypes.string,
      author: PropTypes.string,
      difficulty: PropTypes.string,
      people_quantity: PropTypes.string,
      image: PropTypes.string,
      author_tip: PropTypes.string,
      tags: PropTypes.array,
    })
  }

  static defaultProps = {
    recipe: {
      name: "Unknown"
    }
  }

  render() {
    return(
      <li className="list-group-item d-flex justify-content-between align-items-center">
        <a href="#" className="list-group-item list-group-item-action" aria-current="true">
          <div className="d-flex w-100 justify-content-between">
            <h3 className="mb-1">{this.props.recipe.name}</h3>
          </div>
          <div className="float-end">
            <ul className="parameters">
              <li>
                <span className="parameter">Serves:</span><span className="float-end">{this.props.recipe.people_quantity}</span>
              </li>
              <li>
                <span className="parameter">Difficulty:</span><span className="float-end">{this.props.recipe.difficulty}</span>
              </li>
              <li>
                <span className="parameter">Time:</span><span className="float-end">{this.props.recipe.total_time}</span>
              </li>
              <li>
                <span className="parameter">Rating:</span><span className="float-end">{this.props.recipe.rate}</span>
              </li>
            </ul>
          </div>
          <div className="col-md-9">
            <small>
              <Tags tags={this.props.recipe.tags}/>
            </small>
          </div>
          <Ingredients ingredients={this.props.recipe.ingredients}/>
        </a>
      </li>
    )
  }
}

export default Recipe
