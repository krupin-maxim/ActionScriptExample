package resources {
import flash.display.Bitmap;
import flash.display.BitmapData;

/**
 * This class contains all images from "../../resources/images"
 * It is good practice to generate this
 */
public class Images {

    public static function getBitmapData(className:Class):BitmapData {
        var inst = new className();
        if (inst is Bitmap) {
            return Bitmap(inst).bitmapData;
        } else {
            throw Error("Wrong class name for bitmap");
        }
    }

// ------------- Common

    [Embed(source="../../resources/images/disable.png")]
    public static var disable_png:Class;
    [Embed(source="../../resources/images/icon_experience.png")]
    public static var icon_experience_png:Class;
    [Embed(source="../../resources/images/icon_gold.png")]
    public static var icon_gold_png:Class;
    [Embed(source="../../resources/images/icon_silver.png")]
    public static var icon_silver_png:Class;

// ------------- Gold

    [Embed(source="../../resources/images/gold_disable.png")]
    public static var gold_disable_png:Class;
    [Embed(source="../../resources/images/gold_hover.png")]
    public static var gold_hover_png:Class;
    [Embed(source="../../resources/images/gold_normal.png")]
    public static var gold_normal_png:Class;
    [Embed(source="../../resources/images/gold_press.png")]
    public static var gold_press_png:Class;

// ------------- Green

    [Embed(source="../../resources/images/green_disable.png")]
    public static var green_disable_png:Class;
    [Embed(source="../../resources/images/green_hover.png")]
    public static var green_hover_png:Class;
    [Embed(source="../../resources/images/green_normal.png")]
    public static var green_normal_png:Class;
    [Embed(source="../../resources/images/green_press.png")]
    public static var green_press_png:Class;

// ------------- Silver

    [Embed(source="../../resources/images/silver_disable.png")]
    public static var silver_disable_png:Class;
    [Embed(source="../../resources/images/silver_hover.png")]
    public static var silver_hover_png:Class;
    [Embed(source="../../resources/images/silver_normal.png")]
    public static var silver_normal_png:Class;
    [Embed(source="../../resources/images/silver_press.png")]
    public static var silver_press_png:Class;

}
}
