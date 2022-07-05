import React, { Component } from 'react';

class Navi extends Component {
   
    render() {
        //변수 선언
        let lists = [];
		//프롭스로 전달된 값을 변수에 저장
        let data = this.props.data;
        let i = 0; 

        //배열 크기만큼 반복
        while (i < data.length) {
            //앞에서 생성한 빈 배열에 li태그 넣기
            lists.push(
                /*
                React에서는 반복되는 코드가 존재시 중복되지 않는 key를 요구함
                */
                <li key={data[i].id}>
                    <a href={"/content/" + data[i].id}
                    data-id={data[i].id} 
                     onClick={function(event){
                        //링크 클릭시 이벤트 객체 호출
                        console.log(event);
                        event.preventDefault();
                        /*
                        부모가 props로 전달해준 함수 호출시 매개변수로전달한느 값은 해당태그의
                        data-id로 지정한 값을 event객체를 통해 얻어와서 전달함
                        */
                        this.props.onChangePage(event.target.dataset.id);
                    }.bind(this)} >
                        {data[i].title}
                        </a>
                </li>);
            i++;
        }

        return (

            <nav>
                <ul>
                    {lists}
                </ul>
            </nav>

        );
    }
}

export default Navi;