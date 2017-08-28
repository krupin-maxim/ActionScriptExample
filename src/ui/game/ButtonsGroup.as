package ui.game {

import flash.display.DisplayObject;
import flash.events.MouseEvent;
import ui.base.widgets.SimpleGroup;
import ui.game.events.ButtonsGroupEvent;
import ui.game.model.ButtonStyleEnum;
import ui.game.model.ButtonVO;
import ui.game.model.IconTypeEnum;

/**
 * Group of buttons with simple horizontal/vertical layout
 * Default child padding is 10, but it possible to change
 */
public class ButtonsGroup extends SimpleGroup {

    // Buttons configuration
    private var dataProvider:Vector.<ButtonVO>;

    public function ButtonsGroup() {
        mouseChildren = true;

        super(10, true);
    }

    /**
     * Set buttons configuration via ButtonVO objects
     */
    public function setDataProvider(dataProvider:Vector.<ButtonVO>):void {
        while (numChildren > 0) {
            var removeObject:DisplayObject = removeChildAt(0);
            removeObject.removeEventListener(MouseEvent.CLICK, buttonClickHandler);
            removeObject.removeEventListener(MouseEvent.CLICK, buttonPressHandler);
        }
        this.dataProvider = dataProvider;
        if (dataProvider != null) {
            for (var i:int = 0; i < dataProvider.length; i++) {
                var button:Button = new Button();
                this.addChild(button);

                var buttonVO:ButtonVO = dataProvider[i];
                button.setText(buttonVO.getLabelValue())

                switch (buttonVO.getBackgroundStyle().getRawValue()) {
                    case ButtonStyleEnum.GOLD.getRawValue():
                        button.setGoldStyle();
                        break;
                    case ButtonStyleEnum.GREEN.getRawValue():
                        button.setGreenStyle();
                        break;
                    case ButtonStyleEnum.SILVER.getRawValue():
                        button.setSilverStyle();
                        break;
                }

                switch (buttonVO.getIconType().getRawValue()) {
                    case IconTypeEnum.GOLD.getRawValue():
                        button.setGoldIcon();
                        break;
                    case IconTypeEnum.SILVER.getRawValue():
                        button.setSilverIcon();
                        break;
                    case IconTypeEnum.EXPERIENCE.getRawValue():
                        button.setExperienceIcon();
                        break;
                }
            }
            button.addEventListener(MouseEvent.CLICK, buttonClickHandler);
            button.addEventListener(MouseEvent.CLICK, buttonPressHandler);
        }
        doLayout();
    }

    public function getButtonByIndex(index:int):Button {
        if (index >= 0 && index < numChildren) {
            var button:DisplayObject = this.getChildAt(index);
            return button as Button;
        }
        return null;
    }

    private function buttonClickHandler(event:MouseEvent):void {
        if (event.currentTarget is Button) {
            dispatchButtonGroupEvent(Button(event.currentTarget), ButtonsGroupEvent.BUTTON_CLICK);
        }
    }

    private function buttonPressHandler(event:MouseEvent):void {
        if (event.currentTarget is Button) {
            dispatchButtonGroupEvent(Button(event.currentTarget), ButtonsGroupEvent.BUTTON_PRESS);
        }
    }

    private function dispatchButtonGroupEvent(button: Button, type:String):void {
        var index:int = getChildIndex(Button(button));
        dispatchEvent(new ButtonsGroupEvent(type, index));
    }


}
}
