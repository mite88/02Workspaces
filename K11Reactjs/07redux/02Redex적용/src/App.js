import React, { Component } from 'react';
import './App.css';
import AddNumberRoot from './components/AddNumberRoot';
import DisplayNumberRoot from './components/DisplayNumberRoot';

class App extends Component {
  //state값 선언
  state = { rootNumber: 10 }
  render() {
    return (
      <div className="App">
        <h2>Root 컴포넌트</h2>
       
        <AddNumberRoot />
        <DisplayNumberRoot/>
      </div>
    );
  }
}

export default App;