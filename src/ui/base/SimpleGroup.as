package ui.base {

import flash.display.DisplayObject;
import flash.display.Sprite;

/**
 * Primitive horizontal|vertical group with center|middle-align
 */
public class SimpleGroup extends Sprite {

    private var padLeft:int = 0;
    private var padTop:int = 0;
    private var padRight:int = 0;
    private var padBottom:int = 0;
    private var childPad:int = 0;

    private var contentWidth:Number = 0;
    private var contentHeight:Number = 0;

    private var isVertical: Boolean = false;

    public function SimpleGroup(childPad:int, isVertical : Boolean, padLeft:int = 0, padTop:int = 0, padRight:int = 0, padBottom:int = 0) {
        super();
        this.childPad = childPad;
        this.isVertical = isVertical;
        this.padLeft = padLeft;
        this.padTop = padTop;
        this.padRight = padRight;
        this.padBottom = padBottom;
    }

    public function doLayout():void {
        if (isVertical) {
            doVerticalLayout();
        } else {
            doHorizontalLayout();
        }
    }

    private function doHorizontalLayout():void {
        // -- Horizontal positions
        contentWidth = padLeft;
        var maxChildHeight: Number = 0;

        var lastChild: DisplayObject;
        for (var i:int = 0; i < this.numChildren; i++) {
            lastChild = this.getChildAt(i);
            lastChild.x = contentWidth;
            maxChildHeight = Math.max(maxChildHeight, lastChild.height);

            if (i != this.numChildren - 1) { // Not last
                contentWidth += lastChild.width + childPad;
            }
        }
        if (lastChild != null) {
            contentWidth += lastChild.width;
        }
        contentWidth += padRight;

        // -- Vertical positions
        var lastY: Number = padTop;
        // For middle-align we need second for-loop
        for (i = 0; i < this.numChildren; i++) {
            lastChild = this.getChildAt(i);
            lastChild.y = lastY + (maxChildHeight - lastChild.height) / 2;
        }
        contentHeight = padTop + maxChildHeight + padBottom;
    }

    private function doVerticalLayout():void {
        // -- Vertical positions
        contentHeight = padTop;
        var maxChildWidth: Number = 0;

        var lastChild: DisplayObject;
        for (var i:int = 0; i < this.numChildren; i++) {
            lastChild = this.getChildAt(i);
            lastChild.y = contentHeight;
            maxChildWidth = Math.max(maxChildWidth, lastChild.width);

            if (i != this.numChildren - 1) { // Not last
                contentHeight += lastChild.height + childPad;
            }
        }
        if (lastChild != null) {
            contentHeight += lastChild.height;
        }
        contentHeight += padBottom;

        // -- Horizontal positions
        var lastX: Number = padLeft;
        // For center-align we need second for-loop
        for (i = 0; i < this.numChildren; i++) {
            lastChild = this.getChildAt(i);
            lastChild.x = lastX + (maxChildWidth - lastChild.width) / 2;
        }
        contentWidth = padLeft + maxChildWidth + padRight;
    }

    override public function get width():Number {
        return contentWidth;
    }

    override public function get height():Number {
        return contentHeight;
    }
}
}
