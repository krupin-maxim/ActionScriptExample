package {

import flash.display.Sprite;
import flash.text.Font;
import flash.text.TextField;
import flash.text.TextFormat;

import resources.Fonts;

import resources.Skins;
import ui.base.SimpleButton;
import ui.game.GameButton;
import ui.game.GameTextField;

public class Main extends Sprite {



    public function Main() {
        var firstButton: GameButton = new GameButton();
        firstButton.setGoldStyle();

        addChild(firstButton);
    }
}
}
