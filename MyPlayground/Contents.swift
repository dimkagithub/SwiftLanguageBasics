//    1. Реализовать свой тип коллекции «очередь» (queue) c использованием дженериков.
//    2. Добавить ему несколько методов высшего порядка, полезных для этой коллекции (пример: filter для массивов)
//    3. * Добавить свой subscript, который будет возвращать nil в случае обращения к несуществующему индексу.
//
//    Нашёл классный шорткат cmd + / -- закоментировать блок кода :)

import Foundation

enum VehicleType: String {
    case motorcycle = "Мотоцикл 🏍"
    case passangercar = "Легковой автомобиль 🚗"
    case truckCar = "Грузовой автомобиль 🚚"
    case plane = "Самолет 🛩"
    case ship = "Корабль 🛳"
    case locomotive = "Электровоз 🚂"
    static func setRandomVehicleType() -> VehicleType {
        let randomVehicleType = Int.random(in: 1...6)
        switch randomVehicleType {
        case 1:
            return .motorcycle
        case 2:
            return .passangercar
        case 3:
            return .truckCar
        case 4:
            return .plane
        case 5:
            return .ship
        case 6:
            return .locomotive
        default:
            return setRandomVehicleType()
        }
    }
}

enum EngineType: String {
    case gasoline = "бензиновый"
    case diesel = "дизельный"
    case nuclear = "ядерное топливо"
    case electric = "электрический"
    case jet = "реактивный"
    static func setRandomEngineType() -> EngineType {
        let randomEngineType = Int.random(in: 1...5)
        switch randomEngineType {
        case 1:
            return .gasoline
        case 2:
            return .diesel
        case 3:
            return .nuclear
        case 4:
            return .electric
        case 5:
            return .jet
        default:
            return setRandomEngineType()
        }
    }
}

enum ProducingCountry: String {
    case germany = "Германия 🇩🇪"
    case russia = "Россия 🇷🇺"
    case sweeden = "Швеция 🇸🇪"
    case usa = "США 🇺🇸"
    case france = "Франция 🇫🇷"
    case italy = "Италия 🇮🇹"
    case gb = "Великобритания 🇬🇧"
    static func setRandomProducingCountry() -> ProducingCountry {
        let randomProducingCountry = Int.random(in: 1...7)
        switch randomProducingCountry {
        case 1:
            return .germany
        case 2:
            return .russia
        case 3:
            return .sweeden
        case 4:
            return .usa
        case 5:
            return .france
        case 6:
            return .italy
        case 7:
            return .gb
        default:
            return setRandomProducingCountry()
        }
    }
}

enum BodyColor: String {
    case whitе = "белый ⚪"
    case black = "черный ⚫"
    case blue = "синий 🔵"
    case green = "зеленый 🟢"
    case red = "красный 🔴"
    case brown = "коричневый 🟤"
    case yellow = "желтый 🟡"
    case silver = "серебристый 🔘"
    static func setRandomBodyColor() -> BodyColor {
        let randomBodyColor = Int.random(in: 1...8)
        switch randomBodyColor {
        case 1:
            return .whitе
        case 2:
            return .black
        case 3:
            return .blue
        case 4:
            return .green
        case 5:
            return .red
        case 6:
            return .brown
        case 7:
            return .yellow
        case 8:
            return .silver
        default:
            return setRandomBodyColor()
        }
    }
}

enum EngineLayout: String {
    case front = "спереди"
    case middle = "посередине"
    case rear = "сзади"
    static func setRandomEngineLayout() -> EngineLayout {
        let randomEngineLayout = Int.random(in: 1...3)
        switch randomEngineLayout {
        case 1:
            return .front
        case 2:
            return .middle
        case 3:
            return .rear
        default:
            return setRandomEngineLayout()
        }
    }
}

enum Voltage: String {
    case ac = "переменный ток, 25 кВ."
    case dc = "постоянный ток, 3 кВ."
    static func setRandomVoltage() -> Voltage {
        let randomVoltage = Int.random(in: 1...2)
        switch randomVoltage {
        case 1:
            return .ac
        case 2:
            return .dc
        default:
            return setRandomVoltage()
        }
    }
}

enum TrackWidth: String {
    case europe = "1435"
    case russia = "1520"
    static func setRandomTrackWidth() -> TrackWidth {
        let randomTrackWidth = Int.random(in: 1...2)
        switch randomTrackWidth {
        case 1:
            return .europe
        case 2:
            return .russia
        default:
            return setRandomTrackWidth()
        }
    }
}

