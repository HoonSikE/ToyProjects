/** 이벤트 */
// 상품 정보
var productShoes1 = {
    item_id: 'VANS_12345',
    item_brand: 'Vans',
    item_name: '반스 운동화 올드스쿨 블랙',
    item_variant: 'Black',
    price: 18860.0,
    affiliation: 'Golden Mall',
    coupon: 'SUMMER_FUN',
    item_category: 'Clothes',
    item_category2: 'Shoes',
    quantity: 1,
    index: 0,
};
var productShoes2 = {
    item_id: 'CROCS_67890',
    item_brand: 'Crocs',
    item_name: '바야밴드 클로그',
    item_variant: 'White',
    price: 35900.0,
    affiliation: 'Golden Mall',
    item_category: 'Clothes',
    item_category2: 'Shoes',
    quantity: 1,
    index: 1,
};
var productShirt1 = {
    item_id: 'NIKE_369',
    item_brand: 'Nike',
    item_name: '나이키 스우시 반팔',
    item_variant: 'Black/White',
    price: 22900.0,
    affiliation: 'Golden Mall',
    item_category: 'Clothes',
    item_category2: 'Shirt',
    quantity: 1,
    index: 2,
};
var productShirt2 = {
    item_id: 'COMME_777',
    item_brand: '꼼데가르송',
    item_name: 'PLAY 반팔티셔츠',
    item_variant: 'White',
    price: 123000.0,
    affiliation: 'Golden Mall',
    item_category: 'Clothes',
    item_category2: 'Shirt',
    quantity: 1,
    index: 3,
};
var productDrink1 = {
    item_id: 'SAM_111',
    item_brand: '삼육두유',
    item_name: '검은참깨 두유',
    price: 19500.0,
    affiliation: 'Golden Mall',
    item_category: 'Food',
    item_category2: 'Drink',
    quantity: 32,
    index: 4,
};
var productDrink2 = {
    item_id: 'M_13579',
    item_brand: '매일유업',
    item_name: '아몬드 브리즈',
    price: 21900.0,
    affiliation: 'Golden Mall',
    item_category: 'Food',
    item_category2: 'Drink',
    quantity: 24,
    index: 5,
};

