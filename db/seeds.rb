# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# services = Service.create([{name: "address", label: "Address"}, 
#                           {name: "maps", label: "Google Maps & Directions"}, 
#                           {name: "contact_form", label: "Contact Form"}, 
#                           {name: "web2mobile", label: "Web-2-Mobile"}])
                          
services = Service.create([{name: "live_chat", label: "Live Chat"}, 
                          {name: "social_media", label: "Social Media"}, 
                          {name: "advanced_address_lookup", label: "Advanced Address Lookup"}, 
                          {name: "fax", label: "Fax Service"},
                          {name: "handshake", label: "Handshake"},
                          {name: "analytics", label: "Analytics"}])                          
