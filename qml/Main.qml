import VPlay 2.0
import QtQuick 2.0

GameWindow {
  id: gameWindow

  // you get free licenseKeys as a V-Play customer or in your V-Play Trial
  // with a licenseKey, you get the best development experience:
  //  * No watermark shown
  //  * No license reminder every couple of minutes
  //  * No fading V-Play logo
  // you can generate one from https://v-play.net/developers/license/, then enter it below:
  //licenseKey: "<generate one from https://v-play.net/developers/license/>"

  activeScene: scene

  // the size of the Window can be changed at runtime by pressing Ctrl (or Cmd on Mac) + the number keys 1-8
  // the content of the logical scene size (480x320 for landscape mode by default) gets scaled to the window size based on the scaleMode
  // you can set this size to any resolution you would like your project to start with, most of the times the one of your main target device
  screenWidth: 640
  screenHeight: 960



  Scene {
    id: scene
   width: 320

    height: 480
   sceneAlignmentY: "bottom"
   property string gamestate:"wait"
   property int score:0
   property string check:"false"
   PhysicsWorld{
       debugDrawVisible: false
      z:1000
        gravity.y: scene.gamestate!="wait"? 27:0

   }

   MouseArea
   {
       anchors.fill: scene.gameWindowAnchorItem
       onPressed: {
          if(scene.gamestate=="wait"){
              scene.startgame()
              player.push()
              scene.check="true"

          }
          else if(scene.gamestate=="play")
              player.push()
          else if(scene.gamestate=="gameOver")
              scene.reset()
       }
   }


   MultiResolutionImage  {
        id: bg
        source: "../assets/bg.png"
        anchors.horizontalCenter: scene.horizontalCenter
        anchors.bottom: scene.gameWindowAnchorItem.bottom

    }
   MultiResolutionImage {
     id: rotor
     source: "../assets/rotor.png"
     x: 154
     y: 228
   }
   MovementAnimation{
       target: rotor
       velocity: 300
       property: "rotation"
       running: true
   }


   Pipe{

       id:pipe1
       x:400
       y:30+Math.random()*200
   }
//   Pipe{
//       id:pipe2
//       x:640
//       y:30+Math.random()*200
//   }

    Ground
    {
        anchors.horizontalCenter: scene.horizontalCenter
        anchors.bottom: scene.bottom

    }

    Player
    {
        id:player
        x:147
        y:167


    }
    function startgame()
    {
        scene.gamestate="play"
    }

    function stopgame()
    {
        scene.gamestate="gameOver"
    }
    Text {
        id: po
        text:scene.score
        color: "white"
        anchors.horizontalCenter: scene.horizontalCenter
        y:30
        font.pixelSize: 30
    }


function reset()
{
    scene.gamestate="wait"
    pipe1.x=400
    pipe1.y=30+Math.random()*200
    pipe1.x=600
    pipe1.y=30+Math.random()*200
    player.x=147
    player.y=167
    scene.score=0

}



  }
}

