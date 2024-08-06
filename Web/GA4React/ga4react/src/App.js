import './App.css';

import './style.css';

import MainPage from "./pages/MainPage";
import Page1 from "./pages/Page1";
import Page2 from "./pages/Page2";
import Page3 from "./pages/Page3";
import { Link, Routes, Route, BrowserRouter } from "react-router-dom";

import React, { useEffect } from 'react';
import {sendGAPage, sendGAVirPage, sendGAEvent, sendGAAttrEvent, sendGAEcommerce} from './GoogleAnalyticsBuilder';
import {productShoes1, productShoes2, productShirt1, productShirt2, productDrink1, productDrink2} from './product';

function App() {
  // 페이지가 처음 렌더링될 때 sendGAPage를 호출합니다.
  useEffect(() => {
    return () => {
        sendPageView();
    }
  }, []);

  const sendPageView = () => {
    let pageviewObj = {
        title: '메인>메인 홈',
        ep_page_name: '메인>메인 홈',
        ep_visit_channel: 'PCWeb',
        ep_login_yn: 'Y',
        ep_dow: '화123',
        user_id: 'hhpark',
        up_uid: 'hhpark',
        up_type: '개인',
        up_age: '20대',
        up_gender: 'M',
        up_joindate: '20240604',
    };
    sendGAPage(pageviewObj);
    console.log('페이지뷰 이벤트가 발생했습니다.');
  };
  const VirPage0 = () => {
    let pageviewObj = {
      title: '메인>메인 홈',
      location: 'http://localhost/',
      ep_page_name: '메인>메인 홈',
      ep_visit_channel: 'PCWeb',
      ep_login_yn: 'Y',
      ep_dow: '화123',
      user_id: 'hhpark',
      up_uid: 'hhpark',
      up_type: '개인',
      up_age: '20대',
      up_gender: 'M',
      up_joindate: '20240604',
    };
    sendGAVirPage(pageviewObj);
    console.log('가상 페이지뷰 이벤트가 발생했습니다.');
  };
  const VirPage1 = () => {
    let virtualObj = {
        title: '페이지1>페이지1 홈',
        location: 'http://localhost/Page1',
        ep_page_name: '페이지1>페이지1 홈',
        ep_visit_channel: 'PCWeb',
        ep_login_yn: 'Y',
        ep_dow: '화',
        user_id: 'hhpark',
        up_uid: 'hhpark',
        up_type: '개인_페이지1',
        up_age: '20대',
        up_gender: 'M',
        up_joindate: '20240604',
    };
    sendGAVirPage(virtualObj);
    console.log('가상 페이지뷰 이벤트가 발생했습니다.');
  };
  const VirPage2 = () => {
    let virtualObj = {
        title: '페이지2>페이지2 홈',
        location: 'http://localhost/Page2',
        ep_page_name: '페이지2>페이지2 홈',
        ep_visit_channel: 'PCWeb',
        ep_login_yn: 'Y',
        ep_dow: '화',
        user_id: 'hhpark',
        up_uid: 'hhpark',
        up_type: '개인_페이지2',
        up_age: '20대',
        up_gender: 'M',
        up_joindate: '20240604',
    };
    sendGAVirPage(virtualObj);
    console.log('가상 페이지뷰 이벤트가 발생했습니다.');
  };
  const VirPage3 = () => {
    let virtualObj = {
        title: '페이지3>페이지3 홈',
        location: 'http://localhost/Page3',
        ep_page_name: '페이지3>페이지3 홈',
        ep_visit_channel: 'PCWeb',
        ep_login_yn: 'Y',
        ep_dow: '화',
        user_id: 'hhpark',
        up_uid: 'hhpark',
        up_type: '개인_페이지3',
        up_age: '20대',
        up_gender: 'M',
        up_joindate: '20240604',
    };
    sendGAVirPage(virtualObj);
    console.log('가상 페이지뷰 이벤트가 발생했습니다.');
  };

  return (
    <div>
      <div className="title">
        GA4Test (React)
      </div>
      <BrowserRouter>
        <div className="nav-list">
          <Link className="nav-list-item" to={"/"} onClick={() => VirPage0()}>Home</Link>
          <Link className="nav-list-item" to={"/Page1"} onClick={() => VirPage1()}>Page1</Link>
          <Link className="nav-list-item" to={"/Page2"} onClick={() => VirPage2()}>Page2</Link>
          <Link className="nav-list-item" to={"/Page3"} onClick={() => VirPage3()}>Page3</Link>
        </div>
        <hr/>
        <Routes>
          <Route path="/" element={<MainPage />} />
          <Route path="/Page1" element={<Page1 />} />
          <Route path="/Page2" element={<Page2 />} />
          <Route path="/Page3" element={<Page3 />} />
        </Routes>
      </BrowserRouter> 
    </div>
  );
}

export default App;
