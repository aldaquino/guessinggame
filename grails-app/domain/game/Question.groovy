package game

//required framework imports
// import grails.persistence.*
import javax.persistence.*;

//my imports
import game.Node

@Entity
@Table(name = "question")
class Question {

    Integer id
    String text

    static constraints = {
        id unique: true
        text blank: false
    }

    static mapping = {
        table "question"
        id column: "id"
        text column: "text"
        version false
    }
}