extension Double {
     var roundTo: Double { (self * 100).rounded() / 100 }
 }

extension Collection {
    subscript(safe index: Index) -> Element? {
        return safeIndex(at: index)
    }
    func safeIndex(at index: Index) -> Element? {
        return indices.contains(index) ? self[index]: nil
    }
}

protocol Weightable {
    var weight: Double { get set }
}

protocol Vehicle: Weightable {
    var vehicleType: VehicleType { get set }
    var engineType: EngineType { get set }
    var producingCountry: ProducingCountry { get set }
    var bodyColor: BodyColor { get set }
    func printDesctiption()
}

class Motorcycle: Vehicle {
    var vehicleType: VehicleType
    var engineType: EngineType
    var producingCountry: ProducingCountry
    var bodyColor: BodyColor
    var weight: Double
    var accelerationTime: Double
    var maxRpm: Int
    init(vehicleType: VehicleType, engineType: EngineType, producingCountry: ProducingCountry, bodyColor: BodyColor, weight: Double, accelerationTime: Double, maxRpm: Int ) {
        self.vehicleType = vehicleType
        self.engineType = engineType
        self.producingCountry = producingCountry
        self.bodyColor = bodyColor
        self.weight = weight
        self.accelerationTime = accelerationTime
        self.maxRpm = maxRpm
    }
    func printDesctiption() {
        print("""
        Тип ТС: \(vehicleType.rawValue)
        Тип двигателя: \(engineType.rawValue)
        Страна производитель: \(producingCountry.rawValue)
        Цвет рамы: \(bodyColor.rawValue)
        Вес: \(weight.roundTo) кг.
        Разгон до 100 км.ч.: \(accelerationTime.roundTo) сек.
        Макмимальные обороты двигателя: \(maxRpm) об./мин.

        """)
        
    }
}

class PassengerCar: Vehicle {
    var vehicleType: VehicleType
    var engineType: EngineType
    var producingCountry: ProducingCountry
    var bodyColor: BodyColor
    var weight: Double
    var numberOfAirbags: Int
    var engineLaout: EngineLayout
    init(vehicleType: VehicleType, engineType: EngineType, producingCountry: ProducingCountry, bodyColor: BodyColor, weight: Double, numberOfAirBags: Int, engineLayout: EngineLayout) {
        self.vehicleType = vehicleType
        self.engineType = engineType
        self.producingCountry = producingCountry
        self.bodyColor = bodyColor
        self.weight = weight
        self.numberOfAirbags = numberOfAirBags
        self.engineLaout = engineLayout
    }
    func printDesctiption() {
        print("""
        Тип ТС: \(vehicleType.rawValue)
        Тип двигателя: \(engineType.rawValue)
        Страна производитель: \(producingCountry.rawValue)
        Цвет кузова: \(bodyColor.rawValue)
        Вес: \(weight.roundTo) кг.
        Количество подушек: \(numberOfAirbags) шт.
        Расположение двигателя: \(engineLaout.rawValue)

        """)
    }
}

class TruckCar: Vehicle {
    var vehicleType: VehicleType
    var engineType: EngineType
    var producingCountry: ProducingCountry
    var bodyColor: BodyColor
    var weight: Double
    var loadCapacity: Double
    var numberOfAxles: Int
    init(vehicleType: VehicleType, engineType: EngineType, producingCountry: ProducingCountry, bodyColor: BodyColor, weight: Double, loadCapacity: Double, numberOfAxles: Int) {
        self.vehicleType = vehicleType
        self.engineType = engineType
        self.producingCountry = producingCountry
        self.bodyColor = bodyColor
        self.weight = weight
        self.loadCapacity = loadCapacity
        self.numberOfAxles = numberOfAxles
    }
    func printDesctiption() {
        print("""
        Тип ТС: \(vehicleType.rawValue)
        Тип двигателя: \(engineType.rawValue)
        Страна производитель: \(producingCountry.rawValue)
        Цвет кузова: \(bodyColor.rawValue)
        Вес: \(weight.roundTo) кг.
        Грузоподъемность: \(loadCapacity.roundTo) кг.
        Количество осей: \(numberOfAxles) шт.

        """)
    }
}

