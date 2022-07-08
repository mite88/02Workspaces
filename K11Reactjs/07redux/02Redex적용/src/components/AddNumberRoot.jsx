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
        <AddNumber  />
      </div>
    );
  }
}

