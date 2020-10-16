// 0. Функция автоматически добавляет номер задачи при выводе в консоль.

var taskCounter = 0
func addTaskCounter() -> Int {
    taskCounter += 1
    return(taskCounter)
}


// 1.  Написать функцию, которая определяет, четное число или нет.

func checkEvenOrOdd (_ number: Int) -> Bool {
    return number % 2 == 0
}

print("\(addTaskCounter()) 3адача: \(checkEvenOrOdd(10))")


// 2. Написать функцию, которая определяет, делится ли число без остатка на 3.

func checkDivWithoutReminder (_ number: Int) -> Bool {
    return number % 3 == 0
}

print("\n\(addTaskCounter()) 3адача: \(checkDivWithoutReminder(9))")


// 3. Создать возрастающий массив из 100 чисел.

var array = [Int]()
for count in 1...100 {
    array.append(count)
}
print("\n\(addTaskCounter()) 3адача: \(array)")


// 4. Удалить из этого массива все четные числа и все числа, которые не делятся на 3.

for index in (0..<array.count).reversed() {
    let number = array[index]
    if checkEvenOrOdd(number) || !checkDivWithoutReminder(number) {
        array.remove(at: index)
        
    }
}
print("\n\(addTaskCounter()) 3адача: \(array)")


// 5. * Написать функцию, которая добавляет в массив новое число Фибоначчи, и добавить при помощи нее 100 элементов.

func addFibonacciNubmers() -> Array<Double> {
    var array: [Double] = [0, 1]
    let maxNumber = 100
    for index in array.count..<maxNumber {
        let number = array[index - 1] + array[index - 2]
        array.append(number)
    }
    return(array)
}
print("\n\(addTaskCounter()) 3адача: \(addFibonacciNubmers())")


/*  6. * Заполнить массив из 100 элементов различными простыми числами. Натуральное число, большее единицы,
       называется простым, если оно делится только на себя и на единицу. Для нахождения всех простых чисел
       не больше заданного числа n, следуя методу Эратосфена, нужно выполнить следующие шаги:
    a. Выписать подряд все целые числа от двух до n (2, 3, 4, ..., n).
    b. Пусть переменная p изначально равна двум — первому простому числу.
    c. Зачеркнуть в списке числа от 2 + p до n, считая шагом p..
    d. Найти первое не зачёркнутое число в списке, большее, чем p, и присвоить значению переменной p это число.
    e. Повторять шаги c и d, пока возможно. */

var newArray = Set<Int>()
for index in 2...100 {
    newArray.insert(index)
}
var number = 2
for _ in 1...100 {
    for count in stride(from: 2 * number, through: 100, by: number) {
        newArray.remove(count)
    }
    for index in newArray.sorted() {
        if number < index {
            number = index
            break
        }
    }
}
print("\n\(addTaskCounter()) Задача: \(newArray.sorted())")
