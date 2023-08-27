
data class Cordinate(val x: Int, val y: Int)
data class Position(val cor: Cordinate, val description: Char)
class Robot( initCordinate:Cordinate,
             position: Position,
             instruction:String) {
    var curPosition :Position
    init {
        curPosition = Position(initCordinate,' ')
        positonFromCordinate(position)
        for (char in instruction){
            move(char)
        }
    }
    fun positonFromCordinate(position: Position){
        when(position.description){
            'E' ->{
                val newX= curPosition.cor.x +position.cor.x
                val newY =  position.cor.y
                val cordinate = Cordinate(newX,newY)
                curPosition = Position( cordinate,position.description)
            }
            'W' ->{
                val newX= curPosition.cor.x - position.cor.x
                val newY =  position.cor.y
                val cordinate = Cordinate(newX,newY)
                curPosition = Position( cordinate,position.description)

            }
            'S' ->{
                val newX= position.cor.x
                val newY = curPosition.cor.y - position.cor.y
                val cordinate = Cordinate(newX,newY)
                curPosition = Position( cordinate,position.description)
            }
            'N' ->{
                val newX= position.cor.x
                val newY = curPosition.cor.y + position.cor.y
                val cordinate = Cordinate(newX,newY)
                curPosition = Position( cordinate,position.description)
            }
            else->{}
        }
    }
    fun move(instruction: Char) {
        when (instruction) {
            'L' -> {
                changeOrientation('L')
            }

            'R' -> {
                changeOrientation('R')
            }

            'F' -> {
                val newX = curPosition.cor.x + 1
                val cordinate = Cordinate(newX,curPosition.cor.y)
                curPosition = Position( cordinate,curPosition.description)
            }

            'B' -> {
                val newX = curPosition.cor.x - 1
                val cordinate = Cordinate(newX,curPosition.cor.y)
                curPosition = Position( cordinate,curPosition.description)
            }

            else -> {
                print("Wrong instruction")
            }

        }

    }

    private fun changeOrientation(orientation:Char) {
        when(orientation){
            'L' ->{orientationHelper(orientation,curPosition.description)

            }
            'R' ->{orientationHelper(orientation,curPosition.description)
            }
            else ->{}
        }
    }
    private fun orientationHelper(instruct:Char,
                                  orientation:Char){
        val tempInstruct = "$instruct$orientation"
        when(tempInstruct){
            "LE"->{
                curPosition = Position(curPosition.cor,'N')
            }
            "LW" ->{
                curPosition = Position(curPosition.cor,'S')
            }
            "LS" ->{
                curPosition = Position(curPosition.cor,'E')
            }
            "LN" ->{ curPosition = Position(curPosition.cor,'W')}
            "RE"->{
                curPosition = Position(curPosition.cor,'S')
            }
            "RS"->{
                curPosition = Position(curPosition.cor,'W')
            }
            "RW"->{
                curPosition = Position(curPosition.cor,'N')
            }
            "RN"->{
                curPosition = Position(curPosition.cor,'E')
            }
            else->{}
        }
    }
}
fun main(args:Array<String>){
    val cordinate = Cordinate(5,3)
    val position = Position(Cordinate(1,1),'E')
    val robot = Robot(cordinate,position,"RFRFRFRF")
    println(" ${robot.curPosition.cor.x} ${robot.curPosition.cor.y} " +
            "${robot.curPosition.description}")
}