class Plane: Vehicle {
    var vehicleType: VehicleType
    var engineType: EngineType
    var producingCountry: ProducingCountry
    var bodyColor: BodyColor
    var weight: Double
    var passangerCapacity: Int
    var numberOfEngines: Int
    init(vehicleType: VehicleType, engineType: EngineType, producingCountry: ProducingCountry, bodyColor: BodyColor, weight: Double, passangerCapacity: Int, numberOfEngines: Int) {
        self.vehicleType = vehicleType
        self.engineType = engineType
        self.producingCountry = producingCountry
        self.bodyColor = bodyColor
        self.weight = weight
        self.passangerCapacity = passangerCapacity
        self.numberOfEngines = numberOfEngines
    }
    func printDesctiption() {
        print("""
        Тип ТС: \(vehicleType.rawValue)
        Тип двигателя: \(engineType.rawValue)
        Страна производитель: \(producingCountry.rawValue)
        Цвет фюзеляжа: \(bodyColor.rawValue)
        Вес: \(weight.roundTo) кг.
        Пассажировместимость: \(passangerCapacity) чел.
        Количество двигателей \(numberOfEngines) шт.

        """)
    }
}

class Ship: Vehicle {
    var vehicleType: VehicleType
    var engineType: EngineType
    var producingCountry: ProducingCountry
    var bodyColor: BodyColor
    var weight: Double
    var displacementTonnage: Double
    var cruisingRange: Int
    init(vehicleType: VehicleType, engineType: EngineType, producingCountry: ProducingCountry, bodyColor: BodyColor, weight: Double, displacementTonnage: Double, cruisingRange: Int) {
        self.vehicleType = vehicleType
        self.engineType = engineType
        self.producingCountry = producingCountry
        self.bodyColor = bodyColor
        self.weight = weight
        self.displacementTonnage = displacementTonnage
        self.cruisingRange = cruisingRange
    }
    func printDesctiption() {
        print("""
        Тип ТС: \(vehicleType.rawValue)
        Тип двигателя: \(engineType.rawValue)
        Страна производитель: \(producingCountry.rawValue)
        Цвет корпуса: \(bodyColor.rawValue)
        Вес: \(weight.roundTo) кг.
        Водоизмещение: \((displacementTonnage / 1000).roundTo) т.
        Запас хода: \(cruisingRange) км.

        """)
    }
}

class Locomotive: Vehicle {
    var vehicleType: VehicleType
    var engineType: EngineType
    var producingCountry: ProducingCountry
    var bodyColor: BodyColor
    var weight: Double
    var voltage: Voltage
    var trackWidth: TrackWidth
    init(vehicleType: VehicleType, engineType: EngineType, producingCountry: ProducingCountry, bodyColor: BodyColor, weight: Double, voltage: Voltage, trackWidth: TrackWidth) {
        self.vehicleType = vehicleType
        self.engineType = engineType
        self.producingCountry = producingCountry
        self.bodyColor = bodyColor
        self.weight = weight
        self.voltage = voltage
        self.trackWidth = trackWidth
    }
    func printDesctiption() {
        print("""
        Тип ТС: \(vehicleType.rawValue)
        Тип двигателя: \(engineType.rawValue)
        Страна производитель: \(producingCountry.rawValue)
        Цвет корпуса: \(bodyColor.rawValue)
        Вес: \(weight.roundTo) кг.
        Напряжение сети: \(voltage.rawValue)
        Колея: \(trackWidth.rawValue) мм.

        """)
    }
}

struct Stack<T: Weightable> {
    private var elements: [T] = []
    mutating func push(_ element: T) {
        elements.append(element)
    }
    mutating func pop() -> T? {
        return elements.removeLast()
    }
    var totalWeight: Double {
        var weight = 0.0
        for element in elements {
            weight += element.weight
        }
        return weight
    }
    subscript(indices: Int ...) -> Double {
        var weight = 0.0
        for index in indices where index < self.elements.count {
            weight += self.elements[Int(index)].weight
        }
        return weight
    }
}

var motorcycleStack = Stack<Motorcycle>()
var passengerCarStack = Stack<PassengerCar>()
var truckCarStack = Stack<TruckCar>()
var planeStack = Stack<Plane>()
var shipStack = Stack<Ship>()
var locomotiveStack = Stack<Locomotive>()

var arrayMotorcycle:Array<Motorcycle> = []
var arrayPassengerCar:Array<PassengerCar> = []
var arrayTruckCar:Array<TruckCar> = []
var arrayPlane:Array<Plane> = []
var arrayShip:Array<Ship> = []
var arrayLocomotive:Array<Locomotive> = []

