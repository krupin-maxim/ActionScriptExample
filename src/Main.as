package {

import flash.display.Sprite;
import resources.Skins;
import ui.base.SimpleButton;

public class Main extends Sprite {

    public function Main() {
        var firstButton: SimpleButton = new SimpleButton(null);

        firstButton.setNormalSkin(Skins.goldNormal);

        addChild(firstButton)

    }
}
}
