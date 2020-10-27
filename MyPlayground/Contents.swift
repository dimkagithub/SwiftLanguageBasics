/*
1. Создать протокол «Car» и описать свойства, общие для автомобилей, а также метод действия.
2. Создать расширения для протокола «Car» и реализовать в них методы конкретных действий с автомобилем: открыть/закрыть окно, запустить/заглушить двигатель и т.д. (по одному методу на действие, реализовывать следует только те действия, реализация которых общая для всех автомобилей).
3. Создать два класса, имплементирующих протокол «Car»: tunkCar и sportCar. Описать в них свойства, отличающиеся для спортивного автомобиля и цистерны.
4. Для каждого класса написать расширение, имплементирующее протокол «CustomStringConvertible».
5. Создать несколько объектов каждого класса. Применить к ним различные действия.
6. Вывести сами объекты в консоль.
*/

import Foundation

enum WheelsStatus: String {
    case rotating = "вращаются", standing = "не вращаются"
    static func setRandomWheelsStatus() -> WheelsStatus {
        let random = Int.random(in: 1...2)
        switch random {
        case 1:
            return .rotating
        case 2:
            return .standing
        default:
            return .setRandomWheelsStatus()
        }
    }
}
enum DoorsStatus: String {
    case opened = "открыты", closed = "закрыты"
    static func setRandomDoorsStatus() -> DoorsStatus {
        let random = Int.random(in: 1...2)
        switch random {
        case 1:
            return .closed
        case 2:
            return .opened
        default:
            return .setRandomDoorsStatus()
        }
    }
}
enum EngineStatus: String {
    case on = "включён", off = "выключен"
    static func setRandomEngineStatus() -> EngineStatus {
        let random = Int.random(in: 1...2)
        switch random {
        case 1:
            return .off
        case 2:
            return .on
        default:
            return .setRandomEngineStatus()
        }
    }
}
enum WindowsStatus: String {
    case opened = "открыты", closed = "закрыты"
    static func setRandomWindowsStatus() -> WindowsStatus {
        let random = Int.random(in: 1...2)
        switch random {
        case 1:
            return .closed
        case 2:
            return .opened
        default:
            return .setRandomWindowsStatus()
        }
    }
}
enum TunkStatus: String {
    case full = "полный", empty = "пустой"
    static func setRandomTrunkStatus() -> TunkStatus {
        let random = Int.random(in: 1...2)
        switch random {
        case 1:
            return .empty
        case 2:
            return .full
        default:
            return .setRandomTrunkStatus()
        }
    }
}
enum HoodStatus: String {
    case opened = "открыт", closed = "закрыт"
    static func setRandomHoodStatus() -> HoodStatus {
        let random = Int.random(in: 1...2)
        switch random {
        case 1:
            return .closed
        case 2:
            return .opened
        default:
            return .setRandomHoodStatus()
        }
    }
}
enum BodyColor: Character {
    case whitе = "⚪", black = "⚫", blue = "🔵", green = "🟢", red = "🔴", brown = "🟤", yellow = "🟡"
    static func setRandomBodyColor() -> BodyColor {
        let random = Int.random(in: 1...7)
        switch random {
        case 1:
            return .black
        case 2:
            return .blue
        case 3:
            return .brown
        case 4:
            return .green
        case 5:
            return .red
        case 6:
            return .whitе
        case 7:
            return .yellow
        default:
            return .setRandomBodyColor()
        }
    }
}
enum SteeringWheelPosition: String {
    case left = "слева", right = "справа"
    static func setRandomSteeringWheelPositon() -> SteeringWheelPosition {
        let random = Int.random(in: 1...2)
        switch random {
        case 1:
            return .left
        case 2:
            return .right
        default:
            return .setRandomSteeringWheelPositon()
        }
    }
}
enum VehicleType: String {
    case sportscar = "спортивный 🏎", truckcar  = "грузовой-цистерна 🚛"
    static func setRandomVehicleType() -> VehicleType {
        let random = Int.random(in: 1...2)
        switch random {
        case 1:
            return .sportscar
        case 2:
            return .truckcar
        default:
            return .setRandomVehicleType()
        }
    }
}
enum EngineType: String {
    case gasoline = "бензиновый", diesel = "дизельный", electric = "электрический"
    static func setRandomEngineType() -> EngineType {
        let random = Int.random(in: 1...3)
        switch random {
        case 1:
            return .diesel
        case 2:
            return .electric
        case 3:
            return .gasoline
        default:
            return .setRandomEngineType()
        }
    }
}
enum Driver: Character {
    case chicken = "🐔", heron = "🦩", swan = "🦢", linux = "🐧", parrot = "🦜", eagle = "🦅", owl = "🦉", duck = "🦆"
    static func setRandomDriver() -> Driver {
        let random = Int.random(in: 1...8)
        switch random {
        case 1:
            return .chicken
        case 2:
            return .duck
        case 3:
            return .eagle
        case 4:
            return .heron
        case 5:
            return .linux
        case 6:
            return .owl
        case 7:
            return .parrot
        case 8:
            return .swan
        default:
            return .setRandomDriver()
        }
    }
}