func makeVehicles() {
    var motorcycleStartCount = 0
    let motorCycleEndCount = Int.random(in: 1...10)
    var passengerCarStartCount = 0
    let passengerCarEndCount = Int.random(in: 1...10)
    var truckCarStartCount = 0
    let truckCarEndCount = Int.random(in: 1...10)
    var planeStartCount = 0
    let planeEndCount = Int.random(in: 1...10)
    var shipStartCount = 0
    let shipEndCount = Int.random(in: 1...10)
    var locomotiveStartCount = 0
    let locomotiveEndCount = Int.random(in: 1...10)
    print("Создаем \(motorCycleEndCount) мотоциклов...\n")
    sleep(1)
    repeat {
        let motorcycle = Motorcycle(vehicleType: .motorcycle, engineType: .gasoline, producingCountry: .setRandomProducingCountry(), bodyColor: .setRandomBodyColor(), weight: Double.random(in: 98.69...156.54), accelerationTime: Double.random(in: 2.6...11.69), maxRpm: Int.random(in: 7000...16000))
        arrayMotorcycle.append(motorcycle)
        motorcycleStartCount += 1
    } while motorcycleStartCount < motorCycleEndCount
    print("Создаем \(passengerCarEndCount) легковых автомобилей...\n")
    sleep(1)
    repeat {
        let passengerCar = PassengerCar(vehicleType: .passangercar, engineType: .gasoline, producingCountry: .setRandomProducingCountry(), bodyColor: .setRandomBodyColor(), weight: Double.random(in: 1265.98...2452.85), numberOfAirBags: Int.random(in: 1...4), engineLayout: .setRandomEngineLayout())
        arrayPassengerCar.append(passengerCar)
        passengerCarStartCount += 1
    } while passengerCarStartCount < passengerCarEndCount
    print("Создаем \(truckCarEndCount) грузовых автомобилей...\n")
    sleep(1)
    repeat {
        let truckCar = TruckCar(vehicleType: .truckCar, engineType: .diesel, producingCountry: .setRandomProducingCountry(), bodyColor: .setRandomBodyColor(), weight: Double.random(in: 8954.96...24589.54), loadCapacity: Double.random(in: 2458.97...19965.95), numberOfAxles: Int.random(in: 2...6))
        arrayTruckCar.append(truckCar)
        truckCarStartCount += 1
    } while truckCarStartCount < truckCarEndCount
    print("Создаем \(planeEndCount) самолетов...\n")
    sleep(1)
    repeat {
        let plane = Plane(vehicleType: .plane, engineType: .jet, producingCountry: .setRandomProducingCountry(), bodyColor: .setRandomBodyColor(), weight: Double.random(in: 124125.65...238654.98), passangerCapacity: Int.random(in: 50...234), numberOfEngines: Int.random(in: 1...4))
        arrayPlane.append(plane)
        planeStartCount += 1
    } while planeStartCount < planeEndCount
    print("Создаем \(shipEndCount) кораблей...\n")
    sleep(1)
    repeat {
        let ship = Ship(vehicleType: .ship, engineType: .nuclear, producingCountry: .setRandomProducingCountry(), bodyColor: .setRandomBodyColor(), weight: Double.random(in: 401259.654...8544589.45), displacementTonnage: Double.random(in: 401259.654...8544589.45), cruisingRange: 11256)
        arrayShip.append(ship)
        shipStartCount += 1
    } while shipStartCount < shipEndCount
    print("Создаем \(locomotiveEndCount) электровозов...\n")
    sleep(1)
    repeat {
        let locomotive = Locomotive(vehicleType: .locomotive, engineType: .electric, producingCountry: .setRandomProducingCountry(), bodyColor: .setRandomBodyColor(), weight: Double.random(in: 401259.654...544589.45) , voltage: .setRandomVoltage(), trackWidth: .setRandomTrackWidth())
        arrayLocomotive.append(locomotive)
        locomotiveStartCount += 1
    } while locomotiveStartCount < locomotiveEndCount
}

