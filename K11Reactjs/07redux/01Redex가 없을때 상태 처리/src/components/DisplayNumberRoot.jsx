import React, { Component } from "react";
import DisplayNumber from '../components/DisplayNumber';

export default class DisplayNumberRoot extends Component {
  render() {
      return (
          <div>
              <h4>숫자 출력Form (Depth1)</h4>
              {/* App컴포넌트로부터 받은 props를 자식컴포넌트로 전달 */}
              <DisplayNumber subNumber2={this.props.subNumber}/>
            </div>
        );
    }
}