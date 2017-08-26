package ui.game {

import resources.Skins;

import ui.base.SimpleButton;

public class GameButton extends SimpleButton {

    public function GameButton() {
        super(new GameTextField()
                .setGameButtonStyle()
                .setText("10 000 000"));
    }

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
}
}
