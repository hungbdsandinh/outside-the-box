package {
import flash.display.Bitmap;
import flash.display.DisplayObject;
import flash.display.Sprite;
import flash.events.MouseEvent;
import flash.text.TextField;
import flash.text.TextFieldAutoSize;
import flash.text.TextFormat;

public class PopUpLose extends Sprite{

    [Embed(source='CSS/bg pu.png')]
    private const BACKGROUND:Class;

    [Embed(source='CSS/lose.png')]
    private const LOSE_TITLE:Class;
    [Embed(source='CSS/bt re.png')]
    private const BTN_REPLAY:Class;

    [Embed(source="font/UTM Impact.ttf",
            fontName="SFUFont",
            mimeType = "application/x-font",
            fontWeight="normal",
            fontStyle="normal",
            advancedAntiAliasing="true",
            embedAsCFF="false")]
    public const SFUFont:Class;


    public var bg:Bitmap = new BACKGROUND();
    public var id:int;
    public function PopUpLose(i:int) {
        id = i;
        var sprite:Sprite = new Sprite();
        sprite.graphics.clear();
        sprite.graphics.beginFill(0xD4D4D4, .2);
        sprite.graphics.drawRect(0,0, Consts.GAME_WIDTH,Consts.GAME_HEIGHT);
        sprite.graphics.endFill();
        addChild(sprite);

        bg.x = sprite.x + (sprite.width - bg.width)/2;
        bg.y = sprite.y + (sprite.height - bg.height)/2;
        addChild(bg);

        var title:DisplayObject = new LOSE_TITLE();
        title.x = bg.x + (bg.width - title.width)/2;
        title.y = bg.y + 30;
        addChild(title);

        var formatText:TextFormat = new TextFormat();
        formatText.size = 75;
        formatText.font = "SFUFont";
        var numText:TextField = new TextField();
        numText.embedFonts = true;
        numText.defaultTextFormat = formatText;
        numText.textColor = 0x000000;
        numText.autoSize = TextFieldAutoSize.CENTER;
        numText.mouseEnabled = false;
        numText.text = "TRY AGAIN";
        numText.x = bg.x + (bg.width - numText.width)/2;
        numText.y = title.y + title.height + 15;
        numText.setTextFormat(formatText);
        addChild(numText);

        var btnReplay:DisplayObject = new BTN_REPLAY();
        btnReplay.x = bg.x + (bg.width - btnReplay.width)/2;
        btnReplay.y = bg.y + bg.height/2 + 10;
        var reSprite:Sprite = new Sprite();
        reSprite.addChild(btnReplay);
        addChild(reSprite);
        reSprite.addEventListener(MouseEvent.CLICK, onClickReplay);
    }

    function onClickReplay(e:MouseEvent):void{
        switch (id) {
            case 1:
                var main1:CorrectRMain = new CorrectRMain();
                main1.x = bg.x - (main1.width - bg.width)/2;
                main1.y = bg.y - (main1.height - bg.height)/2;
                addChild(main1);
                break;
            case 2:
                var main2:CaroMain = new CaroMain();
                main2.x = bg.x - (main2.width - bg.width)/2;
                main2.y = bg.y - (main2.height - bg.height)/2;
                addChild(main2);
                break;
            case 3:
                var main3:BubbleMain = new BubbleMain();
                main3.x = bg.x - (main3.width - bg.width)/2;
                main3.y = bg.y - (main3.height - bg.height)/2;
                addChild(main3);
                break;
            case 4:
                var main4:FDMain = new FDMain();
                main4.x = bg.x - (main4.width - bg.width)/2;
                main4.y = bg.y - (main4.height - bg.height)/2;
                addChild(main4);
                break;
            case 5:
                var main5:DotGameMain = new DotGameMain();
                main5.x = bg.x - (main5.width - bg.width)/2;
                main5.y = bg.y - (main5.height - bg.height)/2;
                addChild(main5);
                break;
            default:
                trace("nope");
        }
    }
}
}
