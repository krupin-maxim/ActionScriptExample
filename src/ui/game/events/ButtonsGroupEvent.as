package ui.game.events {
import flash.events.Event;

/**
 * Event for dispatch which button is clicked in ButtonsGroup
 */
public class ButtonsGroupEvent extends Event {

    public static const BUTTON_CLICK: String = "BUTTON_CLICK";
    public static const BUTTON_PRESS: String = "BUTTON_PRESS";

    private var buttonIndex:int = 0;

    public function ButtonsGroupEvent(type: String, buttonIndex: int, bubbles:Boolean = false, cancelable:Boolean = false) {
        super(type, bubbles, cancelable);
        this.buttonIndex = buttonIndex;
    }

    public function getButtonIndex():int {
        return this.buttonIndex;
    }
}
}
