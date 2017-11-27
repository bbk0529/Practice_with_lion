require 'nokogiri'
require 'rest-client'

# url="https://search.naver.com/search.naver?where=nexearch&sm=top_sly.hst&fbm=0&ie=utf8&query=%EC%95%85%EB%8F%99%EB%AE%A4%EC%A7%80%EC%85%98"
keyword=URI::escape("이찬혁")


url = "https://search.naver.com/search.naver?ie=utf8&where=news&query=#{keyword}&sm=tab_tmr&frm=mr&nso=so:r,p:all,a:all&sort=0"
#url = 'https://search.naver.com/search.naver?ie=utf8&where=news&query=%EC%95%85%EB%8F%99%EB%AE%A4%EC%A7%80%EC%85%98&sm=tab_tmr&frm=mr&nso=so:r,p:all,a:all&sort=0'
result=RestClient.get(url)
parsed_result=Nokogiri::HTML(result.body)


# array=[]

	# news=parsed_result.css("#sp_nws_all1 > dl:nth-child(2) > dt:nth-child(1) > a:nth-child(1)")	
	
	# pic=parsed_result.css("#sp_nws_all1 > dl > dt > a")
	# p news.text
 	# parsed_result.xpath('//ul')	
 	# p pic
	# array << news.text

	#sp_nws1 > dl:nth-child(2) > dt:nth-child(1) > a:nth-child(1)
result = parsed_result.css("._sp_each_title")

array=[]

result.each do |a|
	#puts "#{a["title"]} - (#{a["href"]})"
	array << "#{a["title"]} - (#{a["href"]})"
end

p array.to_s