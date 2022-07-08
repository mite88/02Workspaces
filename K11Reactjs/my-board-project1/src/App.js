import React, { Component } from 'react';
import './App.css';

import Header from './components/Header';
import Left from './components/Left';
import Blist from './components/Blist';
import Bview from './components/Bview';
import Bwrite from './components/Bwrite';
import Bottom from './components/Bottom';

class App extends Component {
  
    render () {
        let contents = null;
        if(this.state.mode === "list"){
            contents = <Blist myChangeMode={(pmode)=>{
                this.setState({mode : pmode});
            }} />
        }
        else if(this.state.mode  === "view"){
            contents = <Bview myChangeMode={(pmode)=>{
                this.setState({mode : pmode});
            }} />
        }
        else if(this.state.mode  === "write"){
            contents = <Bwrite myChangeMode={(pmode)=>{
                this.setState({mode : pmode});
            }} />
        }

        return (
            <div className="container" >

                <Header />

                <div className="row">
                    <Left />
                    {contents}
                </div>
                <Bottom />

            </div>

        );
    }
}

export default App;