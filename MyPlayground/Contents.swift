/*  1. Описать класс Car c общими свойствами автомобилей и пустым методом действия по аналогии с прошлым заданием.
    2.Описать пару его наследников TrunkCar и SportCar. Подумать, какими отличительными свойствами обладают эти автомобили. Описать в каждом наследнике специфичные для него свойства.
    3. Взять из прошлого урока enum с действиями над автомобилем. Подумать, какие особенные действия имеет TrunkCar, а какие – SportCar. Добавить эти действия в перечисление.
    4. В каждом подклассе переопределить метод действия с автомобилем в соответствии с его классом.
    5. Создать несколько объектов каждого класса. Применить к ним различные действия.
    6. Вывести значения свойств экземпляров в консоль.

 Цель: Создаются 6 экземпляров объектов: Автомобиль, Автобус, Грузовик, Электровоз, Самолёт, Корабль. Случайным образов выбирается любой экземпляр или все сразу и выводятся их свойства и методы в консоль, если у какого-то экземпляра нет какого-то свойства или метода, то не выводятся в консоль, если что-то открыто, то закрывается, если что-то пустое, то заполняется и т.д. Потом в случайном порядке происходит деинициализация случайно выбранного экземпляра и выводится соответствующая информация в консоль, если экземпляр УЖЕ был деинициализирован, то тоже выводится соответствующая информация. Ну и sleep() добавил, чтобы не так скучно было :) А то что получилось из поставленной цели внизу, в коде.
    
    Хотел сделать, чтобы создавалось случайное число экземпляров каждого класса, но не смог. :(
    Как сделать случайный символ, букву, слово это я могу, а вот как создать, например Int.random(in: 1...10) экземпляров Корабля?
 
    PS. Вспомнил, у корабля же есть якорь. Забыл про якорь, ща добавлю.
*/

import Foundation

enum VehicleType {
    case Автомобиль, Автобус, Грузовик, Электровоз, Самолёт, Корабль
}
enum EngineStatus {
    case Включен, Выключен
}
enum SeatsStatus {
    case Заняты, Свободны
}
enum WindowsStatus {
    case Открыты, Закрыты
}
enum FuelTankStatus {
    case Полный, Пустой
}
enum VehicleColour {
    case Красный, Оранжевый, Жёлтый, Зеленый, Голубой, Синий, Фиолетовый, Серебристый, Белый
}
enum SunroofStatus {
    case Открыт, Закрыт
}
enum SecondEnranceStatus {
    case Открыт, Закрыт
}
enum RetarderStatus {
    case Включено, Выключено
}
enum GearsStatus {
    case Убраны, Выпущены
}
enum PropellerStatus {
    case Включен, Выключен
}
enum AncorStatus {
    case Спущен, Поднят
}

