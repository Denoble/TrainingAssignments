class Robot {
    var positionState = Position(0, 0, 0)
        private set
    private val x
        get() = positionState

    fun move(instruction: Char) {
        when (instruction) {
            'L' -> {
                changePosition(-90, 0, 0)
            }

            'R' -> {
                changePosition(90, 0, 0)
            }

            'F' -> {
                changePosition(0, 1, 0)
            }

            'B' -> {
                changePosition(0, -1, 0)
            }

            'S' -> {}
            'N' -> {}
            else -> {
                print("Wrong instruction")
            }

        }

    }

    private fun changePosition(degree: Int, distancex: Int, distancey: Int) {
        var newOrientation = (positionState.orientation + (degree))
        if (newOrientation < 0) newOrientation = 270
        else {
            newOrientation = newOrientation % 360
        }
        val x = distancex + positionState.x
        val y = distancey + positionState.y
        positionState = Position(
            x,
            y, newOrientation
        )
    }
}

data class Position(val x: Int, val y: Int, val orientation: Int)