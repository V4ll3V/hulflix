package hulflix
/**
 * The Season entity.
 *
 * @author    
 *
 *
 */
class Season {
    static mapping = {
         table 'season'
         // version is set to false, because this isn't available by default for legacy databases
         version false
         // In case a sequence is needed, changed the identity generator for the following code:
//       id generator:'sequence', column:'Season_ID', params:[sequence:'season_sequence']
         id generator:'identity', column:'Season_ID'
         showID column:'Show_ID'
    }
    String seasonTitle
    String seasonDescription
    // Relation
    Show showID
	static searchable = true
    static constraints = {

        seasonTitle(size: 0..45)
        seasonDescription(size: 0..500)
        showID()
    }

}
