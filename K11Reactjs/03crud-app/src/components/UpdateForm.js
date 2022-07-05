import React, { Component } from "react";

class UpdateForm extends Component {
    constructor(props){
        super(props);
        this.state ={
            id : this.props.readData.id,
            title : this.props.readData.title,
            desc : this.props.readData.desc
        }
    }
    render() {
        return (
            <article>
                <h2>Update</h2>
                <form action="/create_process" method="post" onSubmit={function (e) {
                    e.preventDefault();
                    this.props.onSubmitValue(
                        e.target.id.value,
                        e.target.title.value,
                        e.target.desc.value
                    );
                }.bind(this)}>
                    <input type="hidden" name="id" /* value="아이디값" */value={this.props.readData.id} />
                    <p>
                        <input type="text" name="title" placeholder="제목입력" /* value="기존제목" */ 
                        value={this.props.readData.title} onChange={this.inputChangeHandler}/>
                    </p>
                    <p>
                        <textarea name="desc" placeholder="내용입력" /* value="기존내용 " */
                        value={this.props.readData.desc} onChange={this.inputChangeHandler}></textarea>
                    </p>
                    <p><input type="submit" value="전송" /></p>
                </form>
            </article >
        );
    }
}
export default UpdateForm;