func addVehiclesToStack() {
    print("Добавляем мотоциклы в стек...")
    sleep(1)
    for count in arrayMotorcycle {
        motorcycleStack.push(count)
    }
    print("Готово! \(arrayMotorcycle.count) мотоциклов в стеке\n")
    print("Добавляем легковые автомобили в стек...")
    sleep(1)
    for count in arrayPassengerCar {
        passengerCarStack.push(count)
    }
    print("Готово! \(arrayPassengerCar.count) легковых автомобилей в стеке\n")
    print("Добавляем грузовики в стек...")
    sleep(1)
    for count in arrayTruckCar {
        truckCarStack.push(count)
    }
    print("Готово! \(arrayTruckCar.count) грузовиков в стеке\n")
    print("Добавляем самолеты в стек...")
    sleep(1)
    for count in arrayPlane {
        planeStack.push(count)
    }
    print("Готово! \(arrayPlane.count) самолетов в стеке\n")
    print("Добавляем корабли в стек...")
    sleep(1)
    for count in arrayShip {
        shipStack.push(count)
    }
    print("Готово! \(arrayShip.count) кораблей в стеке\n")
    print("Добавляем электровозы в стек...")
    sleep(1)
    for count in arrayLocomotive {
        locomotiveStack.push(count)
    }
    print("Готово! \(arrayLocomotive.count) электровозов в стеке\n")
}

func removeVehiclesFromStack() {
    print("Удаляем мотоциклы из стека...")
    sleep(1)
    for _ in arrayMotorcycle {
        motorcycleStack.pop()
    }
    print("Готово! \(arrayMotorcycle.count) мотоциклов были удалены из стека\n")
    print("Удаляем легковые автомобили из стека...")
    sleep(1)
    for _ in arrayPassengerCar {
        passengerCarStack.pop()
    }
    print("Готово! \(arrayPassengerCar.count) легковых автомобилей были удалены из стека\n")
    print("Удаляем грузовики из стека...")
    sleep(1)
    for _ in arrayTruckCar {
        truckCarStack.pop()
    }
    print("Готово! \(arrayTruckCar.count) грузовиков были удалены из стека\n")
    print("Удаляем самолеты из стека...")
    sleep(1)
    for _ in arrayPlane {
        planeStack.pop()
    }
    print("Готово! \(arrayPlane.count) самолетов были удалены из стека\n")
    print("Удаляем корабли из стека...")
    sleep(1)
    for _ in arrayShip {
        shipStack.pop()
    }
    print("Готово! \(arrayShip.count) кораблей были удалены из стека\n")
    print("Удаляем электровозы из стека...")
    sleep(1)
    for _ in arrayLocomotive {
        locomotiveStack.pop()
    }
    print("Готово! \(arrayLocomotive.count) электровозов были удалены из стека\n")
}

func printDescription() {
    var count = 0
    for _ in arrayMotorcycle {
        arrayMotorcycle[count].printDesctiption()
        count += 1
    }
    print("---")
    sleep(1)
    count = 0
    for _ in arrayPassengerCar {
        arrayPassengerCar[count].printDesctiption()
        count += 1
    }
    print("---")
    sleep(1)
    count = 0
    for _ in arrayTruckCar {
        arrayTruckCar[count].printDesctiption()
        count += 1
    }
    print("---")
    sleep(1)
    count = 0
    for _ in arrayPlane {
        arrayPlane[count].printDesctiption()
        count += 1
    }
    print("---")
    sleep(1)
    count = 0
    for _ in arrayShip {
        arrayShip[count].printDesctiption()
        count += 1
    }
    print("---")
    sleep(1)
    count = 0
    for _ in arrayLocomotive {
        arrayLocomotive[count].printDesctiption()
        count += 1
    }
    sleep(1)
}

