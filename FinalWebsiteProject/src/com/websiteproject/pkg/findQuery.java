package com.websiteproject.pkg;

public class findQuery {
	
	public static String calculateQuery(String stopsFilter, String airlineFilter, String departureTimeFilter, String arrivalTimeFilter, String flexibleDate, 
			String departureAirport, String destinationAirport, String flexibleDateQuery, String sort) {
		
		String departureTimeQuery = null;
		if(departureTimeFilter != null) {
			
			if(departureTimeFilter.equals("Midnight (12:00am - 4:59am)")) {
				departureTimeQuery = "departureTime >= '00:00:00' and departureTime < '05:00:00'";
			}
			else if(departureTimeFilter.equals("Morning (5:00am - 11:59am)")) {
				departureTimeQuery = "departureTime >= '05:00:00' and departureTime < '12:00:00'";
			}
			else if(departureTimeFilter.equals("Afternoon (12:00pm - 5:59pm)")) {
				departureTimeQuery = "departureTime >= '12:00:00' and departureTime < '18:00:00'";
			}
			else if(departureTimeFilter.equals("Night (6:00pm - 11:59pm)")) {
				departureTimeQuery = "departureTime >= '18:00:00' and departureTime < '00:00:00'";
			}
		}
		
		String arrivalTimeQuery = null;
		if(arrivalTimeFilter != null) {
			
			if(arrivalTimeFilter.equals("Midnight (12:00am - 4:59am)")) {
				arrivalTimeQuery = "arrivalTime >= '00:00:00' and arrivalTime < '05:00:00'";
			}
			else if(arrivalTimeFilter.equals("Morning (5:00am - 11:59am)")) {
				arrivalTimeQuery = "arrivalTime >= '05:00:00' and arrivalTime < '12:00:00'";
			}
			else if(arrivalTimeFilter.equals("Afternoon (12:00pm - 5:59pm)")) {
				arrivalTimeQuery = "arrivalTime >= '12:00:00' and arrivalTime < '18:00:00'";
			}
			else if(arrivalTimeFilter.equals("Night (6:00pm - 11:59pm)")) {
				arrivalTimeQuery = "arrivalTime >= '18:00:00' and arrivalTime < '00:00:00'";
			}
		}
		
		if(stopsFilter != null) {
			
			if(airlineFilter != null) {
			
				if(departureTimeFilter != null) {
				
					if(arrivalTimeFilter != null) {
					
						//if(priceFilter != null) {
						
							if(flexibleDate != null) {
								return "select * from flights where (" + departureTimeQuery + ") and (" + arrivalTimeQuery + ")"
										+ " and stops = '" + stopsFilter + "'"
										+ " and airlineID = '" + airlineFilter + "'"
										+ " and departureAirport ='" + departureAirport + "'"
										+ " and destinationAirport = '" + destinationAirport + "'" 
										+ " and " + flexibleDateQuery
										+ " order by " + sort;
							}
							else if(flexibleDate == null) {
								return "select * from flights where (" + departureTimeQuery + ") and (" + arrivalTimeQuery + ")"
										+ " and stops = '" + stopsFilter + "'"
										+ " and airlineID = '" + airlineFilter + "'"
										+ " and departureAirport ='" + departureAirport + "'"
										+ " and destinationAirport = '" + destinationAirport + "'" 
										//+ " and flightDate = '" + df.format(departureDate) + "'"
										+ " order by " + sort;
							}
						//}
					}
				}
			}
		}
		return null;
	}
}