extension Double {
    var roundTo: Double { (self * 100).rounded() / 100 }
}

func setEnginePower() -> Int {
    let enginePower = Int.random(in: 400...700)
    return enginePower
}
func SetCarMileage() -> Double {
    let carMileage = Double.random(in: 5697.464864...69541.65463)
    return carMileage
}
func SetFuelConsumption() -> Double {
    let fuelConsumption = Double.random(in: 21.156846...42.654664)
    return fuelConsumption
}
func SetReleaseYear() -> Int {
    let releaseYear = Int.random(in: 2010...2020)
    return releaseYear
}
func SetNumberOfCylinders() -> Int? {
    let cylindersArray = [4, 6, 8, 12]
    let numberOfCylinders = cylindersArray.randomElement()
    return numberOfCylinders!
}
func SetProducingCountry() -> String? {
    let producingCountryArray = ["Германия 🇩🇪", "Россия 🇷🇺", "Швеция 🇸🇪", "США 🇺🇸", "Франция 🇫🇷", "Италия 🇮🇹", "Великобритания 🇬🇧"]
    let producingCountry = producingCountryArray.randomElement()
    return producingCountry
}
func SetNumberOfWheels() -> Int? {
    let numberOfWheelsArray = [4, 6]
    let numberOfWheels = numberOfWheelsArray.randomElement()
    return numberOfWheels
}
func SetNumberOfWindows() -> Int? {
    let numbersOfWindowsArray = [4, 6, 8]
    let numbersOfWindows = numbersOfWindowsArray.randomElement()
    return numbersOfWindows
}
func SetNumberOfDoors() -> Int? {
    let numberOfDoorsArray = [2, 4]
    let numberOfDoors = numberOfDoorsArray.randomElement()
    return numberOfDoors
}

protocol Car {
    var wheels: Int { get set }
    var doors: Int { get set }
    var enginetype: EngineType { get set }
    var windows: Int { get set }
    var enginePower: Int { get set }
    var numberOfCylinders: Int { get set }
    var fuelConsumption: Double { get set }
    var producingCountry: String { get set }
    var releaseYear: Int { get set }
    var carMileage: Double { get set }
    var driver: Driver { get set }
    var steeringWheelPosition: SteeringWheelPosition { get set }
    var wheelsStatus: WheelsStatus { get set }
    var doorsStatus: DoorsStatus { get set }
    var engineStatus: EngineStatus { get set }
    var windowsStatus: WindowsStatus  { get set }
    var hoodStatus: HoodStatus  { get set }
    var bodyColor: BodyColor { get set }
    var vehicleType: VehicleType { get set }
    
    func printSpecificatios()
}

extension Car {
    mutating func changeWheelsStatus(){
        switch self.wheelsStatus {
        case .rotating:
            print("Колеса не вращаются\n")
            self.wheelsStatus = .standing
        case.standing:
            print("Колёса вращаются\n")
            self.wheelsStatus = .rotating
        }
    }
    mutating func changeDoorsStatus() {
        switch self.doorsStatus {
        case .closed:
            print("Двери открыты\n")
            self.doorsStatus = .opened
        case .opened:
            print("Двери закрыты\n")
            self.doorsStatus = .closed
        }
    }
    mutating func changeEngineStatus() {
        switch self.engineStatus {
        case .off:
            print("Двигатель включён\n")
            self.engineStatus = .on
        case .on:
            print("Двигатель выключен\n")
            self.engineStatus = .off
        }
    }
    mutating func changeWindowsStatus() {
        switch self.windowsStatus {
        case .closed:
            print("Окна открыты\n")
            self.windowsStatus = .opened
        case .opened:
            print("Окна закрыты\n")
            self.windowsStatus = .closed
        }
    }
    mutating func changeHoodStatus() {
        switch self.hoodStatus {
        case .closed:
            print("Капот открыт\n")
            self.hoodStatus = .opened
        case .opened:
            print("Капот закрыт\n")
            self .hoodStatus = .closed
        }
    }
}