func totalStackWeight() {
    print("Считаем вес транспортных средств в СТЕКЕ (subscript)...")
    sleep(2)
    var count = 0
    var stackMotorcycleWeightArray = [Double]()
    for _ in arrayMotorcycle {
        stackMotorcycleWeightArray.append(motorcycleStack[count])
        count += 1
    }
    let stackMotorcycleWeight = stackMotorcycleWeightArray.reduce(0) { $0 + $1 }
    print("Вес \(count) мотоциклов \(stackMotorcycleWeight.roundTo) кг.")
    count = 0
    var stackPassengerCarWeightArray = [Double]()
    for _ in arrayPassengerCar {
        stackPassengerCarWeightArray.append(passengerCarStack[count])
        count += 1
    }
    let stackPassangerCarWeight = stackPassengerCarWeightArray.reduce(0) { $0 + $1 }
    print("Вес \(count) легковых автомобилей \(stackPassangerCarWeight.roundTo) кг.")
    count = 0
    var stackTruckCarWeightArray = [Double]()
    for _ in arrayTruckCar {
        stackTruckCarWeightArray.append(truckCarStack[count])
        count += 1
    }
    let stackTruckCarWeight = stackTruckCarWeightArray.reduce(0) { $0 + $1 }
    print("Вес \(count) грузовиков \(stackTruckCarWeight.roundTo) кг.")
    count = 0
    var stackPlaneWeightArray = [Double]()
    for _ in arrayPlane {
        stackPlaneWeightArray.append(planeStack[count])
        count += 1
    }
    let stackPlaneWeight = stackPlaneWeightArray.reduce(0) { $0 + $1 }
    print("Вес \(count) самолетов \(stackPlaneWeight.roundTo) кг.")
    count = 0
    var stackShipWeightArray = [Double]()
    for _ in arrayShip {
        stackShipWeightArray.append(shipStack[count])
        count += 1
    }
    let stackShipWeight = stackShipWeightArray.reduce(0) { $0 + $1 }
    print("Вес \(count) кораблей \(stackShipWeight.roundTo) кг.")
    count = 0
    var stackLocomotiveWeightArray = [Double]()
    for _ in arrayLocomotive {
        stackLocomotiveWeightArray.append(locomotiveStack[count])
        count += 1
    }
    let stackLocomotiveWeight = stackLocomotiveWeightArray.reduce(0) { $0 + $1 }
    print("Вес \(count) электровозов \(stackLocomotiveWeight.roundTo) кг.")
    print("""

    Общий вес \(arrayMotorcycle.count + arrayPassengerCar.count + arrayTruckCar.count + arrayPlane.count + arrayShip.count + arrayLocomotive.count) транспортных средств в СТЕКЕ (subscript): \((stackMotorcycleWeight + stackPassangerCarWeight + stackTruckCarWeight + stackPlaneWeight + stackShipWeight + stackLocomotiveWeight).roundTo) кг.

    """)
}

func sortMotorcycleWeight() {
    var count = 0
    var arrayWeight = [Double]()
    print("Попробуем отсортировать вес мотоциклов по возрастанию...")
    sleep(1)
    for _ in arrayMotorcycle {
        arrayWeight.append(arrayMotorcycle[count].weight)
        count += 1
    }
    arrayWeight.sort { $0 < $1 }
    count = 0
    for _ in arrayWeight {
        print("Вес \(count + 1) мотоцикла: \(arrayWeight[count].roundTo) кг.")
        count += 1
    }
    print("")
    count = 0
    arrayWeight = [Double]()
    print("А теперь отсортируем вес мотоциклов по убыванию...")
    sleep(1)
    for _ in arrayMotorcycle {
        arrayWeight.append(arrayMotorcycle[count].weight)
        count += 1
    }
    arrayWeight.sort { $0 > $1 }
    count = 0
    for _ in arrayWeight {
        print("Вес \(count + 1) мотоцикла: \(arrayWeight[count].roundTo) кг.")
        count += 1
    }
    print("")
}

func sortPassengerCarWeight() {
    var count = 0
    var arrayWeight = [Double]()
    print("Попробуем отсортировать вес легковых автомобилей по возрастанию...")
    sleep(1)
    for _ in arrayPassengerCar {
        arrayWeight.append(arrayPassengerCar[count].weight)
        count += 1
    }
    arrayWeight.sort { $0 < $1 }
    count = 0
    for _ in arrayWeight {
        print("Вес \(count + 1) автомашины: \(arrayWeight[count].roundTo) кг.")
        count += 1
    }
    print("")
    count = 0
    arrayWeight = [Double]()
    print("А теперь отсортируем вес легковых автомобилей по убыванию...")
    sleep(1)
    for _ in arrayPassengerCar {
        arrayWeight.append(arrayPassengerCar[count].weight)
        count += 1
    }
    arrayWeight.sort { $0 > $1 }
    count = 0
    for _ in arrayWeight {
        print("Вес \(count + 1) автомашины: \(arrayWeight[count].roundTo) кг.")
        count += 1
    }
    print("")
}

