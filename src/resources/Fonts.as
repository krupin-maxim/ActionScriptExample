package resources {
import flash.text.TextFormat;


public class Fonts {

    [Embed(source="../../resources/fonts/UniversCondC.otf",
            fontName="UniversCondC",
            mimeType="application/x-font-truetype", embedAsCFF="false",
            advancedAntiAliasing="true")]
    public static var universCondC:Class;

    public static function getGameTextFormat():TextFormat {
        return new TextFormat("UniversCondC");
    }

}
}
