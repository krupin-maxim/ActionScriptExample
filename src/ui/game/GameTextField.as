package ui.game {

import flash.text.TextField;
import flash.text.TextFormat;

import resources.Fonts;

public class GameTextField extends TextField {

    private var textFormat: TextFormat = Fonts.getGameTextFormat();

    public function GameTextField() {
        super();
        this.embedFonts = true;
        this.defaultTextFormat = textFormat;
        this.selectable = false;
        this.mouseEnabled = false;
    }

    public function setGameButtonStyle():GameTextField {
        textFormat.size = 12;
        textFormat.color = 0xFFFFFF; // In real world it must be constant
        this.defaultTextFormat = textFormat;
        return this;
    }

    public function setText(value:String):GameTextField {
        this.text = value;
        this.width = this.textWidth + 4; // It is complicated feature of flash, but in our case it is enough
        this.height = this.textHeight + 4;
        return this;
    }

}
}
