import React, { Component } from 'react';
import {Link} from "react-router-dom";

// <!-- Top 영역 s -->
class Bview extends Component {
    state = {
        id:'kosmo',
        name: '',
        content: '',
        date:''
    }
    handleChange = (e) => {
        this.setState({
            [e.target.name]: e.target.value
        })
    }
    handleSubmit = (e) => {
        // 페이지 리로딩 방지
        e.preventDefault();
        // 상태값을 onCreate 를 통하여 부모에게 전달
        this.props.onCreate(this.state);
        // 상태 초기화
        this.setState({
            id:'kosmo',
            name: '',
            content: '',
            date:''
        })
    }
    render() {
        const now = new Date();
        let formatted_date = now.getFullYear() + "-" + (now.getMonth() + 1) + "-" + now.getDate() ;
  

        return (
            <div className="col-lg-10" id="lay_contents">
            <h2>게시판글쓰기</h2>
            <form onSubmit={this.handleSubmit}>

            <input type="hidden" name="date" defaultValue={formatted_date}></input>
            <table className="table table-bordered">
            <tbody>
                <tr>
                    <th width="20%">아이디</th>
                    <td width="80%">
                        <input type="text" name="id" value={this.state.id}
                         onChange={this.handleChange}/>
                    </td>
                </tr>
                <tr>
                    <th>제목</th>
                    <td>
                        <input type="text" name="title"  value={this.state.title}
                         onChange={this.handleChange}/>
                    </td>
                </tr>
                <tr>
                    <th>내용</th>
                    <td height="100">
                        <textarea name="content"  value={this.state.content}
                         onChange={this.handleChange}></textarea>
                    </td>
                </tr>
                <tr>
                    <td colSpan="4" align="center">                     
                        <button type="submit" >
                            작성완료
                        </button>
                        <button type="button" >
                            <Link to="/Blist">리 스 트</Link>
                        </button>
                    </td>
                </tr>  
            </tbody>                              
            </table>
            </form>
        </div>
        );
    }
}

export default Bview;