import React, { Component } from "react";

export default class AddNumber extends Component {
  //state 선언
  state = { adder: 1 };
  render() {
    return (
      <div>
        <h4>숫자증가 Form (Depth2)</h4>
        <p>숫자를 변경한 후 증가 버튼을 누르세요.</p>

        {/* state값을 value로 하고 변화시 state에 즉시 적용함*/}
        <input type="number" className="addInput" value={this.state.adder}
          onChange={(e) => {
            //Event객체를 통해 input상자에 입력된 값 얻어옴
            this.setState({ adder: Number(e.target.value) });
          }}
        ></input>

        {/* Depth1의 부모 컴포넌트가 props로 전달해준 이벤트객체로 
        현재 state값을 매개변수로 전달함*/}
        <input type="button" lass="addBtn" value="증가"
          onClick={() => {
            this.props.addNumberClick2(this.state.adder);
          }}
        ></input>
      </div>
    );
  }
}
