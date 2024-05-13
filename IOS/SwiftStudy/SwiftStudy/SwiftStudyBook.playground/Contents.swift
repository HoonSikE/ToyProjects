import UIKit

// 출력 테스트
var str = "Hello, playground"

print(str)

var num : Int = 10

print(num)

print(str, num)

// Integer 형태의 값을 String으로 하려면 무조건 형 변환을 해야한다.
var numString: String = String(num)
print(str + numString)

/// let: 상수
/// var: 변수

/// typealias: 변수 명을 다른 이름으로 정의
typealias Feet = Int
var distance : Feet = 3000
print(distance)

// print 활용
print("사람", "동물", "집")
print("사람", "동물", "집", separator:",", terminator: "\n")
print("사람", "동물", "집", terminator: "")

// 변수를 넣는법
var name: String = "소녀시대"
var height: Double = 180.5
var weight: Double = 72.5
print("이름: \(name), 키 : \(height), 몸무게 : \(weight)")


// 함수
func show(){
    print("안녕")
}

show()

// 반복문
func show3(){
    var count = 0
    
    for i in 1 ..< 11 {
        count += i;
    }
    
    print("1~10의 합: \(count)")
}

show3()

// 함수
func sum(start:Int, end:Int) -> Int{
    var count = 0
    for i in start ..< end {
        count += i
    }
    return count
}

var result = sum(start:1, end:11)
print("sum(1, 11) -> \(result)")

result = sum(start:1, end:101)
print("sum(1, 101) -> \(result)")

// 오버로딩
func show(message:String, terminator:String="\n"){
    print("메시지 :\(message)", terminator:terminator)
}

show(message:"안녕!")
show(message:"안녕!", terminator:"안녕안녕")

// 가변 파라미터
// swift에서 함수 안의 매개변수는 상수이다. 그래서 가변적인 값을 사용하려면 귀찮더라도 1번 선언하고 사용해야 한다.
func sum(values : Int ...) -> Int {
    var total = 0
    
    for value in values {
        total += value
    }
    
    return total
}
print()

var resultSum = sum(values:10, 20, 30, 40, 50)
print("sum 함수 호출 결과 -> \(resultSum)")

// 튜플
let tuple = (10, "안녕!", Float(2.4), true)
print("tuple: \(tuple)")
print("tuple.0: \(tuple.0)")
print("tuple.1: \(tuple.1)")
print("tuple.2: \(tuple.2)")
print("tuple.3: \(tuple.3)")

func getPerson(value1:String) -> (name:String, age:Int?)?{
    var value2: Int?
    value2 = Int(value1)
    
    if value2 == nil {
        print("전달받은 값은 숫자가 아닙니다.")
        return nil
    }else{
        print("전달받은 숫자 -> \(value2!)")
        return (name:"박한훈", age:value2)
    }
}
var resultGetPerson = getPerson(value1: "20")
print("getPerson 결과 -> \(resultGetPerson)")
print("getPerson 결과 -> \(resultGetPerson?.name)")
print("getPerson 결과 -> \(resultGetPerson?.age)")

/// _ 기호: 변수나 원소의 이름을 사용하지 않고 그 값의 위치만 지정합니다.
func getPerson2(persons:(name:String, age:Int)...) -> Int{
    var count = 0
    
    for(_, _) in persons {
        count += 1
    }
    return count
}
var resultGetPerson2 = getPerson2(persons:("김진수",20),("김진희", 22))
print("getPerson2 함수 호출 결과 -> \(resultGetPerson2)")

/// 조건문
// 값 비교
var numIf: Int = 10
if numIf > 10 {
    print("num > 10")
}else{
    print("num <= 10")
}
// 자료 형 비교
if numIf is Int{
    print("numIf는 Int 형입니다.")
}else{
    print("numIf는 Int 형이 아닙니다.")
}

// 클래스
class Calulator {
    var count = 0
    
    func add(a:Int, b:Int) -> Int {
        count += 1
        
        let output = a + b
        return output
    }
    
    func subtract(a:Int, b:Int) -> Int {
        count += 1
        
        let output = a - b
        return output
    }
}
var calculator1 = Calulator()
result = calculator1.add(a: 20, b: 10)
print("calculator1의 add 함수 호출 후 -> \(result), \(calculator1.count)")
result = calculator1.subtract(a: 20, b: 10)
print("calculator1의 subtract 함수 호출 후 -> \(result), \(calculator1.count)")
