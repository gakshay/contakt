class ContaktDemo.Routers.AddressesRouter extends Backbone.Router
  initialize: (options) ->
    @addresses = new ContaktDemo.Collections.AddressesCollection()
    @addresses.reset options.addresses

  routes:
    "new"      : "newAddress"
    "index"    : "index"
    ":id/edit" : "edit"
    ":id"      : "show"
    ".*"        : "index"

  newAddress: ->
    @view = new ContaktDemo.Views.Addresses.NewView(collection: @addresses)
    $("#addresses").html(@view.render().el)

  index: ->
    @view = new ContaktDemo.Views.Addresses.IndexView(addresses: @addresses)
    $("#addresses").html(@view.render().el)

  show: (id) ->
    address = @addresses.get(id)

    @view = new ContaktDemo.Views.Addresses.ShowView(model: address)
    $("#addresses").html(@view.render().el)

  edit: (id) ->
    address = @addresses.get(id)

    @view = new ContaktDemo.Views.Addresses.EditView(model: address)
    $("#addresses").html(@view.render().el)
