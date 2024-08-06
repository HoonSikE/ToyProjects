import Foundation
import WebKit

import FirebaseAnalytics


// MARK: 에러 타입 정의
//enum GAError: Error {
//    case requiredType
//    case requiredTitle
//    case requiredEventName
//    case actionFieldError
//    case itemFieldError
//}

class GA4 {

    func hybridData(message: WKScriptMessage) throws {
        let data = (message.body as AnyObject).data(using: String.Encoding.utf8.rawValue,allowLossyConversion: false)!
        guard let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else {
            fatalError("\(Error.self)")
        }
        print("GA4_Data: \(json as AnyObject)")

        do {
            // MARK: GA 데이터 객체 선언
            var gaData: [String: Any] = [:]

            // MARK: 화면 이름 및 데이터 전송 타입 설정
            guard let screenName = json["title"] as? String else { throw GAError.requiredTitle }
            guard let eventType = json["type"] as? String else { throw GAError.requiredType }

            // MARK: 공통 데이터 설정
            for (key, value) in json {
                // 맞춤 측정기준 설정
                if key.contains("ep_") {
                    if let value = value as? String {
                        gaData[key] = value.prefix(100)
                    }
                }
                // 맞춤 측정항목 설정
                else if key.contains("cm_") {
                    gaData[key] = convertMetric(data: value as Any)
                }
                // 사용자 속성 및 사용자ID 설정
                else if key.contains("up_") {
                    if let value = value as? String {
                        Analytics.setUserProperty(value, forName: key)
                        if key == "up_uid" {
                            Analytics.setUserID(value)
                        }
                    }
                }
                // 거래 데이터 설정
                else if key == "transaction" {
                    if let value = value as? [String: Any] {
                        gaData.merge(try convertAction(data: value)) { (_, new) in new}
                    }
                }
                // 상품 데이터 설정
                else if key == "items" {
                    if let value = value as? [Any] {
                        gaData[key] = value
                    }
                }
            }
            // ClientID 설정
            Analytics.setUserProperty(Analytics.appInstanceID(), forName: "up_cid")

            // MARK: 데이터 전송
            // 화면 데이터 전송
            if eventType == "P" {
                gaData[AnalyticsParameterScreenName] = screenName
                Analytics.logEvent(AnalyticsEventScreenView, parameters: gaData)
            }
            // 전자상거래 데이터 전송
            else if gaData["items"] != nil {
                var ecommerceData = gaData

                // EcommerceStep 가져오기
                guard let eventName = json["event_name"] as? String else { throw GAError.requiredEventName }

                // 상품 데이터 형변환
                if let ecommerceItem = ecommerceData["items"] as? [Any] {
                    ecommerceData["items"] = try convertItem(items: ecommerceItem)
                }
                Analytics.logEvent(eventName, parameters: ecommerceData)
            }
            // 이벤트 데이터 전송
            else {
                guard let eventName = json["event_name"] as? String else { throw GAError.requiredEventName }
                Analytics.logEvent(eventName, parameters: gaData)
            }
        } catch {
            switch error {
            case GAError.requiredType:
                print("GA4_Error: type 값 확인 부탁드립니다.")
            case GAError.requiredTitle:
                print("GA4_Error: title 값 확인 부탁드립니다.")
            case GAError.requiredEventName:
                print("GA4_Error: event_name 값 확인 부탁드립니다.")
            case GAError.actionFieldError:
                print("GA4_Error: 거래 데이터 확인 부탁드립니다.")
            case GAError.itemFieldError:
                print("GA4_Error: 상품 데이터 확인 부탁드립니다.")
            default:
                print("GA4_Interface_Error")
            }
        }
    }

    // MARK: 맞춤 측정항목 데이터 형변환 함수 정의
    func convertMetric(data: Any) -> Any {
        guard let stringValue = data as? String else {
            return data
        }
        guard let doubleValue = Double(stringValue) else {
            return "GA4_Metric_Error"
        }

        return doubleValue
    }

    // MARK: 전자상거래 거래 데이터 형변환 함수 정의
    func convertAction(data: [String: Any]) throws -> [String: Any] {
        var setData = data
        for (key, value) in setData {
            if let stringValue = value as? String, ["tax", "shipping", "value"].contains(key) {
                guard let doubleValue = Double(stringValue) else {
                    throw GAError.actionFieldError
                }
                setData[key] = doubleValue
            }
        }

        return setData
    }

    // MARK: 전자상거래 상품 데이터 형변환 함수 정의
    func convertItem(items: [Any]) throws -> [Any] {
        return try items.map { item -> Any in
            guard var itemDict = item as? [String: Any] else { throw GAError.itemFieldError }
            for (key, value) in itemDict {
                switch key {
                case "price", "discount":
                    if let stringValue = value as? String {
                        guard let doubleValue = Double(stringValue) else { throw GAError.itemFieldError }
                        itemDict[key] = doubleValue
                    }
                case "index", "quantity":
                    if let stringValue = value as? String {
                        guard let intValue = Int(stringValue) else { throw GAError.itemFieldError }
                        itemDict[key] = intValue
                    }
                default:
                    break
                }
            }

            return itemDict
        }
    }
}
