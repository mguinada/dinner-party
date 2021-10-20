import * as React from 'react';
import { render, screen } from '@testing-library/react';
import recipes from './fixtures/recipes.json'
import Recipes from '../Recipes.js.jsx'
import '@testing-library/jest-dom/extend-expect';

describe('Recipes', () => {
  it('Renders the recipes', () => {
    render(<Recipes recipes={recipes} />)

    expect(screen.getByText('Gnocchis à la Romaine de ma grand mère (farine)')).toBeInTheDocument();
    expect(screen.getByText('Gnocchis à la romaine')).toBeInTheDocument();
  })
})