class TunkCar: Car {
    var wheels: Int
    var doors: Int
    var enginetype: EngineType
    var windows: Int
    var enginePower: Int
    var numberOfCylinders: Int
    var fuelConsumption: Double
    var producingCountry: String
    var releaseYear: Int
    var carMileage: Double
    var driver: Driver
    var steeringWheelPosition: SteeringWheelPosition
    var vehicleType: VehicleType
    var wheelsStatus: WheelsStatus {
        willSet {
            if newValue == .rotating {
                print("Колёса прекращают вращение\n")
            } else {
                print("Колёса начинают вращение\n")
            }
        }
    }
    var doorsStatus: DoorsStatus {
        willSet {
            if newValue == .closed {
                print("Двери начинают открываться\n")
            } else {
                print("Двери начинают закрываться\n")
            }
        }
    }
    var engineStatus: EngineStatus {
        willSet {
            if newValue == .off {
                print("Двигатель начинает запускаться\n")
            } else {
                print("Двигатель начинает останавливаться\n")
            }
        }
    }
    var windowsStatus: WindowsStatus  {
        willSet {
            if newValue == .closed {
                print("Окна начинают открываться\n")
            } else {
                print("Окна начинают закрываться\n")
            }
        }
    }
    var hoodStatus: HoodStatus {
        willSet {
            if newValue == .closed {
                print("Капот начинает открываться\n")
            } else {
                print("Капот начинает закрываться\n")
            }
        }
    }
    var bodyColor: BodyColor
    init(wheels: Int, doors: Int, enginetype: EngineType, windows: Int, producingCountry: String, releaseYear: Int, carMileage: Double, driver: Driver, steeringWheelPosition: SteeringWheelPosition, vehicleType: VehicleType, wheelsStatus: WheelsStatus, doorsStatus: DoorsStatus, engineStatus: EngineStatus, windowsStatus: WindowsStatus, enginePower: Int, numberOfCylinders: Int, fuelConsumption: Double, hoodStatus: HoodStatus, bodyColor: BodyColor) {
        self.wheels = wheels
        self.doors = doors
        self.enginetype = enginetype
        self.windows = windows
        self.enginePower = enginePower
        self.numberOfCylinders = numberOfCylinders
        self.fuelConsumption = fuelConsumption
        self.producingCountry = producingCountry
        self.releaseYear = releaseYear
        self.carMileage = carMileage
        self.driver = driver
        self.steeringWheelPosition = steeringWheelPosition
        self.vehicleType = vehicleType
        self.wheelsStatus = wheelsStatus
        self.doorsStatus = doorsStatus
        self.engineStatus = engineStatus
        self.windowsStatus = windowsStatus
        self.hoodStatus = hoodStatus
        self.bodyColor = bodyColor
    }
    func printSpecificatios() {
        print("""

        Тип ТС: \(vehicleType.rawValue)
        Водитель: \(driver.rawValue)
        Количество колёс: \(wheels) шт.
        Количество дверей: \(doors) шт.
        Двигатель: \(enginetype.rawValue)
        Количество цилиндров: \(numberOfCylinders) шт.
        Количество окон: \(windows) шт.
        Мощность двигателя: \(enginePower) л.с.
        Расход топлива: \(fuelConsumption) л./100 км.
        Расположение руля: \(steeringWheelPosition.rawValue)
        Страна производитель: \(producingCountry)
        Год выпуска: \(releaseYear)
        Пробег: \(carMileage) км.

        Колёса: \(wheelsStatus.rawValue)
        Двери: \(doorsStatus.rawValue)
        Двигатель: \(engineStatus.rawValue)
        Окна: \(windowsStatus.rawValue)
        Капот: \(hoodStatus.rawValue)
        Цвет кузова: \(bodyColor.rawValue)
        """)
    }
}

