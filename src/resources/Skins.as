package resources {
import ui.base.skins.SimpleFillSkin;
import ui.base.skins.SimpleSlice9Skin;


/**
 * This class contains wrapped images to skins for customized draw method: slice9 or fill
 */
public class Skins {

    // ------------- Common
    public static var overDisable:SimpleFillSkin = new SimpleFillSkin(Images.getBitmapData(Images.disable_png), 20, 20);

    // ------------- Gold

    public static var goldNormal:SimpleSlice9Skin = new SimpleSlice9Skin(Images.getBitmapData(Images.gold_normal_png), 25, 22);
    public static var goldHover:SimpleSlice9Skin = new SimpleSlice9Skin(Images.getBitmapData(Images.gold_hover_png), 25, 22);
    public static var goldPress:SimpleSlice9Skin = new SimpleSlice9Skin(Images.getBitmapData(Images.gold_press_png), 25, 22);
    public static var goldDisable:SimpleSlice9Skin = new SimpleSlice9Skin((Images.getBitmapData(Images.gold_disable_png)), 25, 22);

    // ------------- Green

    public static var greenNormal:SimpleSlice9Skin = new SimpleSlice9Skin(Images.getBitmapData(Images.green_normal_png), 25, 22);
    public static var greenHover:SimpleSlice9Skin = new SimpleSlice9Skin(Images.getBitmapData(Images.green_hover_png), 25, 22);
    public static var greenPress:SimpleSlice9Skin = new SimpleSlice9Skin(Images.getBitmapData(Images.green_press_png), 25, 22);
    public static var greenDisable:SimpleSlice9Skin = new SimpleSlice9Skin(Images.getBitmapData(Images.green_disable_png), 25, 22);

    // ------------- Silver

    public static var silverNormal:SimpleSlice9Skin = new SimpleSlice9Skin(Images.getBitmapData(Images.silver_normal_png), 25, 22);
    public static var silverHover:SimpleSlice9Skin = new SimpleSlice9Skin(Images.getBitmapData(Images.silver_hover_png), 25, 22);
    public static var silverPress:SimpleSlice9Skin = new SimpleSlice9Skin(Images.getBitmapData(Images.silver_press_png), 25, 22);
    public static var silverDisable:SimpleSlice9Skin = new SimpleSlice9Skin(Images.getBitmapData(Images.silver_disable_png), 25, 22);


}
}
