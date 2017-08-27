package ui.base {

import flash.display.DisplayObject;
import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;

/**
 * Button with any content. It can do all buttons stuff: handle mouse events, working with skins
 * Size of button is equal to size of content
 */
public class SimpleButton extends Sprite {


    private var normalSkin:SimpleBaseSkin;
    private var hoverSkin:SimpleBaseSkin;
    private var pressSkin:SimpleBaseSkin;
    private var disableSkin:SimpleBaseSkin;

    private var content:DisplayObject;

    private var pressed:Boolean = false;
    private var hovered:Boolean = false;
    private var disabled:Boolean = false;

    /**
     * @param content is DisplayObject, because all we need is just width/height
     */
    public function SimpleButton(content:DisplayObject) {
        this.mouseChildren = false;
        this.buttonMode = true;
        this.useHandCursor = true;
        this.mouseEnabled = true;

        if (content != null) {
            this.content = content;
            this.addChild(content);
//            this.content.visible = false;
        }

        this.addEventListener(MouseEvent.MOUSE_DOWN, mouseDownHandler);
        this.addEventListener(MouseEvent.MOUSE_UP, mouseUpHandler);
        this.addEventListener(MouseEvent.ROLL_OVER, mouseRollOverHandler);
        this.addEventListener(MouseEvent.ROLL_OUT, mouseRollOutHandler);
    }

    // -------------------- Skins

    public function setNormalSkin(skin:SimpleBaseSkin):SimpleButton {
        this.normalSkin = skin;
        if (normalSkin != null && content != null) {
            normalSkin.draw(this, content.width, content.height);
        }
        return this;
    }

    public function setHoverSkin(skin:SimpleBaseSkin):SimpleButton {
        this.hoverSkin = skin;
        return this;
    }

    public function setPressSkin(skin:SimpleBaseSkin):SimpleButton {
        this.pressSkin = skin;
        return this;
    }

    public function setDisableSkin(skin:SimpleBaseSkin):SimpleButton {
        this.disableSkin = disableSkin;
        return this;
    }

    // ------------------- Mouse Handlers

    private function mouseDownHandler(e:MouseEvent):void {
        if (this.disabled || this.pressed) {
            return;
        }
        this.pressed = true;
        switchSkin(this.pressSkin)
    }

    private function mouseUpHandler(e:MouseEvent):void {
        if (this.disabled || !this.pressed) {
            return;
        }
        this.pressed = false;
        if (this.hovered) {
            switchSkin(this.hoverSkin);
        } else {
            switchSkin(this.normalSkin);
        }
    }

    private function mouseRollOverHandler(e:MouseEvent):void {
        if (this.disabled || this.hovered) {
            return;
        }
        this.hovered = true;
        switchSkin(this.hoverSkin);
    }

    private function mouseRollOutHandler(e:MouseEvent):void {
        if (this.disabled || !this.hovered) {
            return;
        }
        this.hovered = false;
        this.pressed = false;
        switchSkin(this.normalSkin);
    }

    private function switchSkin(skin:SimpleBaseSkin):void {
        if (skin != null && content != null) {
            skin.draw(this, content.width, content.height);
        }
    }

}
}
