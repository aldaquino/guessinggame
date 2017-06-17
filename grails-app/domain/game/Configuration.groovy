package game

//required framework imports
// import grails.persistence.*
import javax.persistence.*;

@Entity
@Table(name = "configuration")
class Configuration {

    Integer id
    Integer currentNodeId

    static constraints = {
        id unique: true
        currentNodeId blank: false, nullable: false
    }

    static mapping = {
        table "configuration"
        id column: "id"
        currentNodeId column: "current_node_id"
        version false
    }
}
