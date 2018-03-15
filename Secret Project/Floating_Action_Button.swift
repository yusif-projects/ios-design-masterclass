import UIKit

class Floating_Action_Button: UIButtonX {
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        
        UIView.animate(withDuration: 0.3, animations: {
            if self.transform == .identity {
                self.transform = CGAffineTransform(rotationAngle: -45 * (.pi / 180))
            } else {
                self.transform = .identity
            }
        })
        return super.beginTracking(touch, with: event)
    }
}
