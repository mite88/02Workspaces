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
        {/* Depth1의 컴포넌트로 props전달함
                매개변수로 받은 값을 통해 state의 rootNumber와 더한 값 반영함 */}
        <AddNumberRoot addNumberClick={(addNum) => {
          this.setState({
            rootNumber: this.state.rootNumber + addNum
          });
        }}>

        </AddNumberRoot>
        {/* state로 선언된 rootNumber를 props을 자식으로 전달 */}
        <DisplayNumberRoot subNumber={this.state.rootNumber}></DisplayNumberRoot>
      </div>
    );
  }
}

export default App;