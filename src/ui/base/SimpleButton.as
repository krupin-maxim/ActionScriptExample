package ui.base {

import flash.display.DisplayObject;
import flash.display.Sprite;

/**
 * Button with any content. It can do all buttons stuff: handle mouse events, working with skins
 * Size of button is equal to size of content
 */
public class SimpleButton extends Sprite {


    private var normalSkin:SimpleBaseSkin;
    private var hoverSkin:SimpleBaseSkin;
    private var pressSkin:SimpleBaseSkin;
    private var disableSkin:SimpleBaseSkin;

    /**
     * @param content is DisplayObject, because all we need is just width/height
     */
    public function SimpleButton(content:DisplayObject) {
        this.mouseChildren = false;
        this.buttonMode = true;
        this.useHandCursor = true;

        if (content != null) {
            this.addChild(content);
        }
    }

    protected function setNormalSkin(skin:SimpleBaseSkin):SimpleButton {
        this.normalSkin = skin;
        return this;
    }

    protected function setHoverSkin(skin:SimpleBaseSkin):SimpleButton {
        this.hoverSkin = skin;
        return this;
    }

    protected function setPressSkin(skin:SimpleBaseSkin):SimpleButton {
        this.pressSkin = skin;
        return this;
    }

    protected function setDisableSkin(skin:SimpleBaseSkin):SimpleButton {
        this.disableSkin = disableSkin;
        return this;
    }

}
}
