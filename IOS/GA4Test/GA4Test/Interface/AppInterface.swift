import Foundation
import WebKit

import FirebaseAnalytics

// MARK: 에러 타입 정의
enum GAError: Error {
    case dataNotFound
    case requiredType
    case requiredEventName
}

class AppInterface {
    
    func hybridData(message: WKScriptMessage) {
        do {
            guard let data = (message.body as AnyObject).data(using: String.Encoding.utf8.rawValue,allowLossyConversion: false) else { throw GAError.dataNotFound }
            guard let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else { throw GAError.dataNotFound }
            
            sendGAData(json)
        } catch {
            print("hybridData_func_Error: 데이터 처리 중 에러 발생 - \(error.localizedDescription)")
        }
    }
    
    private func sendGAData(_ gaData: [String: Any]) {
        do {
            guard let eventType = gaData["type"] as? String else { throw GAError.requiredType }
            var sendData = setCustomData(gaData)
            
            // 앱 사용자 속성 고정값 처리
            Analytics.setUserProperty("{{광고식별자값}}", forName: "up_adid")
            Analytics.setUserProperty(Analytics.appInstanceID(), forName: "up_cid")
            
            // 데이터 전송
            if eventType == "P" {
                if let screenName = gaData["title"] as? String, !screenName.isEmpty {
                    sendData[AnalyticsParameterScreenName] = screenName
                }
                Analytics.logEvent(AnalyticsEventScreenView, parameters: sendData)
            } else if eventType == "E" {
                if let transactionData = gaData["transaction"] as? [String: Any] {
                    sendData.merge(setTransactionData(transactionData)) { (_, new) in new }
                }
                if let items = gaData["items"] as? [[String: Any]] {
                    sendData["items"] = setItemsData(items)
                }
                guard let eventName = gaData["event_name"] as? String else { throw GAError.requiredEventName }
                Analytics.logEvent(eventName, parameters: sendData)
            } else {
                print("sendGAData_func_Error: type 값 확인 부탁드립니다.")
            }
        } catch {
            switch error {
            case GAError.requiredType:
                print("sendGAData_func_Error: type 값 확인 부탁드립니다.")
            case GAError.requiredEventName:
                print("sendGAData_func_Error: event_name 값 확인 부탁드립니다.")
            default:
                print("sendGAData_func_Error: \(error.localizedDescription)")
            }
        }
    }
    
    // MARK: 맞춤 매개변수 데이터 설정 함수
    private func setCustomData(_ customData: [String: Any]) -> [String: Any] {
        var returnData: [String: Any] = [:]
        for (key, value) in customData {
            // 맞춤 측정기준 설정
            if key.starts(with: "ep_"), let valueString = value as? String {
                returnData[key] = valueString.prefix(100)
            }
            // 맞춤 측정항목 설정
            else if key.starts(with: "cm_") {
                if let valueDouble = value as? Double {
                    returnData[key] = valueDouble
                } else if let valueInt = value as? Int {
                    returnData[key] = Double(valueInt)
                } else if let valueString = value as? String, let valueDouble = Double(valueString) {
                    returnData[key] = valueDouble
                }
            }
            // 사용자 속성 및 사용자ID 설정
            else if key.starts(with: "up_"), let valueString = value as? String {
                Analytics.setUserProperty(valueString, forName: key)
                if key == "up_uid" {
                    Analytics.setUserID(valueString)
                }
            }
        }
        
        return returnData
    }
    
    // MARK: 전자상거래 거래 데이터 설정 함수
    private func setTransactionData(_ transactionData: [String: Any]) -> [String: Any] {
        var returnData = transactionData
        for (key, value) in returnData {
            if ["tax", "shipping", "value"].contains(key) {
                if let valueDouble = value as? Double {
                    returnData[key] = valueDouble
                } else if let valueInt = value as? Int {
                    returnData[key] = Double(valueInt)
                } else if let valueString = value as? String, let valueDouble = Double(valueString) {
                    returnData[key] = valueDouble
                }
            }
        }
        
        return returnData
    }
    
    // MARK: 전자상거래 상품 데이터 설정 함수
    private func setItemsData(_ itemData: [[String: Any]]) -> [[String: Any]] {
        return itemData.compactMap { item -> [String: Any] in
            var returnData = item
            
            for (key, value) in returnData {
                switch key {
                case "price", "discount":
                    if let valueDouble = value as? Double {
                        returnData[key] = valueDouble
                    } else if let valueInt = value as? Int {
                        returnData[key] = Double(valueInt)
                    } else if let valueString = value as? String, let valueDouble = Double(valueString) {
                        returnData[key] = valueDouble
                    }
                case "index", "quantity":
                    if let valueInt = value as? Int {
                        returnData[key] = valueInt
                    } else if let valueDouble = value as? Double {
                        returnData[key] = Int(valueDouble)
                    } else if let valueString = value as? String, let valueInt = Int(valueString) {
                        returnData[key] = valueInt
                    }
                default:
                    break
                }
            }
            
            return returnData
        }
    }
    
    func sendGAScreen(_ screenData: [String: Any]) {
        var gaData = screenData
        gaData["type"] = "P"
        sendGAData(gaData)
    }
    
    func sendGAEvent(_ eventData: [String: Any]) {
        var gaData = eventData
        gaData["type"] = "E"
        sendGAData(gaData)
    }
    
    func sendGAEcommerce(_ ecommerceData: [String: Any], _ transaction: [String: Any], _ items: [[String: Any]]) {
        var gaData = ecommerceData
        gaData["transaction"] = transaction
        gaData[AnalyticsParameterItems] = items
        gaData["type"] = "E"
        sendGAData(gaData)
    }
}
