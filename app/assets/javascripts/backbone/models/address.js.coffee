class ContaktDemo.Models.Address extends Backbone.Model
  paramRoot: 'address'

  defaults:
    street_address: null
    street_address_two: null
    city: null
    state: null
    country: null
    zipcode: null

class ContaktDemo.Collections.AddressesCollection extends Backbone.Collection
  model: ContaktDemo.Models.Address
  url: '/addresses'