class SportsCar: Car {
    var wheels: Int
    var doors: Int
    var enginetype: EngineType
    var windows: Int
    var enginePower: Int
    var numberOfCylinders: Int
    var fuelConsumption: Double
    var producingCountry: String
    var releaseYear: Int
    var carMileage: Double
    var driver: Driver
    var steeringWheelPosition: SteeringWheelPosition
    var vehicleType: VehicleType
    var wheelsStatus: WheelsStatus {
        willSet {
            if newValue == .rotating {
                print("Колёса прекращают вращение\n")
            } else {
                print("Колёса начинают вращение\n")
            }
        }
    }
    var doorsStatus: DoorsStatus {
        willSet {
            if newValue == .closed {
                print("Двери начинают открываться\n")
            } else {
                print("Двери начинают закрываться\n")
            }
        }
    }
    var engineStatus: EngineStatus {
        willSet {
            if newValue == .off {
                print("Двигатель начинает запускаться\n")
            } else {
                print("Двигатель начинает останавливаться\n")
            }
        }
    }
    var windowsStatus: WindowsStatus  {
        willSet {
            if newValue == .closed {
                print("Окна начинают открываться\n")
            } else {
                print("Окна начинают закрываться\n")
            }
        }
    }
    var hoodStatus: HoodStatus {
        willSet {
            if newValue == .closed {
                print("Капот начинает открываться\n")
            } else {
                print("Капот начинает закрываться\n")
            }
        }
    }
    var bodyColor: BodyColor
    init(wheels: Int, doors: Int, enginetype: EngineType, windows: Int, producingCountry: String, releaseYear: Int, carMileage: Double, driver: Driver, steeringWheelPosition: SteeringWheelPosition, vehicleType: VehicleType, wheelsStatus: WheelsStatus, doorsStatus: DoorsStatus, engineStatus: EngineStatus, windowsStatus: WindowsStatus, enginePower: Int, numberOfCylinders: Int, fuelConsumption: Double, hoodStatus: HoodStatus, bodyColor: BodyColor) {
        self.wheels = wheels
        self.doors = doors
        self.enginetype = enginetype
        self.windows = windows
        self.enginePower = enginePower
        self.numberOfCylinders = numberOfCylinders
        self.fuelConsumption = fuelConsumption
        self.producingCountry = producingCountry
        self.releaseYear = releaseYear
        self.carMileage = carMileage
        self.driver = driver
        self.steeringWheelPosition = steeringWheelPosition
        self.vehicleType = vehicleType
        self.wheelsStatus = wheelsStatus
        self.doorsStatus = doorsStatus
        self.engineStatus = engineStatus
        self.windowsStatus = windowsStatus
        self.hoodStatus = hoodStatus
        self.bodyColor = bodyColor
    }
    func printSpecificatios() {
        print("""

        Тип ТС: \(vehicleType.rawValue)
        Водитель: \(driver.rawValue)
        Количество колёс: \(wheels) шт.
        Количество дверей: \(doors) шт.
        Двигатель: \(enginetype.rawValue)
        Количество цилиндров: \(numberOfCylinders) шт.
        Количество окон: \(windows) шт.
        Мощность двигателя: \(enginePower) л.с.
        Расход топлива: \(fuelConsumption) л./100 км.
        Расположение руля: \(steeringWheelPosition.rawValue)
        Страна производитель: \(producingCountry)
        Год выпуска: \(releaseYear)
        Пробег: \(carMileage) км.

        Колёса: \(wheelsStatus.rawValue)
        Двери: \(doorsStatus.rawValue)
        Двигатель: \(engineStatus.rawValue)
        Окна: \(windowsStatus.rawValue)
        Капот: \(hoodStatus.rawValue)
        Цвет кузова: \(bodyColor.rawValue)
        """)
    }
}

extension TunkCar: CustomStringConvertible {
    var description: String {
        return """

        Это класс TunkCar, здесь может быть создано от 1 до 10 экземпляров с различными параметрами, а затем в случайном порядке исчезнуть.
        
        """
    }
}


extension SportsCar: CustomStringConvertible {
    var description: String {
        return """

        Это класс SportsCar, здесь может быть создано от 1 до 10 экземпляров с различными параметрами, а затем в случайном порядке исчезнуть.
        
        """
    }
}

var arraySportsCar:Array<SportsCar> = []
var startCountSportsCar = 0
var endCountSportsCar = Int.random(in: 1...10)
repeat {
    let sportsCar = SportsCar(wheels: SetNumberOfWheels()!, doors: SetNumberOfDoors()!, enginetype: .setRandomEngineType(), windows: SetNumberOfWindows()!, producingCountry: SetProducingCountry()!, releaseYear: SetReleaseYear(), carMileage: SetCarMileage().roundTo, driver: .setRandomDriver(), steeringWheelPosition: .setRandomSteeringWheelPositon(), vehicleType: .sportscar, wheelsStatus: .setRandomWheelsStatus(), doorsStatus: .setRandomDoorsStatus(), engineStatus: .setRandomEngineStatus(), windowsStatus: .setRandomWindowsStatus(), enginePower: setEnginePower(), numberOfCylinders: SetNumberOfCylinders()!, fuelConsumption: SetFuelConsumption().roundTo, hoodStatus: .setRandomHoodStatus(), bodyColor: .setRandomBodyColor())
    arraySportsCar.append(sportsCar)
    startCountSportsCar += 1
} while startCountSportsCar < endCountSportsCar

