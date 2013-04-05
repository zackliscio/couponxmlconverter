require 'xmlsimple'
require 'csv'
  config = XmlSimple.xml_in('getCoupons.xml', { 'KeyAttr' => 'businessName' })
  
  dataForSort = config['coupon'] #hash of hashes of businesses and their corresponding coupons
  

  
  
  #main details
  #p config.class

  

  dataForSort.each do |coupon|
  	dataEntryName = coupon[0]
  	entryForSort = coupon[1] 
  	entry = [dataEntryName, entryForSort["id"], entryForSort["cat"], entryForSort["naicCode"], entryForSort["naicDesc"], entryForSort["endDate"], entryForSort["couponUrl"], entryForSort["weblink"], entryForSort["thmImg"], entryForSort["logoImg"], entryForSort["locations"][0]["address"][0]["street"], entryForSort["locations"][0]["address"][0]["city"], entryForSort["locations"][0]["address"][0]["zip"], entryForSort["locations"][0]["address"][0]["phone"],entryForSort["couponOffer"][0]["text"], entryForSort["couponOffer"][0]["expDate"],entryForSort["couponOffer"][0]["disclaimer"]]
  	#fullArray = dataEntryName+entryForSort
  	#print fullArray
  	#print dataEntryName.class
  	#print entryForSort.class
  end

  

  CSV.open("data.csv", "wb") do |csv| 
  		csv << ["Business Name", "CouponID", "Cat", "naicCode", "naicDesc","endDate", "couponUrl", "weblink", "thmImg", "logoImg", "street", "city", "zip", "phone","coupon text", "Expirtation","Terms"]
  	dataForSort.each do |elem| 
  		dataEntryName = elem[0]
  		entryForSort = elem[1] 
  		entry = [dataEntryName, entryForSort["id"], entryForSort["cat"], entryForSort["naicCode"], entryForSort["naicDesc"], entryForSort["endDate"], entryForSort["couponUrl"], entryForSort["weblink"], entryForSort["thmImg"], entryForSort["logoImg"], entryForSort["locations"][0]["address"][0]["street"], entryForSort["locations"][0]["address"][0]["city"], entryForSort["locations"][0]["address"][0]["zip"], entryForSort["locations"][0]["address"][0]["phone"],entryForSort["couponOffer"][0]["text"], entryForSort["couponOffer"][0]["expDate"],entryForSort["couponOffer"][0]["disclaimer"]]
  	
  		csv << entry
  	end
  end

  p "completed like a boss"

  # {"id"=>"1187968", 
  # 	"cat"=>"108", 
  # 	"naicCode"=>"722213AAG", 
  # 	"naicDesc"=>"SNACK & NONALCOHOLIC BEVERAGE BARS-YOGURT", 
  # 	"endDate"=>"2015-03-18", 
  # 	"couponUrl"=>"http://www.valpak.com/coupons/printable/DREAM-SWIRLS-FROZEN-YOGURT/71332?slugId=1187968&vpref=vpcomLX", 
  # 	"weblink"=>"http://www.dreamsweirls.com", 
  # 	"thmImg"=>"http://www.valpak.com/img/slug/3173140941401.jpg", 
  # 	"logoImg"=>"http://www.valpak.com/img/print/3173140941401.jpg", 
  # 	"locations"=>[{"address"=>[{"id"=>"1647479", 
  # 		"street"=>"15570 W. Van Buren St Ste D-101", 
  # 		"city"=>"Goodyear", 
  # 		"zip"=>"85338", 
  # 		"phone"=>"(623)536-2191"}]}], 
  # 	"couponOffer"=>[{"id"=>"1506051", 
  # 		"text"=>"Frozen Yogurt Coupon for 15% OFF Entire Purchase @ Dream Swirls!", 
  # 		"expDate"=>"2013-04-18", 
  # 		"disclaimer"=>["Discount only Valid at Dream Swirls Frozen Yogurt located at: 15570 W. Van Buren Goodyear AZ 85338", 
  # 			"Not valid with any other offer.", 
  # 			"With Valpakå¨ coupon only.", 
  # 			"Coupon void if altered."]}]}