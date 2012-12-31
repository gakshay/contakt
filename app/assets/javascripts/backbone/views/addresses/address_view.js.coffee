ContaktDemo.Views.Addresses ||= {}

class ContaktDemo.Views.Addresses.AddressView extends Backbone.View
  template: JST["backbone/templates/addresses/address"]

  events:
    "click .destroy" : "destroy"

  tagName: "tr"

  destroy: () ->
    @model.destroy()
    this.remove()

    return false

  render: ->
    @$el.html(@template(@model.toJSON() ))
    return this
