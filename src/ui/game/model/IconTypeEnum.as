
package ui.game.model {

/**
 * Enum for icon type in Button
 */
public class IconTypeEnum/*String*/ {

    public static const EXPERIENCE:IconTypeEnum = new IconTypeEnum("Exp");
    public static const GOLD:IconTypeEnum = new IconTypeEnum("Gold");
    public static const  SILVER:IconTypeEnum = new IconTypeEnum("Silver");

    private var rawValue:String;

    public function IconTypeEnum(rawValue:String) {
        this.rawValue = rawValue;
    }

    public function getRawValue():String {
        return this.rawValue;
    }
}
}