class Vehicle {
    static var vehicleCount = 0
    let vehicleType: VehicleType
    let numberOfEngines: Int
    let numberOfSeats: Int
    let numberofWindows: Int
    let fuelTankCapacity: Int
    let vehicleColor: VehicleColour
    var engineStatus: EngineStatus {
        willSet {
            if newValue == .Включен {
                print("Двигатель выключается\n")
            } else {
                print("Двигатель запускается\n")
            }
        }
    }
    var seatsStatus: SeatsStatus {
        willSet {
            if newValue == .Заняты {
                print("Места освобождаются\n")
            } else {
                print("Места занимаются\n")
            }
        }
    }
    var windowsStatus: WindowsStatus {
        willSet {
            if newValue == .Закрыты {
                print("Окна открываются\n")
            } else {
                print("Окна закрываются\n")
            }
        }
    }
    var fuelTankStatus: FuelTankStatus {
        willSet {
            if newValue == .Пустой {
                print("Бак заправляется топливом\n")
            } else {
                print("Топливо расходуется из бака\n")
            }
        }
    }
    init(vehicleType: VehicleType, numberOfEngines: Int, numberOfSeats: Int, numberofWindows: Int, fuelTankCapacity: Int, vehicleColor: VehicleColour, engineStatus: EngineStatus, seatsStatus: SeatsStatus, windowsStatus: WindowsStatus, fuelTankStatus: FuelTankStatus) {
        self.vehicleType = vehicleType
        self.numberOfEngines = numberOfEngines
        self.numberOfSeats = numberOfSeats
        self.numberofWindows = numberofWindows
        self.fuelTankCapacity = fuelTankCapacity
        self.vehicleColor = vehicleColor
        self.engineStatus = engineStatus
        self.seatsStatus = seatsStatus
        self.windowsStatus = windowsStatus
        self.fuelTankStatus = fuelTankStatus
        Vehicle.vehicleCount += 1
    }
    deinit {
        Vehicle.vehicleCount -= 1
    }
    static func countInfo() {
        if vehicleCount > 0 {
            print("Всего существует \(self.vehicleCount) транспортных средств.\n")
        } else {
            print("Не осталось транспортных средств.\n")
        }
    }
    func changeEngineStatus() {
        switch self.engineStatus {
        case .Включен:
            print("Двигатель выключён\n")
            self.engineStatus = .Выключен
        case .Выключен:
            print("Двигатель включён\n")
            self.engineStatus = .Включен
        }
    }
    func changeSeatsStatus() {
        switch self.seatsStatus {
        case .Заняты:
            print("Места свободны\n")
            self.seatsStatus = .Свободны
        case .Свободны:
            print("Места заняты\n")
            self.seatsStatus = .Заняты
        }
    }
    func changeWindowsStatus() {
        switch self.windowsStatus {
        case .Закрыты:
            print("Окна открыты\n")
        self.windowsStatus = .Открыты
        case .Открыты:
            print("Окна закрыты\n")
            self.windowsStatus = .Закрыты
        }
    }
    func changeFuelTankStatus() {
        switch self.fuelTankStatus {
        case .Полный:
            print("Топливный бак пустой\n")
            self.fuelTankStatus = .Пустой
        case .Пустой:
            print("Топливный бак полный\n")
            self.fuelTankStatus = .Полный
        }
    }
    func printSpecifications() {
        print("""
        Транспортное средство: \(vehicleType)
        Количество двигателей: \(numberOfEngines) шт.
        Количство мест: \(numberOfSeats) шт.
        Количество окон: \(numberofWindows) шт.
        Объем топливного бака: \(fuelTankCapacity) л.
        Цвет: \(vehicleColor)
        Состояние двигателя: \(engineStatus)
        Состояне свободных мест: \(seatsStatus)
        Состояние окон: \(windowsStatus)
        Состояние топливного бака: \(fuelTankStatus)

        """)
    }
}

class PassangerCar: Vehicle {
    static var passengerCarCount = 0
    var sunroofStatus: SunroofStatus {
        willSet {
            if newValue == .Закрыт {
                print("Люк открывается\n")
            } else {
                print("Люк закрывается\n")
            }
        }
    }
    let weight: String
    let price: String
    init(vehicleType: VehicleType, numberOfEngines: Int, numberOfSeats: Int, numberofWindows: Int, fuelTankCapacity: Int, vehicleColor: VehicleColour, engineStatus: EngineStatus, seatsStatus: SeatsStatus, windowsStatus: WindowsStatus, fuelTankStatus: FuelTankStatus, sunroofStatus: SunroofStatus, weight: String, price: String) {
        self.sunroofStatus = sunroofStatus
        self.weight = weight
        self.price = price
        super.init(vehicleType: vehicleType, numberOfEngines: numberofWindows, numberOfSeats: numberOfSeats, numberofWindows: numberofWindows, fuelTankCapacity: fuelTankCapacity, vehicleColor: vehicleColor, engineStatus: engineStatus, seatsStatus: seatsStatus, windowsStatus: windowsStatus, fuelTankStatus: fuelTankStatus)
        PassangerCar.passengerCarCount += 1
        }
        deinit {
            PassangerCar.passengerCarCount -= 1
        }
        static func countPassangerCarInfo() {
            if passengerCarCount > 0 {
                print("Всего существует \(self.passengerCarCount) легковых автомобиля.\n")
            } else {
                print("Не осталось легковых автомобилей.\n")
            }
            
        }
    func changeSunroofStatus() {
        switch self.sunroofStatus {
        case .Закрыт:
            print("Люк открыт\n")
            self.sunroofStatus = .Открыт
        case .Открыт:
            print("Люк закрыт\n")
            self.sunroofStatus = .Закрыт
        }
    }
    override func printSpecifications() {
        print("""
        Транспортное средство: \(vehicleType)
        Количество двигателей: \(numberOfEngines) шт.
        Количство мест: \(numberOfSeats) шт.
        Количество окон: \(numberofWindows) шт.
        Объем топливного бака: \(fuelTankCapacity) л.
        Цвет: \(vehicleColor)
        Снаряженная масса: \(weight)
        Стоимость: \(price)
        Состояние двигателя: \(engineStatus)
        Состояне свободных мест: \(seatsStatus)
        Состояние окон: \(windowsStatus)
        Состояние топливного бака: \(fuelTankStatus)
        Состояние люка: \(sunroofStatus)

        """)
    }
}

