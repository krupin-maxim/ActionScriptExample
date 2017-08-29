package ui.game.model {

/**
 * Enum for choose background colors in Button
 */
public class ButtonStyleEnum/*Style*/ {

    public static const GOLD:ButtonStyleEnum = new ButtonStyleEnum("Gold");
    public static const GREEN:ButtonStyleEnum = new ButtonStyleEnum("Green");
    public static const SILVER:ButtonStyleEnum = new ButtonStyleEnum("Silver");

    private var rawValue:String;

    public function ButtonStyleEnum(rawValue:String) {
        this.rawValue = rawValue;
    }

    public function getRawValue():String {
        return this.rawValue;
    }

}
}
