package {
import flash.display.Sprite;
import flash.text.TextField;
import flash.text.TextFieldAutoSize;
import flash.text.TextFormat;

public class CuztomText extends Sprite{
    [Embed(source="font/UTM Impact.ttf",
            fontName="SFUFont",
            mimeType = "application/x-font",
            fontWeight="normal",
            fontStyle="normal",
            advancedAntiAliasing="true",
            embedAsCFF="false")]
    public const SFUFont:Class;

    public var formatText:TextFormat = new TextFormat();
    public var numText:TextField = new TextField();


    public function CuztomText(size:int, color:uint, text:String) {
        formatText.size = size;
        formatText.font = "SFUFont";
        formatText.align = "center"

        numText.embedFonts = true;
        numText.defaultTextFormat = formatText;
        numText.textColor = color;
        numText.autoSize = TextFieldAutoSize.CENTER;
        numText.mouseEnabled = false;
        numText.text = text;
        numText.setTextFormat(formatText);
        addChild(numText);
    }


}
}
