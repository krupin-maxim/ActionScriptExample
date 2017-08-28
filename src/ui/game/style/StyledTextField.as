package ui.game.style {

import flash.text.TextField;
import flash.text.TextFormat;

import resources.Fonts;

/**
 * TextField with customized font
 */
public class StyledTextField extends TextField {

    private var textFormat: TextFormat = Fonts.getGameTextFormat();

    public function StyledTextField() {
        super();
        this.embedFonts = true;
        this.defaultTextFormat = textFormat;
        this.selectable = false;
        this.mouseEnabled = false;
    }

    // ------------------- Game Styles

    public function setGameButtonStyle():StyledTextField {
        textFormat.size = 12;
        textFormat.color = 0xFFFFFF; // In real world it must be constant
        this.defaultTextFormat = textFormat;
        return this;
    }

    // --------------------

    public function setText(value:String):StyledTextField {
        this.text = value;
        this.width = this.textWidth + 4; // It is complicated feature of flash, but in our case it is enough
        this.height = this.textHeight + 4;
        return this;
    }

}
}
