import UIKit

class Floating_Action_Button: UIButtonX {
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        
        UIView.animate(withDuration: 0.2, animations: {
            if self.transform == .identity {
                self.transform = CGAffineTransform(rotationAngle: -45 * (.pi / 180))
                self.backgroundColor = UIColor(red:0.76, green:0.23, blue:0.37, alpha:1.00)
            } else {
                self.transform = .identity
                self.backgroundColor = UIColor(red:0.93, green:0.34, blue:0.47, alpha:1.00)
            }
        })
        return true
    }
}
