import React, { Component } from "react";
//리덕스 스토어 접근용 
import store from "../store";

export default class AddNumber extends Component {
    state = { adder: 1 }
    render() {
        return (
            <div>
                <h4>숫자 증가Form (Depth2)</h4>
                <p>숫자를 변경한 후 증가 버튼을 누르세요.</p>
                <input type="number" className="addInput" value={this.state.adder}
                    onChange={(e) => {
                        this.setState(
                            { adder: Number(e.target.value) }
                        );
                    }
                    }></input>

                {/* store의 dispatch() 함수로 값과 타입 전달함 */}
                <input type="button" className="addBtn" value="증가"
                    onClick={() => {
	                        store.dispatch({type:'INCREMENT', size:this.state.adder})
	                    }
                    }></input>
            </div>
        );
    }
}