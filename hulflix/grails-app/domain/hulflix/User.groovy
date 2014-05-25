package hulflix
/**
 * The User entity.
 *
 * @author    
 *
 *
 */
class User {
    static mapping = {
         table 'user'
         // version is set to false, because this isn't available by default for legacy databases
         version false
         // In case a sequence is needed, changed the identity generator for the following code:
//       id generator:'sequence', column:'User_ID', params:[sequence:'user_sequence']
         id generator:'identity', column:'User_ID'
    }
    String userName
	String userPassword
	String userPicture
   // String userMail
    //String userAdress
    //Date userBirthdate
    //Integer userCreditCardNumber

    static hasMany = [ favorite : Favorite ]

    static constraints = {
        userName(size: 0..45)
       // userMail(size: 0..45)
        //userAdress(size: 0..45)
        //userBirthdate(nullable: true)
      //  userCreditCardNumber(nullable: true, max: 2147483647)
    }
	static {
		grails.converters.JSON.registerObjectMarshaller(User) {User u ->
			def ar = [:]
			ar['id'] = u.id
			ar['userName'] = u.userName
			ar['userPassword'] = u.userPassword
			ar['userPicture'] = u.userPicture
			ar
		}
	}
}
