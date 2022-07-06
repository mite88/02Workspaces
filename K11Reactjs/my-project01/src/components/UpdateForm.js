import React, { Component } from "react";

//수정폼 컴포넌트
class UpdateForm extends Component {
    //수정폼 컴포넌트로 전달된 데이터 수정을 위해 state로 변경가능하게 함
    //생성자 추가 및 state생성
    constructor(props){
        super(props);
        //부모 컴포넌트인 App.js에서 props를 통해 전달해준 게시물로 state를 초기화함
        this.state ={
            id : this.props.readData.id,
            title : this.props.readData.title,
            desc : this.props.readData.desc
        }
    }
    /*
    각 input에 입력한 내용이 있을시 state값 변경을 위해 선언한 함수로 
    setState() 함수를 통해 변경.

    이벤트 객체를 통해 각name, value를 얻어와 지정된 값을 변경하며 
    이때 대괄호 표기법을 사용함
    */
    inputChangeHandler = (e)=>{
        this.setState({[e.target.name]:e.target.value});
    }
    render() {
        return (
            <article>
                <h2>Update</h2>
                <form action="/create_process" method="post" onSubmit={(e) => {
                    e.preventDefault();
                    //부모에서 전달한 props로 폼값 전송
                    this.props.onSubmitValue(
                        //전송시 이벤트 객체를 사용함
                        e.target.id.value,
                        e.target.title.value,
                        e.target.desc.value
                    );
                }}>
                    {/*기존게시물 수정이라 아이디를 저장할 hidden 필요*/}

                    {/* input상자의 value값을 state로 변경, 값 변경시 onChange이벤트 리스너를
                    통해 함수 호출, 이로 인해 입력값에 대한 변경이 state에 적용됨 */}
                    <input type="hidden" name="id" /* value="아이디값" */defaultValue ={this.props.readData.id} />
                    <p>
                        <input type="text" name="title" placeholder="제목입력" /* value="기존제목" */ 
                        defaultValue ={this.props.readData.title} onChange={this.inputChangeHandler}/>
                    </p>
                    <p>
                        <textarea name="desc" placeholder="내용입력" /* value="기존내용 " */
                        defaultValue ={this.props.readData.desc} onChange={this.inputChangeHandler}></textarea>
                    </p>
                    <p><input type="submit" value="전송" /></p>
                </form>
            </article >
        );
    }
}
export default UpdateForm;