package {
import flash.display.Bitmap;
import flash.display.DisplayObject;
import flash.display.Sprite;
import flash.events.MouseEvent;

public class MenuLevel extends Sprite{
    [Embed(source='CSS/bg.png')]
    private const BACK_GROUND:Class;

    [Embed(source='CSS/bt. back.png')]
    private const BTN_BACK:Class;

    [Embed(source='CSS/select.png')]
    private const LEVEL_TITLE:Class;

    public var arrLevel:Array = [];

    public var BackVisible:Boolean = false;

    public var bg:Bitmap = new BACK_GROUND();
    function MenuLevel():void{
        bg = SDUtils.getFitImage(bg, Consts.GAME_WIDTH, Consts.GAME_HEIGHT);
        addChild(bg);
//        Utils.saveLocalStorage("pass-lv-1", "");
//        Utils.saveLocalStorage("pass-lv-2", "");
//        Utils.saveLocalStorage("pass-lv-3", "");

        var selectLevel:DisplayObject = new LEVEL_TITLE();
        selectLevel.x = bg.x + (bg.width - selectLevel.width)/2;
        selectLevel.y = bg.y + 20;
        addChild(selectLevel);


        for(var i:int =0; i < 18; i++){
            var levelPicker:LevelPicker = new LevelPicker(i);
            levelPicker.scaleY = levelPicker.scaleX = .65;
            if(i < 6){
                levelPicker.x = bg.x + (bg.width)/2 - levelPicker.width * 3 + levelPicker.width* i + 5;
                levelPicker.y = selectLevel.y + selectLevel.height;
            }
            else if(i >= 6 && i < 12){
                levelPicker.x = bg.x + (bg.width)/2 - levelPicker.width * 3 + levelPicker.width* (i - 6);
                levelPicker.y = arrLevel[0].y + levelPicker.height + 10;
            }
             else{
                levelPicker.x = bg.x + (bg.width)/2 - levelPicker.width * 3 + levelPicker.width* (i - 12);
                levelPicker.y = arrLevel[0].y + levelPicker.height * 2 + 20;
            }
            arrLevel.push(levelPicker);
            addChild(levelPicker);
        }

        arrLevel[0].addEventListener(MouseEvent.CLICK, openLevel1);
        arrLevel[1].addEventListener(MouseEvent.CLICK, openLevel2);
        arrLevel[2].addEventListener(MouseEvent.CLICK, openLevel3);
        arrLevel[3].addEventListener(MouseEvent.CLICK, openLevel4);
        arrLevel[4].addEventListener(MouseEvent.CLICK, openLevel5);
        for(var i:int = 5; i< 18; i++){
            arrLevel[i].addEventListener(MouseEvent.CLICK, openLevelLock);
        }
    }

    function removeAllLevelPicker():void{
        for each(var o:Sprite in arrLevel){
            removeChild(o);
        }
    }

    function openLevelLock(e:MouseEvent):void{
        var nope:NopePopUp = new NopePopUp();
        nope.x = bg.x + (bg.width - nope.width)/2;
        nope.y = bg.y + (bg.height - nope.height)/2;
        addChild(nope);

        nope.addEventListener(MouseEvent.CLICK, function (e:MouseEvent) {
            removeChild(nope);
        })
    }

    function openLevel1(e:MouseEvent):void{
        if(Utils.getLocalStorage("pass-lv-" + (e.target.id + 1).toString()) == "true"){
            var main:CorrectRMain = new CorrectRMain();
            addChild(main);
            var btnBack:DisplayObject = new BTN_BACK();
            var backSprite:Sprite = new Sprite();
            backSprite.addChild(btnBack);
            backSprite.x = bg.x + 70;
            backSprite.y = bg.y + 30;
            addChild(backSprite);
            backSprite.visible = true;
            backSprite.addEventListener(MouseEvent.CLICK, function (e:MouseEvent) {
                e.currentTarget.parent.removeChild(main);
                backSprite.visible = false;
            })
        } else{
            trace("nope");
        }
    }

    function openLevel2(e:MouseEvent):void{
        if(Utils.getLocalStorage("pass-lv-" + (e.target.id + 1).toString()) == "true"){
            var main:CaroMain = new CaroMain();
            addChild(main);
            var btnBack:DisplayObject = new BTN_BACK();
            var backSprite:Sprite = new Sprite();
            backSprite.addChild(btnBack);
            backSprite.x = bg.x + 70;
            backSprite.y = bg.y + 30;
            addChild(backSprite);
            backSprite.visible = true;
            backSprite.addEventListener(MouseEvent.CLICK, function (e:MouseEvent) {
                e.currentTarget.parent.removeChild(main);
                backSprite.visible = false;
            })
        } else{
            openLevelLock(e);
        }
    }

    function openLevel3(e:MouseEvent):void{
        if(Utils.getLocalStorage("pass-lv-" + (e.target.id + 1).toString()) == "true"){
            var main:DotGameMain = new DotGameMain();
            addChild(main);
            var btnBack:DisplayObject = new BTN_BACK();
            var backSprite:Sprite = new Sprite();
            backSprite.addChild(btnBack);
            backSprite.x = bg.x + 70;
            backSprite.y = bg.y + 30;
            addChild(backSprite);
            backSprite.visible = true;
            backSprite.addEventListener(MouseEvent.CLICK, function (e:MouseEvent) {
                e.currentTarget.parent.removeChild(main);
                backSprite.visible = false;
            })
        } else{
            openLevelLock(e);
        }
    }

    function openLevel4(e:MouseEvent):void{
        if(Utils.getLocalStorage("pass-lv-" + (e.target.id + 1).toString()) == "true"){
            var main:FDMain = new FDMain();
            addChild(main);
            var btnBack:DisplayObject = new BTN_BACK();
            var backSprite:Sprite = new Sprite();
            backSprite.addChild(btnBack);
            backSprite.x = bg.x + 70;
            backSprite.y = bg.y + 30;
            addChild(backSprite);
            backSprite.visible = true;
            backSprite.addEventListener(MouseEvent.CLICK, function (e:MouseEvent) {
                e.currentTarget.parent.removeChild(main);
                backSprite.visible = false;
            })
        } else{
            openLevelLock(e);
        }
    }

    function openLevel5(e:MouseEvent):void{
        if(Utils.getLocalStorage("pass-lv-" + (e.target.id + 1).toString()) == "true"){
            var main:BubbleMain = new BubbleMain();
            addChild(main);
            var btnBack:DisplayObject = new BTN_BACK();
            var backSprite:Sprite = new Sprite();
            backSprite.addChild(btnBack);
            backSprite.x = bg.x + 70;
            backSprite.y = bg.y + 30;
            addChild(backSprite);
            backSprite.visible = true;
            backSprite.addEventListener(MouseEvent.CLICK, function (e:MouseEvent) {
                e.currentTarget.parent.removeChild(main);
                backSprite.visible = false;
            })
        } else{
            openLevelLock(e);
        }
    }
}
}
