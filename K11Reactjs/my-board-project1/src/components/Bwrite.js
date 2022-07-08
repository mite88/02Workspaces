import React, { Component } from 'react';

// <!-- Top 영역 s -->
class Bview extends Component {
    state = {}
 
    render() {
        const now = new Date();
        let formatted_date = now.getFullYear() + "-" + (now.getMonth() + 1) + "-" + now.getDate();


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
                                    <input type="text" name="id" defaultValue="Kosmo"/>
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
                                    <textarea name="content" ></textarea>
                                </td>
                            </tr>
                            <tr>
                                <td colSpan="4" align="center">
                                    <button type="submit" >
                                        작성완료
                                    </button>
                                    <button type="button" onClick={(e)=>{
                                        e.preventDefault();
                                        this.props.myChangeMode('list');
                                    }}>
                                        리 스 트
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