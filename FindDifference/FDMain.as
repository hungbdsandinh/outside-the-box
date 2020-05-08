package {
import flash.display.Bitmap;
import flash.display.DisplayObject;
import flash.display.Sprite;
import flash.events.MouseEvent;
import flash.media.Sound;

public class FDMain extends Sprite{

    [Embed(source='img/bg 3.png')]
    private const BACK_GROUND:Class;

    [Embed(source='img/tranh 1.png')]
    private const TRANH_1:Class;

    [Embed(source='img/tranh 2.png')]
    private const TRANH_2:Class;

    [Embed(source='../MainMenu/sound/ButtonClick.mp3')]
    private const SoundClick:Class;
    public var moveSound:Sound = new SoundClick();

    public var bg:Bitmap = new BACK_GROUND();
    public var arrTick:Array = [];

    public var IdGame:int = 4;
    public function FDMain() {
        bg = SDUtils.getFitImage(bg, Consts.GAME_WIDTH, Consts.GAME_HEIGHT);
        addChild(bg);

        var texxt:CuztomText = new CuztomText(55, 0xb0dc92, "FIND 11 DIFFERENCES IN RIGHT PICTURE");
        texxt.x = bg.x + (bg.width)/2;
        texxt.y = bg.y + 10;
        addChild(texxt);

        var tranh_2:DisplayObject = new TRANH_2();
        tranh_2.x = bg.x + bg.width - tranh_2.width - 40;
        tranh_2.y = bg.y + bg.height - tranh_2.height - 40;
        addChild(tranh_2);

        var tranh_1:DisplayObject = new TRANH_1();
        tranh_1.x = tranh_2.x - tranh_2.width - 40;
        tranh_1.y = tranh_2.y;
        addChild(tranh_1);

        trace(tranh_2.width);
        trace(tranh_2.height);

        var answer1:answerSprite = new answerSprite(1);
        answer1.x = tranh_2.x + 35;
        answer1.y = tranh_2.y + 50;
        addChild(answer1);
        var answer2:answerSprite = new answerSprite(2);
        answer2.x = tranh_2.x + 125;
        answer2.y = tranh_2.y + 75;
        addChild(answer2);
        var answer3:answerSprite = new answerSprite(3);
        answer3.x = tranh_2.x + 375;
        answer3.y = tranh_2.y + 95;
        addChild(answer3);
        var answer4:answerSprite = new answerSprite(4);
        answer4.x = tranh_2.x + 90;
        answer4.y = tranh_2.y + 195;
        addChild(answer4);
        var answer5:answerSprite = new answerSprite(5);
        answer5.x = tranh_2.x + 200;
        answer5.y = tranh_2.y + 215;
        addChild(answer5);
        var answer6:answerSprite = new answerSprite(6);
        answer6.x = tranh_2.x + 240;
        answer6.y = tranh_2.y + 255;
        addChild(answer6);
        var answer7:answerSprite = new answerSprite(7);
        answer7.x = tranh_2.x + 85;
        answer7.y = tranh_2.y + 310;
        addChild(answer7);
        var answer8:answerSprite = new answerSprite(8);
        answer8.x = tranh_2.x + 192;
        answer8.y = tranh_2.y + 310;
        addChild(answer8);
        var answer9:answerSprite = new answerSprite(9);
        answer9.x = tranh_2.x + 165;
        answer9.y = tranh_2.y + 365;
        addChild(answer9);
        var answer10:answerSprite = new answerSprite(10);
        answer10.x = tranh_2.x + 285;
        answer10.y = tranh_2.y + 355;
        addChild(answer10);

        answer1.addEventListener(MouseEvent.CLICK, onClickTick);
        answer2.addEventListener(MouseEvent.CLICK, onClickTick);
        answer3.addEventListener(MouseEvent.CLICK, onClickTick);
        answer4.addEventListener(MouseEvent.CLICK, onClickTick);
        answer5.addEventListener(MouseEvent.CLICK, onClickTick);
        answer6.addEventListener(MouseEvent.CLICK, onClickTick);
        answer7.addEventListener(MouseEvent.CLICK, onClickTick);
        answer8.addEventListener(MouseEvent.CLICK, onClickTick);
        answer9.addEventListener(MouseEvent.CLICK, onClickTick);
        answer10.addEventListener(MouseEvent.CLICK, onClickTick);

        arrTick.push(answer1);
        arrTick.push(answer2);
        arrTick.push(answer3);
        arrTick.push(answer4);
        arrTick.push(answer5);
        arrTick.push(answer6);
        arrTick.push(answer7);
        arrTick.push(answer8);
        arrTick.push(answer9);
        arrTick.push(answer10);

    }

    function onClickTick(e:MouseEvent):void{
        e.target.isClicked = true;
        moveSound.play();
        removeEventListener(MouseEvent.CLICK, onClickTick);
        checkWin();
        trace("a");
    }


    function checkWin():void{
        var count:int = 0;
        for each (var a:Object in arrTick){
            if(a.isClicked){
                count++;
            }
        }
        if(count == 11){
            var winPU:PopUpWin = new PopUpWin(IdGame);
            winPU.x = bg.x + (bg.width - winPU.width)/2;
            winPU.y = bg.y + (bg.height - winPU.height)/2;
            addChild(winPU);
        } else return;
    }
}
}
