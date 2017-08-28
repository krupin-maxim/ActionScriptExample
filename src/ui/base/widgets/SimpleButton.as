package ui.base.widgets {

import flash.display.DisplayObject;
import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;

import ui.base.skins.SimpleBaseSkin;

/**
 * Button with any content. It can do all buttons stuff: handle mouse events, working with skins
 * Size of button is equal to size of content
 */
public class SimpleButton extends Sprite {

    private var normalSkin:SimpleBaseSkin;
    private var hoverSkin:SimpleBaseSkin;
    private var pressSkin:SimpleBaseSkin;
    private var disableSkin:SimpleBaseSkin;
    private var overDisableSkin: SimpleBaseSkin;

    private var content:DisplayObject;
    private var overDisableSprite:Sprite;

    private var pressed:Boolean = false;
    private var hovered:Boolean = false;
    private var disabled:Boolean = true;

    /**
     * @param content is DisplayObject, because all we need is just width/height
     */
    public function SimpleButton(content:DisplayObject) {
        this.mouseChildren = false;
        this.buttonMode = true;
        this.useHandCursor = true;

        if (content != null) {
            this.content = content;
            this.addChild(content);
        }
        setDisabled(false);
    }

    public function setDisabled(isDisabled:Boolean):void {
        if (isDisabled == this.disabled) {
            return;
        }
        this.disabled = isDisabled;
        this.mouseEnabled = !isDisabled;
        if (overDisableSprite != null) {
            overDisableSprite.visible = isDisabled;
        }
        if (isDisabled) {
            unsubscribeMouseEvents();
        } else {
            subscribeMouseEvent();
        }
        refresh();
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

    public function setDisableSkin(bgSkin:SimpleBaseSkin, overSkin:SimpleBaseSkin = null):SimpleButton {
        this.disableSkin = bgSkin;
        if (overSkin != null) {
            this.overDisableSkin = overSkin;
            overDisableSprite = new Sprite();
            this.addChild(overDisableSprite);
        }
        return this;
    }

    // ------------------- Mouse Handlers

    private function subscribeMouseEvent():void {
        this.addEventListener(MouseEvent.MOUSE_DOWN, mouseDownHandler);
        this.addEventListener(MouseEvent.MOUSE_UP, mouseUpHandler);
        this.addEventListener(MouseEvent.ROLL_OVER, mouseRollOverHandler);
        this.addEventListener(MouseEvent.ROLL_OUT, mouseRollOutHandler);
    }

    private function unsubscribeMouseEvents():void {
        this.removeEventListener(MouseEvent.MOUSE_DOWN, mouseDownHandler);
        this.removeEventListener(MouseEvent.MOUSE_UP, mouseUpHandler);
        this.removeEventListener(MouseEvent.ROLL_OVER, mouseRollOverHandler);
        this.removeEventListener(MouseEvent.ROLL_OUT, mouseRollOutHandler);
    }

    private function mouseDownHandler(e:MouseEvent):void {
        if (this.pressed) {
            return;
        }
        this.pressed = true;
        if (!this.disabled) {
            switchSkin(this.pressSkin)
        }
    }

    private function mouseUpHandler(e:MouseEvent):void {
        if (!this.pressed) {
            return;
        }
        this.pressed = false;
        if (!this.disabled) {
            if (this.hovered) {
                switchSkin(this.hoverSkin);
            } else {
                switchSkin(this.normalSkin);
            }
        }
    }

    private function mouseRollOverHandler(e:MouseEvent):void {
        if (this.hovered) {
            return;
        }
        this.hovered = true;
        if (!this.disabled) {
            switchSkin(this.hoverSkin);
        }
    }

    private function mouseRollOutHandler(e:MouseEvent):void {
        if (!this.hovered) {
            return;
        }
        this.hovered = false;
        this.pressed = false;
        if (!this.disabled) {
            switchSkin(this.normalSkin);
        }
    }

    private function switchSkin(skin:SimpleBaseSkin):void {
        if (skin != null && content != null) {
            skin.draw(this, content.width, content.height);
        }
    }

    // ------------------- Content

    /**
     * Change self-size by content content-size
     */
    protected function refresh():void {
        if (this.disabled) {
            switchSkin(this.disableSkin);
            if (overDisableSkin != null && overDisableSprite != null && content != null) {
                overDisableSkin.draw(overDisableSprite, content.width, content.height)
            }
            return;
        }
        if (this.pressed) {
            switchSkin(this.pressSkin);
            return;
        }
        if (this.hovered) {
            switchSkin(this.hoverSkin);
            return;
        }
        switchSkin(this.normalSkin);
    }

}
}
