package rewards.internal.account;


/**
 * Loads account aggregates. Called by the reward network to find and
 * reconstitute Account entities from an external form such as a set of RDMS
 * rows.
 * 
 * Objects returned by this repository are guaranteed to be fully initialized
 * and ready to use.
 */

//	TODO-04:  Alter this interface to extend a Spring Data Interface.
//	Define a method that will look up an Account by the provided creditCardNumber.
public interface AccountRepository {


}