class Bus: Vehicle {
    static var busCount = 0
    let extraAxle: String
    let lagreCabin: String
    let doubleDecker: String
    var secondEntranceStatus: SecondEnranceStatus {
        willSet {
            if newValue == .Закрыт {
                print("Второй вход открывается\n")
            } else {
                print("Второй вход закрывается\n")
            }
            
        }
    }
    init(vehicleType: VehicleType, numberOfEngines: Int, numberOfSeats: Int, numberofWindows: Int, fuelTankCapacity: Int, vehicleColor: VehicleColour, engineStatus: EngineStatus, seatsStatus: SeatsStatus, windowsStatus: WindowsStatus, fuelTankStatus: FuelTankStatus, extraAxle: String, largeCabin: String, doubleDecker: String, secondEntranceStatus: SecondEnranceStatus) {
        self.extraAxle = extraAxle
        self.lagreCabin = largeCabin
        self.doubleDecker = doubleDecker
        self.secondEntranceStatus = secondEntranceStatus
        super.init(vehicleType: vehicleType, numberOfEngines: numberOfEngines, numberOfSeats: numberOfSeats, numberofWindows: numberofWindows, fuelTankCapacity: fuelTankCapacity, vehicleColor: vehicleColor, engineStatus: engineStatus, seatsStatus: seatsStatus, windowsStatus: windowsStatus, fuelTankStatus: fuelTankStatus)
        Bus.busCount += 1
        }
        deinit {
            Bus.busCount -= 1
        }
        static func countBusInfo() {
            if busCount > 0 {
                print("Всего существует \(self.busCount) автобуса.\n")
            } else {
                print("Не осталось ни одного автобуса.\n")
            }
        }
    func changeSecondEntranceStatus() {
        switch self.secondEntranceStatus {
        case .Закрыт:
            print("Второй вход/выход открыт\n")
            self.secondEntranceStatus = .Открыт
        case .Открыт:
            print("Второй вход/выход закрыт\n")
            self.secondEntranceStatus = .Закрыт
        }
    }
    override func printSpecifications() {
        print("""
        Транспортное средство: \(vehicleType)
        Количество двигателей: \(numberOfEngines) шт.
        Количство мест: \(numberOfSeats) шт.
        Количество окон: \(numberofWindows) шт.
        Объем топливного бака: \(fuelTankCapacity) л.
        Цвет: \(vehicleColor)
        Дополнительная ось: \(extraAxle)
        Большой салон: \(lagreCabin)
        Второй этаж: \(doubleDecker)
        Состояние двигателя: \(engineStatus)
        Состояне свободных мест: \(seatsStatus)
        Состояние окон: \(windowsStatus)
        Состояние топливного бака: \(fuelTankStatus)
        Состояние второго входа/выхода: \(secondEntranceStatus)

        """)
    }
}

