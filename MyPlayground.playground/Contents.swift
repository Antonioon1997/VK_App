import UIKit

var str = "Hello, playground"


var array = ["hello", "my", "darling", "duty"]

var firstLetters = Set(array.map({$0.first!}).sorted(by: <))
var stringLetters = [String] ()

firstLetters.forEach { (Character) in
    stringLetters.append("\(Character)")
    
}
array.remove(at: 1)

var arr = [(1,4) , (2, 5)]
arr.remove(at: 1)
print (firstLetters)
print (stringLetters)
print (array)
print (arr)

var groups = [
    (name: "Reddit", desctription: "Юмор", avatar: UIImage(named: "Reddit")!),
    (name: "Видео категории Б", desctription: "Юмор", avatar: UIImage(named: "Видео категории Б")!),
    (name: "КЛИЕНТ ВСЕГДА ПРАВ!", desctription: "Юмор", avatar: UIImage(named: "КЛИЕНТ ВСЕГДА ПРАВ!")!),
    (name: "SAUCE", desctription: "Юмор", avatar: UIImage(named: "SAUCE")!)
]
