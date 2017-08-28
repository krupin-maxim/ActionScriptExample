package ui.base.skins {
import flash.display.BitmapData;
import flash.display.DisplayObjectContainer;
import flash.display.Sprite;
import flash.geom.Matrix;
import flash.geom.Rectangle;

import ui.base.skins.SimpleBaseSkin;

/**
 * SimpleSlice9Skin wraps origBitmapData and draw it on any sprite's graphic with slice9 method
 */
public class SimpleSlice9Skin extends SimpleBaseSkin {

    private var slice9Rect:Rectangle;
    private var lastDrawnBitmapData:BitmapData;

    /**
     * For simplify we set just two paddings: horizontal and vertical, than they calculates to left, right, top, bottom for slicing
     * @param bitmapData
     * @param padHor
     * @param padVert
     */
    public function SimpleSlice9Skin(bitmapData:BitmapData, padHor:int, padVert:int) {
        super(bitmapData);

        if (bitmapData == null) {
            trace("SimpleSlice9Skin: bitmapData is null");
        } else if (padHor * 2 >= bitmapData.width || padVert * 2 >= bitmapData.height) {
            trace("SimpleSlice9Skin: wrong slice paddings");
        } else {
            slice9Rect = new Rectangle(padHor, padVert, bitmapData.width - 2 * padHor, bitmapData.height - 2 * padVert);
        }
    }

    /**
     * Draw skins's bitmap on sprite with slice9 method
     */
    override public function draw(onSprite:Sprite, withWidth:Number, withHeight:Number):void {
        if (onSprite == null) {
            trace("SimpleSlice9Skin: onSprite is null");
            return;
        }

        if (withWidth == 0 || withHeight == 0) {
            trace("SimpleSlice9Skin: on of draw size is zero");
            return;
        }

        if (lastDrawnBitmapData == null || lastDrawnBitmapData.width != withWidth || lastDrawnBitmapData.height != withHeight) {
            lastDrawnBitmapData = new BitmapData(withWidth, withHeight, true, 0x000000);

            if (origBitmapData != null && slice9Rect != null) {
                var origCols:Vector.<Number> = Vector.<Number>([0, slice9Rect.left, slice9Rect.right, origBitmapData.width]);
                var origRows:Vector.<Number> = Vector.<Number>([0, slice9Rect.top, slice9Rect.bottom, origBitmapData.height]);

                var drawSliceRight:Number = withWidth - (origBitmapData.width - slice9Rect.right);
                var drawSliceBottom:Number = withHeight - (origBitmapData.height - slice9Rect.bottom);
                var drawCols:Vector.<Number> = Vector.<Number>([0, slice9Rect.left, drawSliceRight, withWidth]);
                var drawRows:Vector.<Number> = Vector.<Number>([0, slice9Rect.top, drawSliceBottom, withHeight]);

                var origRect:Rectangle;
                var drawRect:Rectangle;
                var mat:Matrix = new Matrix();

                for (var cx:int = 0; cx < 3; cx++) {
                    for (var cy:int = 0; cy < 3; cy++) {
                        origRect = new Rectangle(origCols[cx], origRows[cy], origCols[cx + 1] - origCols[cx], origRows[cy + 1] - origRows[cy]);
                        drawRect = new Rectangle(drawCols[cx], drawRows[cy], drawCols[cx + 1] - drawCols[cx], drawRows[cy + 1] - drawRows[cy]);
                        mat.identity();
                        mat.translate(-origRect.x, -origRect.y);
                        mat.scale(drawRect.width / origRect.width, drawRect.height / origRect.height);
                        mat.translate(drawRect.x, drawRect.y);

                        lastDrawnBitmapData.draw(origBitmapData, mat, /*colorTransform:*/null, /*blendMode:*/null, /*clipRect:*/drawRect, /*smoothing:*/true);
                    }
                }
            } else {
                trace("SimpleSlice9Skin: wrong configuration");
            }
        }

        onSprite.graphics.clear();
        onSprite.graphics.beginBitmapFill(lastDrawnBitmapData, /*matrix:*/null, /*repeat:*/false, /*smooth:*/true);
        onSprite.graphics.drawRect(/*x:*/0, /*y:*/0, lastDrawnBitmapData.width, lastDrawnBitmapData.height);
        onSprite.graphics.endFill();
    }
}
}