class TruckCar: Vehicle {
    static var truckCarCount = 0
    let largeTrunk: String
    var retarder: RetarderStatus {
        willSet {
            if newValue == .Включено {
                print("Не тормозим двигателем\n")
            } else {
                print("Тормозим двигателем\n")
            }
        }
    }
    init(vehicleType: VehicleType, numberOfEngines: Int, numberOfSeats: Int, numberofWindows: Int, fuelTankCapacity: Int, vehicleColor: VehicleColour, engineStatus: EngineStatus, seatsStatus: SeatsStatus, windowsStatus: WindowsStatus, fuelTankStatus: FuelTankStatus, largeTrunk: String, retarder: RetarderStatus) {
        self.largeTrunk = largeTrunk
        self.retarder = retarder
        super.init(vehicleType: vehicleType, numberOfEngines: numberOfEngines, numberOfSeats: numberOfSeats, numberofWindows: numberofWindows, fuelTankCapacity: fuelTankCapacity, vehicleColor: vehicleColor, engineStatus: engineStatus, seatsStatus: seatsStatus, windowsStatus: windowsStatus, fuelTankStatus: fuelTankStatus)
        TruckCar.truckCarCount += 1
        }
        deinit {
            TruckCar.truckCarCount -= 1
        }
        static func countTruckCarInfo() {
            if truckCarCount > 0 {
                print("Всего существует \(self.truckCarCount) грузовых автомобиля.\n")
            } else {
                print("Совсем не осталось ни одного грузовика\n")
            }
        }
    func changeRetarderStatus() {
        switch self.retarder {
        case .Включено:
            print("Торможение двигателем выключено\n")
            self.retarder = .Выключено
        case .Выключено:
            print("Торможение двигателем включено\n")
            self.retarder = .Включено
        }
    }
    override func printSpecifications() {
        print("""
        Транспортное средство: \(vehicleType)
        Количество двигателей: \(numberOfEngines) шт.
        Количство мест: \(numberOfSeats) шт.
        Количество окон: \(numberofWindows) шт.
        Объем топливного бака: \(fuelTankCapacity) л.
        Цвет: \(vehicleColor)
        Вместительный кузов: \(largeTrunk)
        Состояние двигателя: \(engineStatus)
        Состояне свободных мест: \(seatsStatus)
        Состояние окон: \(windowsStatus)
        Состояние топливного бака: \(fuelTankStatus)
        Состояние тормоза-замедлителя: \(retarder)

        """)
    }
}

class Locomotive: Vehicle {
    static var locomotiveCount = 0
    let powerfull: String
    let environmentallySafe: String
    init(vehicleType: VehicleType, numberOfEngines: Int, numberOfSeats: Int, numberofWindows: Int, fuelTankCapacity: Int, vehicleColor: VehicleColour, engineStatus: EngineStatus, seatsStatus: SeatsStatus, windowsStatus: WindowsStatus, fuelTankStatus: FuelTankStatus, powerfull: String, environmentallySafe: String) {
        self.powerfull = powerfull
        self .environmentallySafe = environmentallySafe
        super.init(vehicleType: vehicleType, numberOfEngines: numberOfEngines, numberOfSeats: numberOfSeats, numberofWindows: numberofWindows, fuelTankCapacity: fuelTankCapacity, vehicleColor: vehicleColor, engineStatus: engineStatus, seatsStatus: seatsStatus, windowsStatus: windowsStatus, fuelTankStatus: fuelTankStatus)
        Locomotive.locomotiveCount += 1
        }
        deinit {
            Locomotive.locomotiveCount -= 1
        }
        static func countLocomotiveInfo() {
            if locomotiveCount > 0 {
                print("Всего существует \(self.locomotiveCount) элетровоза.\n")
            } else {
                print("Не осталось ни одного электровоза.\n")
            }
        }
    override func printSpecifications() {
        print("""
        Транспортное средство: \(vehicleType)
        Количество двигателей: \(numberOfEngines) шт.
        Количство мест: \(numberOfSeats) шт.
        Количество окон: \(numberofWindows) шт.
        Объем топливного бака: \(fuelTankCapacity) л.
        Цвет: \(vehicleColor)
        Мощность: \(powerfull)
        Экологический безопасный транспорт: \(environmentallySafe)
        Состояние двигателя: \(engineStatus)
        Состояне свободных мест: \(seatsStatus)
        Состояние окон: \(windowsStatus)

        """)
    }
}

