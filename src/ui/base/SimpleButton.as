package ui.base {

import flash.display.DisplayObject;
import flash.display.Sprite;

/**
 * Button with any content. It can do all buttons stuff: handle mouse events, working with skins
 * Size of button is equal to size of content
 */
public class SimpleButton extends Sprite {

    /**
     * @param content is DisplayObject, because all we need is just width/height
     */
    public function SimpleButton(content: DisplayObject) {
        this.addChild(content);
    }



}
}
