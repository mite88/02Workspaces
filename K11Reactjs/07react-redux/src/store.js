
/*
리덕스(Redux)

리액트 생태계에서 가장 사용률이 높은 상태관리 라이브러리
컴포넌트들의 깊이에 상관없이 스토어를 통해 효율적인 관리가 가능함

리듀서(Reducer)
변화르 일으키는함수
state, action두가지의 파라미터를 받아옴

디스패치(Dispatch)
스토어의 내장함수로 액션을 발생시킴
액션과 타입 등을 매개변수로 전달

구독(Subscribe)
스토어의 내장함수로 함수 형태의 값을 파라미터로 받아옴
subscribe함수에 특정 함수르 전달 시, 액션이 디스패치 될때마다 전달해준 함수가 호출됨
*/

//createStore 모듈 임포트
import { legacy_createStore as createStore } from "redux";

/*
createStore()는 첫번째 매개변수로 reducer함수를 사용하며
2개의 매개변수로 (state, action) 사용함
*/
export default createStore(function (state, action) {
	//state가 undefined이면 number를 0으로 초기화
	if (state === undefined) {
		return { number: 0 }
	}
	//인수로 전달된 action.type이 INCREMENT일때 두숫자를 더해 state를 변경함
	if (action.type === 'INCREMENT') {

		return { ...state, number: state.number + action.size }
	}
	return state;
})