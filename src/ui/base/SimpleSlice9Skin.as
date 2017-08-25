package ui.base {
import flash.display.BitmapData;
import flash.display.DisplayObjectContainer;
import flash.display.Sprite;

/**
 * SimpleSlice9Skin wraps bitmapData and draw it on any sprite's graphic with slice9 method
 */
public class SimpleSlice9Skin extends SimpleBaseSkin {

    public function SimpleSlice9Skin(bitmapData:BitmapData) {
        super(bitmapData);
    }

    /**
     * Draw skins's bitmap on sprite with slice9 method
     * @param onSprite
     */
    override public function draw(onSprite:Sprite) {
        if (onSprite != null && bitmapData != null) {

        }
    }
}
}
