package ui.game.model {

/**
 * Value-object for creating button in ButtonsGroup
 */
public class ButtonVO {

    private var labelValue: String;
    private var backgroundStyle: ButtonStyleEnum;
    private var iconType: IconTypeEnum;

    public function ButtonVO(labelValue: String, backgroundStyle: ButtonStyleEnum, iconType: IconTypeEnum) {
        this.labelValue = labelValue;
        this.backgroundStyle = backgroundStyle;
        this.iconType = iconType;
    }

    public function getLabelValue(): String {
        return labelValue;
    }

    public function getBackgroundStyle():ButtonStyleEnum {
        return this.backgroundStyle;
    }

    public function getIconType(): IconTypeEnum {
        return this.iconType;
    }

}
}
