/*
react-router-dom
React는 기본적으로 화면의 새로고침 없이 화면을 갱신
이경우주소가 하나로 고정되므로 즐겨찾기 등의 기능을 사용할 수 없음
이때 어떤 주소로 들어왔는지 알아내어 그에 해당하는 컴포넌트를 렌더링하고
그 상태를 관리하기 위해 내부적으로 state, props를 관리해주는 도구이다
*/

/*
라우팅
사용자가 주소 진입시 그 주소에해당하는
적당한 페이지를 사용자측으로 렌더링하는것

BrowserRouter
리액트 라운터 돔을 적용하고 싶은 컴포넌트 최상위에 감싸주는
레퍼로 사용함

Routes
URL에 따른 적당한 컴포넌트를 렌더링하기위해 사용하는 컴포넌트

Routes
Route는 Routes로 전체를 감싸야함

Link
링크를 걸때 a태그를 사용하나 클릭마다 페이지가 리로드 되기에
클릭시 페이지가 리로드 되지 않게 처리해줌

NavLink
Link와 동일하나 class속성을 해당 엘리먼트에 삽입해줌
*/
import './App.css';
import { BrowserRouter, Routes, Route, NavLink, useParams, Outlet } from "react-router-dom"
import { useLocation, useSearchParams } from "react-router-dom"

const NotFound = () => {
  return (
    <div>
      <h2>NotFound</h2>
      페이지를 찾을 수 없습니다. 경로를 확인해주세요.
    </div>
  );
}

function Home() {
  //쿼리스트링 그래로 얻어올때 사용 
  const location = useLocation();
  //const[쿼리스트링 값, 쿼리스트링 설정 함수] = = useSearchParams(); 
  const [searchParams, setSearchParams] = useSearchParams();
  //특정쿼리값은 get()사용함
  const detail = searchParams.get('detail');
  const mode = searchParams.get('mode');
  const onToggleDetail = () => {
    /*
      두번째 반환값 useSearchParams()함수르 통해 쿼리스트링 설정
    	
    "현재요청url?mode=mode값&detail=detail값"
    */
    setSearchParams({ mode, detail: detail === 'true' ? false : true });
  }
  /*쿼리스트링 중 detail은 그대로 사용하고 mode값엔 +1한 결과 설정*/
  const onIncreaseMode = () => {
    const nextMode = (mode === null || isNaN(mode)) ? 1 : parseInt(mode) + 1;
    setSearchParams({ mode: nextMode, detail });
  }
  return (
    <div>
      <h2>Home</h2>
      Home컴포넌트
      <div>
        <p>쿼리스트링: {location.search}</p>
        <p>detail : {detail}</p>
        <p>mode : {mode}</p>
        <button onClick={onToggleDetail}>Toggle detail</button>
        <button onClick={onIncreaseMode}>mode + 1</button>
      </div>
    </div>
  );
}

//Topics컴포넌트 메뉴 사용을 위해 변수생성, 객체가 하위 객체를 포함한 형태
const menuObject = {
  free: { title: '자유게시판', desc: '<h2>자유게시판 리스트</h2>' },
  qna: { title: '질문과답변', desc: '<h2>질문과답변 리스트</h2>' },
  faq: { title: '자주묻는질문', desc: '<h2>자주묻는질문 리스트</h2>' },
};

function Topics() {
  //li태그를 포함한 링크 추가를 위한 배열 변수생성 및 삽입
  let menuArray = [];
  for (var menu in menuObject) {
    //반복되는 요소 사용시 key속성이 필요함, 주로PK로 지정된 일런번호를 사용함
    menuArray.push(
      <li key={menu}>
        <NavLink to={"/Topics/" + menu}>{menuObject[menu].title}</NavLink>
      </li>
    );
  }
  return (
    <div>
      <h2>Topics</h2> Topics 컴포넌트
      <ul>
        {/* <li><NavLink to="/Topics/free">자유게시판</NavLink></li> 
			<li><NavLink to="/Topics/qna">질문과답변</NavLink ></li> 
			<li><NavLink to="/Topics/faq">자주묻는질문</NavLink></li>  */}
        {menuArray}
      </ul>
      {/* <Outlet  />  미 사용시 중첩 처리*/}
      {/* <Desc /> */}

      {/*중첩 라우팅 시 자식 컴포넌트로 선언된 객체 렌더링*/}
      <Outlet />
    </div>
  );
}

function Contact() {
  return (
    <div>
      <h2>Contact</h2>
      Contact컴포넌트
    </div>
  );
}

//Topics하위 메뉴 선택시 설명 추가를 위한 컴포넌트
function Desc() {
  //리액트 훅에서 제공하는 함수로 파라미터 정보 얻어올수 있음
  let params = useParams();
  //아래 라우팅처리 부분에서 Topics하위 rudfhfh :category한 부분의 값 얻기
  let category = params.category;
  let contents = '';//출력할내용

  if (category === undefined) {
    contents = { title: 'Sorry', desc: 'No Selected..!!' }
  } else {
    //하위 링크가 같다면 json객체얻어옴
    contents = menuObject[category];
  }

  //얻어온 JSON파싱해서 해당 컴포넌트를 <Topics> 하위에 출력
  return (
    <div>
      <h3>{contents.title}</h3>
      <p>{contents.desc}</p>
    </div>
  );
}

function App() {
  return (
    <BrowserRouter>
      <div className="App">
        <h1>Hello React Router DOM</h1>
        <h4>a태그 : 화면깜빡임 있음</h4>
        <ul>
          <li><a href="/">Home(a태그)</a></li>
          <li><a href="/Topics">Topics(a태그)</a></li>
          <li><a href="/Contact">Contact(a태그)</a></li>
          <li><NavLink to="/Abcd1234">없는링크</NavLink></li>
        </ul>

        <h4>Link : 화면의 깜빡임 없음</h4>
        <ul>
          <li><NavLink to="/">Home</NavLink></li>
          <li><NavLink to="/Topics">Topics</NavLink></li>
          <li><NavLink to="/Contact">Contact</NavLink></li>
        </ul>

        {/*
          <Route path='경로명' element={컴포넌트명}></Route> 
          매칭하는 경로명이 없을 경우 마지막 부분의 *가 모든
          URL과 매칭되어 NotFound컴포넌트를 렌더링함
          */}
        <h4>Routes : 화면의 깜빡임 없음</h4>
        <Routes>
          <Route path='/' element={<Home></Home>}></Route>

          {/* <Outlet  />  미 사용시 중첩 처리*/}
          {/*
            <Route path='/Topics' element={<Topics></Topics>}></Route> 
            <Route path="/Topics/:category" element={<Topics/>}</Route>
            */}

          {/*
          중첩해서 라우팅 처리시 Outlet을 통해 자식컴포넌트 렌더링 가능
          */}
          <Route path='/Topics' element={<Topics></Topics>}>
            <Route path=":category" element={<Desc />}></Route>
          </Route>

          <Route path='/Contact' element={<Contact></Contact>}></Route>
          <Route path='*' element={<NotFound></NotFound>}></Route>
        </Routes>
      </div>
    </BrowserRouter>
  );
}

export default App;