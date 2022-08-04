import React, { Component } from 'react';
import {Link} from "react-router-dom";

// <!-- Top 영역 s -->
class Bview extends Component {
    render() {
        return (
            <div class="col-lg-10" id="lay_contents">
                <h2>게시판내용보기</h2>
                <table class="table table-bordered">
                    <tr>
                        <th width="10%">번호</th>
                        <td width="40%">1000</td>
                        <th width="10%">작성자</th>
                        <td width="40%">1000</td>
                    </tr>
                    <tr>
                        <th>작성일</th>
                        <td>1000</td>
                        <th>조회수</th>
                        <td>1000</td>
                    </tr>
                    <tr>
                        <th>제목</th>
                        <td colSpan="3">1000</td>
                    </tr>
                    <tr>
                        <th>내용</th>
                        <td colSpan="3" height="100">1000</td>
                    </tr>
                    <tr>
                        <td colSpan="4" align="center">
                            <button type="button" onClick="">
                            <Link to="/Blist">리스트바로가기</Link>
                            </button>
                        </td>
                    </tr>
                </table>
            </div>
        );
    }
}

export default Bview;