class Plane: Vehicle {
    static var planeCount = 0
    let wings: String
    var gearsStatus: GearsStatus {
        willSet {
            if newValue == .Выпущены {
                print("Шасси складываются\n")
            } else {
                print("Шасси выпускаются\n")
            }
        }
    }
    init(vehicleType: VehicleType, numberOfEngines: Int, numberOfSeats: Int, numberofWindows: Int, fuelTankCapacity: Int, vehicleColor: VehicleColour, engineStatus: EngineStatus, seatsStatus: SeatsStatus, windowsStatus: WindowsStatus, fuelTankStatus: FuelTankStatus, wings: String, gearsStatus: GearsStatus) {
        self.wings = wings
        self.gearsStatus = gearsStatus
        super.init(vehicleType: vehicleType, numberOfEngines: numberOfEngines, numberOfSeats: numberOfSeats, numberofWindows: numberofWindows, fuelTankCapacity: fuelTankCapacity, vehicleColor: vehicleColor, engineStatus: engineStatus, seatsStatus: seatsStatus, windowsStatus: windowsStatus, fuelTankStatus: fuelTankStatus)
        Plane.planeCount += 1
        }
        deinit {
            Plane.planeCount -= 1
        }
        static func countPlaneInfo() {
            if planeCount > 0 {
                print("Всего существует \(self.planeCount) самолёта.\n")
            } else {
                print("Самолетов больше нет.\n")
            }
        }
    func changeGearsStatus() {
        switch self.gearsStatus {
        case .Убраны:
            print("Шасси выпущены\n")
            self.gearsStatus = .Выпущены
        case .Выпущены:
            print("Шасси убраны\n")
            self.gearsStatus = .Убраны
        }
    }
    override func printSpecifications() {
        print("""
        Транспортное средство: \(vehicleType)
        Количество двигателей: \(numberOfEngines) шт.
        Количство мест: \(numberOfSeats) шт.
        Количество окон: \(numberofWindows) шт.
        Объем топливного бака: \(fuelTankCapacity) л.
        Цвет: \(vehicleColor)
        Длинные крылья: \(wings)
        Состояние двигателя: \(engineStatus)
        Состояне свободных мест: \(seatsStatus)
        Состояние окон: \(windowsStatus)
        Состояние топливного бака: \(fuelTankStatus)
        Состояние шасси: \(gearsStatus)

        """)
    }
}

