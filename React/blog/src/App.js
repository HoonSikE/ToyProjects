/* eslint-disable */

import React, {useState} from 'react';
import logo from './logo.svg';
import './App.css';

// jsx 문법
function App() {
  
  // ES6 destructuring 문법
  let [title, updateTitle] = useState(['남자 코트 추천', '강남 우동 맛집', '파이썬독학']);
  let [date, updateDate] = useState(['2월 17일', '2월 18일', '2월 19일']);
  let [count, updateCount] = useState([0, 0, 0]);

  let posts = '강남 고기 맛집';

  function updateTitle2(){
    var tmpTitle = [...title]
    tmpTitle[0] = '여자 코트 추천'
    updateTitle(tmpTitle)
  }

  return (
    <div className="App">
      <div className='black-nav'>
        <div>개발 Blog</div>
      </div>
      <div className='list'>
        {/* <h3>{posts}</h3> */}
        <h3>{title[0]} <span onClick={ ()=>{ updateCount([count[0] + 1, 0, 0])} }>👍</span> {count[0]} </h3>
        <button onClick={updateTitle2}>제목 변경</button>
        <p>{date[0]}발행</p>
        <hr/>
      </div>
      <div className='list'>
        <h3>{title[1]}</h3>
        <p>{date[1]}발행</p>
        <hr/>
      </div>
      <div className='list'>
        <h3>{title[2]}</h3>
        <p>{date[2]}발행</p>
        <hr/>
      </div>

      <Modal/>
    </div>
  );
}

function Modal(){
  return (
    <div className='modal'>
      <h2>제목</h2>
      <p>날짜</p>
      <p>상세내용</p>
    </div>
  )
}

export default App;
