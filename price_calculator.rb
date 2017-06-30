require "rubygems"
require 'json'
@master_item = '{"milk":{"unit_price":3.97,"offer_qty":2,"offer_price":5},"bread":{"unit_price":2.17,"offer_qty":3,"offer_price":6},"banana":{"unit_price":0.99,"offer_qty":0,"offer_price":0},"apple":{"unit_price":0.89,"offer_qty":0,"offer_price":0}}'
@master_hash = JSON.parse(@master_item)
puts 'Please enter all the items purchased separated by a comma'
@items = gets
@items = @items.downcase.strip
if @items != ""	
	puts "\nItem 		Quantity	Price"
	puts "---------------------------------------"
@items = @items.split(",")
@item_hash = Hash.new(0)
@items.each { |name| @item_hash[name.strip] += 1 }
@total = 0
@save = 0
	@item_hash.each do |key, value|
		@price = 0
		if @master_hash[key]!=nil and @master_hash[key]['offer_qty'].to_i==0
			@price = @master_hash[key]['unit_price']*value
		elsif @master_hash[key]!=nil#@master_hash[key]!=nil and @master_hash[key]['offer_qty'].to_i==0
			if value.to_i > @master_hash[key]['offer_qty'].to_i
				@price = (value.to_i -  @master_hash[key]['offer_qty'].to_i)*@master_hash[key]['unit_price']+@master_hash[key]['offer_price'] 
				@save = @save + (@master_hash[key]['unit_price']*value - @price)
            elsif value.to_i == @master_hash[key]['offer_qty'].to_i##if key > @master_hash[key]['offer_qty'].to_i
            @price = @master_hash[key]['offer_price']
			else#if key > @master_hash[key]['offer_qty'].to_i
            @price = @master_hash[key]['unit_price']*value		 
			end#if key > @master_hash[key]['offer_qty'].to_i			
		end#@master_hash[key]!=nil and @master_hash[key]['offer_qty'].to_i==0

@total = @total + @price if @price != 0
	puts"#{key.capitalize}		#{value}		$#{@price}" 
	end#@item_hash.each do |key, value|
	puts "---------------------------------------"
	puts"\n  Total price :  $#{@total}" 
	puts"  You saved $#{@save.round(2)} today." 
	puts "---------------------------------------"
	puts "Thank You... Visit Again... "
else#if @items!=""
	puts 'Invalid input!'	
end#if @items!=""
