import React from 'react'
import ReactDOM from 'react-dom'
import App from '../components/App.js.jsx'

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(
    <App />,
    document.body.appendChild(document.createElement('div')),
  )
})
