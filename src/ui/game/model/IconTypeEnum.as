
package ui.game.model {

public class IconTypeEnum/*int*/ {

    public static const EXPERIENCE:IconTypeEnum = new IconTypeEnum(0);
    public static const GOLD:IconTypeEnum = new IconTypeEnum(1);
    public static const  SILVER:IconTypeEnum = new IconTypeEnum(2);

    private var rawValue:int;

    public function IconTypeEnum(rawValue:int) {
        this.rawValue = rawValue;
    }

    public function getRawValue():int {
        return this.rawValue;
    }
}
}
