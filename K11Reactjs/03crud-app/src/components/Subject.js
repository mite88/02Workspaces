import React, { Component } from 'react';
/*
Subject 컴포넌트 렌더링시 속성으로 추가한 내용을 props로 얻어와 출력함
*/
class Subject extends Component {
    render() {
        return (
            <header>
                <h1><a href='/' onClick={function(e){
                    e.preventDefault();
                    //부모에서 props로 전달해준 이벤트 하수 실행
                    this.props.onChangePage();
                //일반함수의 경우 반드시 this와 bind()해야함
                }.bind(this)}>{this.props.title}</a></h1>
                {this.props.sub}
            </header>
        );
    }
}

export default Subject;