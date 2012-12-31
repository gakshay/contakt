ContaktDemo.Views.Addresses ||= {}

class ContaktDemo.Views.Addresses.EditView extends Backbone.View
  template: JST["backbone/templates/addresses/edit"]

  events:
    "submit #edit-address": "update"

  update: (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.save(null,
      success: (address) =>
        @model = address
        window.location.hash = "/#{@model.id}"
    )

  render: ->
    @$el.html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this
