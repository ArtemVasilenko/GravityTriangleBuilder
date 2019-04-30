
import UIKit

enum numberLine {
    case side1
    case side2
    case side3
}

struct DataLine {
    var numberSide: numberLine
    var lenght: Int
    var width = 2
    
    init(numberSide: numberLine, lenght: Int) {
        self.numberSide = numberSide
        self.lenght = lenght
    }
    
    init(numberSide: numberLine, lenght: Int, width: Int) {
        self.numberSide = numberSide
        self.lenght = lenght
        self.width = width
    }
}

class Line: UIView {
    
    var numberSide: numberLine!
    var lenght: Int!
    var width: Int!
    
    init(dataLine: DataLine) {
        super.init(frame: CGRect())
        self.numberSide = dataLine.numberSide
        self.lenght = dataLine.lenght
        self.width = dataLine.width
        
        var arrayView = [UIView]()
        
        switch self.numberSide {
        case .side1?:
            for i in 0..<self.lenght {
                let framePoint = CGRect(x: i, y: self.lenght - i, width: self.width, height: self.width)
                let myView = UIView(frame: framePoint)
                myView.backgroundColor = .red
                
                arrayView.append(myView)
            }
            
        case .side2?:
            for i in 0..<self.lenght {
                let framePoint = CGRect(x: i, y: self.lenght + i, width: self.width, height: self.width)
                let myView = UIView(frame: framePoint)
                myView.backgroundColor = .green
                
                arrayView.append(myView)
            }
            
        case .side3?:
            let frameLine = CGRect(x: 0, y: 0, width: self.lenght, height: self.width)
            
            let myView = UIView(frame: frameLine)
            myView.backgroundColor = .blue
            
            arrayView.append(myView)
            
        case .none:
            ()
        }
        
        arrayView.forEach {
            self.addSubview($0)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}


