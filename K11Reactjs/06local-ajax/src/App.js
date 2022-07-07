import React, { Component } from 'react';
import './App.css';

//Nav컴포넌트 모듈화
class Nav extends Component {
  //state선언(링크추가할거임 ㅇㅊㅇ)
  state = {
    list: []
  }
  //수명주기 함수중 render()가 호출되어 화면이 렌더링 딘 직후호출
  componentDidMount() {
    //비동기 통신을 위해 호출(내부에 작성된 JSON사용함)
    fetch('list.json')
      .then(function (result) {
        //요청 성공시 콜백데이터 반환
        return result.json();
      })
      .then(function (json) {
        //앞의 then절 반환 값이 전달됨
        console.log(json);
        this.setState({ list: json });
      }.bind(this));
  }
  //렌더링 처리
  render() {
    //네비에 반복되는 li태그 저장 배열
    var listTag = [];

    //state의 list반복
    for (var i = 0; i < this.state.list.length; i++) {
      //해당 인덱스 항목
      var li = this.state.list[i];
      //li태그 추가
      listTag.push(
        <li key={li.id}>
          {/* 이벤트 객체를 통해 전달하기 위해 data-id속성추가 */}
          <a href={li.id} data-id={li.id} onClick={(e) => {
            e.preventDefault(); 
            console.log("링크 클릭함");

            //부모에서 props를 통해 전달해준 이벤트를 통해 id전달
            this.props.myLinkClick(e.target.dataset.id);
          }}>{li.title}</a>
        </li>
      );
    }
    return (
      <nav>
        <ul>
          {listTag}
        </ul>
      </nav>
    );
  }
}

class Article extends Component {
  //부모 컴포넌트로 부터 props를 받아 내용 출력
  render() {
    return (
      <article>
        <h2>{this.props.title}</h2>
        {this.props.desc}
      </article>
    );
  }
}

class App extends Component {
  //첫 진입시 환영인사 출력함
  state = {
    article: { title: 'Welcome', desc: 'Hello, Ajax..!!' }
  }
  render() {
    return ( 
			<div className="App">
				<h1>WEB</h1> 

        <Nav myLinkClick={(id)=>{ 
          /*
          Nav링크 클릭시 전달되는 id값으로
          JSON파일을 fatch() 후 state변경
          */
        fetch(id+'.json') 
          .then(function(result) {
            return result.json();
          })
          .then(function(json) { 
            /*
            JSON에서 읽은 내용으로 state변경되며 
            변경시 render()재 호출 및 리로드
            */
            this.setState({ 
              article:{
                title: json.title, 
                desc: json.desc
              }
              });
            }.bind(this)); 
        }}></Nav>
			
				<Article title={this.state.article.title} desc={this.state.article.desc}>
				</Article>  
			</div >
		);
  }
}

export default App;