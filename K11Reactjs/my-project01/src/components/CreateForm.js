import React, { Component } from 'react';

class CreateForm extends Component {
    render() {
        return (
           <article>
                <form action='/create_process' method='post' onSubmit={(e)=>{
                    //이벤트 중지
                    e.preventDefault();
                    //부모가 내려준 props로 폼값(이벤트객체의 target속성이용) 전송
                    this.props.onSubmitValue(
                        e.target.title.value,
                        e.target.desc.value
                    );  
                }} >
                    <p><input type="text" name="title" placeholder='제목입력'/></p>
                    <p><textarea name="desc" placeholder='내용입력'></textarea></p>
                    <p><input type="submit" value="전송"/></p>
                </form>
           </article>
        );
    }
}

export default CreateForm;