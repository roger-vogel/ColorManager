
import Foundation
import UIKit

public class ColorManager {
    
    // MARK: - PROPERTIES
    
    public var red: CGFloat
    public var green: CGFloat
    public var blue: CGFloat
    public var alpha: CGFloat
    
    // MARK: COMPUTED PROPERTIES
    
    public var uicolor: UIColor { return UIColor(displayP3Red: red, green: green, blue: blue, alpha: alpha) }
    
    public var cgcolor: CGColor { return UIColor(displayP3Red: red, green: green, blue: blue, alpha: alpha).cgColor }
    
    public var luminance: CGFloat {
        
        let comed = 0.299 * red
        let compGreen = 0.587 * green
        let compBlue = 0.114 * blue
        let luminance = (comed + compGreen + compBlue)
        
        return luminance
    }
        
    public var white: ColorManager { return ColorManager(r: 1.0, g: 1.0, b: 1.0, a: 1.0) }
    
    public var black: ColorManager { return ColorManager(r: 0.0, g: 0.0, b: 0.0, a: 1.0) }
    
    public var noAlpha: ColorManager {
        
        var R: CGFloat?
        var G: CGFloat?
        var B: CGFloat?
        
        if alpha < 1.0 { R = ( (1-alpha)+(alpha*red) ); G = ( (1-alpha)+(alpha*green) ); B = ( (1-alpha)+(alpha*blue) ) }
        else { R = red; G = green; B = blue }
        
        return ColorManager(r: R, g: G, b: B, a: 1.0)
    }
    
    public var components: (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) { return (red,green,blue,alpha) }
    
    public var intComponents: (red: Int32, green: Int32, blue: Int32, alpha: Int32) {
        
        let redInt = Int32(red * 255)
        let greenInt = Int32(green * 255)
        let blueInt = Int32(blue * 255)
        let alphaInt = Int32(alpha * 255)
        
        return (redInt,greenInt,blueInt,alphaInt)
    }
    
    // MARK: - INITIALIZATION
    
    public init(r: CGFloat? = 0.5, g: CGFloat? = 0.5, b: CGFloat? = 0.5, a: CGFloat? = 1.0) {
        
        if r! > 1.0 { red = r!/255; green = g!/255; blue = b!/255; alpha = a!/255 }
        else { red = r!; green = g!; blue = b!; alpha = a! }
    }
    
    public init(color:UIColor) {
        
        var R: CGFloat = 0
        var G: CGFloat = 0
        var B: CGFloat = 0
        var A: CGFloat = 0
       
        color.getRed(&R, green: &G, blue: &B, alpha: &A)
        red = R; green = G; blue = B; alpha = A
    }
    
    public init(grayScalePercent: CGFloat) { red = grayScalePercent/100; green = grayScalePercent/100; blue = grayScalePercent/100; alpha = 1.0 }
    
    public init(hexValue: String) {
        
        let redValue = String(hexValue.partial(fromIndex: 0, length: 2))
        let redByte = NSString(string: redValue).intValue
        
        let greenValue = String(hexValue.partial(fromIndex: 2, length: 2))
        let greenByte = NSString(string: greenValue).intValue
        
        let blueValue = String(hexValue.partial(fromIndex: 4, length: 2))
        let blueByte = NSString(string: blueValue).intValue
        
        red = CGFloat(redByte)/255
        green = CGFloat(greenByte)/255
        blue = CGFloat(blueByte)/255
        alpha = 1.0
    }
    
    public init(name: String) {
        
        let color = UIColor(named: name)!
        
        var R: CGFloat = 0
        var G: CGFloat = 0
        var B: CGFloat = 0
        var A: CGFloat = 0
       
        color.getRed(&R, green: &G, blue: &B, alpha: &A)
        red = R; green = G; blue = B; alpha = A
    }
}
