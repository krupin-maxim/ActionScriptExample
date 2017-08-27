package ui.base {

import flash.display.DisplayObjectContainer;

public class SimpleGroup extends DisplayObjectContainer {

    private var padLeft:int = 0;
    private var padTop:int = 0;
    private var padRight:int = 0;
    private var padBottom:int = 0;
    private var childPad:int = 0;

    public function SimpleGroup(padLeft:int, padTop:int, padRight:int, padBottom:int, childPad:int) {
        this.padLeft = padLeft;
        this.padTop = padTop;
        this.padRight = padRight;
        this.padBottom = padBottom;
        this.childPad = childPad;
    }

    public function doLayout():void {

    }

}
}
