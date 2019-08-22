# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Artist.create(artist:"U-Z")
Label.create(label:"IRMA RECORDS")
Genre.create(genre:"Future Soul")
DeliveryAddress.create(end_user_id:1,zip:"0000000",delivery_address:"滋賀")
SellCd.create(label_id:1,genre_id:1,title:"Wanna Love Me",value:100,sell_status:1,stock:10)
Order.create(end_user_id:1,total_price:1000,payment_method:1,delivery_address_id:1,delivery_status:1)
Disc.create(sell_cd_id:1,disc:"DISC1",number:1)#:number追加まだしてない
CdArtist.create(sell_cd_id:1,artist_id:1)
Cart.create( sell_cd_id:1 , end_user_id:1 , quantity:2 )
OrderContent.create(sell_cd_id:1,order_id:1,quantity:2)
Song.create(disc_id:1,number:1,song:"Futuristic Drive")
