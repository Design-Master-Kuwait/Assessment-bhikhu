

import Foundation
import UIKit
//import SkeletonView
// MARK: - enums

/// Shake directions of a view.
///
/// - horizontal: Shake left and right.
/// - vertical: Shake up and down.
public enum ShakeDirection {
    /// shake horizontal
    case horizontal
    /// shake vertical
    case vertical
}

/// Angle units.
///
/// - degrees: degrees.
/// - radians: radians.
public enum AngleUnit {
    /// AngleUnit degrees
    case degrees
    /// AngleUnit radians
    case radians
}

/// Shake animations types.
///
/// - linear: linear animation.
/// - easeIn: easeIn animation
/// - easeOut: easeOut animation.
/// - easeInOut: easeInOut animation.
public enum ShakeAnimationType {
    /// shake type linear
    case linear
    /// shake type easeIn
    case easeIn
    /// shake type easeOut
    case easeOut
    /// shake type easeInOut
    case easeInOut
}

// MARK: - Properties

public extension UIView {
    /// Border color of view; also inspectable from Storyboard.
    @IBInspectable var borderColor: UIColor? {
        get {
            guard let color = layer.borderColor else {
                return nil
            }
            return UIColor(cgColor: color)
        }
        set {
            guard let color = newValue else {
                layer.borderColor = nil
                return
            }
            layer.borderColor = color.cgColor
        }
    }

    /// Border width of view; also inspectable from Storyboard.
    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }

    /// Corner radius of view; also inspectable from Storyboard.
    @IBInspectable var cornerRadiusView: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            //            layer.masksToBounds = true
            layer.cornerRadius = abs(CGFloat(Int(newValue * 100)) / 100)
        }
    }
    
    /// border of views
    @IBInspectable var TWBorderColor:UIColor{
        get{
            return self.TWBorderColor
        }
        set{
            self.layer.borderColor = newValue.cgColor
            
        }
    }
    
    /// Height of view.
    var height: CGFloat {
        get {
            return frame.size.height
        }
        set {
            frame.size.height = newValue
        }
    }

    /// Width of view.
    var width: CGFloat {
        get {
            return frame.size.width
        }
        set {
            frame.size.width = newValue
        }
    }

    /// x origin of view.
    var xPos: CGFloat {
        get {
            return frame.origin.x
        }
        set {
            frame.origin.x = newValue
        }
    }

    /// y origin of view.
    var yPos: CGFloat {
        get {
            return frame.origin.y
        }
        set {
            frame.origin.y = newValue
        }
    }

    /// Size of view.
    var size: CGSize {
        get {
            return frame.size
        }
        set {
            width = newValue.width
            height = newValue.height
        }
    }

    /// Take screenshot of view (if applicable).
    var screenshot: UIImage? {
        UIGraphicsBeginImageContextWithOptions(layer.frame.size, false, 0)
        defer {
            UIGraphicsEndImageContext()
        }
        guard let context = UIGraphicsGetCurrentContext() else {
            return nil
        }
        layer.render(in: context)
        return UIGraphicsGetImageFromCurrentImageContext()
    }
    
    /// Custom shape used in UI
    func customShapeLayout() {
        self.backgroundColor = .orange
        self.layer.cornerRadius = 15
        self.layer.masksToBounds = true
    }
    /// Flip view horizontally.
    func flipHorizontally() {
        transform = CGAffineTransform(scaleX: -transform.a, y: transform.d)
    }
  
   
    var snapshot: UIImage? {
            UIGraphicsBeginImageContextWithOptions(bounds.size, false, 0)
            defer { UIGraphicsEndImageContext() }
            drawHierarchy(in: bounds, afterScreenUpdates: true)
            return UIGraphicsGetImageFromCurrentImageContext()
    }
   
    func takeScreenshot() -> UIImage {
      
        
        
        // Begin context
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, false, UIScreen.main.scale)

        // Draw view in that context
        drawHierarchy(in: self.bounds, afterScreenUpdates: true)

        // And finally, get image
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        if (image != nil)
        {
            return image!
        }
        return UIImage()
    }
    
}

// MARK: - Methods

