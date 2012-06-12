describe 'Annotator.Plugin.Categories', ->
  annotator = null
  plugin = null
  categories =
    'errata':'annotator-hl-errata', 
    'comment':'annotator-hl-comment', 
    'suggestion':'annotator-hl-suggestion' 
  
  beforeEach ->
    annotator = new Annotator($('<div/>')[0])
    plugin = new Annotator.Plugin.Categories($('<div />')[0], categories)
    plugin.annotator = annotator
    plugin.pluginInit

  describe "pluginInit", ->
    it "should always have the first item checked", ->
      spyOn(annotator.editor, 'addField')
      plugin.pluginInit()
      expect(annotator.element.find("li:first :input").prop("checked")).toEqual(true)

    it "should add a field to the editor", ->
      spyOn(annotator.editor, 'addField')
      plugin.pluginInit()
      expect(annotator.editor.addField).toHaveBeenCalled()

    it "should register a filter if the Filter plugin is loaded", ->
      plugin.annotator.plugins.Filter = {addFilter: jasmine.createSpy()}
      plugin.pluginInit()
      expect(plugin.annotator.plugins.Filter.addFilter).toHaveBeenCalled()

  
  describe "setHighlights", ->
    it "should set class specific to each category to the highlight in the viewer", ->
      annotation =
        highlights: $('<span><em>Hats</em></span><span><em>Gloves</em></span>'),
        category: "errata"
      plugin.setHighlights(annotation)
      # expect(annotation.highlights.find('span')).toEqual("")
      

  describe "updateField", ->
    it "should update a checked field", ->
      field = annotator.editor.addField({ type: 'radio', checked: true })
      annotation = { category: "errata" }
      plugin.updateField(field, annotation)


  describe "setAnnotationCat", ->
    it "should check if radio button is active", ->
  
  describe "updateViewer", ->
    it "should add the correct class to the highlighted text", ->
