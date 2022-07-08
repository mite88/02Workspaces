import React, { Component } from "react";
import DisplayNumber from '../components/DisplayNumber';

export default class DisplayNumberRoot extends Component {
  render() {
      return (
          <div>
              <h4>숫자 출력Form (Depth1)</h4>
              <DisplayNumber />
            </div>
        );
    }
}