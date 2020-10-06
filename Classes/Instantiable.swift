import UIKit

public protocol Instantiable {
    
    static func instantiate() -> Self?
    static func instantiate(bundle: Bundle) -> Self?
}

extension UIViewController: Instantiable {

    public static func instantiate() -> Self? {
        return instantiate(bundle: Bundle.main)
    }
    
    public static func instantiate(bundle: Bundle) -> Self? {
        let filename = String(describing: Self.self)
        if bundle.path(forResource: filename, ofType: "storyboardc") != nil {
            let storyboard = UIStoryboard(name: filename, bundle: bundle)
            if let viewController = storyboard.instantiateInitialViewController() as? Self {
                return viewController
            }
            if let viewController = storyboard.instantiateViewController(identifier: filename) as? Self {
                return viewController
            }
        }
        if bundle.path(forResource: filename, ofType: "nib") != nil {
            return Self(nibName: filename, bundle: bundle)
        }
        return Self()
    }
}
