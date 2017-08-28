package ui.base.skins {
import flash.display.BitmapData;
import flash.display.Sprite;

import ui.base.skins.SimpleBaseSkin;

public class SimpleFillSkin extends SimpleBaseSkin {

    private var padHor:int = 0;
    private var padVert:int = 0;

    public function SimpleFillSkin(bitmapData:BitmapData, padHor:int, padVert:int) {
        super(bitmapData);

        this.padHor = padHor;
        this.padVert = padVert;
    }


    override public function draw(onSprite:Sprite, withWidth:Number, withHeight:Number):void {
        if (onSprite == null) {
            trace("SimpleFillSkin: onSprite is null");
            return;
        }

        if (withWidth == 0 || withHeight == 0) {
            trace("SimpleFillSkin: on of draw size is zero");
            return;
        }

        if (origBitmapData != null) {
            onSprite.graphics.clear();
            onSprite.graphics.beginBitmapFill(origBitmapData, /*matrix*/null, /*repeat*/true, /*smooth*/ true);
            onSprite.graphics.drawRect(/*x:*/padHor, /*y:*/padVert, withWidth - 2 * padHor, withHeight - 2 * padHor);
            onSprite.graphics.endFill();
        }
    }
}
}
