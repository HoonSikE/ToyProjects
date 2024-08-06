import '../style.css';

import React, { useEffect } from 'react';
import {sendGAPage, sendGAVirPage, sendGAEvent, sendGAAttrEvent, sendGAEcommerce} from '../GoogleAnalyticsBuilder';
import {productShoes1, productShoes2, productShirt1, productShirt2, productDrink1, productDrink2} from '../product';

function Page1() {
    const clickEvent = (isVirtual) => {
        let eventObj = {
            // 이벤트 명
            event_name: '페이지1_이벤트 이름',
            // 이벤트 매개변수
            ep_click_page: '페이지1_이벤트 페이지',
            ep_click_area: '페이지1_이벤트 영역',
            ep_click_area2: '페이지1_이벤트 영역 2',
            ep_click_label: '페이지1_이벤트 테스트 라벨',
        };

        sendGAEvent(eventObj, isVirtual);
        console.log('클릭 이벤트가 발생했습니다.');
    };

    const viewItemList = (isVirtual) => {
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

        sendGAEcommerce(eventData, transaction, items, isVirtual);
        console.log('상품 리스트를 조회했습니다.');
    };

    const selectItem = (isVirtual) => {
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

        sendGAEcommerce(eventData, transaction, items, isVirtual);
        console.log('상품을 클릭했습니다.');
    };

    const viewItem = (isVirtual) => {
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

        sendGAEcommerce(eventData, transaction, items, isVirtual);
        console.log('상품 상세 정보를 조회했습니다.');
    };

    const addToWishlist = (isVirtual) => {
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

        sendGAEcommerce(eventData, transaction, items, isVirtual);
        console.log('위시 리스트에 상품을 추가했습니다.');
    };

    const addToCart = (isVirtual) => {
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

        sendGAEcommerce(eventData, transaction, items, isVirtual);
        console.log('장바구니에 상품을 담았습니다.');
    };

    const viewCart = (isVirtual) => {
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

        sendGAEcommerce(eventData, transaction, items, isVirtual);
        console.log('장바구니를 조회했습니다.');
    };

    const removeFromCart = (isVirtual) => {
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

        sendGAEcommerce(eventData, transaction, items, isVirtual);
        console.log('장바구니에서 상품을 제거했습니다.');
    };

    const beginCheckout = (isVirtual) => {
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

        sendGAEcommerce(eventData, transaction, items, isVirtual);
        console.log('상품 구매 절차를 시작했습니다.');
    };

    const addShippingInfo = (isVirtual) => {
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

        sendGAEcommerce(eventData, transaction, items, isVirtual);
        console.log('배송 정보를 입력했습니다.');
    };

    const addPaymentInfo = (isVirtual) => {
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

        sendGAEcommerce(eventData, transaction, items, isVirtual);
        console.log('결제 정보를 입력했습니다.');
    };

    const purchase = (isVirtual) => {
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

        sendGAEcommerce(eventData, transaction, items, isVirtual);
        console.log('구매를 완료했습니다.');
    };

    const refund = (isVirtual) => {
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

        sendGAEcommerce(eventData, transaction, items, isVirtual);
        console.log('상품을 환불했습니다.');
    };

    return (
        <div>
            <div>
                <div class="contents">
                    ● 이벤트 (가상)
                </div>
                <div class="a">
                    <span class="c" onClick={() => clickEvent(true)}>
                        클릭 이벤트 테스트<br/>
                        (Event)
                    </span>
                </div>
            </div>
            <hr/>
            <div>
                <div class="contents">
                    ● 전자 상거래 (가상)
                </div>
                <div class="a">
                    <span class="c" onClick={() => viewItemList(true)}>
                        상품 리스트<br/>
                        (ViewItemList)
                    </span>
                    <span class="c" onClick={() => selectItem(true)}>
                        상품 클릭 테스트<br/>
                        (SelectItem)
                    </span>
                    <span class="c" onClick={() => viewItem(true)}>
                        상품 상세 정보 전송<br/>
                        (ViewItem)
                    </span>
                    <span class="c" onClick={() => addToWishlist(true)}>
                        위시 리스트<br/>
                        (AddToWishlist)
                    </span>
                    <span class="c" onClick={() => addToCart(true)}>
                        장바구니 담기<br/>
                        (AddToCart)
                    </span>
                    <span class="c" onClick={() => viewCart(true)}>
                        장바구니 상세 정보<br/>
                        (ViewCart)
                    </span>
                    <span class="c" onClick={() => removeFromCart(true)}>
                        장바구니 제거<br/>
                        (RemoveFromCart)
                    </span>
                    <span class="c" onClick={() => beginCheckout(true)}>
                        상품 구매<br/>
                        (BeginCheckout)
                    </span>
                    <span class="c" onClick={() => addShippingInfo(true)}>
                        배송 정보 입력<br/>
                        (AddShippingInfo)
                    </span>
                    <span class="c" onClick={() => addPaymentInfo(true)}>
                        상품 결제<br/>
                        (AddPaymentInfo)
                    </span>
                    <span class="c" onClick={() => purchase(true)}>
                        구매 완료<br/>
                        (Purchase)
                    </span>
                    <span class="c" onClick={() => refund(true)}>
                        상품 환불<br/>
                        (Refund)
                    </span>
                </div>
            </div>
        </div>
    );
}

export default Page1;
