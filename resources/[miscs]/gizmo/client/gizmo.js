var gizmoEnabled = false
var selectionHandle = null
var loop = null

const makeEntityMatrix = (entity) => {
    const [front, right, up, at] = GetEntityMatrix(entity)
    return new Float32Array([
        right[0], right[1], right[2], 0,
        front[0], front[1], front[2], 0,
        up[0], up[1], up[2], 0,
        at[0], at[1], at[2], 1,
    ])
}

const toggleGizmo = (entity) => {
    gizmoEnabled = !gizmoEnabled
    selectionHandle = entity

    if (gizmoEnabled === true) {
      EnterCursorMode()

      loop = setTick(async () => {
        const entityMatrix = makeEntityMatrix(selectionHandle)
        DrawGizmo(entityMatrix, selectionHandle.toString())
        DisableControlAction(0, 24, true) // Disable Left mouse button (attack)
      })

    } else {
      LeaveCursorMode()

      if (loop !== null) {
        clearTick(loop)
      }
    }
}

exports('Toggle', toggleGizmo)
RegisterCommand('gizmo', () => toggleGizmo(PlayerPedId()))


// -----------------------------------

on("gameEventTriggered", (name, args) => {
    console.log(`Game event ${name} ${args.join(', ')}`)
});