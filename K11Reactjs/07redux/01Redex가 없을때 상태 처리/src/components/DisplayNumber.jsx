import React, { Component } from "react";

export default class DisplayNumber extends Component {
    render() {
        return (
            <div>
                {/* 부모로 부터 받은 props를 value속성으로 추가 */}
                <h4>숫자 출력Form (Depth2)</h4>
                <input type="text" className="disInput" value={this.props.subNumber2} readOnly></input>
            </div>
        );
    }
}