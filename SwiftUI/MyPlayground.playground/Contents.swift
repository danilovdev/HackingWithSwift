import UIKit

class Awesome {
    var name: String

    init(name: String) {
        self.name = name
    }
}

let obj1 = Awesome(name: "123")
let obj2 = Awesome(name: "456")

let array1 = [obj1, obj2]
let array2 = array1

array2[0].name = "000"
print(array1[0].name)
