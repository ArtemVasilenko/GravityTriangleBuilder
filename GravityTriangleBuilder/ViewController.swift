
import UIKit
import CoreMotion

class ViewController: UIViewController, TriangleProtocol {
    
    var motionManager = CMMotionManager()
    var timer = Timer()
    var triangle: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        let line1 = Line(dataLine: .init(numberSide: .side1, lenght: 50))
//        let line2 = Line(dataLine: .init(numberSide: .side2, lenght: 50, width: 5))
//        let line3 = Line(dataLine: DataLine(numberSide: .side3, lenght: 100, width: 10))
//        self.view.addSubview(line1)
//        self.view.addSubview(line2)
//        self.view.addSubview(line3)
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(moveTriangle), userInfo: nil, repeats: true)
        
        triangle = Triangle(triangleData: TriangleData(x: 50, y: 50, length: 100, width: 2))
        self.view.addSubview(triangle)
        
//        let triangleProtocol = creatingTriangle(triangleData: TriangleData(x: 50, y: 200, length: 150, width: 5))
//        self.view.addSubview(triangleProtocol)
        
    }

    @objc func moveTriangle() {
        
        if motionManager.isAccelerometerAvailable {
            motionManager.accelerometerUpdateInterval = 0.001
            motionManager.startAccelerometerUpdates(to: .main) {
               (data, error) in
                guard let data = data, error == nil else {return}
                self.triangle.center.x += CGFloat(data.acceleration.x)
                self.triangle.center.y -= CGFloat(data.acceleration.y)

            }
        }
    }
}

