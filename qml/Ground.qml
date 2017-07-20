import QtQuick 2.0
import VPlay 2.0


EntityBase{
    id:ground

    entityType: "ground"
   width: sprite.width
       height: sprite.height
    SpriteSequenceVPlay{
        id:sprite
         running: scene.gamestate!="gameOver"
        SpriteVPlay
        {
            frameCount: 2
            frameRate: 4
            frameWidth: 368
            frameHeight: 90
            source: "../assets/land.png"
        }
    }
    BoxCollider//else bird will fall to the depths of hell
    {
        anchors.fill: parent
        bodyType: Body.Static
        fixture.onBeginContact:{
            scene.stopgame()
        }
    }
}
