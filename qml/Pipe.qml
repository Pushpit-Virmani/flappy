import QtQuick 2.0
import VPlay 2.0




EntityBase{//gateway is only a thin line pipe images are attached on it
    id:pipe
    entityType: "pipe"

    height: 90
    width: 1
    Image {
        id: lowerpipe
        source: "../assets/pipe.png"

        anchors.top:pipe.bottom



        anchors.horizontalCenter: pipe.horizontalCenter
    }
    Image {
        id: upperpipe
        source: "../assets/pipe.png"
        rotation: 180
        mirror: true
        anchors.bottom:pipe.top
        anchors.horizontalCenter: pipe.horizontalCenter
    }
        MovementAnimation{
            id:movement

            target: pipe
            property: "x"
            minPropertyValue: -80
            velocity: -140

           // running: scene.check
            running: scene.gamestate!="wait"&scene.gamestate!="gameOver"?true:false
            onLimitReached: {
                pipe.x=400
                pipe.y=30+Math.random()*200
            }
        }
        BoxCollider{
            anchors.fill: pipe
            bodyType: Body.Static
            collisionTestingOnlyMode: true
            fixture.onBeginContact: {
                scene.score++
            }
        }
        BoxCollider{
            anchors.fill: lowerpipe
            bodyType: Body.Static
            collisionTestingOnlyMode: true

            fixture.onBeginContact:{
                         scene.stopgame()
                     }
        }
        BoxCollider{
            anchors.fill: upperpipe
            bodyType: Body.Static
            collisionTestingOnlyMode: true
            fixture.onBeginContact:{
                         scene.stopgame()
        }

}

}
