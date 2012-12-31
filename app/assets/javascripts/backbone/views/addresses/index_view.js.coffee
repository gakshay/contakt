ContaktDemo.Views.Addresses ||= {}

class ContaktDemo.Views.Addresses.IndexView extends Backbone.View
  template: JST["backbone/templates/addresses/index"]

  initialize: () ->
    @options.addresses.bind('reset', @addAll)

  addAll: () =>
    @options.addresses.each(@addOne)

  addOne: (address) =>
    view = new ContaktDemo.Views.Addresses.AddressView({model : address})
    @$("tbody").append(view.render().el)

  render: =>
    @$el.html(@template(addresses: @options.addresses.toJSON() ))
    @addAll()

    return this
