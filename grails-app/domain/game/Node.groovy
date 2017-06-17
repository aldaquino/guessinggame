package game

//required framework imports
// import grails.persistence.*
import javax.persistence.*;

//my imports
import game.Question
import game.Animal

@Entity
@Table(name = "node")
class Node {

    Integer id
    Integer parent
    Animal animal
    Question question
    Integer growthTo // 0 => left  ||  1 => right

    static constraints = {
        id unique: true
        parent blank: true, nullable: true
        animal blank: true, nullable: true
        question blank: true, nullable: true
        growthTo blank: true, nullable: true
    }

    static mapping = {
        table "node"
        id column: "id"
        parent column: "parent_id"
        animal column: "animal_id"
        question column: "question_id"
        growthTo column: "growth_to"
        version false
    }
}
