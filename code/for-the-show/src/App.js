import React, { Component } from 'react';
import logo from './logo.svg';
import './App.css';

class App extends Component {
  render() {
    return (
      <div className="App">
        <header className="App-header">
          <img src={logo} className="App-logo" alt="logo" />
          <p>
            Esta es una aplicación con una sola página
          </p>
          <a
            className="App-link"
            href="https://github.com/JJ/azure-cli"
            target="_blank"
            rel="noopener noreferrer"
          >
            Tutorial de Azure desde la línea de órdenes
          </a>
        </header>
      </div>
    );
  }
}

export default App;
