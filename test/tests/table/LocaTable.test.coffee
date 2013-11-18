fs = require 'fs'
jDataView = require 'jdataview'
TTFDataView = require '../../../src/util/TTFDataView'
LocaTable = require '../../../src/table/LocaTable'
ttf1Loca = require '../../resources/SourceCodePro/SourceCodePro-Medium.loca.json'

# test data
view = new TTFDataView fs.readFileSync __dirname + '/../../resources/SourceCodePro/SourceCodePro-Medium.ttf'
ttf1 = LocaTable.createFromTTFDataView(view,
  7464,
  {
    getNumGlyphs: () ->
      965
    isLocaLong: () ->
      false
  }
)
json = require('../../resources/SourceCodePro/SourceCodePro-Medium.ttf.json').loca
ttf1_json = LocaTable.createFromJSON(json)


# test
exports.LocaTable =
  
  'test LocaTable is Constructor': (test) ->
    test.strictEqual typeof LocaTable, 'function'
    head = new LocaTable()
    test.ok head instanceof LocaTable
    test.done()

exports.LocaTable_createFromTTFDataView =
  
  'LocaTable#createFromTTFDataView() is function': (test) ->
    test.strictEqual typeof LocaTable.createFromTTFDataView, 'function'
    test.ok ttf1 instanceof LocaTable
    test.done()

  'LocaTable#createFromJSON() is function': (test) ->
    test.strictEqual typeof LocaTable.createFromJSON, 'function'
    test.ok ttf1_json instanceof LocaTable
    test.done()

  'test LocaTable#offsets': (test) ->
    test.deepEqual ttf1.offsets, ttf1Loca
    test.deepEqual ttf1_json.offsets, ttf1Loca
    test.done()

