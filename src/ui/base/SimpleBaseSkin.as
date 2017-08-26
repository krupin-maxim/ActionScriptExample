package ui.base {
import flash.display.BitmapData;
import flash.display.Sprite;

/**
 * SimpleBaseSkin wraps origBitmapData and draw it on any sprite's graphic with draw method
 */
public class SimpleBaseSkin {

    protected var origBitmapData: BitmapData;

    public function SimpleBaseSkin(bitmapData:BitmapData) {
        this.origBitmapData = bitmapData;
    }

    /**
     * Please override it
     * We need drawWidth and drawHeight, because empty child-free sprite have zero size
     * @param onSprite target sprite for drawing
     * @param withWidth width for bitmapData size
     * @param withHeight height for bitmapData size
     */
    public function draw(onSprite: Sprite, withWidth: Number, withHeight: Number) {
        // You can throw Error here for make class abstract, but I think it's normal to do nothing here
        trace("SimpleBaseSkin: You use skin without draw rules");
    }

}
}
