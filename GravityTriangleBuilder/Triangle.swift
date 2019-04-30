import UIKit

struct TriangleData {
    var x: Int
    var y: Int
    var length: Int
    var width = 2
    
    init(x: Int, y: Int, length: Int) {
        self.x = x
        self.y = y
        self.length = length
    }
    
    init(x: Int, y: Int, length: Int, width: Int) {
        self.x = x
        self.y = y
        self.length = length
        self.width = width
    }
}

class Triangle: UIView {
    var x: Int!
    var y: Int!
    var length: Int!
    var width: Int!
    
    init(triangleData: TriangleData) {
        self.x = triangleData.x
        self.y = triangleData.y
        self.length = triangleData.length
        self.width = triangleData.width
        
       // let h = sqrt((length * length) - ((length/2) * (length/2)))
        let h = Int(sqrt(3.0) * Double(self.length) / 3.5)
        
        let line1 = Line(dataLine: DataLine(numberSide: .side1, lenght: self.length, width: self.width))
        
        
        let line2 = Line(dataLine: DataLine(numberSide: .side2, lenght: self.length, width: self.width))
        let viewLine2 = UIView(frame: CGRect(x: self.length, y: -h*2, width: self.length/2, height: h))
        viewLine2.addSubview(line2)
        
        let line3 = Line(dataLine: DataLine(numberSide: .side3, lenght: self.length*2, width: self.width))
        let viewLine3 = UIView(frame: CGRect(x: Int(line1.frame.origin.x), y: self.length, width: self.length, height: self.y))
        viewLine3.addSubview(line3)
        
        super.init(frame: CGRect(x: self.x, y: self.y, width: self.length*2, height: h*2 + self.width*2))
        

        self.addSubview(line1)
        self.addSubview(viewLine2)
        self.addSubview(viewLine3)
}
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


protocol TriangleProtocol {
    func creatingTriangle(triangleData: TriangleData) -> UIView
}

extension TriangleProtocol {
    
    func creatingTriangle(triangleData: TriangleData) -> UIView {
        let mainView = UIView()
        
        let h = Int(sqrt(3.0) * Double(triangleData.length) / 3.5)
        
        let line1 = Line(dataLine: DataLine(numberSide: .side1, lenght: triangleData.length, width: triangleData.width))
        
        
        let line2 = Line(dataLine: DataLine(numberSide: .side2, lenght: triangleData.length, width: triangleData.width))
        let viewLine2 = UIView(frame: CGRect(x: triangleData.length, y: -h*2, width: triangleData.length/2, height: h))
        viewLine2.addSubview(line2)
        
        let line3 = Line(dataLine: DataLine(numberSide: .side3, lenght: triangleData.length*2, width: triangleData.width))
        let viewLine3 = UIView(frame: CGRect(x: Int(line1.frame.origin.x), y: triangleData.length, width: triangleData.length, height: triangleData.y))
        viewLine3.addSubview(line3)
        
        mainView.addSubview(line1)
        mainView.addSubview(viewLine2)
        mainView.addSubview(viewLine3)
        
        return mainView
    }
}
