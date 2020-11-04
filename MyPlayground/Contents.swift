//  1. Придумать класс, методы которого могут завершаться неудачей и возвращать либо значение, либо ошибку Error?. Реализовать их вызов и обработать результат метода при помощи конструкции if let, или guard let.
//  2. Придумать класс, методы которого могут выбрасывать ошибки. Реализуйте несколько throws-функций. Вызовите их и обработайте результат вызова при помощи конструкции try/catch.

import Foundation

enum FuelStationError: Error {
    case invalidSelection
    case invalidLiters(liters: Int)
    case invalidSum(sum: Int)
    case outOfStock(unavailable: Int)
    case empty
    case insufficientMoney(moneyNeeded: Int)
}

struct Fuel {
    var price: Int
    var count: Int
}

class FuelStation {
    var fuelTanks = [
        "АИ-92": Fuel(price: 43, count: 25_258),
        "АИ-95": Fuel(price: 48, count: 31_486),
        "АИ-98": Fuel(price: 53, count: 38_154),
        "Дизель": Fuel(price: 48, count: 41_475),
        "Газ": Fuel(price: 25, count: 52_887)
    ]
    
    var moneyPaid = 0
    var fuelNeed = 0
    
    func fill(fuelType name: String) throws {
        guard let fuelType = fuelTanks[name] else {
            throw FuelStationError.invalidSelection
        }
        guard fuelNeed > 0 else {
            throw FuelStationError.invalidLiters(liters: fuelNeed)
        }
        guard moneyPaid > 0 else {
            throw FuelStationError.invalidSum(sum: moneyPaid)
        }
        guard fuelType.count > 0 else {
            throw FuelStationError.empty
        }
        guard fuelType.count >= fuelNeed else {
            throw FuelStationError.outOfStock(unavailable: (fuelType.count - fuelNeed))
        }
        guard (fuelType.price * fuelNeed) <= moneyPaid else {
            throw FuelStationError.insufficientMoney(moneyNeeded: ((fuelType.price * fuelNeed) - moneyPaid))
        }
        moneyPaid -= fuelType.price
        var fuelFill = fuelType
        fuelFill.count -= fuelNeed
        fuelTanks[name] = fuelFill
        print("Налив \(name), \(fuelNeed) литров на \((fuelType.price * fuelNeed)) руб.\n")
        moneyPaid = 0
        fuelNeed = 0
    }
}

let fuelSell = FuelStation()
func printFuelSpecs() {
    print("""
    Стоимость АИ-92 за 1 л.: \(fuelSell.fuelTanks["АИ-92"]?.price ?? 0) руб., остаток \(fuelSell.fuelTanks["АИ-92"]?.count ?? 0) литров
    Стоимость АИ-95 за 1 л.: \(fuelSell.fuelTanks["АИ-95"]?.price ?? 0) руб., остаток \(fuelSell.fuelTanks["АИ-95"]?.count ?? 0) литров
    Стоимость АИ-98 за 1 л.: \(fuelSell.fuelTanks["АИ-98"]?.price ?? 0) руб., остаток \(fuelSell.fuelTanks["АИ-98"]?.count ?? 0) литров
    Стоимость дизельного топлива за 1 л.: \(fuelSell.fuelTanks["Дизель"]?.price ?? 0) руб., остаток \(fuelSell.fuelTanks["Дизель"]?.count ?? 0) литров
    Стоимость газа за 1 л.: \(fuelSell.fuelTanks["Газ"]?.price ?? 0) руб., остаток \(fuelSell.fuelTanks["Газ"]?.count ?? 0) литров

    """)
}

printFuelSpecs()
fuelSell.fuelNeed = 25250
fuelSell.moneyPaid = 1085750

do {
    try fuelSell.fill(fuelType: "АИ-92")
} catch FuelStationError.invalidSelection {
    print("Нет такого топлива.\n")
} catch FuelStationError.outOfStock(let unavailable) {
    let positiveUnavailable = -unavailable
    print("Нет столько топлива в цистерне. Уменьшите количество топлива на \(positiveUnavailable) литров.\n")
} catch FuelStationError.insufficientMoney(let moneyNeeded){
    print("Недостаточно средств. Нужно еще \(moneyNeeded) руб.\n")
} catch FuelStationError.invalidLiters(let liters) {
    print("Не могу налить \(liters) литров\n")
} catch FuelStationError.invalidSum(let sum) {
    print("Не могу продать на \(sum) руб.\n")
} catch FuelStationError.empty {
    print("Топливо закончилось!\n")
}

printFuelSpecs()
fuelSell.fuelNeed = 8
fuelSell.moneyPaid = 344

do {
    try fuelSell.fill(fuelType: "АИ-92")
} catch FuelStationError.invalidSelection {
    print("Нет такого топлива.\n")
} catch FuelStationError.outOfStock(let unavailable) {
    let positiveUnavailable = -unavailable
    print("Нет столько топлива в цистерне. Уменьшите количество топлива на \(positiveUnavailable) литров.\n")
} catch FuelStationError.insufficientMoney(let moneyNeeded){
    print("Недостаточно средств. Нужно еще \(moneyNeeded) руб.\n")
} catch FuelStationError.invalidLiters(let liters) {
    print("Не могу налить \(liters) литров\n")
} catch FuelStationError.invalidSum(let sum) {
    print("Не могу продать на \(sum) руб.\n")
} catch FuelStationError.empty {
    print("Топливо закончилось!\n")
}

printFuelSpecs()
fuelSell.fuelNeed = 1
fuelSell.moneyPaid = 43

do {
    try fuelSell.fill(fuelType: "АИ-92")
} catch FuelStationError.invalidSelection {
    print("Нет такого топлива.\n")
} catch FuelStationError.outOfStock(let unavailable) {
    let positiveUnavailable = -unavailable
    print("Нет столько топлива в цистерне. Уменьшите количество топлива на \(positiveUnavailable) литров.\n")
} catch FuelStationError.insufficientMoney(let moneyNeeded){
    print("Недостаточно средств. Нужно еще \(moneyNeeded) руб.\n")
} catch FuelStationError.invalidLiters(let liters) {
    print("Не могу налить \(liters) литров\n")
} catch FuelStationError.invalidSum(let sum) {
    print("Не могу продать на \(sum) руб.\n")
} catch FuelStationError.empty {
    print("Топливо закончилось!\n")
}
