package {
import flash.display.Bitmap;
import flash.display.DisplayObject;
import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.events.TimerEvent;
import flash.media.Sound;
import flash.utils.Timer;

public class CaroMain extends Sprite{

    [Embed(source='img/bg 7.png')]
    private const BACK_GROUND:Class;
    [Embed(source='img/khung 7.png')]
    private const KHUNG:Class;

    [Embed(source='img/tu.png')]
    private const WORDS:Class;

    [Embed(source='img/caro 1.png')]
    private const X_SIGN:Class;

    [Embed(source='img/caro 2.png')]
    private const O_SIGN:Class;

    [Embed(source='img/thanhngang.png')]
    private const THANHNGANG:Class;

    public var vien:int;
    public var bg:Bitmap = new BACK_GROUND();
    public var sprite:Sprite = new Sprite();
    public var sprite1:Sprite = new Sprite();
    public var sprite2:Sprite = new Sprite();

    [Embed(source='../MainMenu/sound/ButtonClick.mp3')]
    private const SoundClick:Class;
    public var moveSound:Sound = new SoundClick();

    public var IdGame:int = 2;
    public function CaroMain() {
        bg = SDUtils.getFitImage(bg, Consts.GAME_WIDTH, Consts.GAME_HEIGHT);
        addChild(bg);

        var khung_play:DisplayObject = new KHUNG();
//        khung_play.scaleX = khung_play.scaleY = 1.2;
        khung_play.y = bg.y + (bg.height - khung_play.height)/2;
        khung_play.x = bg.x + bg.width - khung_play.width - (bg.height - khung_play.height)/2;
        addChild(khung_play);

        var words:DisplayObject = new WORDS();
        words.x = khung_play.x - words.width - 60;
        words.y = khung_play.y + khung_play.height - words.height - 30;
        addChild(words);

        var o1:DisplayObject = new O_SIGN();
        o1.x = khung_play.x + (khung_play.width - o1.width)/2;
        o1.y = khung_play.y + (khung_play.height - o1.height * 3)/6;
        vien = (khung_play.height - o1.height * 3)/6;
        addChild(o1);


        var x2:DisplayObject = new X_SIGN();
        x2.x = khung_play.x + vien;
        x2.y = o1.y + o1.height + vien*2;
        addChild(x2);

        var o2:DisplayObject = new O_SIGN();
        o2.x = o1.x;
        o2.y = o1.y + o1.height + vien*2;
        addChild(o2);

        var x3:DisplayObject = new X_SIGN();
        x3.x = khung_play.x + khung_play.width - x3.width - vien;
        x3.y = o1.y + o1.height + vien*2;
        addChild(x3);

        var x4:DisplayObject = new X_SIGN();
        x4.x = o1.x;
        x4.y = o2.y + o1.height + vien*2;
        addChild(x4);

        var o3:DisplayObject = new O_SIGN();
        o3.x = x3.x;
        o3.y = x4.y;
        addChild(o3);

        sprite.graphics.clear();
        sprite.graphics.beginFill(0xBAF6F7, 0);
        sprite.graphics.drawEllipse(0, 0, o1.width, o1.height);
        sprite.x = o1.x - o1.width - vien*2;
        sprite.y = o1.y;
        sprite.graphics.endFill();
        addChild(sprite);
        sprite.addEventListener(MouseEvent.CLICK, onClickInCorrectAnswer);

        sprite1.graphics.clear();
        sprite1.graphics.beginFill(0xBAF6F7, 0);
        sprite1.graphics.drawEllipse(0, 0, o1.width, o1.height);
        sprite1.x = o1.x + o1.width + vien*2;
        sprite1.y = o1.y;
        sprite1.graphics.endFill();
        addChild(sprite1);
        sprite1.addEventListener(MouseEvent.CLICK, onClickInCorrectAnswer);

        sprite2.graphics.clear();
        sprite2.graphics.beginFill(0xBAF6F7, 0);
        sprite2.graphics.drawEllipse(0, 0, o1.width, o1.height);
        sprite2.x = x2.x;
        sprite2.y = x4.y;
        sprite2.graphics.endFill();
        addChild(sprite2);
        sprite2.addEventListener(MouseEvent.CLICK, onClickCorrectAnswer);
    }

    function onClickCorrectAnswer(e:MouseEvent):void{
        var xCorrect:DisplayObject = new X_SIGN();
        e.target.addChild(xCorrect);

        var line:DisplayObject = new THANHNGANG();
        line.x = e.target.x - (line.width - e.target.width)/2;
        line.y = e.target.y + (e.target.height - line.height)/2;

        var winPU:PopUpWin = new PopUpWin(IdGame);
        winPU.x = bg.x + (bg.width - winPU.width)/2;
        winPU.y = bg.y + (bg.height - winPU.height)/2;

        delayedFunctionCall(500, function (event:Event):void {
            addChild(line);
            delayedFunctionCall(1000, function (event:Event):void {
                trace((IdGame+1).toString());
                Utils.saveLocalStorage("pass-lv"+ (IdGame+1).toString(), "true");
                addChild(winPU);
            });
        });
//        winPU.homeSprite.addEventListener(MouseEvent.CLICK, onClickHome);
//        winPU.reSprite.addEventListener(MouseEvent.CLICK, onClickReplay);
//        winPU.nextSprite.addEventListener(MouseEvent.CLICK, onClickNext);
    }

    function onClickInCorrectAnswer(e:MouseEvent):void{
        var xCorrect:DisplayObject = new X_SIGN();
        e.target.addChild(xCorrect);
        moveSound.play();

        var losePU:PopUpLose = new PopUpLose(IdGame);
        losePU.x = bg.x + (bg.width - losePU.width)/2;
        losePU.y = bg.y + (bg.height - losePU.height)/2;
        addChild(losePU);
    }

    function delayedFunctionCall(delay:int, func:Function) {
        trace('going to execute the function you passed me in', delay, 'milliseconds');
        var timer:Timer = new Timer(delay, 1);
        timer.addEventListener(TimerEvent.TIMER, func);
        timer.start();
    }
}
}
