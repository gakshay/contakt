ContaktDemo.Views.Addresses ||= {}

class ContaktDemo.Views.Addresses.ShowView extends Backbone.View
  template: JST["backbone/templates/addresses/show"]

  render: ->
    @$el.html(@template(@model.toJSON() ))
    return this
