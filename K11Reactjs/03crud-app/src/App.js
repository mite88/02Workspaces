//해당문서에서 React기능 사용을 위한 import
import React, { Component } from 'react';
import './App.css';

/*
외부 js파일로 모듈화한 컴포넌트를 해당 문서로 importgka
각 컴포넌트 마지막에 지정한 "export default 컴포넌트명"을 그래로 사용함
*/
import Subject from './components/Subject';
import Navi from './components/Navi';
import Content from './components/Content';
import Buttons from './components/Buttons';
import CreateForm from './components/CreateForm';
import UpdateForm from './components/UpdateForm';

class App extends Component {
    constructor(props) {
        super(props);
        //게시물 일련번호 부여용 시퀀스, 새게시물 작성시 마다 +1됨
        this.max_content_id = 3;
        //steate 생성 및 초기화
        this.state = {
            subject: { title: 'WEB(st)', sub: 'world wide web(st)' },
            contents: [
                { id: 1, title: 'HTML', desc: 'HTML은 내용을 출력' },
                { id: 2, title: 'CSS', desc: 'CSS는 스타일을 지정' },
                { id: 3, title: 'JavaScript', desc: 'JS는 화면을 동적으로 제어' }
            ],
            mode: 'welcome',
            welcome: { title: 'Welcome', desc: 'Hello, React..!!' },
            selected_content_id: 2,
        }
    }
    render() {
        /*
        Navi를 클릭시 해당 내용 변경을 위해 state에 mode, welcome추가
        */
        let _title, _desc, _article = null;

        //타입비교를 위해 === 사용

        //처음 시작시 환영메세지 출력
        if (this.state.mode === 'welcome') {
            _title = this.state.welcome.title;
            _desc = this.state.welcome.desc;

            //웹 애플리케이션 처음 실행시 내용출력
            _article = <Content title={_title} desc={_desc}></Content>;

        } else if (this.state.mode === 'read') {
            //Navi의 각 링크 클릭시 해당 항목의 타이틀 및 제목 출력

            //선택한 항목을 출력하기 위해 반복문으로 선택함
            let i = 0;
            while (i < this.state.contents.length) {
                var data = this.state.contents[i];

                if (data.id === this.state.selected_content_id) {
                    _title = data.title;
                    _desc = data.desc;
                    break;
                }
                i++;
            }
            //내용출력
            _article = <Content title={_title} desc={_desc}></Content>;

        } else if (this.state.mode === 'create') {
            //onSubmitValue속성을 통해 자식으로 2개의 값을 전달받을 props 전달
            _article = <CreateForm onSubmitValue={function (_title, _desc) {
                console.log(_title, _desc);

                //일련번호(id) +1증가하여 부여함
                this.max_content_id = this.max_content_id + 1;

                /*
                새로 생성한 일련번호, 폼값 전송된 항목을 새로운 객체로 생성후 concat()로
                state의 contents에 추가함
                */
                var _contents = this.state.contents.concat(
                    { id: this.max_content_id, title: _title, desc: _desc }
                );

                /*
                state값 변경 후 새롭게 렌더링하여 화면에 다시 로드
                */
                this.setState({
                    contents: _contents,
                    mode: 'read',
                    selected_content_id: this.max_content_id
                })
            }.bind(this)}></CreateForm>;

        } else if (this.state.mode === 'update') {
            //배열의 인덱스가 0이라서 -1해줌(이부분은 나중에 수정해야함 ㅇㅊㅇ)
            //let _readData = this.state.contents[this.state.selected_content_id-1];

            let _readData;
            var i = 0
            while (i < this.state.contents.length) {
                var data = this.state.contents[i];
                if (data.id === this.state.selected_content_id) {
                    _readData = data;
                    break;
                }
                i++;
            }

            //게시물 수정을 위한 수점폼 컴포넌트추가 현재 조회중인 게시물을 props로 전달
            _article = <UpdateForm readData={_readData}
                onSubmitValue={function (_id, _title, _desc) {
                    //값 확인
                    console.log(_id, _title, _desc);

                    //기존배열을 복사함(Array.from)
                    var _contents = Array.from(this.state.contents);
                    //수정할 게시물 id에서 1빼서 배열 인덱스를 통해 수정한 객체 저장함
                    //수정된 객체를 폼값으로 전송된 값으로 새롭게 생성한 JSON객체임
                    /* _contents[this.state.selected_content_id-1]
                    = {id:Number(_id), title:_title, desc:_desc}; */

                    var i = 0
                    while (i < _contents.length) {
                        var data = _contents[i];
                        if(data.id === Number(_id)){
                            _contents[i]= {id:Number(_id), title:_title, desc:_desc};
                            break;
                        }
                        i++;
                    }
                    //변경된 배열을 state적용후 렌더링함
                    this.setState({
                        contents: _contents,
                        mode: 'read'
                    });
                }.bind(this)}>
            </UpdateForm>;
        } else if (this.state.mode === 'delete') {
            //여기서 처리시 렌더링 2번해야해서 비효율적
        }
        return (

            <div className="App">
                {/*
                Subject 컴포넌트로 onChangePage라는 props전달함
                (model를 welcome로 변경하는 역할임)
                */}
                <Subject title={this.state.subject.title}
                    sub={this.state.subject.sub}
                    onChangePage={function () {
                        //alert("이벤트 확인용(부모)");
                        this.setState({ mode: 'welcome' });
                    }.bind(this)}>
                </Subject>

                {/* 
                Navi컴포넌트로 onChangePage라는 props전달
                자식 호출시 mode를 read로 변경 후  매개변수로 전달된 값으로
                selected_content_id 변경함
                */}
                <Navi data={this.state.contents}
                    onChangePage={function (id) {
                        //console.log("이벤트 확인용(Navi)");
                        this.setState({
                            mode: 'read',
                            selected_content_id: Number(id)
                        });
                    }.bind(this)}>
                </Navi>
                {/*mode값 변경기능이 있는 onChangeMode라는 props 전달 */}
                <Buttons onChangeMode={function (btn_mode) {

                    if (btn_mode === 'delete') {
                        //React에선 window를 생략하면 에러남 ㅇㅊㅇ;;;
                        if (window.confirm('삭제할까요?')) {
                            //기존 배열 복사
                            var _contents = Array.from(this.state.contents);
                            var i = 0
                            //그중 삭제할 항목 찾기
                            while (i < _contents.length) {
                                if (_contents[i].id === this.state.selected_content_id) {
                                    //splice()를 이용하여 해당 항목을 삭제함
                                    _contents.splice(i, 1);
                                    break;
                                }
                                i++;
                            }
                            //읽을 항목이 없어졌으므로 mode는 welcome로 변경함
                            this.setState({
                                contents: _contents,
                                mode: 'welcome'
                            });
                        }
                    } else {
                        //mode가 다르면 단순히 state만 변경함
                        this.setState({
                            mode: btn_mode
                        });
                    }
                }.bind(this)}>
                </Buttons>

                {_article}

                {/*  <Content title={_title} desc={_desc}></Content>
                <CreateForm></CreateForm> */}
            </div>
        );
    }
}
export default App;