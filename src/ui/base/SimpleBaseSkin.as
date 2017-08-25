package ui.base {
import flash.display.BitmapData;
import flash.display.Sprite;

/**
 * SimpleBaseSkin wraps bitmapData and draw it on any sprite's graphic with draw method
 */
public class SimpleBaseSkin {

    protected var bitmapData: BitmapData;

    public function SimpleBaseSkin(bitmapData:BitmapData) {
        this.bitmapData = bitmapData;
    }

    /**
     * Please override it
     * @param onSprite target sprite
     */
    public function draw(onSprite: Sprite) {
        // You can throw Error here for make class abstract, but I think it's normal to do nothing here
    }

}
}