func sortTruckCarWeight() {
    var count = 0
    var arrayWeight = [Double]()
    print("Попробуем отсортировать вес грузовиков по возрастанию...")
    sleep(1)
    for _ in arrayTruckCar {
        arrayWeight.append(arrayTruckCar[count].weight)
        count += 1
    }
    arrayWeight.sort { $0 < $1 }
    count = 0
    for _ in arrayWeight {
        print("Вес \(count + 1) грузовика: \(arrayWeight[count].roundTo) кг.")
        count += 1
    }
    print("")
    count = 0
    arrayWeight = [Double]()
    print("А теперь отсортируем вес грузовиков по убыванию...")
    sleep(1)
    for _ in arrayTruckCar {
        arrayWeight.append(arrayTruckCar[count].weight)
        count += 1
    }
    arrayWeight.sort { $0 > $1 }
    count = 0
    for _ in arrayWeight {
        print("Вес \(count + 1) грузовика: \(arrayWeight[count].roundTo) кг.")
        count += 1
    }
    print("")
}

func sortPlaneWeight() {
    var count = 0
    var arrayWeight = [Double]()
    print("Попробуем отсортировать вес самолетов по возрастанию...")
    sleep(1)
    for _ in arrayPlane {
        arrayWeight.append(arrayPlane[count].weight)
        count += 1
    }
    arrayWeight.sort { $0 < $1 }
    count = 0
    for _ in arrayWeight {
        print("Вес \(count + 1) самолета: \(arrayWeight[count].roundTo) кг.")
        count += 1
    }
    print("")
    count = 0
    arrayWeight = [Double]()
    print("А теперь отсортируем вес самолетов по убыванию...")
    sleep(1)
    for _ in arrayPlane {
        arrayWeight.append(arrayPlane[count].weight)
        count += 1
    }
    arrayWeight.sort { $0 > $1 }
    count = 0
    for _ in arrayWeight {
        print("Вес \(count + 1) самолета: \(arrayWeight[count].roundTo) кг.")
        count += 1
    }
    print("")
}

func sortShipWeight() {
    var count = 0
    var arrayWeight = [Double]()
    print("Попробуем отсортировать вес кораблей по возрастанию...")
    sleep(1)
    for _ in arrayShip {
        arrayWeight.append(arrayShip[count].weight)
        count += 1
    }
    arrayWeight.sort { $0 < $1 }
    count = 0
    for _ in arrayWeight {
        print("Вес \(count + 1) корабля: \(arrayWeight[count].roundTo) кг.")
        count += 1
    }
    print("")
    count = 0
    arrayWeight = [Double]()
    print("А теперь отсортируем вес кораблей по убыванию...")
    sleep(1)
    for _ in arrayShip {
        arrayWeight.append(arrayShip[count].weight)
        count += 1
    }
    arrayWeight.sort { $0 > $1 }
    count = 0
    for _ in arrayWeight {
        print("Вес \(count + 1) корабля: \(arrayWeight[count].roundTo) кг.")
        count += 1
    }
    print("")
}

func sortLocomotiveWeight() {
    var count = 0
    var arrayWeight = [Double]()
    print("Попробуем отсортировать вес электровозов по возрастанию...")
    sleep(1)
    for _ in arrayLocomotive {
        arrayWeight.append(arrayLocomotive[count].weight)
        count += 1
    }
    arrayWeight.sort { $0 < $1 }
    count = 0
    for _ in arrayWeight {
        print("Вес \(count + 1) электровоза: \(arrayWeight[count].roundTo) кг.")
        count += 1
    }
    print("")
    count = 0
    arrayWeight = [Double]()
    print("А теперь отсортируем вес электровозов по убыванию...")
    sleep(1)
    for _ in arrayLocomotive {
        arrayWeight.append(arrayLocomotive[count].weight)
        count += 1
    }
    arrayWeight.sort { $0 > $1 }
    count = 0
    for _ in arrayWeight {
        print("Вес \(count + 1) электровоза: \(arrayWeight[count].roundTo) кг.")
        count += 1
    }
    print("")
}

