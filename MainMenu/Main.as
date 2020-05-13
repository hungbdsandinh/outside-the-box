package {
import flash.display.Bitmap;
import flash.display.DisplayObject;
import flash.display.Sprite;
import flash.display.StageAlign;
import flash.display.StageDisplayState;
import flash.display.StageQuality;
import flash.display.StageScaleMode;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.ui.Mouse;


[SWF(width=1120, height=630)]
public class Main extends Sprite{

    [Embed(source='CSS/bg.png')]
    private const BACK_GROUND:Class;

    [Embed(source='CSS/bt play.png')]
    private const PLAY_BTN:Class;

    [Embed(source='CSS/logo.png')]
    private const LOGO:Class;

    public function Main() {

//        init();
        var bg:Bitmap = new BACK_GROUND();
        bg = SDUtils.getFitImage(bg, Consts.GAME_WIDTH, Consts.GAME_HEIGHT);
        addChild(bg);

        var logoImg:DisplayObject = new LOGO();
        logoImg.x = bg.x + (bg.width - logoImg.width)/2;
        logoImg.y = bg.y + (bg.height - logoImg.height)/2 - logoImg.height/2;
        addChild(logoImg);

        var btnPlay:DisplayObject = new PLAY_BTN();
        btnPlay.scaleY = btnPlay.scaleX = .9;
        btnPlay.x = bg.x + (bg.width - btnPlay.width)/2;
        btnPlay.y = logoImg.y + logoImg.height + 50;
        var btnPlaySprite:Sprite = new Sprite();
        btnPlaySprite.addChild(btnPlay);
        addChild(btnPlaySprite);
        btnPlaySprite.addEventListener(MouseEvent.CLICK, onOpenLevel);
    }

    function onOpenLevel(e:MouseEvent):void{
        var menuLevel:MenuLevel = new MenuLevel();
        addChild(menuLevel);
        Utils.saveLocalStorage("pass-lv-1", "true");
    }

    public function allowFullscreen():void {
        stage.displayState = StageDisplayState.FULL_SCREEN_INTERACTIVE;
        doLayout();
    }

    public function doLayout(e:Event = null):void {
        var w:Number, h:Number;
            w = Math.max(stage.fullScreenWidth, stage.fullScreenHeight) + 2;
            h = Math.min(stage.fullScreenWidth, stage.fullScreenHeight);

        var deviceRatio:Number = w / h;
        if (deviceRatio > Consts.AppRatio) {
            Consts.GAME_WIDTH = deviceRatio * Consts.AppW / Consts.AppRatio;
            Consts.appOffsetX = Consts.GAME_WIDTH - Consts.AppW;
        } else {
            Consts.GAME_HEIGHT = Consts.AppRatio * Consts.AppH / deviceRatio;
            Consts.appOffsetY = Consts.GAME_HEIGHT - Consts.AppH;
        }
    }

    public function init():void{
        stage.focus = this;
        stage.scaleMode = StageScaleMode.NO_SCALE;
        stage.align = StageAlign.TOP_LEFT;
        stage.quality = StageQuality.BEST;
        allowFullscreen();
    }
}
}
