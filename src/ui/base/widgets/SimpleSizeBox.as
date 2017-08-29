package ui.base.widgets {

import flash.display.DisplayObject;
import flash.display.Sprite;

/**
 * This component makes min width of content.
 * If content's width is less than minContentWidth, then content just lay in center;
 * If content's width is great than minContentWidth, then self-width is equal for content-width
 * Concept of this component was looked in Unreal Engine 4
 */
public class SimpleSizeBox extends Sprite{

    private var padLeft:int = 0;
    private var padTop:int = 0;
    private var padRight:int = 0;
    private var padBottom:int = 0;

    private var content: DisplayObject;
    private var minContentWidth: int = 0;

    public function SimpleSizeBox(content: DisplayObject, minContentWidth: int, padLeft:int = 0, padTop:int = 0, padRight:int = 0, padBottom:int = 0) {
        this.content = content;
        this.minContentWidth = minContentWidth;

        this.padLeft = padLeft;
        this.padTop = padTop;
        this.padRight = padRight;
        this.padBottom = padBottom;

        if (content != null) {
            this.addChild(content);
        } else {
            trace("SimpleSizeBox: content is null");
        }
        doLayout();
    }

    public function setMinWidth(value: int):void {
        minContentWidth = value;
        doLayout();
    }

    public function doLayout():void {
        if (content != null) {
            if (content.width >= minContentWidth) {
                content.x = padLeft;
            } else {
                content.x = padLeft + (minContentWidth - content.width) / 2;
            }
            content.y = padTop
        }
    }

    override public function get width():Number {
        return padLeft + Math.max(minContentWidth, content != null ? content.width : 0) + padRight;
    }

    override public function get height():Number {
        return padTop + (content != null ? content.height : 0) + padBottom;
    }
}
}
