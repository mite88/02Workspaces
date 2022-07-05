import React, { Component } from 'react';

class CreateForm extends Component {
    render() {
        return (
           <article>
                <form action='/create_process' method='post' onSubmit={function(e){
                    e.preventDefault();
                     this.props.onSubmitValue(
                        e.target.title.value,
                        e.target.desc.value
                    );  
                }.bind(this)} >
                    <p><input type="text" name="title" placeholder='제목입력'/></p>
                    <p><textarea name="desc" placeholder='내용입력'></textarea> </p>
                    <p><input type="submit" value="전송"/></p>
                </form>
           </article>
        );
    }
}

export default CreateForm;