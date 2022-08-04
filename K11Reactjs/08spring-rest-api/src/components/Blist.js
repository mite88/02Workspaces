import React, { Component } from 'react';
import {Link} from "react-router-dom";

// <!-- Top 영역 s -->
class Blist extends Component {
    render() {
        return (
            <div className="col-lg-10" id="lay_contents">
            <h2>게시판목록</h2>
            <table className="table table-bordered">
            <thead>
                <tr>
                    <th width="10%">번호</th>
                    <th width="*">제목</th>
                    <th width="15%">작성자</th>
                    <th width="15%">조회수</th>
                    <th width="15%">작성일</th>
                </tr>
            </thead>
            <tbody>
                <tr align="center">
                    
                    <td>100</td>

                    <td align="left">
                    
                        <Link to="/Bview">나는 제목</Link>

                    </td>

                    <td align="center">홍길동</td>
                    <td align="center">20</td>
                    <td align="center">2020.02.20</td>
                </tr>
            </tbody>    
            </table>
            <div align="right">
                <button type="button"><Link to="/Bwrite">글쓰기</Link></button>
            </div>            
        </div>
        );
    }
}

export default Blist;