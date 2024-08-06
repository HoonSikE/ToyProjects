<template>
  <div>
    <div class="title">
      GA4Test (Vue.js)
    </div>
    <div class="router-view-wrapper">
      <nav class="nav-list">
        <RouterLink class="nav-list-item" to="/" @click="VirPage0()" >Home</RouterLink>
        <RouterLink class="nav-list-item" to="/page1" @click="VirPage1()" >Page1</RouterLink>
        <RouterLink class="nav-list-item" to="/page2" @click="VirPage2()" >Page2</RouterLink>
        <RouterLink class="nav-list-item" to="/page3" @click="VirPage3()" >Page3</RouterLink>
      </nav>
    </div>
    <body>
      <router-view></router-view>
    </body>
    <HomeView /> 
  </div>
</template>

<script>
import {sendGAPage, sendGAVirPage} from './js/GoogleAnalyticsBuilder.js';

export default {
  name: 'App',
  mounted() {
    this.sendPageView();
  },
  methods:{
    sendPageView: function() {
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
    },
    VirPage0: function() {
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
    },
    VirPage1: function() {
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
    },
    VirPage2: function() {
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
    },
    VirPage3: function() {
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
    },
  }
}
</script>

<style scoped>
  @import './css/style.css'
</style>
