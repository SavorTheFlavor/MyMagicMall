(function() {

    var imageResources = getImageRes();
    my.ImageManager.load(imageResources, loadImageResources);

    /**
     * 加载图片资源
     */
    function loadImageResources(number) {
        my.DOM.get('progressText').innerHTML = '正在加载图片...(' + ~~(number / imageResources.length * 100) + '%)';
        if(number < imageResources.length) {
            return false;
        }

        if(!buzz.isOGGSupported() && !buzz.isMP3Supported()) {
            my.DOM.remove(my.DOM.get('progressText'));
            init();
        } else {
            //为了缩减体积就干掉了声音这功能
        }
    }

  
    /**
     * 初始化
     */
    function init() {
        

        // 创建游戏对象
        var donkeyJump = new DonkeyJump();
        donkeyJump.setFPS(60);
        donkeyJump.init();
        var ui = donkeyJump.ui;

        // 开始游戏时
        donkeyJump.onstart = function() {
            my.KeyEvent.addListener();
        }
        // 游戏状态更新
        donkeyJump.onupdate = function() {
            if(my.KeyEvent.check('VK_LEFT') || my.KeyEvent.check('A')) {
                donkeyJump.keyDownLeft = true;
            } else {
                donkeyJump.keyDownLeft = false;
            }

            if(my.KeyEvent.check('VK_RIGHT') || my.KeyEvent.check('D')) {
                donkeyJump.keyDownRight = true;
            } else {
                donkeyJump.keyDownRight = false;
            }
        }
        // 停止游戏时
        donkeyJump.onstop = function() {
            my.KeyEvent.removeListener();
        }
        // 点击开始按钮
        ui.onplay = function() {
            this.toBody();
            donkeyJump.stateInit();
            donkeyJump.start();
        }
        // 打开声音
        ui.onsoundopen = function() {
            
            
        }
        // 关闭声音
        ui.onsoundclose = function() {
            
            
        }
        // 暂停
        ui.onpause = function() {
            donkeyJump.pause();
            ui.panelResumeVisible(true);
            ui.btnPauseVisible(false);
        }
        // 返回列表
        ui.onresumeexit = function() {
            ui.toCover();
            ui.panelResumeVisible(false);
            
        }
        // 继续游戏
        ui.onresume = function() {
            ui.panelResumeVisible(false);
            ui.btnPauseVisible(true);
            donkeyJump.start();
            
        }
        // 未实现
        ui.onshowcup = ui.onshowcore = ui.onshowmore = ui.onshare = function() {
        	alert("~~")
        }
    }

})();
