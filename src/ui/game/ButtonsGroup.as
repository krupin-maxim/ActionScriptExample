package ui.game {

import flash.display.Sprite;

import ui.base.widgets.SimpleGroup;

public class ButtonsGroup extends SimpleGroup {

    private var dataProvider:Vector.<ButtonVO>;

    public function ButtonsGroup() {
        mouseChildren = true;

        super(10, true)
    }

    public function setDataProvider(dataProvider:Vector.<ButtonVO>):void {
        while (numChildren > 0) {
            removeChildAt(0);
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
        }
        doLayout();
    }

}
}
