import React, { Component } from "react";
/*
Depth2에 AddNumber 컴포넌트를자식으로 포함
*/
import AddNumber from "../components/AddNumber";

export default class AddNumberRoot  extends Component {
  state = { adder: 1 };
  render() {
    return (
        <div>
        <h3>숫자 증가 (Depth1)</h3>
        {/* 자식컴포넌트로 addNumber2 기능의 props 전달하여 App컴포넌트로 전송*/}
        <AddNumber addNumberClick2={(aNum) => {
                    this.props.addNumberClick(aNum);
                }} />
      </div>
    );
  }
}