class Ship: Vehicle {
    static var shipCount = 0
    let nonSinking: String
    let numberOfPropellers: Int
    var ancor: AncorStatus {
        willSet {
            if newValue == .Поднят {
                print("Якорь спускается в воду\n")
            } else {
                print("Якорь поднимается из воды\n")
            }
        }
    }
    var propeller: PropellerStatus {
        willSet {
            if newValue == .Включен {
                print("Вращения винта прекращается\n")
            } else {
                print("Вращение винта начинается\n")
            }
        }
    
    }
    init(vehicleType: VehicleType, numberOfEngines: Int, numberOfSeats: Int, numberofWindows: Int, fuelTankCapacity: Int, vehicleColor: VehicleColour, engineStatus: EngineStatus, seatsStatus: SeatsStatus, windowsStatus: WindowsStatus, fuelTankStatus: FuelTankStatus, nonSinking: String, numberOfPropellers: Int, propeller: PropellerStatus, ancor: AncorStatus) {
        self.nonSinking = nonSinking
        self.numberOfPropellers = numberOfPropellers
        self.propeller = propeller
        self.ancor = ancor
        super.init(vehicleType: vehicleType, numberOfEngines: numberOfEngines, numberOfSeats: numberOfSeats, numberofWindows: numberofWindows, fuelTankCapacity: fuelTankCapacity, vehicleColor: vehicleColor, engineStatus: engineStatus, seatsStatus: seatsStatus, windowsStatus: windowsStatus, fuelTankStatus: fuelTankStatus)
        Ship.shipCount += 1
        }
        deinit {
            Ship.shipCount -= 1
        }
        static func countShipInfo() {
            if shipCount > 0 {
                print("Всего существует \(self.shipCount) корабля.\n")
            } else {
                print("Кораблей нет.\n")
            }
        }
    func changePropellerStatus() {
        switch self.propeller {
        case .Включен:
            print("Винт не вращается\n")
            self.propeller = .Выключен
        case .Выключен:
            print("Винт Вращается\n")
            self.propeller = .Включен
        }
    }
    func changeAncorStatus() {
        switch self.ancor {
        case .Поднят:
            print("Якорь спущен в воду\n")
            self.ancor = .Спущен
        case .Спущен:
            print("Якорь поднят из воды\n")
            self.ancor = .Поднят
        }
    }
    override func printSpecifications() {
        print("""

        Транспортное средство: \(vehicleType)
        Количество двигателей: \(numberOfEngines) шт.
        Количство мест: \(numberOfSeats) шт.
        Количество окон: \(numberofWindows) шт.
        Объем топливного бака: \(fuelTankCapacity) л.
        Цвет: \(vehicleColor)
        Количество гребных винтов: \(numberOfPropellers)
        Не боится воды: \(nonSinking)
        Состояние двигателя: \(engineStatus)
        Состояне свободных мест: \(seatsStatus)
        Состояние окон: \(windowsStatus)
        Состояние топливного бака: \(fuelTankStatus)
        Состояние гребного винта: \(propeller)
        Состояние якоря: \(ancor)

        """)
    }
}

var passengerCar: PassangerCar? = PassangerCar(vehicleType: .Автомобиль, numberOfEngines: 1, numberOfSeats: 5, numberofWindows: 6, fuelTankCapacity: 60, vehicleColor: .Белый, engineStatus: .Включен, seatsStatus: .Заняты, windowsStatus: .Закрыты, fuelTankStatus: .Полный, sunroofStatus: .Закрыт, weight: "Легкий", price: "Низкая")
var bus: Bus? = Bus(vehicleType: .Автобус, numberOfEngines: 1, numberOfSeats: 56, numberofWindows: 60, fuelTankCapacity: 180, vehicleColor: .Голубой, engineStatus: .Выключен, seatsStatus: .Свободны, windowsStatus: .Открыты, fuelTankStatus: .Пустой, extraAxle: "Присутствует", largeCabin: "Присутствует", doubleDecker: "Присутствует", secondEntranceStatus: .Открыт)
var truckCar: TruckCar? = TruckCar(vehicleType: .Грузовик, numberOfEngines: 1, numberOfSeats: 2, numberofWindows: 4, fuelTankCapacity: 250, vehicleColor: .Жёлтый, engineStatus: .Включен, seatsStatus: .Заняты, windowsStatus: .Закрыты, fuelTankStatus: .Полный, largeTrunk: "Присутствует", retarder: .Включено)
var locomotive: Locomotive? = Locomotive(vehicleType: .Электровоз, numberOfEngines: 2, numberOfSeats: 4, numberofWindows: 18, fuelTankCapacity: 0, vehicleColor: .Жёлтый, engineStatus: .Выключен, seatsStatus: .Свободны, windowsStatus: .Открыты, fuelTankStatus: .Пустой, powerfull: "Имеет очень высокую мощность", environmentallySafe: "Присутствует")
var plane: Plane? = Plane(vehicleType: .Самолёт, numberOfEngines: 3, numberOfSeats: 260, numberofWindows: 270, fuelTankCapacity: 90_000, vehicleColor: .Серебристый, engineStatus: .Включен, seatsStatus: .Заняты, windowsStatus: .Закрыты, fuelTankStatus: .Полный, wings: "Присутствует", gearsStatus: .Выпущены)
var ship: Ship? = Ship(vehicleType: .Корабль, numberOfEngines: 4, numberOfSeats: 180, numberofWindows: 84, fuelTankCapacity: 340_000, vehicleColor: .Красный, engineStatus: .Выключен, seatsStatus: .Свободны, windowsStatus: .Открыты, fuelTankStatus: .Пустой, nonSinking: "Действительно", numberOfPropellers: 3, propeller: .Включен, ancor: .Поднят)

