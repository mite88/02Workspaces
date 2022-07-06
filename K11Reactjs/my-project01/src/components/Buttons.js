import React, { Component } from 'react';

class Buttons extends Component {
    render() {
        /*
        React에서 스타일 지정시 {{}}사용해야함
        listStyleType : list-style-type
        */
        return (
            <ul>
                <li style={{ listStyleType: 'none' }}>
                    
                   {/*  <input type="button" value="create" />
                    <input type="button" value="update" />
                    <input type="button" value="delete" />  */}

                    {/*
                    이벤트 리스너에서 일반함수를 사용하는 경우
                    bind()를 사용하거나, 화살표함수를 사용해야한다
                    (아래는 화살표 함수로 사용함)
                    */}

                    <input type="button" value="create" onClick={(e)=>{
                        e.preventDefault();
                        this.props.onChangeMode('create');
                    }}/>
                    <input type="button" value="update" onClick={(e)=>{
                        e.preventDefault();
                        this.props.onChangeMode('update');
                    }}/>
                    <input type="button" value="delete" onClick={(e)=>{
                        e.preventDefault();
                        this.props.onChangeMode('delete');
                    }}/>
                </li>
            </ul>
        );
    }
}

export default Buttons;