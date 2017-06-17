package game

//required framework imports
// import grails.persistence.*
import javax.persistence.*;

//my imports
import game.Node

@Entity
@Table(name = "animal")
class Animal {

    Integer id
    String name

    static constraints = {
        id unique: true
        name blank: false
    }

    static mapping = {
        table "animal"
        id column: "id"
        name column: "name"
        version false
    }
}
