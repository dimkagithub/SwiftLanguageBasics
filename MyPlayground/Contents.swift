
/* 1. Описать несколько структур – любой легковой автомобиль SportCar и любой грузовик TrunkCar.
   2. Структуры должны содержать марку авто, год выпуска, объем багажника/кузова, запущен ли двигатель, открыты ли окна, заполненный объем багажника.
   3. Описать перечисление с возможными действиями с автомобилем: запустить/заглушить двигатель, открыть/закрыть окна, погрузить/выгрузить из кузова/багажника груз определенного объема.
   4. Добавить в структуры метод с одним аргументом типа перечисления, который будет менять свойства структуры в зависимости от действия.
   5. Инициализировать несколько экземпляров структур. Применить к ним различные действия.
   6. Вывести значения свойств экземпляров в консоль.
*/

enum VehicleType {
    case Спортивный, Грузовой, Мотоцикл, Велосипед, Самолет
}
enum BodyColor {
    case Красный, Оранжевый, Желтый, Зеленый, Синий, Белый, Серебристый, Черный
}
enum Stereo {
    case Присутствует, Отсутствует
}
enum Transmission {
    case Автоматическая, Ручная, Отсутствует
}
enum EngineType {
    case Бензин, Дизель, Керосин, Отсутствует
}
enum Suspension {
    case Пружины, Воздух, Отсутствует
}
enum Body {
    case Седан, Купе, Хэтчбэк, Грузовик, Труба, Отсутствует
}
enum Axles {
    case Две, Три, Четыре
}
enum EngineStatus {
    case Включен, Выключен
}
enum WindowStatus {
    case Открыты, Закрыты
}
enum CargoStatus {
    case Полный, Пустой
}
enum Climate {
    case Присутствует, Отсутствует
}

struct SportCar {
    let vehicleType: VehicleType
    let model: String
    let manYear: Int
    let cargoCapacity: Double
    let color: BodyColor
    let mp3 : Stereo
    let transmission: Transmission
    let engineType: EngineType
    let suspension: Suspension
    let body: Body
    let axles: Axles
    var engine: EngineStatus {
        willSet {
            if newValue == .Включен {
                print("Двигатель выключается")
            } else {
                print("Двигатель запускается")
            }
        }
    }
    var window: WindowStatus {
        willSet {
            if newValue == .Открыты {
                print("Окна закрываются")
            } else {
                print("Окна открываются")
            }
        }
    }
    var cargo: CargoStatus {
        willSet {
            if newValue == .Пустой {
                print("Багажник загружается")
            } else {
                print("Багажник выгружается")
            }
        }
    }
    var airCon: Climate

    mutating func changeEngineStatus() {
        switch self.engine {
        case .Выключен:
            print("Двигатель включен")
            self.engine = .Включен
        case .Включен:
            print("Двигатель выключен")
            self.engine = .Выключен

        }
    }
  
    mutating func changeWindowStatus() {
        switch self.window {
        case .Закрыты:
            print("Окна открыты")
            self.window = .Открыты
        case .Открыты:
            print("Окна закрыты")
            self.window = .Закрыты
       }
    }

    mutating func changeCargoStatus() {
        switch self.cargo {
        case .Пустой:
            print("Багажник полный")
            self.cargo = .Полный
        case .Полный:
            print("Багажник пустой")
            self.cargo = .Пустой
        }
    }
    
    func specifications() {
        print("\nТип ТС: \(vehicleType)\nМодель: \(model)\nГод выпуска: \(manYear)\nГрузоподъемность: \(cargoCapacity) \nЦвет: \(color)\nМагнитола: \(mp3)\nТип Трансмиссии: \(transmission)\nТип двигателя: \(engineType)\nТип подвески: \(suspension)\nТип кузова: \(body)\nКоличество осей: \(axles)\n")
    }
}

struct TruckCar {
    let vehicleType: VehicleType
    let model: String
    let manYear: Int
    let cargoCapacity: Double
    let color: BodyColor
    let mp3 : Stereo
    let transmission: Transmission
    let engineType: EngineType
    let suspension: Suspension
    let body: Body
    let axles: Axles
    var engine: EngineStatus {
        willSet {
            if newValue == .Включен {
                print("Двигатель выключается")
            } else {
                print("Двигатель запускается")
            }
        }
    }
    var window: WindowStatus {
        willSet {
            if newValue == .Открыты {
                print("Окна закрываются")
            } else {
                print("Окна открываются")
            }
        }
    }
    var cargo: CargoStatus {
        willSet {
            if newValue == .Пустой {
                print("Багажник загружается")
            } else {
                print("Багажник выгружается")
            }
        }
    }
    var airCon: Climate

    mutating func changeEngineStatus() {
        switch self.engine {
        case .Выключен:
            print("Двигатель включен")
            self.engine = .Включен
        case .Включен:
            print("Двигатель выключен")
            self.engine = .Выключен

        }
    }
  
