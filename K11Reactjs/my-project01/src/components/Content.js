import React, { Component } from 'react';
/*
Content 컴포넌트 렌더링시 속성으로 추가한 내용을 props로 얻어와 출력함
*/
class Content extends Component {
    render() {
        return (
            <article>
                <h2>{this.props.title}</h2>
                {this.props.desc}
            </article>
        );
    }
}

export default Content;