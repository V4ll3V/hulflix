package hulflix
/**
 * The Show entity.
 *
 * @author    
 *
 *
 */
class Show {
    static mapping = {
         table 'show'
         // version is set to false, because this isn't available by default for legacy databases
         version false
         // In case a sequence is needed, changed the identity generator for the following code:
//       id generator:'sequence', column:'Show_ID', params:[sequence:'show_sequence']
         id generator:'identity', column:'Show_ID'
    }
    String showTitle
    String showDescription
	static searchable = true
    static constraints = {

        showTitle(size: 0..45)
        showDescription(size: 0..500)
    }

}
