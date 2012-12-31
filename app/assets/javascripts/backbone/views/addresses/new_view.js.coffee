ContaktDemo.Views.Addresses ||= {}

class ContaktDemo.Views.Addresses.NewView extends Backbone.View
  template: JST["backbone/templates/addresses/new"]

  events:
    "submit #new-address": "save"

  constructor: (options) ->
    super(options)
    @model = new @collection.model()

    @model.bind("change:errors", () =>
      this.render()
    )

  save: (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.unset("errors")

    @collection.create(@model.toJSON(),
      success: (address) =>
        @model = address
        window.location.hash = "/#{@model.id}"

      error: (address, jqXHR) =>
        @model.set({errors: $.parseJSON(jqXHR.responseText)})
    )

  render: ->
    @$el.html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this
