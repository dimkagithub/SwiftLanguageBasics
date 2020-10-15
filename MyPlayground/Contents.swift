
// 1. Написать функцию, которая определяет, четное число или нет.

func evenOrOdd(_ number: Int){
    if number % 2 == 0{
        print("Число \(number) является чётным.")
    } else {
        print("Число \(number) является нечётным.")
    }
}
evenOrOdd(256)


// 2. Написать функцию, которая определяет, делится ли число без остатка на 3.

func divisionWithoutReminder(_ number: Int){
    if number % 3 == 0{
        print("\nЧисло \(number) делится без остатка на 3.")
    } else {
        print("Число \(number) не делится без остатка на 3.")
    }
}
divisionWithoutReminder(9)


// 3. Создать возрастающий массив из 100 чисел.

var array = [Int]()
for count in 1...100{
    array.append(count)
}
print("\nКоличество чисел в массиве: \(array.count)")


// 4. Удалить из этого массива все четные числа и все числа, которые не делятся на 3.

for number in array{
    if (number % 2) == 0 || (number % 3) != 0{
       array.remove(at: array.firstIndex(of: number)!)
    }
}
print("\n\(array)\n")


// 5. * Написать функцию, которая добавляет в массив новое число Фибоначчи, и добавить при помощи нее 50 элементов.
//      Числа Фибоначчи определяются соотношениями Fn=Fn-1 + Fn-2.

func fibonacciNumber() -> Array<Int>{
    var array: [Int] = [0,1]
    let maxNumber = 50
    for index in array.count..<maxNumber{
        let number = array[index - 1] + array[index - 2]
        array.append(number)
    }
    return(array)
}
print(fibonacciNumber())


/* 6. * Заполнить массив элементов различными простыми числами. Натуральное число, большее единицы, называется простым,
        если оно делится только на себя и на единицу. Для нахождения всех простых чисел не больше заданного числа n
        (пусть будет 100), следуя методу Эратосфена, нужно выполнить следующие шаги:
        a. Выписать подряд все целые числа от двух до n (2, 3, 4, ..., n).
        b. Пусть переменная p изначально равна двум — первому простому числу.
        c. Зачеркнуть в списке числа от 2 + p до n, считая шагом p.
        d. Найти первое не зачёркнутое число в списке, большее, чем p, и присвоить значению переменной p это число.
        e. Повторять шаги c и d, пока возможно.
*/

var newArray = Set<Int>()
for index in 2...100{
    newArray.insert(index)
}
var number = 2
for _ in 1...100{
    for count in stride(from: 2 * number, through: 100, by: number){
        newArray.remove(count)
    }
    for index in newArray.sorted(){
        if number < index{
            number = index
            break
        }
    }
}
print("\n\(newArray.sorted())")