function clickEvent(){
    let eventObj = {
        // 이벤트 명
        event_name: '이벤트 이름',
        // 이벤트 매개변수
        ep_click_page: '이벤트 페이지',
        ep_click_area: '이벤트 영역',
        ep_click_area2: '이벤트 영역 2',
        ep_click_label: '이벤트 테스트 라벨',
    };

    // 랜덤 숫자 생성 (0부터 9 사이)
    let randomNumber = Math.floor(Math.random() * 10);

    // 각 속성 값 뒤에 랜덤 숫자 추가
    for (let key in eventObj) {
        if (typeof eventObj[key] === 'string') {
            eventObj[key] += randomNumber;
        }
    }

    sendGAEvent(eventObj);
}
/** 전자상거래 */
function ViewItemList(){
    // 기본 정보
    let eventData = {
        event_name: 'view_item_list',
        ep_ecommerce: 'view_item_list',
    };
    // 거래 정보
    let transaction = {
        currency: 'KRW',
    };

    let items = [productShoes1, productShoes2, productShirt1
            , productShirt2, productDrink1, productDrink2];
    sendGAEcommerce(eventData, transaction, items);
}
function SelectItem(){
    // 기본 정보
    let eventData = {
        event_name: 'select_item',
        ep_ecommerce: 'select_item',
    };
    // 거래 정보
    let transaction = {
        currency: 'KRW',
    };
    
    let items = [productShoes1];

    sendGAEcommerce(eventData, transaction, items);
}
function ViewItem(){
    // 기본 정보
    let eventData = {
        event_name: 'view_item',
        ep_ecommerce: 'view_item',
    };
    // 거래 정보
    let transaction = {
        currency: 'KRW',
    };
    
    let items = [productShoes1];

    sendGAEcommerce(eventData, transaction, items);
}
function AddToWishlist(){
    // 기본 정보
    let eventData = {
        event_name: 'add_to_wishlist',
        ep_ecommerce: 'add_to_wishlist',
    };
    // 거래 정보
    let transaction = {
        currency: 'KRW',
    };
    
    let items = [productShoes1];

    sendGAEcommerce(eventData, transaction, items);
}
function AddToCart(){
    // 기본 정보
    let eventData = {
        event_name: 'add_to_cart',
        ep_ecommerce: 'add_to_cart',
    };
    // 거래 정보
    let transaction = {
        currency: 'KRW',
    };

    let items = [productShoes1];

    sendGAEcommerce(eventData, transaction, items);
}
function ViewCart(){
    // 기본 정보
    let eventData = {
        event_name: 'view_cart',
        ep_ecommerce: 'view_cart',
    };
    // 거래 정보
    let transaction = {
        currency: 'KRW',
    };

    let items = [productShoes1];

    sendGAEcommerce(eventData, transaction, items);
}
function RemoveFromCart() {
    // 기본 정보
    let eventData = {
        event_name: 'remove_from_cart',
        ep_ecommerce: 'remove_from_cart',
    };
    // 거래 정보
    let transaction = {
        currency: 'KRW',
    };

    let items = [productShoes1, productShirt1];

    sendGAEcommerce(eventData, transaction, items);
}
function BeginCheckout(){
    // 기본 정보
    let eventData = {
        event_name: 'begin_checkout',
        ep_ecommerce: 'begin_checkout',
    };
    // 거래 정보
    let transaction = {
        currency: 'KRW',
    };

    let items = [productShoes1];

    sendGAEcommerce(eventData, transaction, items);
}
function AddShippingInfo(){
    // 기본 정보
    let eventData = {
        event_name: 'add_shipping_info',
        ep_ecommerce: 'add_shipping_info',
    };
    // 거래 정보
    let transaction = {
        currency: 'KRW',
        value: 175860.0,
        shipping: 3000.0,
        payment_type: 'Kakao Pay',
    };

    let items = [productShoes1, productShirt1];

    sendGAEcommerce(eventData, transaction, items);
}
function AddPaymentInfo(){
    // 기본 정보
    let eventData = {
        event_name: 'add_payment_info',
        ep_ecommerce: 'add_payment_info',
    };
    // 거래 정보
    let transaction = {
        currency: 'KRW',
        value: 175860.0,
        shipping: 3000.0,
        payment_type: 'Kakao Pay',
    };

    let items = [productShoes1, productShirt1];

    sendGAEcommerce(eventData, transaction, items);
}
function Purchase(){
    // 기본 정보
    let eventData = {
        event_name: 'purchase',
        ep_ecommerce: 'purchase',
    };
    // 거래 정보
    let transaction = {
        currency: 'KRW',
        value: 175860.0,
        shipping: 3000.0,
        transaction_id: 'GP-240507',
        payment_type: 'Kakao Pay',
    };
    // 랜덤 숫자 생성 (0부터 99 사이)
    let randomNumber = Math.floor(Math.random() * 100);

    // title과 ep_page_name 속성에만 랜덤 숫자 추가
    if (transaction.hasOwnProperty('transaction_id')) {
        transaction.transaction_id += randomNumber;
    }

    let items = [productShoes1, productShirt1];

    sendGAEcommerce(eventData, transaction, items);
}
function Refund(){
    // 기본 정보
    let eventData = {
        event_name: 'refund',
        ep_ecommerce: 'refund',
    };
    // 거래 정보
    let transaction = {
        transaction_id: 'GP-240507',
        currency: 'KRW',
        value: 175860.0,
        shipping: 3000.0,
        payment_type: 'Kakao Pay',
    };
    // 랜덤 숫자 생성 (0부터 99 사이)
    let randomNumber = Math.floor(Math.random() * 100);

    // title과 ep_page_name 속성에만 랜덤 숫자 추가
    if (transaction.hasOwnProperty('transaction_id')) {
        transaction.transaction_id += randomNumber;
    }

    let items = [productShoes1, productShirt1];

    sendGAEcommerce(eventData, transaction, items);
}
/** 가상 페이지 */
function VirPage(){
    let virtualObj = {
        // 방문 페이지 제목
        title: '메인>골든몰 홈',
        location: 'virtual/location',

        // 이벤트 매개변수
        ep_page_name: '메인>골든몰 홈',            
        ep_visit_channel: 'PCWeb',
        ep_login_yn: 'Y',
        ep_dow: '화',
    
        // 사용자 속성
        up_uid: 'hhpark',
        up_type: '개인',
        up_age: '20대',
        up_gender: 'M',
        up_joindate: '20240604'
    };

    // 랜덤 숫자 생성 (0부터 99 사이)
    let randomNumber = Math.floor(Math.random() * 100);

    // title과 ep_page_name 속성에만 랜덤 숫자 추가
    if (virtualObj.hasOwnProperty('location')) {
        virtualObj.location += randomNumber;
    }
    sendGAVirPage(virtualObj);
}

/*=====페이지 이동 시작=====*/
// 홈
function moveMainPage() {
    console.log("moveMainPage()");
    window.location.href = "/index.html";
}
// 네비게이션
function moveMypage() {
    console.log("moveMypage()");
    window.location.href = "/mypage/mypage.html";
}
function moveCart() {
    console.log("moveCart()");
    window.location.href = "/cart/cart.html";
}
// product
function moveProductItemList() {
    console.log("moveProductItemList()");
    window.location.href = "/product/productItemList.html";
}
function moveProductItemDetail() {
    console.log("moveProductItemDetail()");
    window.location.href = "/product/productItemDetail.html";
}
// product/order
function moveProductCheckout() {
    console.log("moveProductItemList()");
    window.location.href = "/product/order/productCheckout.html";
}
function moveProductPurchase() {
    console.log("moveProductItemDetail()");
    window.location.href = "/product/order/productPurchase.html";
}
// product/history
function moveProductHistory() {
    console.log("moveMypageProductList()");
    window.location.href = "/product/history/productHistory.html";
}
function moveProductHistoryDetail() {
    console.log("moveMypageProductDetail()");
    window.location.href = "/product/history/productHistoryDetail.html";
}
function moveProductHistoryRefund() {
    console.log("moveMypageProductRefund()");
    window.location.href = "/product/history/productRefund.html";
}
/*=====페이지 이동 끝=====*/
