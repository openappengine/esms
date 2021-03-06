package com.esms.model.party

class Address {
	
	String buildingName;
	
	String address1;
	
	String address2;
	
	String city;
	
	String postalCode;
	
	String country = "India";
	
	String state = "Maharashtra";
	
	String addressType;
	
	String area;
	
	String route;
	
	String landmark;
	
	static belongsTo = [party : Party]

    static constraints = {
		address1 blank:false
		address2 nullable:true,blank:true
		addressType inList:['SHIPPING','BILLING','RESIDENTIAL','CARE-OFF']
		area nullable:true,blank:true
		route nullable:true,blank:true
		landmark nullable:true,blank:true
    }
	
	static mapping = {
		tablePerHierarchy false
	}
}