func printSpecs (_ vehicle: String) -> String {
    switch vehicle.lowercased() {
    case "легковой автомобиль", "passenger car":
        PassangerCar.countPassangerCarInfo()
        passengerCar?.printSpecifications()
        passengerCar?.changeSunroofStatus()
        passengerCar?.changeWindowsStatus()
        passengerCar?.changeSeatsStatus()
        passengerCar?.changeEngineStatus()
        passengerCar?.changeFuelTankStatus()
        if passengerCar == nil {
            print("Автомобиль УЖЕ был уничтожен!\n")
        } else {
            passengerCar = nil
            print("Начинаем уничтожать автомобиль...\n")
            for time in 1...3 {
                sleep(1)
                print(time)
            }
            print("\nАвтомобиль уничтожен!\n")
        }
    case "автобус", "bus":
        Bus.countBusInfo()
        bus?.printSpecifications()
        bus?.changeSecondEntranceStatus()
        bus?.changeWindowsStatus()
        bus?.changeSeatsStatus()
        bus?.changeEngineStatus()
        bus?.changeFuelTankStatus()
        if bus == nil {
            print("Автобус УЖЕ был уничтожен!\n")
        } else {
            bus = nil
            print("Начинаем уничтожать единственный автобус...\n")
            for time in 1...3 {
                sleep(1)
                print(time)
            }
            print("\nАвтобус уничтожен!\n")
        }
    case "грузовой автомобиль", "truck car":
        TruckCar.countTruckCarInfo()
        truckCar?.printSpecifications()
        truckCar?.changeRetarderStatus()
        truckCar?.changeWindowsStatus()
        truckCar?.changeSeatsStatus()
        truckCar?.changeEngineStatus()
        truckCar?.changeFuelTankStatus()
        if truckCar == nil {
            print("Грузовик УЖЕ было вынесен!\n")
        } else {
            truckCar = nil
            print("Ща, минуточку, вынесем грузовик...\n")
            for time in 1...3 {
                sleep(1)
                print(time)
            }
            print("\nГрузовик превратился в nil!\n")
        }
    case "электровоз", "locomotive":
        Locomotive.countLocomotiveInfo()
        locomotive?.printSpecifications()
        locomotive?.changeSeatsStatus()
        locomotive?.changeSeatsStatus()
        locomotive?.changeEngineStatus()
        if locomotive == nil {
            print("Электровоз УЖЕ был пущен под откос!\n")
        } else {
            locomotive = nil
            print("Ну, электровоз с рельсов это совсем изи...\n")
            for time in 1...3 {
                sleep(1)
                print(time)
            }
            print("\nЭлектровоз слетел!\n")
        }
    case "самолет", "самолёт", "plane":
        Plane.countPlaneInfo()
        plane?.printSpecifications()
        plane?.changeWindowsStatus()
        plane?.changeSeatsStatus()
        plane?.changeEngineStatus()
        plane?.changeGearsStatus()
        plane?.changeFuelTankStatus()
        if plane == nil {
            print("Самолёт УЖЕ был отправлен в nil!\n")
        } else {
            plane = nil
            print("Отправим самолёт в nil..\n")
            for time in 1...3 {
                sleep(1)
                print(time)
            }
            print("\nНет больше самолёта!\n")
        }
    case "корабль", "ship":
        Ship.countShipInfo()
        ship?.printSpecifications()
        ship?.changeWindowsStatus()
        ship?.changeSeatsStatus()
        ship?.changeEngineStatus()
        ship?.changeFuelTankStatus()
        ship?.changePropellerStatus()
        ship?.changeAncorStatus()
        if ship == nil {
            print("Торпеда УЖЕ вынесла корабль!\n")
        } else {
            ship = nil
            print("Торпеда достигнет корабля через..\n")
            for time in 1...3 {
                sleep(1)
                print(time)
            }
            print("\nНет больше корабля!\n")
        }
    case "все", "all":
        Vehicle.countInfo()
        passengerCar?.printSpecifications()
        passengerCar?.changeSunroofStatus()
        passengerCar?.changeWindowsStatus()
        passengerCar?.changeSeatsStatus()
        passengerCar?.changeEngineStatus()
        passengerCar?.changeFuelTankStatus()
        if passengerCar == nil {
            print("Автомобиль УЖЕ был уничтожен!\n")
        } else {
            passengerCar = nil
            print("Начинаем уничтожать автомобиль...\n")
            for time in 1...3 {
                sleep(1)
                print(time)
            }
            print("\nАвтомобиль уничтожен!\n")
        }
        bus?.printSpecifications()
        bus?.changeSecondEntranceStatus()
        bus?.changeWindowsStatus()
        bus?.changeSeatsStatus()
        bus?.changeEngineStatus()
        bus?.changeFuelTankStatus()
        if bus == nil {
            print("Автобус УЖЕ был уничтожен!\n")
        } else {
            bus = nil
            print("Начинаем уничтожать единственный автобус...\n")
            for time in 1...3 {
                sleep(1)
                print(time)
            }
            print("\nАвтобус уничтожен!\n")
        }
        truckCar?.printSpecifications()
        truckCar?.changeRetarderStatus()
        truckCar?.changeWindowsStatus()
        truckCar?.changeSeatsStatus()
        truckCar?.changeEngineStatus()
        truckCar?.changeFuelTankStatus()
        if truckCar == nil {
            print("Грузовик УЖЕ было вынесен!\n")
        } else {
            truckCar = nil
            print("Ща, минуточку, вынесем грузовик...\n")
            for time in 1...3 {
                sleep(1)
                print(time)
            }
            print("\nГрузовик превратился в nil!\n")
        }
        locomotive?.printSpecifications()
        locomotive?.changeSeatsStatus()
        locomotive?.changeSeatsStatus()
        locomotive?.changeEngineStatus()
        if locomotive == nil {
            print("Электровоз УЖЕ был пущен под откос!\n")
        } else {
            locomotive = nil
            print("Ну, электровоз с рельсов это совсем изи...\n")
            for time in 1...3 {
                sleep(1)
                print(time)
            }
            print("\nЭлектровоз слетел!\n")
        }
        plane?.printSpecifications()
        plane?.changeWindowsStatus()
        plane?.changeSeatsStatus()
        plane?.changeEngineStatus()
        plane?.changeGearsStatus()
        plane?.changeFuelTankStatus()
        if plane == nil {
            print("Самолёт УЖЕ был отправлен в nil!\n")
        } else {
            plane = nil
            print("Отправим самолёт в nil..\n")
            for time in 1...3 {
                sleep(1)
                print(time)
            }
            print("\nНет больше самолёта!\n")
        }
        ship?.printSpecifications()
        ship?.changeWindowsStatus()
        ship?.changeSeatsStatus()
        ship?.changeEngineStatus()
        ship?.changeFuelTankStatus()
        ship?.changePropellerStatus()
        ship?.changeAncorStatus()
        if ship == nil {
            print("Торпеда УЖЕ вынесла корабль!\n")
        } else {
            ship = nil
            print("Торпеда достигнет корабля через..\n")
            for time in 1...3 {
                sleep(1)
                print(time)
            }
            print("\nНет больше корабля!\n")
        }
    default:
        print("Нет транспортных средств.\n")
    }
    return(vehicle)
}
var playTime = 0
repeat {
    let choice = Int.random(in: 1...10)
    if choice == 1 {
        printSpecs("Легковой автомобиль")
    } else if choice == 2 {
        printSpecs("Автобус")
    } else if choice == 3 {
        printSpecs("Грузовой автомобиль")
    } else if choice == 4 {
        printSpecs("Электровоз")
    } else if choice == 5 {
        printSpecs("Самолёт")
    } else if choice == 6 {
        printSpecs("Корабль")
    } else if choice == 7 {
        printSpecs("Все")
    } else {
        printSpecs("")
    }
    playTime += 1
} while playTime <= Int.random(in: 20...30)