    mutating func changeWindowStatus() {
        switch self.window {
        case .Закрыты:
            print("Окна открыты")
            self.window = .Открыты
        case .Открыты:
            print("Окна закрыты")
            self.window = .Закрыты
       }
    }

    mutating func changeCargoStatus() {
        switch self.cargo {
        case .Пустой:
            print("Багажник полный")
            self.cargo = .Полный
        case .Полный:
            print("Багажник пустой")
            self.cargo = .Пустой
        }
    }
    
    func specifications() {
        print("\nТип ТС: \(vehicleType)\nМодель: \(model)\nГод выпуска: \(manYear)\nГрузоподъемность: \(cargoCapacity) \nЦвет: \(color)\nМагнитола: \(mp3)\nТип Трансмиссии: \(transmission)\nТип двигателя: \(engineType)\nТип подвески: \(suspension)\nТип кузова: \(body)\nКоличество осей: \(axles)\n")
    }
}

struct Motocycle {
    let vehicleType: VehicleType
    let model: String
    let manYear: Int
    let cargoCapacity: Double
    let color: BodyColor
    let mp3 : Stereo
    let transmission: Transmission
    let engineType: EngineType
    let suspension: Suspension
    let body: Body
    let axles: Axles
    var engine: EngineStatus {
        willSet {
            if newValue == .Включен {
                print("Двигатель выключается")
            } else {
                print("Двигатель запускается")
            }
        }
    }

    mutating func changeEngineStatus() {
        switch self.engine {
        case .Выключен:
            print("Двигатель включен")
            self.engine = .Включен
        case .Включен:
            print("Двигатель выключен")
            self.engine = .Выключен
        }
    }
   
    func specifications() {
        print("\nТип ТС: \(vehicleType)\nМодель: \(model)\nГод выпуска: \(manYear)\nГрузоподъемность: \(cargoCapacity) \nЦвет: \(color)\nМагнитола: \(mp3)\nТип Трансмиссии: \(transmission)\nТип двигателя: \(engineType)\nТип подвески: \(suspension)\nТип кузова: \(body)\nКоличество осей: \(axles)\n")
    }
}

struct Bike {
    let vehicleType: VehicleType
    let model: String
    let manYear: Int
    let cargoCapacity: Double
    let color: BodyColor
    let mp3 : Stereo
    let transmission: Transmission
    let engineType: EngineType
    let suspension: Suspension
    let body: Body
    let axles: Axles

    func specifications() {
        print("\nТип ТС: \(vehicleType)\nМодель: \(model)\nГод выпуска: \(manYear)\nГрузоподъемность: \(cargoCapacity) \nЦвет: \(color)\nМагнитола: \(mp3)\nТип Трансмиссии: \(transmission)\nТип двигателя: \(engineType)\nТип подвески: \(suspension)\nТип кузова: \(body)\nКоличество осей: \(axles)\n")
    }
}

struct Plane {
    let vehicleType: VehicleType
    let model: String
    let manYear: Int
    let cargoCapacity: Double
    let color: BodyColor
    let mp3 : Stereo
    let transmission: Transmission
    let engineType: EngineType
    let suspension: Suspension
    let body: Body
    let axles: Axles
    var engine: EngineStatus  {
        willSet {
            if newValue == .Включен {
                print("Двигатель выключается")
            } else {
                print("Двигатель запускается")
            }
        }
    }
    var window: WindowStatus {
        willSet {
            if newValue == .Открыты {
                print("Окна закрываются")
            } else {
                print("Окна открываются")
            }
        }
    }
    var cargo: CargoStatus {
        willSet {
            if newValue == .Пустой {
                print("Багажник загружается")
            } else {
                print("Багажник выгружается")
            }
        }
    }
    var airCon: Climate

    mutating func changeEngineStatus() {
        switch self.engine {
        case .Выключен:
            print("Двигатель включен")
            self.engine = .Включен
        case .Включен:
            print("Двигатель выключен")
            self.engine = .Выключен
        }
    }

    mutating func changeWindowStatus() {
        switch self.window {
        case .Закрыты:
            print("Окна открыты")
            self.window = .Открыты
        case .Открыты:
            print("Окна закрыты")
            self.window = .Закрыты
        }
    }

    mutating func changeCargoStatus() {
        switch self.cargo {
        case .Пустой:
            print("Багажник полный")
            self.cargo = .Полный
        case .Полный:
            print("Багажник пустой")
            self.cargo = .Пустой
        }
    }
    
    func specifications() {
        print("\nТип ТС: \(vehicleType)\nМодель: \(model)\nГод выпуска: \(manYear)\nГрузоподъемность: \(cargoCapacity) \nЦвет: \(color)\nМагнитола: \(mp3)\nТип Трансмиссии: \(transmission)\nТип двигателя: \(engineType)\nТип подвески: \(suspension)\nТип кузова: \(body)\nКоличество осей: \(axles)\n")
    }
}

