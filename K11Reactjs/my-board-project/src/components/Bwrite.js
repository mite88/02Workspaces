import React, { Component } from 'react';
import {Link} from "react-router-dom";

// <!-- Top 영역 s -->
class Bview extends Component {
    render() {
        const now = new Date();
        let formatted_date = now.getFullYear() + "-" + (now.getMonth() + 1) + "-" + now.getDate() ;
  

        return (
            <div className="col-lg-10" id="lay_contents">
            <h2>게시판글쓰기</h2>
            <form action='/create_process' method='post' onSubmit={(e)=>{
                e.preventDefault();
                this.props.onSubmitValue(
                    e.target.id.value,
                    e.target.title.value,
                    e.target.content.value,
                    e.target.date.value
                );  
            }} >

            <input type="hidden" name="date" defaultValue={formatted_date}></input>
            <table className="table table-bordered">
            <tbody>
                <tr>
                    <th width="20%">아이디</th>
                    <td width="80%">
                        <input type="text" name="id" defaultValue="kosmo" />
                    </td>
                </tr>
                <tr>
                    <th>제목</th>
                    <td>
                        <input type="text" name="title" />
                    </td>
                </tr>
                <tr>
                    <th>내용</th>
                    <td height="100">
                        <textarea name="content"></textarea>
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