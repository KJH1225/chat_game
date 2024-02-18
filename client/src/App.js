import './App.css';
import { Routes, Route } from 'react-router-dom';
import Login from './page/Login/Login.js';
import Join from './page/Join/Join.js';
import Chart from './page/Chat/Chat';
import Room from './components/RommList/Room/Room.js';

function App() {
  return (
    <div className="App">
      {/* <Main></Main> */}
      <Routes>
        <Route path='/' element={<Login></Login>}></Route>
        <Route path='/Join' element={<Join></Join>}></Route>
        
        <Route path='/room' element={<Room></Room>}></Route>
        <Route path='/chat' element={<Chart></Chart>}></Route>
      </Routes>
    </div>
  );
}

export default App;
