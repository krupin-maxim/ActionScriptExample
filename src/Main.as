package {

import flash.display.Sprite;
import flash.events.MouseEvent;
import flash.text.Font;
import flash.text.TextField;
import flash.text.TextFormat;

import resources.Fonts;

import resources.Skins;

import ui.base.widgets.SimpleButton;
import ui.base.widgets.SimpleGroup;
import ui.game.Button;
import ui.game.ButtonStyleEnum;
import ui.game.ButtonVO;
import ui.game.ButtonsGroup;
import ui.game.IconTypeEnum;
import ui.game.StyledTextField;

public class Main extends Sprite {


    public function Main() {
        var buttonVOs:Vector.<ButtonVO> = Vector.<ButtonVO>([
                new ButtonVO("10", ButtonStyleEnum.GOLD, IconTypeEnum.GOLD),
                new ButtonVO("1 000", ButtonStyleEnum.SILVER, IconTypeEnum.EXPERIENCE),
                new ButtonVO("1 000 000", ButtonStyleEnum.GREEN, IconTypeEnum.SILVER),

        ]);

        var buttonsGroup: ButtonsGroup = new ButtonsGroup();
        buttonsGroup.setDataProvider(buttonVOs);
        addChild(buttonsGroup);
    }
}
}
