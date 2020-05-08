package {
import flash.display.DisplayObject;
import flash.display.Sprite;
import flash.text.TextField;
import flash.text.TextFieldAutoSize;
import flash.text.TextFormat;

public class LevelPicker extends Sprite{

    [Embed(source='CSS/lv unlock.png')]
    private const LEVEL_IMG:Class;

    [Embed(source='CSS/le lock.png')]
    private const LOCK_LEVEL:Class;

    [Embed(source="font/UTM Impact.ttf",
            fontName="SFUFont",
            mimeType = "application/x-font",
            fontWeight="normal",
            fontStyle="normal",
            advancedAntiAliasing="true",
            embedAsCFF="false")]
    public const SFUFont:Class;

    public var id:int;
    public var lvlImg:DisplayObject = new LEVEL_IMG();
    public var lockImg:DisplayObject = new LOCK_LEVEL();

    public function LevelPicker(i:int) {
        id = i;
        if(id == 0){
            addChild(lvlImg);
        } else{
            addChild(lockImg);
        }

        var formatText:TextFormat = new TextFormat();
        formatText.size = 75;
        formatText.font = "SFUFont";
        var numText:TextField = new TextField();
        numText.embedFonts = true;
        numText.defaultTextFormat = formatText;
        numText.textColor = 0xffffff;
        numText.autoSize = TextFieldAutoSize.CENTER;
        numText.mouseEnabled = false;
        numText.text = (i + 1).toString();
        numText.x = lvlImg.x + (lvlImg.width - numText.width)/2;
        numText.y = lvlImg.y + 75;
        numText.setTextFormat(formatText);
        addChild(numText);
    }
}
}
