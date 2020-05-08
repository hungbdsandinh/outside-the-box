package {
import flash.display.Bitmap;
import flash.display.DisplayObject;
import flash.display.Sprite;
import flash.events.MouseEvent;
import flash.media.Sound;

public class PopUpWin extends Sprite{

    [Embed(source='CSS/bg pu.png')]
    private const BACKGROUND:Class;

    [Embed(source='CSS/win.png')]
    private const WIN_TITLE:Class;

    [Embed(source='CSS/bt home.png')]
    private const BTN_HOME:Class;
    [Embed(source='CSS/bt re.png')]
    private const BTN_REPLAY:Class;
    [Embed(source='CSS/bt next.png')]
    private const BTN_NEXT:Class;

    [Embed(source='sound/Win.mp3')]
    private const WIN_SOUND:Class;

    public var winSound:Sound = new WIN_SOUND();
    public var bg:DisplayObject = new BACKGROUND();
    public var id:int;
    public var arrRemove:Array = [];
    public function PopUpWin(i:int) {
        winSound.play();
        var sprite:Sprite = new Sprite();
        sprite.graphics.clear();
        sprite.graphics.beginFill(0xD4D4D4, .2);
        sprite.graphics.drawRect(0,0, Consts.GAME_WIDTH,Consts.GAME_HEIGHT);
        sprite.graphics.endFill();
        addChild(sprite);

        bg.x = sprite.x + (sprite.width - bg.width)/2;
        bg.y = sprite.y + (sprite.height - bg.height)/2;
        addChild(bg);
        id = i;


        var title:DisplayObject = new WIN_TITLE();
        title.x = bg.x + (bg.width - title.width)/2;
        title.y = bg.y;
        addChild(title);

        var btnReplay:DisplayObject = new BTN_REPLAY();
        btnReplay.x = bg.x + (bg.width)/2 - btnReplay.width - 10;
        btnReplay.y = bg.y + bg.height/2;
        var reSprite:Sprite = new Sprite();
        reSprite.addChild(btnReplay);
        addChild(reSprite);
        reSprite.addEventListener(MouseEvent.CLICK, onClickReplay);
//        var btnHome:DisplayObject = new BTN_HOME();
//        btnHome.x = btnReplay.x - btnHome.width - 40;
//        btnHome.y = bg.y + bg.height/2;
//        var homeSprite:Sprite = new Sprite();
//        homeSprite.addChild(btnHome);
//        addChild(homeSprite);
//        homeSprite.addEventListener(MouseEvent.CLICK, onClickHome);
        var btnNext:DisplayObject = new BTN_NEXT();
        btnNext.x = bg.x + (bg.width)/2 + 10;
        btnNext.y = bg.y + bg.height/2;
        var nextSprite:Sprite = new Sprite();
        nextSprite.addChild(btnNext);
        addChild(nextSprite);
        nextSprite.addEventListener(MouseEvent.CLICK, onClickNext);
        Utils.saveLocalStorage("pass-lv-" + (id + 1).toString(), "true");

    }


    function onClickHome(e:MouseEvent):void{
        var menuLevel:MenuLevel = new MenuLevel();
        menuLevel.x = bg.x - (menuLevel.width - bg.width)/2;
        menuLevel.y = bg.y - (menuLevel.height - bg.height)/2;
        addChild(menuLevel);
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

    function onClickNext(e:MouseEvent):void{
        switch (id + 1) {
            case 2:
                var main2:CaroMain = new CaroMain();
                main2.x = bg.x - (main2.width - bg.width)/2;
                main2.y = bg.y - (main2.height - bg.height)/2;
                addChild(main2);
                break;
            case 3:
                var main3:DotGameMain = new DotGameMain();
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
                var main5:BubbleMain = new BubbleMain();
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