func totalArrayWeight() {
    print("Считаем вес транспортных средств в МАССИВЕ (ФВП)...")
    sleep(2)
    var count = 0
    var arrayMotorcycleWeight = [Double]()
    for _ in arrayMotorcycle {
        arrayMotorcycleWeight.append(arrayMotorcycle[count].weight)
        count += 1
    }
    let totalMotorcycleWeight = arrayMotorcycleWeight.reduce(0) { $0 + $1 }
    print("Вес \(arrayMotorcycle.count) мотоциклов \(totalMotorcycleWeight.roundTo) кг.")
    count = 0
    var arrayPassengerCarWeight = [Double]()
    for _ in arrayPassengerCar {
        arrayPassengerCarWeight.append(arrayPassengerCar[count].weight)
        count += 1
    }
    let totalPassengerCarWeight = arrayPassengerCarWeight.reduce(0) { $0 + $1 }
    print("Вес \(arrayPassengerCar.count) легковых автомобилей \(totalPassengerCarWeight.roundTo) кг.")
    count = 0
    var arrayTruckCarWeight = [Double]()
    for _ in arrayTruckCar {
        arrayTruckCarWeight.append(arrayTruckCar[count].weight)
        count += 1
    }
    let totalTruckCarWeight = arrayTruckCarWeight.reduce(0) { $0 + $1 }
    print("Вес \(arrayTruckCar.count) грузовых автомобилей \(totalTruckCarWeight.roundTo) кг.")
    count = 0
    var arrayPlaneWeight = [Double]()
    for _ in arrayPlane {
        arrayPlaneWeight.append(arrayPlane[count].weight)
        count += 1
    }
    let totalPlaneWeight = arrayPlaneWeight.reduce(0) { $0 + $1 }
    print("Вес \(arrayPlane.count) самолетов \(totalPlaneWeight.roundTo) кг.")
    count = 0
    var arrayShipWeight = [Double]()
    for _ in arrayShip {
        arrayShipWeight.append(arrayShip[count].weight)
        count += 1
    }
    let totalShipWeight = arrayShipWeight.reduce(0) { $0 + $1 }
    print("Вес \(arrayShip.count) кораблей \(totalShipWeight.roundTo) кг.")
    count = 0
    var arrayLocomotiveWeight = [Double]()
    for _ in arrayLocomotive {
        arrayLocomotiveWeight.append(arrayLocomotive[count].weight)
        count += 1
    }
    let totalLocomotiveWeight = arrayLocomotiveWeight.reduce(0) { $0 + $1 }
    print("Вес \(arrayLocomotive.count) электровозов \(totalLocomotiveWeight.roundTo) кг.")
    print("""

    Общий вес \(arrayMotorcycle.count + arrayPassengerCar.count + arrayTruckCar.count + arrayPlane.count + arrayShip.count + arrayLocomotive.count) транспортных средств в массиве (ФВП): \((totalMotorcycleWeight + totalPassengerCarWeight + totalTruckCarWeight + totalPlaneWeight + totalShipWeight + totalLocomotiveWeight).roundTo) кг.

    """)
}

func removeVehiclesFromArray() {
    print("Удаляем транспортные средства из своих массивов...")
    sleep(2)
    arrayMotorcycle.removeAll()
    arrayPassengerCar.removeAll()
    arrayTruckCar.removeAll()
    arrayPlane.removeAll()
    arrayShip.removeAll()
    arrayLocomotive.removeAll()
    print("Готово!\n")
    
}

func checkNil() {
    print("Возвращаем nil с помощью subscript...")
    sleep(2)
    print("Массив Мотоциклы пустой \(arrayMotorcycle), в любом индексе: \(String(describing: arrayMotorcycle[safe: 0]?.vehicleType.rawValue))")
    print("Массив Легковой автомобиль пустой \(arrayPassengerCar), в любом индексе: \(String(describing: arrayPassengerCar[safe: 0]?.vehicleType.rawValue))")
    print("Массив Грузовой автомобиль пустой \(arrayTruckCar), в любом индексе: \(String(describing: arrayTruckCar[safe: 0]?.vehicleType.rawValue))")
    print("Массив Самолет пустой \(arrayPlane), в любом индексе: \(String(describing: arrayPlane[safe: 0]?.vehicleType.rawValue))")
    print("Массив Корабль пустой \(arrayShip), в любом индексе: \(String(describing: arrayShip[safe: 0]?.vehicleType.rawValue))")
    print("Массив Электровоз пустой \(arrayLocomotive), в любом индексе: \(String(describing: arrayLocomotive[safe: 0]?.vehicleType.rawValue))\n")
}

func startThisShit() {
    makeVehicles()
    printDescription()
    addVehiclesToStack()
    totalStackWeight()
    removeVehiclesFromStack()
    sortMotorcycleWeight()
    sortPassengerCarWeight()
    sortTruckCarWeight()
    sortPlaneWeight()
    sortShipWeight()
    sortLocomotiveWeight()
    totalArrayWeight()
    removeVehiclesFromArray()
    checkNil()
}

startThisShit()
