import React, { useState, useEffect } from 'react';
import './App.css';

/*
Hook
리액트 기본 버전에선 간단한 기능을 기능 제작시 함수를 사용했는데
이는 state 변경이 클래스형 컴포넌트에서만 가능했기 때문

16.8버전 이후 Hook를 통해 함수형 컴포넌트에서도 state변경이 가능하게됨
useXXX()와 같은 이름으로 함수를 사용하고
이를 위해 별도의 import가 필요함
*/

//최상위 컴포넌트
function App() {
  return (
    <div className="container">
      <h1>Class vs Function Style</h1>
      <FuncComponent initNumber={2}>x</FuncComponent>
      <ClassComponent initNumber={2}>x</ClassComponent>
    </div>
  );
}

/*
함수형 컴포넌트
출력할 내용을 즉시 return하면됨
(함수 자신이 render()역할을 하므로..)
*/
function FuncComponent(props) {

  console.log('#Life','FuncComponent==> 함수실행');

  /*
  함수형 컴포넌트에선 useState()라는 훅으로 state설정 및 변경
  여기서 useState()의 매개변수는 2가 전달되므로
  이를 통해 설정하면 0번째 원소는 인자로 전달된값이고
  1번째 원소는 state값을 변경할수 있는 함수가됨
  */
  var numberState = useState(props.initNumber);
  console.log("number State", numberState);
  var number = numberState[0];// 값
  var setNumber = numberState[1]; //함수

  var dateState = useState(new Date().toString());
  var nowDate = dateState[0];
  var setDate = dateState[1];
  /*아래와같이 변경가능*/
  //var [nowDate, setDate] = useState((new Date().toString();

  useEffect(function(){
		console.log('#Life','FuncComponent==> useEffect');
	});

	console.log('#Life','FuncComponent==> return실행(render와 동일)');

  return (
    <div className="container">
      <h2>function style component</h2>
      <p>initNumber : {props.initNumber}</p>
      {/* useState()를 통해 반환된 첫번째 원소 출력됨 */}
      <p>initNumber : {number}</p>
      <p>날짜 : {nowDate}</p>

      {/* useState()를 통해 반환된 두번째 원소를 통해 state값 변경 */}
      <input type="button" value="난수생성" onClick={function () {
        setNumber(Math.random());
      }} />

      {/*함수형 컴포넌트에선 state값 변경을 위해 this사용할 필요없음*/}
      <input type="button" value="현재날짜" onClick={function () {
        setDate((new Date()).toString());
      }} />
    </div>
  );
}

/*
클래스형 컴포넌트
React.Component를 상혹하여 선언함
render()필수 기술
*/
class ClassComponent extends React.Component {
  /*state초기값으로 props(부모가 자식에게 전달해준 파라미터)사용*/
  state = {
    number: this.props.initNumber,
    nowDate: (new Date()).toString()
  }
  /*
   render() 호출 전 호출되는수명주기 함수
   getDerivedStateFromProps()함수가 있는데, render이 호출되기 전
   전달된 props를 통해 state를 변경하는 역할이며 반드시 반환값이 있어야함
  */
  UNSAFE_componentWillMount(){
    console.error("ClassComponent => componentWillmount()호출됨");
  }
  componentDidMount() {
    console.error("ClassComponent => componentDidMount() 호출됨");
  }
  shouldComponentUpdate() {
    console.error("ClassComponent => shouldComponentUpdate()  호출됨");
  }
  render() {
    return (
      <div className="container">
        <h2>class style component</h2>
        <p>initNumber : {this.props.initNumber}</p>
        {/* state 출력시 this.state.스테이트명 으로 사용 */}
        <p>initNumber : {this.state.number}</p>
        <p>날짜 : {this.state.nowDate}</p>

        {/* 클래스형 컴포넌트에선 state변경시 setState()사용 */}
        <input type="button" value="난수생성" onClick={function () {
          this.setState({ number: Math.random() });
        }.bind(this)} />

        {/* 일반함수 사용시에도 this 및 bind()해야하지만 화살표함수 
         사용시엔 바인딩이 필요없음 */}
        <input type="button" value="현재날짜" onClick={() => {
          this.setState({ nowDate: (new Date()).toString() });
        }
        } />
      </div>
    );
  }
}

export default App;
