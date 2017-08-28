package {

import flash.display.Sprite;

import ui.game.ButtonsGroup;
import ui.game.model.ButtonStyleEnum;
import ui.game.model.ButtonVO;
import ui.game.model.IconTypeEnum;

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
