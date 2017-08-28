package ui.game.model {

/**
 *
 */
public class ButtonStyleEnum/*int*/ {

    public static const GOLD:ButtonStyleEnum = new ButtonStyleEnum(0);
    public static const GREEN:ButtonStyleEnum = new ButtonStyleEnum(1);
    public static const SILVER:ButtonStyleEnum = new ButtonStyleEnum(2);

    private var rawValue:int;

    public function ButtonStyleEnum(rawValue:int) {
        this.rawValue = rawValue;
    }

    public function getRawValue():int {
        return rawValue;
    }

}
}