var sportCar = SportCar(vehicleType: .Спортивный, model: "Mercedes-Benz E63", manYear: 2019, cargoCapacity: 1600, color: .Красный, mp3: .Присутствует, transmission: .Автоматическая, engineType: .Бензин, suspension: .Воздух, body: .Седан, axles: .Две, engine: EngineStatus.Включен, window: WindowStatus.Открыты, cargo: CargoStatus.Полный, airCon: .Присутствует)
var truckCar = TruckCar(vehicleType: .Грузовой, model: "Peterbilt 379", manYear: 2015, cargoCapacity: 20500, color: .Черный, mp3: .Присутствует, transmission: .Ручная, engineType: .Дизель, suspension: .Пружины, body: .Грузовик, axles: .Три, engine: EngineStatus.Выключен, window: WindowStatus.Закрыты, cargo: CargoStatus.Пустой, airCon: .Присутствует)
var motorcycle = Motocycle(vehicleType: .Мотоцикл, model: "Honda Ninha ZX-10R", manYear: 2010, cargoCapacity: 90, color: .Зеленый, mp3: .Отсутствует, transmission: .Ручная, engineType: .Бензин, suspension: .Пружины, body: .Отсутствует, axles: .Две, engine: EngineStatus.Включен)
var bike = Bike(vehicleType: .Велосипед, model: "Trek 4300", manYear: 2020, cargoCapacity: 50, color: .Желтый, mp3: .Отсутствует, transmission: .Отсутствует, engineType: .Отсутствует, suspension: .Отсутствует, body: .Отсутствует, axles: .Две)
var plane = Plane(vehicleType: .Самолет, model: "Boeing 777", manYear: 2012, cargoCapacity: 128000, color: .Серебристый, mp3: .Присутствует, transmission: .Отсутствует, engineType: .Керосин, suspension: .Отсутствует, body: .Труба, axles: .Две, engine: EngineStatus.Выключен, window: WindowStatus.Открыты, cargo: CargoStatus.Полный, airCon: .Присутствует)

func printSpecs (_ vehicle: String) -> String {
    switch vehicle.lowercased() {
    case "спортивный", "sportscar", "1":
        sportCar.specifications()
        sportCar.changeEngineStatus()
        sportCar.changeEngineStatus()
        sportCar.changeWindowStatus()
        sportCar.changeWindowStatus()
        sportCar.changeCargoStatus()
        sportCar.changeCargoStatus()
    case "грузовой", "truckcar", "2":
        truckCar.specifications()
        truckCar.changeEngineStatus()
        truckCar.changeEngineStatus()
        truckCar.changeWindowStatus()
        truckCar.changeWindowStatus()
        truckCar.changeCargoStatus()
        truckCar.changeCargoStatus()
    case "мотоцикл", "motorcycle", "3":
        motorcycle.specifications()
        motorcycle.changeEngineStatus()
        motorcycle.changeEngineStatus()
    case "велосипед", "bike", "4":
        bike.specifications()
    case "самолет", "самолёт", "plane", "5":
        plane.specifications()
        plane.changeEngineStatus()
        plane.changeEngineStatus()
        plane.changeWindowStatus()
        plane.changeWindowStatus()
        plane.changeCargoStatus()
        plane.changeCargoStatus()
    case "все", "all":
        sportCar.specifications()
        sportCar.changeEngineStatus()
        sportCar.changeEngineStatus()
        sportCar.changeWindowStatus()
        sportCar.changeWindowStatus()
        sportCar.changeCargoStatus()
        sportCar.changeCargoStatus()
        truckCar.specifications()
        truckCar.changeEngineStatus()
        truckCar.changeEngineStatus()
        truckCar.changeWindowStatus()
        truckCar.changeWindowStatus()
        truckCar.changeCargoStatus()
        truckCar.changeCargoStatus()
        motorcycle.specifications()
        motorcycle.changeEngineStatus()
        motorcycle.changeEngineStatus()
        bike.specifications()
        plane.specifications()
        plane.changeEngineStatus()
        plane.changeEngineStatus()
        plane.changeWindowStatus()
        plane.changeWindowStatus()
        plane.changeCargoStatus()
        plane.changeCargoStatus()
    default:
        print("Нет транспортных средств.")
    }
    return(vehicle)
}

// Playground очень скучный, нет возможности вводить параметры из консоли, поэтому пусть сам выбирает и вводит, что хочет! :)

var choice = Int.random(in: 1...10)
if choice == 1 {
    printSpecs("спортивный")
} else if choice == 1 {
    printSpecs("грузовой")
} else if choice == 2 {
    printSpecs("мотоцикл")
} else if choice == 3 {
    printSpecs("велосипед")
} else if choice == 4 {
    printSpecs("самолет")
} else if choice == 5 {
    printSpecs("все")
} else if choice > 5 {
    printSpecs("")
}
