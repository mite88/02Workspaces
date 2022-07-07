import { BrowserRouter, Routes, Route } from "react-router-dom";
import './App.css';

import Header from './components/Header';
import Left from './components/Left';
import Blist from './components/Blist';
import Bview from './components/Bview';
import Bwrite from './components/Bwrite';
import Bottom from './components/Bottom';


function App() {
    return (
        <BrowserRouter>
            <div class="container">

                <Header />

                <div class="row">
                    <Left />
                    <Routes>
                        <Route path='/' element={<Blist></Blist>}></Route>
                        <Route path='/Blist' element={<Blist></Blist>}></Route>
                        <Route path='/Bview' element={<Bview></Bview>}></Route>
                        <Route path='/Bwrite' element={<Bwrite />}></Route>
                    </Routes>

                </div>
                <Bottom />

            </div>
        </BrowserRouter>
    );
}

export default App;