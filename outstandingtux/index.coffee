---
---

document.addEventListener('DOMContentLoaded', ->
  canvas = document.querySelector('canvas')
  engine = new BABYLON.Engine(canvas, true)
  BABYLON.SceneLoader.Load('', 'levels.babylon', engine, (scene) ->
    scene.executeWhenReady(->
      scene.activeCamera.attachControl(canvas)
      ocean = scene.getMeshByName('ocean')
      level1 = scene.getMeshByName('level.1')
      level1.material.emissiveTexture = new BABYLON.Texture('level.png', scene)
      level1.material.specularPower = 3
      level1.material.bumpTexture = new BABYLON.Texture('level_NRM.png', scene)
      level1.material.emissiveColor = new BABYLON.Color3(1, 1, 1)
      engine.runRenderLoop(->
        scene.render()
        ocean.material.diffuseTexture.uOffset += .001
        ocean.material.diffuseTexture.vOffset += .0008
        ocean.material.bumpTexture.uOffset += .001
        ocean.material.bumpTexture.vOffset += .0008
      )
    )
  )
)
