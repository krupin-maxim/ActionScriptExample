package {

import flash.display.Sprite;
import flash.events.MouseEvent;
import flash.text.Font;
import flash.text.TextField;
import flash.text.TextFormat;

import resources.Fonts;

import resources.Skins;

import ui.base.SimpleButton;
import ui.base.SimpleGroup;
import ui.game.GameButton;
import ui.game.GameTextField;

public class Main extends Sprite {


    public function Main() {
        var text:String = "10";

        var firstButton:GameButton = new GameButton();
        firstButton.setGoldStyle();

        firstButton.addEventListener(MouseEvent.CLICK, function (event:MouseEvent) {
            text = text.slice(0, text.length - 4);
            firstButton.setText(text);
        });

        addChild(firstButton);

        var secondButton:GameButton = new GameButton();
        secondButton.setGreenStyle();
        secondButton.y = 100;


        secondButton.addEventListener(MouseEvent.CLICK, function (event:MouseEvent) {
            text += " 000";
            firstButton.setText(text);
        });

        addChild(secondButton);


        var buttonsGroup:SimpleGroup = new SimpleGroup(-10, true, 50, 50, 50, 50);
        buttonsGroup.addChild(firstButton);
        buttonsGroup.addChild(secondButton);
        buttonsGroup.doLayout();

        addChild(buttonsGroup);
    }
}
}
