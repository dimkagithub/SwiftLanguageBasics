import Foundation


// Решить квадратное уравнение

let a:Double = 5
let b:Double = 5
let c:Double = 0

let d = b*b - 4 * a * c

if d > 0 {
    let x1 = (-b + sqrt(d)) / (2 * a)
    let x2 = (-b - sqrt(d)) / (2 * a)
    print("Уравнение имеет два корня:")
    print("X1 = \(x1)")
    print("X2 = \(x2)")
} else if d == 0 {
    let x = -b / (2 * a)
    print("Уравнение имеет один корень:")
    print("X = \(x)")
} else if d < 0 {
    print("Дискриминант меньше нуля, корней нет.")
}


// Даны катеты прямоугольного треугольника. Найти площадь, периметр и гипотенузу треугольника.

let legA:Double = 5
let legB:Double = 5

let legC = sqrt((legA * legA) + (legB * legB))

print()
print("Площадь прямоугольного треугольника равна \(legA * legB / 2)")
print("Периметр прямоугольного треугольника равен \(legA + legB + legC)")
print("Гипотенуза прямоугольного треугольника равна \(legC)")
print()


// Пользователь вводит сумму вклада в банк и годовой процент. Найти сумму вклада через 5 лет.

var depositAmount = 5000
let depositPercent = 10

for currentYear in 1...5{
    depositAmount = depositAmount * (1 + depositPercent) / 10
    print("Сумма вклада за \(currentYear) год \(depositAmount) рублей.")
}