public extension UIView {
    /// Set some or all corners radiuses of view.
    ///
    /// - Parameters:
    ///   - corners: array of corners to change (example: [.bottomLeft, .topRight]).
    ///   - radius: radius for selected corners.
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        let maskPath = UIBezierPath(roundedRect: bounds,
                                    byRoundingCorners: corners,
                                    cornerRadii: CGSize(width: radius, height: radius))
        let shape = CAShapeLayer()
        shape.path = maskPath.cgPath
        layer.mask = shape
    }
    /// Load view from nib.
    ///
    /// - Parameters:
    ///   - name: nib name.
    ///   - bundle: bundle of nib (default is nil).
    /// - Returns: optional UIView (if applicable).
    class func loadFromNib(named name: String, bundle: Bundle? = nil) -> UIView? {
        return UINib(nibName: name, bundle: bundle).instantiate(withOwner: nil, options: nil)[0] as? UIView
    }

    /// Remove all gesture recognizers from view.
    func removeGestureRecognizers() {
        gestureRecognizers?.forEach(removeGestureRecognizer)
    }

    /// Fade in view.
    ///
    /// - Parameters:
    ///   - duration: animation duration in seconds (default is 1 second).
    ///   - completion: optional completion handler to run with animation finishes (default is nil)
    func fadeIn(duration: TimeInterval = 1, completion: ((Bool) -> Void)? = nil) {
        if isHidden {
            isHidden = false
        }
        UIView.animate(withDuration: duration, animations: {
            self.alpha = 1
        }, completion: completion)
    }

    /// Fade out view.
    ///
    /// - Parameters:
    ///   - duration: animation duration in seconds (default is 1 second).
    ///   - completion: optional completion handler to run with animation finishes (default is nil)
    func fadeOut(duration: TimeInterval = 1, completion: ((Bool) -> Void)? = nil) {
        if isHidden {
            isHidden = false
        }
        UIView.animate(withDuration: duration, animations: {
            self.alpha = 0
        }, completion: completion)
    }

    /* Usage Example
       * bgView.addBottomRoundedEdge(desiredCurve: 1.5)
       */

    /// UIView to display a curved view
    /// - Parameter desiredCurve: desiredCurve value
    func addTopRoundedEdge(desiredCurve: CGFloat?) {
        let offset: CGFloat =  frame.width/desiredCurve!
        let bounds: CGRect = self.bounds
        let rectBounds: CGRect = CGRect(x: bounds.origin.x, y: bounds.origin.y+bounds.size.height / 2, width: bounds.size.width, height: bounds.size.height / 2)
        let rectPath: UIBezierPath = UIBezierPath(rect: rectBounds)
        let ovalBounds: CGRect = CGRect(x: bounds.origin.x - offset / 2, y: bounds.origin.y, width: bounds.size.width + offset, height: bounds.size.height)

        let ovalPath: UIBezierPath = UIBezierPath(ovalIn: ovalBounds)
        rectPath.append(ovalPath)

        // Create the shape layer and set its path
        let maskLayer: CAShapeLayer = CAShapeLayer()
        maskLayer.frame = bounds
        maskLayer.path = rectPath.cgPath

        // Set the newly created shape layer as the mask for the view's layer][1]][1]
        layer.mask = maskLayer
    }

    func addGradient(withFirstColor firstColor: UIColor, secondColor: UIColor) {
        let layer1 = CAGradientLayer()
        layer1.colors = [
            firstColor.cgColor,
            secondColor.cgColor
        ]
        layer1.locations = [0, 1]
        layer1.startPoint = CGPoint(x: 0.25, y: 0.5)
        layer1.endPoint = CGPoint(x: 0.75, y: 0.5)
        layer1.transform = CATransform3DMakeAffineTransform(CGAffineTransform(a: 1.09, b: 2.06, c: -2.06, d: 10.4, tx: 0.94, ty: -5.44))
        layer1.bounds = self.bounds.insetBy(dx: -0.5 * self.bounds.size.width, dy: -0.5 * self.bounds.size.height)
        layer1.position = self.center
        self.layer.insertSublayer(layer1, at: 0)
    }

    func removeGradientLayer() {
        self.layer.sublayers?.forEach({ layer in
            if layer is CAGradientLayer {
                layer.removeFromSuperlayer()
            }
        })
    }

    /// Add shadow to view.
    ///
    /// - Parameters:
    ///   - color: shadow color (default is #137992).
    ///   - radius: shadow radius (default is 7).
    ///   - offset: shadow offset (default is .zero).
    ///   - opacity: shadow opacity (default is 0.5).
    func addShadow(radius: CGFloat, opacity: Float) {
        self.layer.shadowColor = UIColor.lightGray.cgColor
        self.layer.shadowOpacity = opacity
        self.layer.shadowOffset = CGSize(width: 0, height: 1)
        self.layer.shadowRadius = radius
        
   }
    
    /// Add conrner radius
    /// - Parameter cornerRadius: Radius
    func makeCorner(cornerRadius:CGFloat) {
        self.layer.cornerRadius = cornerRadius
        self.clipsToBounds = true
    }
    func constrainToEdges(_ subview: UIView) {

      subview.translatesAutoresizingMaskIntoConstraints = false

      let topContraint = NSLayoutConstraint(
        item: subview,
        attribute: .top,
        relatedBy: .equal,
        toItem: self,
        attribute: .top,
        multiplier: 1.0,
        constant: 0)

      let bottomConstraint = NSLayoutConstraint(
        item: subview,
        attribute: .bottom,
        relatedBy: .equal,
        toItem: self,
        attribute: .bottom,
        multiplier: 1.0,
        constant: 0)

      let leadingContraint = NSLayoutConstraint(
        item: subview,
        attribute: .leading,
        relatedBy: .equal,
        toItem: self,
        attribute: .leading,
        multiplier: 1.0,
        constant: 0)

      let trailingContraint = NSLayoutConstraint(
        item: subview,
        attribute: .trailing,
        relatedBy: .equal,
        toItem: self,
        attribute: .trailing,
        multiplier: 1.0,
        constant: 0)

      addConstraints([
        topContraint,
        bottomConstraint,
        leadingContraint,
        trailingContraint])
    }
    /// Get View Frame
    /// - Returns: Frame
    func getRect() -> CGRect {
        return CGRect(
            x: 0,
            y: 0,
            width: self.frame.size.width,
            height: self.frame.size.width)
    }

    // there can be other views between `subview` and `self`
    func getConvertedFrame(fromSubview subview: UIView) -> CGRect? {
        // check if `subview` is a subview of self
        guard subview.isDescendant(of: self) else {
            return nil
        }

        var frame = subview.frame
        if subview.superview == nil {
            return frame
        }

        var superview = subview.superview
        while superview != self {
            frame = superview!.convert(frame, to: superview!.superview)
            if superview!.superview == nil {
                break
            } else {
                superview = superview!.superview
            }
        }

        return superview!.convert(frame, to: self)
    }
    /** This is the function to get subViews of a view of a particular type
     */
    func subViews<T: UIView>(type: T.Type) -> [T] {
        var all = [T]()
        for view in self.subviews {
            if let aView = view as? T {
                all.append(aView)
            }
        }
        return all
    }

    /** This is a function to get subViews of a particular type from view recursively. It would look recursively in all subviews and return back the subviews of the type T */
    func allSubViewsOf<T: UIView>(type: T.Type) -> [T] {
        var all = [T]()
        func getSubview(view: UIView) {
            if let aView = view as? T {
                all.append(aView)
            }
            guard view.subviews.count>0 else { return }
            view.subviews.forEach { getSubview(view: $0) }
        }
        getSubview(view: self)
        return all
    }

    
    /// Remove view from super view
    /// - Parameters:
    ///   - animation: Animation, none, atomic
    ///   - completion: competion bock
    func removeFromSuperviewWithAnimationCenter(animation:@escaping ()-> Void, completion:@escaping ()-> Void){
        
        UIView.animate(withDuration: 0.3, delay: 0, options: [], animations: {
            self.alpha = 0
            self.transform = self.transform.scaledBy(x: 0.01, y: 0.01)
            animation()
        }, completion: { (_) in
            self.removeFromSuperview()
            completion()
            self.transform = CGAffineTransform.identity
            self.backgroundColor = .clear
        })
    }
    
    /// Add view from super view
    /// - Parameters:
    ///   - animation: Animation, none, atomic
    ///   - completion: competion bock
    func addSubviewWithAnimationCenter(animation:@escaping ()-> Void, completion:@escaping ()-> Void){
        
        self.backgroundColor = .clear
        self.transform = self.transform.scaledBy(x: 0.01, y: 0.01)
        //UIApplication.shared.keyWindow?.addSubview(self)
        UIApplication.shared.connectedScenes
                        .filter({$0.activationState == .foregroundActive})
                        .compactMap({$0 as? UIWindowScene})
                        .first?.windows
            .filter({$0.isKeyWindow}).first?.addSubview(self)
        self.alpha = 0
        UIView.animate(withDuration: 0.3, delay: 0, options: [], animations: {
            self.alpha = 1
            self.transform = CGAffineTransform.identity
            animation()
            
        }) { (result : Bool) in
            self.backgroundColor = UIColor.init(red: 0.0/255.0, green:0.0/255.0, blue: 0.0/255.0, alpha: 0.5)
            completion()
        }
    }
}

extension UIView {
    /// Border color of view; also inspectable from Storyboard.
    @IBInspectable var bborderColor: UIColor? {
        get {
            guard let color = layer.borderColor else {
                return nil
            }
            return UIColor(cgColor: color)
        }
        set {
            guard let color = newValue else {
                layer.borderColor = nil
                return
            }
            layer.borderColor = color.cgColor
        }
    }

    /// Border width of view; also inspectable from Storyboard.
    @IBInspectable var bborderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }

    func setSemiRounded(corners: UIRectCorner, radius: CGFloat) {
        layer.cornerRadius = 0
        let maskPath = UIBezierPath(roundedRect: bounds,
                                    byRoundingCorners: corners,
                                    cornerRadii: CGSize(width: radius, height: radius))

        let maskLayer = CAShapeLayer()
        maskLayer.path = maskPath.cgPath
        layer.mask = maskLayer
        layoutSubviews()
    }

    func addShadow(_ cornerRadius: CGFloat = 4.0) {
        // corner radius
        layer.cornerRadius = cornerRadius
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.2
        layer.shadowOffset = .zero
        layer.shadowRadius = 4
    }
}