var arrayTunkCar:Array<TunkCar> = []
var startCountTunkCar = 0
var endCountTunkCar = Int.random(in: 1...10)
repeat {
    let tunkCar = TunkCar(wheels: SetNumberOfWheels()!, doors: SetNumberOfDoors()!, enginetype: .setRandomEngineType(), windows: SetNumberOfWindows()!, producingCountry: SetProducingCountry()!, releaseYear: SetReleaseYear(), carMileage: SetCarMileage().roundTo, driver: .setRandomDriver(), steeringWheelPosition: .setRandomSteeringWheelPositon(), vehicleType: .truckcar, wheelsStatus: .setRandomWheelsStatus(), doorsStatus: .setRandomDoorsStatus(), engineStatus: .setRandomEngineStatus(), windowsStatus: .setRandomWindowsStatus(), enginePower: setEnginePower(), numberOfCylinders: SetNumberOfCylinders()!, fuelConsumption: SetFuelConsumption().roundTo, hoodStatus: .setRandomHoodStatus(), bodyColor: .setRandomBodyColor())
    arrayTunkCar.append(tunkCar)
    startCountTunkCar += 1
} while startCountTunkCar < endCountTunkCar

var sportsCarCount = 0
var tunkCarCount = 0
func makeCars() {
    print(arraySportsCar[0].description)
    sleep(5)
    for _ in arraySportsCar {
        arraySportsCar[sportsCarCount].printSpecificatios()
        arraySportsCar[sportsCarCount].changeWheelsStatus()
        arraySportsCar[sportsCarCount].changeDoorsStatus()
        arraySportsCar[sportsCarCount].changeEngineStatus()
        arraySportsCar[sportsCarCount].changeWindowsStatus()
        arraySportsCar[sportsCarCount].changeHoodStatus()
        sportsCarCount += 1
    }
    print(arrayTunkCar[0].description)
    sleep(5)
    for _ in arrayTunkCar {
        arrayTunkCar[tunkCarCount].printSpecificatios()
        arrayTunkCar[tunkCarCount].changeWheelsStatus()
        arrayTunkCar[tunkCarCount].changeDoorsStatus()
        arrayTunkCar[tunkCarCount].changeEngineStatus()
        arrayTunkCar[tunkCarCount].changeWindowsStatus()
        arrayTunkCar[tunkCarCount].changeHoodStatus()
        tunkCarCount += 1
    }
    print("Было произведено \(arraySportsCar.count - 1) спортивных автомобилей и \(arrayTunkCar.count - 1) грузовых.")
}

func destroyCars() {
   
    if arraySportsCar.isEmpty {
        print("\nНи одной спортивной машины не произведено!")
    } else {
        for _ in arraySportsCar {
            let sportCarDestroyer = Int.random(in: 0..<arraySportsCar.count)
            arraySportsCar.remove(at: sportCarDestroyer)
            if arraySportsCar.isEmpty {
                print("\nВсе спортивные автомобили уничтожены.")
            } else {
                if arraySportsCar.count - 1 == 0 {
                    print ("\nУничтожаем последнюю тачку!")
                } else {
                    print("\nУничтожаем 1 любую спортивную тачку...")
                    if arraySportsCar.count - 1 != 0 {
                        print("Осталось \(arraySportsCar.count - 1) спортивных автомобилей.")
                    }
                }
            }
        }
    }

    if arrayTunkCar.isEmpty {
        print("Ни одного грузовика не произведено!")
    } else {
        for _ in arrayTunkCar {
            let tunkCarDestroyer = Int.random(in: 0..<arrayTunkCar.count)
            arrayTunkCar.remove(at: tunkCarDestroyer)
            if arrayTunkCar.isEmpty {
                print("\nВсе грузовые автомобили уничтожены.")
            } else {
                if arrayTunkCar.count - 1 == 0 {
                    print("\nУничтожаем последний грузовик!")
                } else {
                    print("\nУничтожаем 1 любой грузовик...")
                    if arrayTunkCar.count - 1 != 0 {
                        print("Осталось \(arrayTunkCar.count - 1) грузовых автомобилей.")
                    }
                }
            }
        }
    }
}

makeCars()
destroyCars()
