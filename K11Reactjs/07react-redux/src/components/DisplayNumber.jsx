import React, { Component } from "react";
import store from "../store";

export default class DisplayNumber extends Component {
    state = { number:store.getState().number }

		constructor(props){
			super(props);

			store.subscribe(() => {
				this.setState (
					{ number:store.getState().number }
				)

			});
		}
    render() {
        return (
            <div>
                <h4>숫자 출력Form (Depth2)</h4>
                <input type="text" className="disInput" value={this.state.number} readOnly></input>
            </div>
        );
    }
}