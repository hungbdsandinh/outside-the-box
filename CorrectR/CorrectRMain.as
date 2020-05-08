package {
import com.greensock.loading.CSSLoader;

import flash.display.Bitmap;
import flash.display.DisplayObject;
import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.events.TimerEvent;
import flash.media.Sound;
import flash.utils.Timer;

public class CorrectRMain extends Sprite{

    [Embed(source='img/bg 6.png')]
    private const BACK_GROUND:Class;

    [Embed(source='img/khung 5.png')]
    private const KHUNG:Class;

    [Embed(source='img/so oto.png')]
    private const QUEST:Class;

    [Embed(source='img/vong 1.png')]
    private const VONG_1:Class;
    [Embed(source='img/vo ng 2.png')]
    private const VONG_2:Class;
    [Embed(source='img/vong 3.png')]
    private const VONG_3:Class;

    [Embed(source='img/r1.png')]
    private const ANSWER_1:Class;
    [Embed(source='img/r2.png')]
    private const ANSWER_2:Class;
    [Embed(source='img/r3.png')]
    private const ANSWER_3:Class;

    [Embed(source='../MainMenu/CSS/v.png')]
    private const CORRECT:Class;
    [Embed(source='../MainMenu/CSS/x.png')]
    private const INCORRECT:Class;

    [Embed(source='../MainMenu/sound/ButtonClick.mp3')]
    private const SoundClick:Class;
    public var moveSound:Sound = new SoundClick();

    [Embed(source='../MainMenu/sound/audioblocks-game-incorrect-answer-3_BKVQc-MUAvL_NWM.mp3')]
    private const BlockClick:Class;
    public var blockSound:Sound = new BlockClick();

    public var bg:Bitmap = new BACK_GROUND();

    public var IdGame:int = 1;
    public function CorrectRMain() {
        bg = SDUtils.getFitImage(bg, Consts.GAME_WIDTH, Consts.GAME_HEIGHT);
        addChild(bg);

        var khung_play:DisplayObject = new KHUNG();
        khung_play.scaleX = khung_play.scaleY = 1.2;
        khung_play.y = bg.y + (bg.height - khung_play.height)/2;
        khung_play.x = bg.x + bg.width - khung_play.width - (bg.height - khung_play.height)/2;
        addChild(khung_play);

        var tuto:CuztomText = new CuztomText(70, 0x99d6ff, "CHOOSE");
        tuto.x = khung_play.x - tuto.width - 60;
        tuto.y = khung_play.y + khung_play.height/2 + 20;
        addChild(tuto);
        var tuto1:CuztomText = new CuztomText(70, 0x99d6ff, "AN ANSWER");
        tuto1.x = tuto.x + 10;
        tuto1.y = tuto.y + tuto.height;
        addChild(tuto1);

        var quest:DisplayObject = new QUEST();
        quest.x = khung_play.x + (khung_play.width - quest.width)/2;
        quest.y = khung_play.y + 30;
        addChild(quest);

        var answer2:DisplayObject =new VONG_2();
        var r2:DisplayObject =new ANSWER_2();
        var sprite2:Sprite = new Sprite();

        sprite2.addChild(answer2);
        r2.x = answer2.x + (answer2.width - r2.width)/2;
        r2.y = answer2.y + (answer2.height - r2.height)/2;

        sprite2.addChild(r2);
        sprite2.x = khung_play.x + (khung_play.width - sprite2.width)/2;
        sprite2.y = quest.y + quest.height + 20;

        var answer1:DisplayObject =new VONG_1();
        var r1:DisplayObject =new ANSWER_1();
        var sprite1:Sprite = new Sprite();

        sprite1.addChild(answer1);
        r1.x = answer1.x + (answer1.width - r1.width)/2;
        r1.y = answer1.y + (answer1.height - r1.height)/2;

        sprite1.addChild(r1);
        sprite1.x = sprite2.x - sprite1.width - 50;
        sprite1.y = sprite2.y;


        var answer3:DisplayObject =new VONG_3();
        var r3:DisplayObject =new ANSWER_3();
        var sprite3:Sprite = new Sprite();

        sprite3.addChild(answer3);
        r3.x = answer3.x + (answer3.width - r3.width)/2;
        r3.y = answer3.y + (answer3.height - r3.height)/2;

        sprite3.addChild(r3);
        sprite3.x = sprite2.x + sprite2.width + 50;
        sprite3.y = sprite2.y;

        randomSwap(sprite1, sprite2, sprite3);

        addChild(sprite3);
        sprite3.addEventListener(MouseEvent.CLICK, onClickIncorrectAnswer);
        addChild(sprite2);
        sprite2.addEventListener(MouseEvent.CLICK, onClickIncorrectAnswer);
        addChild(sprite1);
        sprite1.addEventListener(MouseEvent.CLICK, onClickCorrectAnswer);
    }

    function onClickCorrectAnswer(e:MouseEvent):void{
        trace("bam!");
        var correctV:DisplayObject = new CORRECT();
        correctV.x = e.target.x + e.target.width - 20;
        correctV.y = e.target.y;
        addChild(correctV);
        var winPU:PopUpWin = new PopUpWin(IdGame);

        winPU.x = bg.x + (bg.width - winPU.width)/2;
        winPU.y = bg.y + (bg.height - winPU.height)/2;
        moveSound.play();

        delayedFunctionCall(300, function (event:Event):void {
            addChild(winPU);
        });
    }

    function delayedFunctionCall(delay:int, func:Function) {
        trace('going to execute the function you passed me in', delay, 'milliseconds');
        var timer:Timer = new Timer(delay, 1);
        timer.addEventListener(TimerEvent.TIMER, func);
        timer.start();
    }

    function onClickIncorrectAnswer(e:MouseEvent):void{
        trace("bam!");
        var incorrectV:DisplayObject = new INCORRECT();
        incorrectV.x = e.target.x + e.target.width - 20;
        incorrectV.y = e.target.y;
        addChild(incorrectV);

        var losePU:PopUpLose = new PopUpLose(IdGame);

        losePU.x = bg.x + (bg.width - losePU.width)/2;
        losePU.y = bg.y + (bg.height - losePU.height)/2;
        blockSound.play();

        delayedFunctionCall(300, function (event:Event):void {
            addChild(losePU);
        });
    }

    function randomSwap(a:Object, b:Object, c:Object):void{
        var i:int = a.x;
        var j:int = b.x;
        if(random(0,4) == 2){
            b.x = c.x;
            c.x = i;
            a.x = j;
        } else if(random(0,4) == 3){
            a.x = c.x;
            c.x = i;
        } else if(random(0,4) == 1){
            a.x = b.x;
            b.x = i;
        } else {
            return;
        }
    }

    function random(min:int = 0, max:int = int.MAX_VALUE):int
    {
        if (min == max) return min;
        if (min < max) return min + (Math.random() * (max - min + 1));
        else return max + (Math.random() * (min - max + 1));
    }
}
}
