//import Foundation
//import WebKit
//import FirebaseAnalytics
//
//// MARK: 에러 타입 정의
//enum GAError: Error {
//    case dataNotFound
//   
//    case requiredType
//    case requiredTitle
//    case requiredEventName
//    case actionFieldError
//    case itemFieldError
//    
//    case eventType
////    case metricTypeError
//    
//    case setCustomData
//    case setTransactionData
//    case setItemsData
//    case sendGAScreen
//    case sendGAEvent
//    
//    case actionTypeError
//    case itemTypeError
//}
//
//class AppInterface2 {
//    var gaData: [String: Any] = [:]
//
//    func hybridData(message: WKScriptMessage) {
//        do {
//            guard let data = (message.body as AnyObject).data(using: String.Encoding.utf8.rawValue,allowLossyConversion: false) else { throw GAError.dataNotFound }
//            guard let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else { throw GAError.dataNotFound }
//            
//            sendGA(json)
//        } catch {
//            print("GA4_Error: 전달받은 데이터가 없습니다.")
//        }
//    }
//    func sendGA(_ gaDict: [String: Any]) {
//        do {
//            // MARK: data Type 점검 및 data 설정
//            // data 역할: gaDict
//            // Bundle 역할: gaData
//            
//            let eventName: String = gaDict["event_name"] as? String ?? ""
//            let screenName: String = gaDict["title"] as? String ?? ""
//            let eventType: String = gaDict["type"] as? String ?? ""
//            
//            try setCustomData(gaDict) // GA4 맞춤 데이터 설정
//            
//            // 앱 사용자 속성 고정값 처리
//            Analytics.setUserProperty("{{광고식별자값}}", forName: "up_adid")
//            Analytics.setUserProperty(Analytics.appInstanceID(), forName: "up_cid")
//                        
//            // 이벤트 타입 처리 (스크린뷰, 맞춤 이벤트, 전자상거래)
//            if eventType == "P" {
//                gaData[AnalyticsParameterScreenName] = screenName
//                Analytics.logEvent(AnalyticsEventScreenView, parameters: gaData)
//            }else if eventType == "E" {
//                // 거래 데이터 설정
//                if gaDict["transaction"] != nil {
//                    try setTransactionData(gaDict)    // 거래 데이터 처리
//                }
//                // 상품 데이터 설정
//                if gaDict["items"] != nil {
//                    try setItemsData(gaDict)         // 아이템 데이터 처리
//                }
//                Analytics.logEvent(eventName, parameters: gaData)
//            }else{
//                throw GAError.eventType
//            }
//        } catch {
//            switch error {
//                case GAError.requiredType:
//                    print("GA4_Error: type 값 확인 부탁드립니다.")
//                case GAError.requiredTitle:
//                    print("GA4_Error: title 값 확인 부탁드립니다.")
//                case GAError.requiredEventName:
//                    print("GA4_Error: event_name 값 확인 부탁드립니다.")
//                case GAError.actionFieldError:
//                    print("GA4_Error: 거래 데이터 확인 부탁드립니다.")
//                case GAError.itemFieldError:
//                    print("GA4_Error: 상품 데이터 확인 부탁드립니다.")
//
//                case GAError.eventType:
//                    print("GA4_Error: event Type 확인 부탁드립니다.")
////                case GAError.metricTypeError:
////                    print("GA4_Error: 측정 항목 값 확인 부탁드립니다.")
//                
//                case GAError.setCustomData:
//                    print("GA4_Error: setCustomData 함수 확인 부탁드립니다.")
//                case GAError.setTransactionData:
//                    print("GA4_Error: setTransactionData 함수 확인 부탁드립니다.")
//                case GAError.setItemsData:
//                    print("GA4_Error: setItemsData 함수 확인 부탁드립니다.")
//                case GAError.sendGAScreen:
//                    print("GA4_Error: sendGAScreen 함수 확인 부탁드립니다.")
//                case GAError.sendGAEvent:
//                    print("GA4_Error: sendGAEvent 함수 확인 부탁드립니다.")
//                
//
//                case GAError.actionTypeError:
//                    print("GA4_Error: 거래 데이터 type 확인 부탁드립니다.")
//                case GAError.itemTypeError:
//                    print("GA4_Error: 상품 데이터 type 확인 부탁드립니다.")
//
//                default:
//                    print("GA4_Interface_Error")
//            }
//        }
//    }
//    // MARK: 맞춤 매개변수 데이터 설정 함수
//    func setCustomData(_ dataForCustom: [String: Any]) throws {
//        do{
//            for (key, value) in dataForCustom {
//                switch key {
//                    // 맞춤 측정기준 설정
//                    case let key where key.contains("ep_"):
//                        guard let value = value as? String else {
//                            throw GAError.actionTypeError
//                        }
//                        gaData[key] = value.prefix(100)
//                    // 맞춤 측정항목 설정
//                    case let key where key.contains("cm_"):
//                    do {
////                        let doubleValue = Double(value)
////                        gaData[key] = doubleValue
//                    }catch {
//                        throw GAError.actionTypeError
//                    }
////                        guard let value = value as? Double else {
////                            throw GAError.actionTypeError
////                        }
////                        gaData[key] = value
//                    // 사용자 속성 및 사용자ID 설정
//                    case let key where key.contains("up_"):
//                        guard let value = value as? String else {
//                            throw GAError.actionTypeError
//                        }
//                        Analytics.setUserProperty(value, forName: key)
//                        if key == "up_uid" {
//                            Analytics.setUserID(value)
//                        }
//                    default:
//                        break
//                }
//            }
//        } catch {
//            throw GAError.setCustomData
//        }
//    }
//    // MARK: 거래 데이터 설정 함수
//    func setTransactionData(_ gaDict: [String: Any]) throws {
//        do{
//            guard let dataForTransaction = gaDict["transaction"] as? [String: Any] else { throw GAError.actionFieldError }
//            for (key, value) in dataForTransaction {
//                switch key {
//                    case "value", "tax", "shipping":
//                        guard let doubleValue = value as? Double else {
//                            throw GAError.actionTypeError
//                        }
//                        gaData[key] = doubleValue
//                    default:
//                        guard let stringValue = value as? String else {
//                            throw GAError.actionTypeError
//                        }
//                        gaData[key] = stringValue
//                        break
//                }
//            }
//        } catch {
//            throw GAError.setTransactionData
//        }
//    }
//    // MARK: 상품 데이터 설정 함수
//    func setItemsData(_ gaDict: [String: Any]) throws {
//        do{
//            guard let dataForItems = gaDict["items"] as? [[String: Any]] else { throw GAError.itemFieldError }
//            
//            var itemsDic: [[String: Any]] = []
//            for item in dataForItems {
//                var itemDic: [String: Any] = [:]
//                for (key, value) in item {
//                    switch key {
//                        case "quantity", "index":
//                            guard let stringValue = value as? Int else {
//                                throw GAError.itemTypeError
//                            }
//                            itemDic[key] = stringValue
//                        case "discount", "price":
//                            guard let stringValue = value as? Double
//                            else {
//                                throw GAError.itemTypeError
//                            }
//                            itemDic[key] = stringValue
//                        default:
//                            guard let stringValue = value as? String else {
//                                throw GAError.itemTypeError
//                            }
//                            itemDic[key] = stringValue
//                    }
//                }
//                itemsDic.append(itemDic)
//            }
//            gaData[AnalyticsParameterItems] = itemsDic
//        } catch {
//            throw GAError.setItemsData
//        }
//    }
//            
//    // MARK: 네이티브 공통 함수
//    func sendGAScreen(_ dataForScreen: [String: Any]) {
//        do {
//            var setData = dataForScreen
//            setData["type"] = "P"
//            try sendGA(setData)
//        } catch {
//            print("GA4_Error: sendGAScreen 함수 확인 부탁드립니다.")
//        }
//    }
//    
//    func sendGAEvent(_ dataForEvent: [String: Any]) {
//        do {
//            var setData = dataForEvent
//            setData["type"] = "E"
//            try sendGA(setData)
//        } catch {
//            print("GA4_Error: sendGAEvent 함수 확인 부탁드립니다.")
//        }
//    }
//    
//    func sendGAEcommerce(_ dataForEcommerce: [String: Any]) {
//        do {
//            var setData = dataForEcommerce
//            setData["type"] = "E"
//            try sendGA(setData)
//        } catch {
//            print("GA4_Error: sendGAEcommerce 함수 확인 부탁드립니다.")
//        }
//    }
////    // MARK: 맞춤 측정항목 데이터 형변환 함수 정의
////    func convertMetric(data: Any) throws -> Any {
////        do{
////            guard let stringValue = data as? String else {
////                return data
////            }
////            guard let doubleValue = Double(stringValue) else {
////                throw GAError.metricTypeError
////            }
////
////            return doubleValue
////        } catch {
////            throw GAError.metricTypeError
////        }
////    }
//}
