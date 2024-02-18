import './App.css';
import { Routes, Route } from 'react-router-dom';
// import Main from './page/Main';
// import Test from './page/Test';
import Join from './page/Join/Join';
import Chart from './page/Chat/Chat';
import Room from './components/RommList/Room/Room.js';

function App() {
  return (
    <div className="App">
      {/* <Main></Main> */}
      <Routes>
        <Route path='/' element={<Join></Join>}></Route>
        <Route path='/room' element={<Room></Room>}></Route>
        <Route path='/chat' element={<Chart></Chart>}></Route>
      </Routes>
    </div>
  );
}

export default App;
