package ui.game {

import flash.display.Bitmap;

import resources.Images;
import resources.Skins;

import ui.base.SimpleButton;
import ui.base.SimpleGroup;
import ui.base.SimpleSizeBox;

public class GameButton extends SimpleButton {

    private var textFiled: GameTextField;
    private var icon: Bitmap;

    private var textIconSizeBox: SimpleSizeBox;
    private var textIconGroup: SimpleGroup;

    public function GameButton() {
        // It is possible to make creation components more beautiful with DSL-simulation
        textFiled = new GameTextField()
                .setGameButtonStyle()
                .setText("10");

        icon = Images.getBitmap(Images.icon_gold_png);

        textIconGroup = new SimpleGroup(/*childPad*/0, /*isVertical*/false);
        textIconGroup.addChild(textFiled);
        textIconGroup.addChild(icon);

        textIconSizeBox = new SimpleSizeBox(textIconGroup, 160, /*padLeft*/40, /*padTop*/20, /*padRight*/40, /*padBottom*/20);
        super(textIconSizeBox);

        refresh();
    }

    // ---------------------- Styles

    public function setGoldStyle():void {
        this.setNormalSkin(Skins.goldNormal)
                .setHoverSkin(Skins.goldHover)
                .setPressSkin(Skins.goldPress)
                .setDisableSkin(Skins.goldDisable);
    }

    public function setGreenStyle():void {
        this.setNormalSkin(Skins.greenNormal)
                .setHoverSkin(Skins.greenHover)
                .setPressSkin(Skins.greenPress)
                .setDisableSkin(Skins.greenDisable);
    }

    public function setSilverStyle():void {
        this.setNormalSkin(Skins.silverNormal)
                .setHoverSkin(Skins.silverHover)
                .setPressSkin(Skins.silverPress)
                .setDisableSkin(Skins.silverDisable);
    }

    // ----------------------

    public function setText(value: String):void {
        textFiled.setText(value);
        refresh();
    }

    // ---------------------- Inner logic

    override protected function refresh():void {
        // It is possible to make automatic refresh for nested components
        textIconGroup.doLayout();
        textIconSizeBox.doLayout();
        super.refresh();
    }

}
}
